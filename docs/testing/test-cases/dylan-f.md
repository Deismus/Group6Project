Test Cases: Dylan F
Team number: 07
My area: Registration inputs: Red ID and phone number (lib/pages/register.dart, lib/validation/profile_validation.dart, lib/classes/student.dart)

How tests were run: flutter run -d chrome on main (commit dc0690e), Windows PC. Saved data was read in the Supabase Table Editor, table test-users (the table the app writes to). The phone field formats input with dashes as you type (6195550123 displays and is stored as 619-555-0123).



Test ID: DF-01
From Part 6: New
Written by: Dylan Fermo
Title: Red ID starting with one 0 is stored with its leading zero
Traces to: REQ-DF-01
Test type: Integration
Preconditions: App running. Supabase Table Editor open on test-users. No existing row with this Red ID.
Test data:

Name: TestingStudentFermo
Phone: 6195550123
Password / confirm: Passw0rd!!
Major: Computer Science; Class: MATH 596; Availability: any valid slot
Red ID: 012345678

Steps:

On the Login page click Register.
Fill in every field with the test data.
Click Submit Data.
Open test-users in the Supabase Table Editor and find the newest row.
Read the redID column.

Expected result: The save succeeds and redID is 012345678 (9 characters, first character 0).
Actual result: The save succeeded with no error. The table shows redID 12345678 (8 characters). The leading zero was removed.
Status: Fail
Severity: Major
V or V: Verification
GitHub Issue: #128



Test ID: DF-02
From Part 6: New
Written by: Dylan Fermo
Title: Red ID field accepts exactly 9 digits and blocks anything else
Traces to: REQ-DF-02, NFR-DF-01
Test type: Boundary Value
Preconditions: Register page open. All other fields valid.
Test data: Red ID 123456789 (9 digits), 12345678 (8 digits), 1234567890 (10 digits)

Steps:

Type the 8-digit Red ID. Check whether submitting data is possible or not.
Type the 9-digit Red ID. Check whether submitting data is possible or not.
Try to type a 10th digit.

Expected result: With 8 digits, Submit Data cannot be clicked. With 9 digits it can be clicked. A 10th digit cannot be typed, and the field stays at 9 digits.
Actual result: Submit Data stayed disabled until 9 digits were entered. A 10th digit could not be typed.
Status: Pass
Severity: N/A
V or V: N/A
GitHub Issue: N/A



Test ID: DF-03
From Part 6: New
Written by: Dylan Fermo
Title: Letters cannot be entered in the Red ID field
Traces to: REQ-DF-03, NFR-DF-01
Test type: Negative
Preconditions: Register page open.
Test data: Red ID attempt 12345678A

Steps:

Click the Red ID field.
Type 12345678A.
Look at what appears in the field.

Expected result: The letter A does not appear in the field. Only the digits can be entered.
Actual result: Letters cannot be typed into the Red ID field.
Status: Pass
Severity: N/A
V or V: N/A
GitHub Issue: N/A



Test ID: DF-04
From Part 6: New
Written by: Dylan Fermo
Title: Phone number must be exactly 10 digits
Traces to: REQ-DF-04, NFR-DF-01
Test type: Boundary Value
Preconditions: Register page open. All other fields valid.
Test data: Phone 619555012 (9 digits), 6195550123 (10 digits), and an attempted 11th digit

Steps:

Type the 9-digit phone. Check whether submitting data is possible or not.
Type the 10-digit phone. Check whether submitting data is possible or not and how the number is displayed.
Try to type an 11th digit.

Expected result: With 9 digits, Submit Data cannot be clicked. With 10 digits it can, and the number displays as 619-555-0123. An 11th digit cannot be typed.
Actual result: With 9 digit, Submit Data is unable to be clicked and you can't go past 10 digits so 11th digit is unable to be typed. Only when there are 10 digits in the prompt is it possible.
Status: Pass
Severity: N/A
V or V: N/A
GitHub Issue: N/A



Test ID: DF-05
From Part 6: New
Written by: Dylan Fermo
Title: A student's stored Red ID matches the one on their card
Traces to: G-DF-01
Test type: Acceptance
Preconditions: App running. Login is not working in the app, so the stored value is checked in the Supabase table instead.
Test data: Student A Red ID 123456789. Student B Red ID 012345678. All other fields valid.

Steps:

Register Student A with Red ID 123456789.
Register Student B with Red ID 012345678.
In test-users, compare each stored redID with the Red ID that was entered.

Expected result: Both stored Red IDs equal the entered IDs exactly, so each student could be found by the number on their card.
Actual result: Student A (123456789) was stored as 123456789, a match. Student B (012345678) was stored as 12345678, not a match. Any Red ID starting with 0 is stored differently from the real one.
Status: Fail
Severity: Major
V or V: Verification (same root cause as DF-01). It also fails the student's goal G-DF-01 for anyone whose ID starts with 0.
GitHub Issue: #130



Test ID: DF-06
From Part 6: New
Written by: Dylan Fermo
Title: Red ID with several leading zeros loses all of them
Traces to: REQ-DF-01
Test type: Boundary Value
Preconditions: Same as DF-01.
Test data: Red ID 000000099 (all other fields as in DF-01)

Steps:

Register with the test data.
Open test-users and read the redID of the newest row.

Expected result: redID is 000000099 (9 characters).
Actual result: The save succeeded. redID is stored as 99. Every leading zero was removed.
Status: Fail
Severity: Major
V or V: Verification
GitHub Issue: #129


