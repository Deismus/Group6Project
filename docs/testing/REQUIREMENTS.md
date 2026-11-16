# Testable Requirements: [Study Buddy Finder]

**Team number:** [07]
**Inherited from:** Team [06]

## Who Owns What

| Area of the system | Owner | ID prefix |
|---|---|---|
| [Signup] | [Darrin Yun] | [DY] |
|[Data Storage] |[Diego Cardenas Pineda] |[DC] |
|[RedID & Phone Number] | [Dylan Jacob Fermo] | [DF] |
| | | |

<!--
RULES
- Only edit YOUR OWN section below. This keeps merge conflicts away.
- Categories: G = Stakeholder Goal, REQ = Functional, NFR = Non-Functional.
- "From Part 5": write the original CR ID and its text from SYSTEM_MAP.md. Write "New" if you added it this sprint.
- Status: Confirmed or Suspected bug. No Unconfirmed allowed. Every Suspected bug needs a GitHub Issue.
- The test: could a stranger write a Pass or Fail test without asking you a question?
-->

---

## Section: [Signup] ([Darrin Yun])

### Stakeholder Goals

| ID | Stakeholder | Goal |
|---|---|---|
| G-DY-01 |Student User |The system shall allow a student to reset their password upon request via phone number. |

### Functional Requirements

| ID | Requirement | Status | From Part 5 |
|---|---|---|---|
| REQ-DY-01 | The system shall reject passwords that is less than 8, greater than 30 characters, empty, or does not use at least 3 special characters, and notify the user which requirement they failed to meet.  | Suspected |CR-1 The system shall reject a password that is less than 8 characters, greater than 30, is empty, and does not use at least 3 special characters. |
| REQ-DY-02 | The system shall notify the user every time a successful save occurs at any point in the program.| Suspected |CR-4 Candidate requirement The system shall return true from saveProfile() when a profile is saved successfully.|
| REQ-DY-03 | - The system shall load options for students to select when creating a new profile for major and class.| Suspected |New |

### Non-Functional Requirements

| ID | Requirement | Status | From Part 5 |
|---|---|---|---|
| NFR-DY-01 | The sign-up should log the user in under 5 seconds of creating a new account.| Suspected | New |

### Example of a Good Rewrite

| ID | Requirement | Status | From Part 5 |
|---|---|---|---|
| REQ-MG-01 | The system shall reject a profile bio longer than 280 characters with the error "Bio must be 280 characters or fewer." | Suspected bug | CR-3 (Unconfirmed): The system shall limit the bio to 280 characters. |
| NFR-MG-01 | The profile page loads in under 2 seconds with 100 profiles in the database. | Confirmed | New |

---

## Section: [Data Storage] ([Diego Cardenas Pineda])

### Stakeholder Goals

| ID | Stakeholder | Goal |
|---|---|---|
| G-DC-01 | SDSU student creating a profile | I can pick my major from a complete list that includes "Other", so my profile is accurate even if my major is not listed. |
| G-DC-02 | SDSU student looking for study partners | Each major appears exactly once in the list, so I never wonder which of two similar entries to choose. |
| G-DC-03 | SDSU student looking for study partners | The major I pick is stored in my profile in a form that can always be matched back to the major list, so people who share my major can find me. |

### Functional Requirements

| ID | Requirement | Status | From Part 5 |
|---|---|---|---|
| REQ-DC-01 | A request for all rows of `majorslist` made with the app's publishable (anon) key and no signed-in user shall return HTTP 200 and exactly 21 rows, including the row named "Other". | Confirmed | CR-2 (Unconfirmed): The system shall allow unauthenticated users to read the list of majors. |
| REQ-DC-02 | Inserting a row into `majorslist` with the name `Biology` while a row named `Biology` already exists shall fail with SQLSTATE 23505 (unique violation), and the table shall still hold 21 rows. | Confirmed | CR-5 (Confirmed): The system shall reject a major whose name already exists. |
| REQ-DC-03 | Inserting a row into `majorslist` whose name equals an existing name except for letter case or a trailing space (for example `biology`, `BIOLOGY`, or `Biology ` with one trailing space) shall fail, and the table shall still hold 21 rows. | Suspected bug | New |
| REQ-DC-04 | Inserting a row into `majorslist` whose name is an empty string or only spaces shall fail, and the table shall still hold 21 rows. | Suspected bug | New |
| REQ-DC-05 | After a student submits the Create Profile form with the major "Biology", the new `test-users` row shall have a `majorID` value equal to the `id` of the "Biology" row in `majorslist`. | Suspected bug | New |

### Non-Functional Requirements

| ID | Requirement | Status | From Part 5 |
|---|---|---|---|
| NFR-DC-01 | (Security) An INSERT, UPDATE, or DELETE on `majorslist` made as the `anon` role shall fail with SQLSTATE 42501 (permission denied), and the table shall still hold the same 21 rows afterward. | Confirmed | New |
| NFR-DC-02 | (Usability) When the request for `majorslist` fails, the Create Profile page shall replace the loading spinner with the text "Could not load majors. Please try again." within 10 seconds. | Suspected bug | New |


## Section: [Your Area] ([Your Name])

### Stakeholder Goals

| ID | Stakeholder | Goal |
|---|---|---|
| | | |

### Functional Requirements

| ID | Requirement | Status | From Part 5 |
|---|---|---|---|
| | | | |
| | | | |
| | | | |

### Non-Functional Requirements

| ID | Requirement | Status | From Part 5 |
|---|---|---|---|
| | | | |

---

## Section: [RedID & Phone Number] ([Dylan Jacob Fermo])

### Stakeholder Goals

| ID | Stakeholder | Goal |
|---|---|---|
| G-DF-01 | SDSU student registering for Study Buddy Finder | My Red ID and phone number are saved exactly as I typed them and mistakes are blocked before I submit, so classmates and the app can reliably identify me.

### Functional Requirements

| ID | Requirement | Status | From Part 5 |
|---|---|---|---|
| REQ-DF-01 | The system shall store a Red ID exactly as entered, including any leading zeros: entering 012345678 must be stored as 012345678 and entering 000000099 must be stored as 000000099. | Suspected bug (#128, #129, #130; related to #100) | New |
| REQ-DF-02 | The system shall not allow a Red ID that is not exactly 9 digits to be submitted: Submit Data stays disabled until 9 digits are entered and a 10th digit cannot be typed. | Confirmed | New |
| REQ-DF-03 | The system shall accept only digits in the Red ID field; letters cannot be entered. | Confirmed | New |
| REQ-DF-04 | The system shall allow a phone number to be submitted only if it is exactly 10 digits: Submit Data stays disabled with 9 or 11 digits. A valid number is displayed formatted as 619-555-0123. | Confirmed | New |

### Non-Functional Requirements

| ID | Requirement | Status | From Part 5 |
|---|---|---|---|
| NFR-DF-01 | The Register page shall prevent invalid Red ID and phone input before submission (digits only in Red ID, Red ID limited to 9 digits, Submit Data disabled unless the phone number is exactly 10 digits), so the user cannot reach a failed submit. | Confirmed | New |
