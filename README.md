# Group6Project
## Team Members
- Yomna Fassatoui
- Leo Freije
- Jordan Baugh
- Kolina Katoanga

# Study Buddy Finder

## Project Overview

Study Buddy Finder is a mobile application designed to help San Diego State University (SDSU) students find classmates to study with. Students can create a profile with their major, course of interest, contact information, and availability to help them find compatible study partners.

## Current Status

- **Profile Creation:** Implemented and connected to Supabase to save student information.
- **Login:** The Login page has been created, but authentication is not yet implemented.
- **Study Buddy Board:** The board has been created and displays sample student profiles. It is not yet connected to real student data.
- **Meeting Request Management:** Not yet implemented.

## Technologies Used

- Flutter
- Dart
- Supabase
- Git and GitHub

## Getting Started

### Prerequisites

Install the following tools:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Git](https://git-scm.com/downloads)
- [Visual Studio Code](https://code.visualstudio.com/) or another code editor

Check that Flutter is installed correctly:

```bash
flutter doctor
```

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Deismus/Group6Project.git
   ```

2. Navigate to the project directory:

   ```bash
   cd Group6Project
   ```

3. Install the dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application in Chrome:

   ```bash
   flutter run -d chrome
   ```

Supabase configuration may be required for backend features to work correctly.

## Main Features

### Create Profile

Students can enter their information, select their major and course, provide contact information, and add their availability. The registration form uses Supabase to save profile data.

### Log In

Students can enter their Red ID and password on the Login page. Credential verification and authentication still need to be implemented.

### Browse Study Buddy Board

Students can view sample study buddy profiles, including their major, course, and availability. Connecting the board to real student data and implementing matching functionality are future tasks.

### Meeting Request Management

Planned functionality includes sending meeting requests, accepting or declining requests, and viewing contact information to coordinate study sessions.

## Development and Testing

The project is managed through GitHub. Pull requests are used to review and merge changes.

Automated test results can be checked in the repository's **Actions** tab. The status of the latest checks should be verified before considering a change ready to merge.

## How to run the tests

1. Install Flutter (https://docs.flutter.dev/get-started/install) and make sure `flutter doctor` runs.
2. Clone the repo and open a terminal in the project folder:
   git clone https://github.com/Deismus/Group6Project
   cd Group6Project
3. Download the dependencies:
   flutter pub get
4. Run every test:
   flutter test
5. To run one test file, give its path, for example:
   flutter test test/password_validation_test.dart
6. Expected result on main: 13 tests pass and 1 fails. The failing one is
   test/supabase_test.dart, which was already failing before this sprint
   (MissingPluginException for shared_preferences).

The unit tests do not need Supabase access. To run the app itself (flutter run -d chrome),
you need access to the team's Supabase project.

## Repository

[Study Buddy Finder on GitHub](https://github.com/Deismus/Group6Project)
