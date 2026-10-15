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

## Repository

[Study Buddy Finder on GitHub](https://github.com/Deismus/Group6Project)
