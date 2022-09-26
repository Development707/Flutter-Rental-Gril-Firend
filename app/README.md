# RENTAL GIRL FRIEND APP

## Run app

```dart
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run --flavor=production --target="lib/main_production.dart" --dart-define="BASE_URL=www.production.com"
```

## Run build runner

```dart
flutter pub run build_runner watch
```

## Create native splash

```dart
flutter pub run flutter_native_splash:create
```

## Create launcher icons

```dart
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*
```

## Initial intl

```dart
flutter pub run intl_utils:generate
```
