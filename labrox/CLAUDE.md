# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

- Run the app: `flutter run`
- Build APK (debug): `flutter build apk --debug`
- Build APK (release): `flutter build apk --release`
- Run tests: `flutter test`
- Run a single test: `flutter test test/your_test_file.dart`
- Analyze code: `flutter analyze`
- Get dependencies: `flutter pub get`
- Upgrade dependencies: `flutter pub upgrade`
- Check for outdated dependencies: `flutter pub outdated`
- Clean build: `flutter clean`
- Generate icons: `flutter pub run flutter_launcher_icons:main` (if configured)

## Project Structure

This is a Flutter application with the following key directories:

- `lib/`: Contains all Dart source code for the application
  - `main.dart`: Entry point of the application, defines the RakshaApp widget and theme configuration
  - `screens/`: Contains the main screens of the application
    - `home_dashboard.dart`: Main dashboard screen (likely shows fundraising overview)
    - `trusted_contacts.dart`: Screen for managing trusted contacts
    - `settings.dart`: Application settings screen
- `android/`: Android-specific project files and configuration
- `ios/`: iOS-specific project files and configuration
- `assets/`: Stores static assets like images, icons, and SVGs (referenced in main.dart for drawer icons)

## Architecture Overview

The application follows a standard Flutter structure:

1. **State Management**: Uses StatefulWidget for the main screen (`HomeScreen`) with bottom navigation to switch between three primary views:
   - Home Dashboard (index 0)
   - Trusted Contacts (index 1) - shows a floating action button to add contacts
   - Settings (index 2)

2. **Theme Configuration**: 
   - Defined in `main.dart` using ThemeData with custom color scheme
   - Uses Google Fonts (Bebas Neue) for typography
   - Supports both light and dark themes with specific color configurations

3. **Navigation**: 
   - Bottom navigation bar with three destinations (Home, Contacts, Settings)
   - Index-based widget switching in `_widgetOptions` list

4. **UI Components**:
   - Uses Material Design 3 components
   - Custom SVG icons for drawer/menu (assets/icons/drawer2.svg)
   - Floating Action Button for adding contacts (only visible in Contacts tab)

## Key Features Observed

- The app is named "Raksha" (appears in AppBar title as "Rakshak")
- Primary color scheme uses deep slate/blue (#1E293B) with trustworthy blue (#3B82F6) and reassuring green (#10B981)
- Error state uses crimson red (#EF4444)
- Dark theme uses deep purple seed with custom primary/secondary colors
- Scaffold background is very dark (#0F172A) for light theme

## Common Tasks

When working on this codebase:
- To modify navigation or add new screens: edit `_widgetOptions` in `main.dart` and add corresponding destination in `NavigationBar`
- To change theme colors: modify the `ColorScheme.fromSeed` parameters in `main.dart`
- To add new assets: place them in `assets/` directory and reference in `pubspec.yaml` (if not already configured)
- To modify screen content: work within the respective screen files in `lib/screens/`