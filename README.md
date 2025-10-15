# taxi_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Onboarding screens (Client & Driver)

This repo includes modular onboarding implementations for both the Client (passenger) and Driver apps.

- Client onboarding: `lib/client_app/onboarding_screens/onboarding_one.dart`
- Client logo screen: `lib/client_app/onboarding_screens/logo_screen.dart`
- Driver onboarding: `lib/driver_app/onboarding/driver_onboarding.dart`
- Shared widgets: `lib/common/widgets/onboarding_page.dart` and `lib/common/widgets/onboarding_indicator.dart`

Images are stored under `assets/onboarding/` and referenced directly (example: `assets/onboarding/onboarding_one.png`). Ensure `pubspec.yaml` contains the `assets/onboarding/` entry (already present).

How to use:
- Replace the temporary TODO navigation in the onboarding `Done` handlers with your app's login/home routes.
- Example: from `main.dart` set `home: const ClientOnboarding()` to quickly test.

Suggested improvements:
- Add small animated transitions for image entrance (fade/slide).
- Persist a flag in local storage (SharedPreferences) to skip onboarding after first run.
- Add accessibility labels to images and buttons.
