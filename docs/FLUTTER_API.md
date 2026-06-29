# Rudraganga — Flutter API Contract

Backend contract for the Rudraganga Flutter app (one app, **role-based**: a user
is a *seeker* by default and becomes an *astrologer* after admin approval). Both
roles use the **same** auth, wallet, session and socket machinery — only which
endpoints they call differs.

- **Base URL:** `<host>/api` (e.g. `http://10.0.2.2:5050/api` on the Android
  emulator — see [CONNECTING.md](./CONNECTING.md)).
- **Interactive docs:** `GET /api-docs` (Swagger UI, all 169 operations).
- **Machine spec:** [`openapi.json`](./openapi.json) — feed to `openapi-generator`.
- **Money:** every amount is **whole rupees** (integers). Never expect decimals.
- **Phone:** stored/returned as `91` + 10 digits (e.g. `919876543210`). Send the
  raw 10-digit number on login; the backend normalises it.

> This doc covers the **app-facing** surface (82 endpoints). The `/api/admin/*`
> and `/api/superadmin/*` routes are for the web admin panel and are **not** used
> by the Flutter app.

---

## 1. Response envelope

Every endpoint returns this shape. Check `success` first.

```jsonc
// success
{ "success": true, "data": <object | array | primitive> }

// failure
{ "success": false, "message": "Human-readable reason", "errors": ["field msg", ...] }
```

| HTTP | Meaning | What the app should do |
|------|---------|------------------------|
| 200 / 201 | OK | Use `data`. |
| 400 | Bad request (business rule) | Show `message`. |
| 401 | Access token missing/expired | Run the refresh flow (§3); retry once. |
| 403 | Forbidden — phone not verified, blocked, or wrong role | Show `message`; route to verify/upgrade. |
| 404 | Not found | Show empty/not-found state. |
| 409 | Conflict (e.g. duplicate, already reviewed) | Show `message`. |
| 422 | Validation failed | Field-level errors are in `errors[]`. |
| 429 | Rate limited | Back off (mostly disabled in dev). |

---

## 2. Auth flow (WhatsApp OTP)

No passwords, no cookies — **JWT in the body**. The app stores the tokens
(secure storage) and sends `Authorization: Bearer <accessToken>` on every call.

```
POST /auth/request-otp     { "phone": "9876543210" }            → OTP sent (dev OTP = 123456)
POST /auth/verify-otp      { "phone": "9876543210", "code": "123456" }
   → data: { accessToken, refreshToken, user, isNewUser }
```

`user` is the full user object:

```jsonc
{
  "_id": "…", "phone": "919876543210", "name": "Asha", "email": null,
  "role": "user",                       // "user" | "astrologer" | "admin" | "super_admin"
  "avatar": null,
  "birthDetails": { "dob": "1995-04-12T…", "time": "08:30", "place": "Pune", "tz": 5.5 },
  "isPhoneVerified": true, "isBlocked": false,
  "freeChatMinutes": 0,
  "astrologerProfile": "…"              // present only for astrologers
}
```

**Role routing in the app:** after `verify-otp`, branch on `user.role`.
`user` → seeker UI; `astrologer` → astrologer UI (go-online, incoming requests,
earnings, withdrawals). A seeker who applies via `POST /astrologers/apply` stays
`user` until an admin activates them — then `role` flips to `astrologer` on next
`GET /auth/me`.

---

## 3. Token refresh

Access tokens are short-lived. On a `401`, call refresh **once**, then retry the
original request. The Dart `ApiClient` (see [`lib/api/api_client.dart`](./lib/api/api_client.dart))
does this automatically.

```
POST /auth/refresh   { "refreshToken": "<stored refresh token>" }
   → data: { accessToken, refreshToken }   // both rotate — store the new pair
POST /auth/logout    { "refreshToken": "<stored refresh token>" }   // revoke on sign-out
```

Refresh tokens rotate on every use and reuse is detected (the whole family is
revoked) — always persist the **new** `refreshToken` from the response.

---

## 4. Push notifications (FCM)

After Firebase gives you a device token, register it (and unregister on logout):

```
POST   /auth/fcm-token   { "token": "<fcm token>", "platform": "android" }   // ios | android | web
DELETE /auth/fcm-token   { "token": "<fcm token>", "platform": "android" }
```

The backend pushes when the recipient is **offline** (e.g. a new chat message or
an incoming call request). When online, the same events arrive over the socket
(§7) — de-dupe by `sessionId`/message id.

---

## 5. Wallet & recharge

Balances are whole rupees. The app shows recharge packs from the admin-managed
templates, then starts a PayU checkout.

```
GET  /wallet/balance              → { balance, lockedBalance, available }
GET  /wallet/transactions         → paginated ledger { items, total, page, limit }
GET  /wallet/recharge-templates   → [{ amount, tokens, name, badge, benefits[], bonus, image }]
POST /wallet/recharge/initiate    { "amountRupees": 100 }
   → { txnid, action, params }    // POST `params` to PayU `action` (webview / hosted page)
```

PayU calls the server back at `/payments/payu/callback` and credits the wallet
**server-side** — the app just polls `GET /wallet/balance` (or listens for the
`wallet-updated` socket event) after returning from checkout.

---

## 6. Consultations (call / chat / video)

A **Session** is the unit for all three. Per-minute billing; minutes are
**ceiling-rounded** (30s → 1 min, 1m3s → 2 min). 60-second ring window.

### Lifecycle (the happy path)

```
1. Seeker:      POST /sessions/start { astrologerId, type: "chat"|"call"|"video" }
                → session created, status "ringing"; astrologer is rung for 60s
2. Astrologer:  receives `incoming-request` socket event → accept or reject
                POST /sessions/:sessionId/accept   (or /reject)
3. Both:        status "ongoing"; for call/video fetch the Agora token:
                GET /sessions/:sessionId/token → { token, uid, channelName, appId }
4. Chat:        exchange messages over the socket (§7) — not REST
5. Either:      POST /sessions/:sessionId/end   → status "completed", final bill
6. Seeker:      POST /sessions/:sessionId/review { rating: 1..5, comment }
```

> `POST /sessions/start` requires a **verified phone** (403 otherwise). You can
> also drive steps 1–2 and 5 over the socket (`start-session`, `accept-session`,
> `end-session`) — REST and socket are equivalent; pick one per action.

### Session object (key fields)

```jsonc
{
  "sessionId": "sess_…",          // also the Agora channel name for call/video
  "type": "chat",                  // call | chat | video
  "status": "ongoing",             // requested|ringing|ongoing|completed|missed|rejected|cancelled|failed
  "user": "…", "astrologer": "…",
  "ratePerMin": 10, "adminCutPerMin": 2,
  "startedAt": "…", "endedAt": null,
  "durationSec": 0, "billedMinutes": 0,
  "totalAmount": 0, "astrologerEarning": 0
}
```

| Endpoint | Who | Purpose |
|----------|-----|---------|
| `GET /sessions/` | both | list my sessions (history) |
| `GET /sessions/:sessionId` | both | one session |
| `GET /sessions/:sessionId/messages` | both | chat transcript (paginated) |
| `GET /sessions/:sessionId/token` | both | Agora RTC token for call/video |

---

## 7. Realtime — Socket.io

Connect to the **host root** (not `/api`) with the access token:

```dart
io('$host', { 'auth': { 'token': accessToken }, 'transports': ['websocket'] });
```

The connection auto-joins `user:<yourId>`. Astrologers are flipped **online** on
connect; use `set-online` to toggle availability.

### Emit (client → server)
| Event | Payload | Who | Notes |
|-------|---------|-----|-------|
| `set-online` | `{ online: bool }` | astrologer | toggle availability |
| `start-session` | `{ astrologerId, type }` | seeker | ack: `{success, sessionId, token}` |
| `accept-session` | `{ sessionId }` | astrologer | ack: `{success, token}` |
| `reject-session` | `{ sessionId }` | astrologer | |
| `join-session` | `{ sessionId }` | both | join the session room |
| `end-session` | `{ sessionId }` | both | |
| `send-message` | `{ sessionId, message, mediaUrl?, mediaType? }` | both | ack: `{success, message, masked, reasons}` |
| `typing` / `stop-typing` | `{ sessionId, to }` | both | `to` = other user id |
| `message-received` | `{ messageId }` | recipient | → sender gets `message-delivered` |
| `mark-read` | `{ sessionId, to }` | recipient | → sender gets `messages-read` |
| `heartbeat` | — | both | keep presence fresh |

Events with a callback (`start-session`, `accept-session`, `reject-session`,
`end-session`, `send-message`) reply via an **ack** function — pass a callback as
the last arg.

### Listen (server → client)
| Event | Payload | Meaning |
|-------|---------|---------|
| `incoming-request` | `{ sessionId, type, from, expiresInSec }` | astrologer is being rung |
| `request-accepted` | `{ sessionId, … }` | your request was accepted |
| `request-rejected` | `{ sessionId }` | rejected |
| `request-missed` | `{ sessionId }` | astrologer didn't answer in 60s |
| `request-expired` | `{ sessionId }` | ring window elapsed |
| `session-ended` | `{ sessionId, … }` | session closed (incl. low-balance auto-end) |
| `receive-message` | `{ id, sessionId, sender, message, mediaUrl, mediaType, timestamp }` | new chat message |
| `message-delivered` | `{ messageId, sessionId }` | single → double tick |
| `messages-read` | `{ sessionId, by }` | blue ticks |
| `typing` / `stop-typing` | `{ sessionId, from }` | typing indicator |
| `wallet-updated` | `{ balance, lockedBalance, available }` | balance changed (recharge/billing) |
| `gift-received` | `{ … }` | astrologer received a gift |
| `free-minute-used` | `{ … }` | a free chat minute was consumed |
| `new-notification` | `{ … }` | a notification was created (mirror of `GET /notifications`) |
| `presence-changed` | `{ astrologer, online }` | an astrologer went on/offline (for live lists) |

Messages are **moderated server-side** — phone numbers and links are masked
before delivery; the `send-message` ack tells you if your text was `masked` and
the `reasons`.

---

## 8. Store, poojas, AI, matrimony, support (quick reference)

Full request/response schemas are in [`openapi.json`](./openapi.json) / `/api-docs`.

- **Store:** `GET /categories`, `GET /products` (`?all=true&limit=`), `GET /products/:id`,
  `POST /offers/coupons/validate`, `GET /offers/products/:id/bundles`,
  `POST /orders` (verified — gateway-paid only), `GET /orders`, `GET /orders/:id`.
- **Poojas:** `GET/POST /poojas/bookings`, `GET /poojas/bookings/:id`.
- **AI astrologer:** `POST /ai/chat` `{ conversationId?, message }`, `GET /ai/conversations`,
  `POST /ai/kundli` · `POST /ai/chart` · `POST /ai/lal-kitab`.
- **Matrimony:** `GET/POST /matrimony/profiles`, `GET /matrimony/search`, `POST /matrimony/match`.
- **Reviews:** `GET /astrologers/:id/reviews`, `POST /sessions/:sessionId/review`,
  `GET/POST /reviews/platform`.
- **Notifications:** `GET /notifications`, `PATCH /notifications/:id/read`, `PATCH /notifications/read-all`.
- **Support:** `GET/POST /support/tickets`, `GET /support/tickets/:id`, `POST /support/tickets/:id/reply`.
- **Profile & addresses:** `GET/PUT /auth/me`, `GET/POST/PUT/DELETE /users/addresses`,
  `PATCH /users/addresses/:id/default`, `POST /users/upload` (multipart image → ImageBB URL).
- **Enquiry / become-astrologer:** `POST /enquiries`, `POST /astrologers/apply`.

---

## 9. Astrologer-role endpoints

The astrologer app additionally uses:

| Endpoint | Purpose |
|----------|---------|
| `GET /astrologers/me/profile` | own profile, rates, status |
| `POST /astrologers/me/online` `{ online }` | go online/offline (REST mirror of `set-online`) |
| `POST /sessions/:id/accept` · `/reject` · `/end` | handle consultations |
| `GET /sessions/` | earnings history (each session has `astrologerEarning`) |
| `GET /withdrawals/` · `POST /withdrawals/` `{ amountRupees, bankAccountDetails }` | payouts |

---

## 10. Full app-facing endpoint table

`auth` column: **public** (no token) · **auth** (Bearer required) · **verified**
(Bearer + verified phone). Body column lists the JSON fields the validator accepts.

| Method | Path (`/api` …) | Auth | Body fields |
|--------|------------------|------|-------------|
| **auth** | | | |
| `DELETE` | `/auth/fcm-token` | auth | token, platform |
| `POST` | `/auth/fcm-token` | auth | token, platform |
| `POST` | `/auth/logout` | public | refreshToken |
| `GET` | `/auth/me` | auth | — |
| `PUT` | `/auth/me` | auth | name, email, birthDetails |
| `POST` | `/auth/refresh` | public | refreshToken |
| `POST` | `/auth/request-otp` | public | phone |
| `POST` | `/auth/verify-otp` | public | phone, code |

| **users** | | | |
| `GET` | `/users/addresses` | auth | — |
| `POST` | `/users/addresses` | auth | label, name, phone, line1, line2, city, state, pincode, isDefault |
| `DELETE` | `/users/addresses/:addressId` | auth | — |
| `PUT` | `/users/addresses/:addressId` | auth | label, name, phone, line1, line2, city, state, pincode, isDefault |
| `PATCH` | `/users/addresses/:addressId/default` | auth | — |
| `POST` | `/users/avatar` | auth | — |
| `POST` | `/users/upload` | auth | — |

| **wallet** | | | |
| `GET` | `/wallet/balance` | auth | — |
| `GET` | `/wallet/recharge-templates` | auth | — |
| `POST` | `/wallet/recharge/initiate` | auth | amountRupees |
| `GET` | `/wallet/transactions` | auth | — |

| **astrologers** | | | |
| `GET` | `/astrologers/` | public | — |
| `GET` | `/astrologers/:id` | public | — |
| `GET` | `/astrologers/:id/reviews` | public | — |
| `POST` | `/astrologers/apply` | public | name, phone, email, expertise, languages, experienceYears, note, anonId |
| `POST` | `/astrologers/me/online` | auth | online |
| `GET` | `/astrologers/me/profile` | auth | — |

| **sessions** | | | |
| `GET` | `/sessions/` | auth | — |
| `GET` | `/sessions/:sessionId` | auth | — |
| `POST` | `/sessions/:sessionId/accept` | auth | — |
| `POST` | `/sessions/:sessionId/end` | auth | — |
| `GET` | `/sessions/:sessionId/messages` | auth | — |
| `POST` | `/sessions/:sessionId/reject` | auth | — |
| `POST` | `/sessions/:sessionId/review` | auth | rating, comment |
| `GET` | `/sessions/:sessionId/token` | auth | — |
| `POST` | `/sessions/start` | verified | astrologerId, type |

| **reviews** | | | |
| `GET` | `/reviews/platform` | public | — |
| `POST` | `/reviews/platform` | auth | rating, comment |

| **withdrawals** | | | |
| `GET` | `/withdrawals/` | auth | — |
| `POST` | `/withdrawals/` | auth | amountRupees, bankAccountDetails |

| **gifts** | | | |
| `GET` | `/gifts/` | public | — |
| `POST` | `/gifts/send` | verified | giftId, receiverId, sessionId |

| **categories** | | | |
| `GET` | `/categories/` | public | — |
| `POST` | `/categories/` | auth | name, image, isActive |
| `DELETE` | `/categories/:id` | auth | — |
| `PUT` | `/categories/:id` | auth | name, image, isActive |

| **products** | | | |
| `GET` | `/products/` | public | — |
| `POST` | `/products/` | auth | name, category, images, description, priceRupees, mrpRupees, stock, isActive |
| `DELETE` | `/products/:id` | auth | — |
| `GET` | `/products/:id` | public | — |
| `PUT` | `/products/:id` | auth | — |
| `POST` | `/products/:id/reviews` | auth | rating, comment |

| **orders** | | | |
| `GET` | `/orders/` | auth | — |
| `POST` | `/orders/` | verified | items, addressId, address |
| `GET` | `/orders/:id` | auth | — |

| **offers** | | | |
| `POST` | `/offers/coupons/validate` | auth | — |
| `GET` | `/offers/products/:productId/bundles` | public | — |

| **poojas** | | | |
| `GET` | `/poojas/bookings` | auth | — |
| `POST` | `/poojas/bookings` | verified | astrologerId, poojaType, preferredDate, priceRupees, specialInstructions |
| `GET` | `/poojas/bookings/:id` | auth | — |
| `PATCH` | `/poojas/bookings/:id/status` | auth | — |

| **ai** | | | |
| `POST` | `/ai/chart` | auth | — |
| `POST` | `/ai/chat` | auth | conversationId, message |
| `GET` | `/ai/conversations` | auth | — |
| `GET` | `/ai/conversations/:id` | auth | — |
| `POST` | `/ai/kundli` | auth | — |
| `POST` | `/ai/lal-kitab` | auth | — |

| **matrimony** | | | |
| `POST` | `/matrimony/match` | auth | profile1, profile2 |
| `GET` | `/matrimony/profiles` | auth | — |
| `POST` | `/matrimony/profiles` | auth | name, gender, dob, birthTime, birthPlace, maritalStatus, religion, caste, familyDetails, partnerExpectations, photos |
| `DELETE` | `/matrimony/profiles/:id` | auth | — |
| `GET` | `/matrimony/profiles/:id` | auth | — |
| `PUT` | `/matrimony/profiles/:id` | auth | — |
| `GET` | `/matrimony/search` | auth | — |

| **notifications** | | | |
| `GET` | `/notifications/` | auth | — |
| `PATCH` | `/notifications/:id/read` | auth | — |
| `PATCH` | `/notifications/read-all` | auth | — |

| **content** | | | |
| `GET` | `/content/` | public | — |
| `GET` | `/content/:key` | public | — |

| **support** | | | |
| `GET` | `/support/tickets` | auth | — |
| `POST` | `/support/tickets` | auth | category, subject, description, attachments |
| `GET` | `/support/tickets/:id` | auth | — |
| `POST` | `/support/tickets/:id/reply` | auth | message |

| **enquiries** | | | |
| `POST` | `/enquiries/` | public | name, email, phone, subject, message, anonId |
