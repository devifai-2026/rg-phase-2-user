plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    // Firebase (FCM). Must be applied after the Android + Flutter plugins.
    id("com.google.gms.google-services")
}

android {
    namespace = "com.rudraganga.rg_user"
    compileSdk = 36 // plugins (image_picker, geocoding, …) require compileSdk >= 36
    ndkVersion = flutter.ndkVersion

    compileOptions {
        // flutter_local_notifications needs core library desugaring.
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        // App-factory: EVERY tenant (including Rudraganga) injects its own
        // applicationId + label at build time via Gradle properties, set by the
        // build worker. The compiled default is brand-NEUTRAL on purpose — no
        // tenant's brand (e.g. Rudraganga) may leak into another tenant's build.
        applicationId = (project.findProperty("tenant.applicationId") as String?) ?: "app.saasastro.user"
        resValue("string", "app_name", (project.findProperty("tenant.appLabel") as String?) ?: "Astro App")
        // Per-tenant deep-link scheme for the AndroidManifest intent-filter. Must
        // match ApiConfig.deepLinkScheme (--dart-define=DEEPLINK_SCHEME). Neutral
        // default so no tenant's brand leaks into another tenant's build.
        manifestPlaceholders["deepLinkScheme"] = (project.findProperty("tenant.deepLinkScheme") as String?) ?: "astroapp"
        // Per-tenant App-Links host (https deep links). Neutral default; each
        // tenant build passes its own domain so no tenant's domain leaks.
        manifestPlaceholders["appLinkHost"] = (project.findProperty("tenant.appLinkHost") as String?) ?: "app.example.com"
        // 24 = required by geolocator/geocoding AndroidX deps. (Note8 is API 28, fine.)
        minSdk = 24
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // Per-tenant release signing: the build worker passes -Ptenant.keystore +
    // -Ptenant.keystoreProps (a props file with storePassword/keyAlias/keyPassword).
    // Absent → fall back to debug signing so dev builds still work (NOT Play-ready).
    val tenantKeystore = project.findProperty("tenant.keystore") as String?
    val tenantKeystoreProps = project.findProperty("tenant.keystoreProps") as String?
    if (tenantKeystore != null && tenantKeystoreProps != null && file(tenantKeystoreProps).exists()) {
        val props = java.util.Properties().apply { load(java.io.FileInputStream(tenantKeystoreProps)) }
        signingConfigs.create("tenant") {
            storeFile = file(tenantKeystore)
            storePassword = props.getProperty("storePassword")
            keyAlias = props.getProperty("keyAlias")
            keyPassword = props.getProperty("keyPassword")
        }
    }

    buildTypes {
        release {
            signingConfig = if (signingConfigs.findByName("tenant") != null)
                signingConfigs.getByName("tenant")
            else
                signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
