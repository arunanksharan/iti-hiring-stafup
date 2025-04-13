## command for build_runner

## if shoe any error in bloc run this commend

```cmd
   dart run build_runner build --delete-conflicting-outputs
```

## For VS Code users

```
You can go the desired main file and click run without debugging or you can type the following commands in terminal
```

```For Dev
flutter run --flavor dev -t lib/main_dev.dart
```

```For Prod
flutter run --flavor prod -t lib/main_prod.dart
```

```For Uat
flutter run --flavor uat -t lib/main_uat.dart
```

## Build APK with different flavors

```For UAT build
flutter build apk --release --no-tree-shake-icons --flavor uat -t lib/main_uat.dart
```

```For build appbundle
flutter build appbundle --release --no-tree-shake-icons --flavor uat -t lib/main_uat.dart
```

```For DEV build
flutter build apk --release --no-tree-shake-icons --flavor dev -t lib/main_dev.dart
```

```For PROD build
flutter build apk --release --no-tree-shake-icons --flavor prod -t lib/main_prod.dart
```

configure firebase

android/app/src/prod/google-services.json

lib/core/firebase/firebase_options_prod.dart
