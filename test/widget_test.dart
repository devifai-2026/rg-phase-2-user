// Minimal smoke test. The full app needs a wired AuthProvider + SettingsProvider
// and network, so we just verify the brand logo widget renders.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rg_user/theme/app_theme.dart';
import 'package:rg_user/widgets/rg_logo.dart';

void main() {
  testWidgets('RgLogo renders', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: AppTheme.dark(),
      home: const Scaffold(body: Center(child: RgLogo(size: 120, showWordmark: true))),
    ));
    expect(find.byType(RgLogo), findsOneWidget);
  });
}
