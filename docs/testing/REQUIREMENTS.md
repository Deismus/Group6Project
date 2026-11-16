# Testable Requirements: [Study Buddy Finder]

**Team number:** [07]
**Inherited from:** Team [06]

## Who Owns What

| Area of the system | Owner | ID prefix |
|---|---|---|
| [Signup] | [Darrin Yun] | [DY] |
| | | |
| | | |
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
