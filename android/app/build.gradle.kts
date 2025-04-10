plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}


import java.util.Properties
import java.io.FileInputStream

// Add this block before the android { ... } block
val keystorePropertiesFile = rootProject.file("/Users/paruljuniwal/kuzushi_labs/metesh/iti/employer_flutter/android/key.properties") // Path relative to android/app/build.gradle.kts
val keystoreProperties = Properties()
if (keystorePropertiesFile.exists()) {
    try {
        keystoreProperties.load(FileInputStream(keystorePropertiesFile))
    } catch (e: Exception) {
        println("Warning: Failed to load key.properties: ${e.message}")
        // Handle error appropriately, e.g., throw exception if signing is mandatory
    }
} else {
    println("Warning: key.properties file not found.")
    // Handle missing file case if necessary
}


android {
    namespace = "com.kuzushiprotean.stafup"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "29.0.13113456"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    // --- Signing Configurations ---
    signingConfigs {
        create("release") {
            // Use properties from key.properties
            // Ensure these property names match exactly what's inside your key.properties file
            val storeFilePath = keystoreProperties.getProperty("storeFile")
            val storePass = keystoreProperties.getProperty("storePassword")
            val alias = keystoreProperties.getProperty("keyAlias")
            val keyPass = keystoreProperties.getProperty("keyPassword")

            // Check if properties were loaded successfully before assigning
            if (storeFilePath != null && storePass != null && alias != null && keyPass != null) {
                // If storeFile path in key.properties is relative, resolve it relative to the project root or android dir
                // Assuming it's relative to the project root where key.properties resides for this example:
                 storeFile = rootProject.file(storeFilePath) // Or rootProject.file("android/$storeFilePath") if relative to android dir
                // If storeFilePath is absolute, you might not need rootProject.file()
                // storeFile = file(storeFilePath) // Use this if the path is absolute

                storePassword = storePass
                keyAlias = alias
                keyPassword = keyPass
            } else {
                 println("Warning: Not all keystore properties found in key.properties. Release build may not be signed correctly.")
                 // You might want to throw an error here in a CI/CD environment
                 // throw GradleException("Missing keystore properties in key.properties.")
            }
        }
        // debug configuration is automatically created by Android Gradle Plugin
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.kuzushiprotean.stafup"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("release")
        }
    }

    flavorDimensions += "app"

    productFlavors {
        create("dev") {
            dimension = "app"
            resValue("string", "app_name", "STAFUP Dev")
            applicationIdSuffix = ""
        }
        create("uat") {
            dimension = "app"
            resValue("string", "app_name", "STAFUP UAT")
            applicationIdSuffix = ""
        }
        create("prod") {
            dimension = "app"
            resValue("string", "app_name", "STAFUP")
            applicationIdSuffix = ""
        }
    }
}

flutter {
    source = "../.."
}
dependencies {
    // Import the BoM for the Firebase platform
    implementation(platform("com.google.firebase:firebase-bom:33.12.0"))

    // Add the dependency for the Firebase Authentication library
    // When using the BoM, you don't specify versions in Firebase library dependencies
    implementation("com.google.firebase:firebase-auth")
}