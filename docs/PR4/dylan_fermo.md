# Dylan Jacob Fermo

## Bug 1: Red ID loses its leading zeros

- Issue: https://github.com/Deismus/Group6Project/issues/128 (also fixes #129 and #130, same cause as #100)
- PR: https://github.com/Deismus/Group6Project/pull/160
- Before: [issue128 before](screenshots/dylan_fermo_issue128_before.png)
- After: [issue128 after](screenshots/dylan_fermo_issue128_after.png)
- Bucket: Code bug. The test is correct. The app sends the Red ID as the text "012345678" (redID: _studentId in lib/classes/student.dart), but the redID column in the Supabase test-users table was int4, so the table stored 12345678. I knew it was the database and not the app because the column type showed int4 in the Table Editor.
- Fix: changed the redID column to text and padded the old rows back to 9 digits (database/redid_text.sql). After the change, registering Red ID 012345678 in the app is stored as 012345678.
- AI Disclosure: Claude helped me understand int4, int8, and text differences for table. I made the SQL changes myself accordingly.

## Bug 2: Register form rejects passwords longer than 20 characters

- Issue: https://github.com/Deismus/Group6Project/issues/134
- PR: https://github.com/Deismus/Group6Project/pull/164
- Before: [issue134 before](screenshots/dylan_fermo_issue134_before.png)
- After: [issue134 after](screenshots/dylan_fermo_issue134_after.png)
- Bucket: Code bug. The requirement (CR-1 / REQ-DY-01) says passwords can be up to 30 characters, but lib/pages/register.dart rejected anything over 20 and its hint text said 8-20. I knew the code was wrong because a 25-character password showed "Password must be 8-20 characters long".
- Fix: changed the hint text, the length check and the error message in register.dart from 8-20 to 8-30. The same 25-character password is now accepted and the app saves the profile and opens the Study Buddy Board.
- Full test suite after the fix: 13 passed, 1 failed. The failure is test/supabase_test.dart, which was already failing on main before this change (MissingPluginException for shared_preferences).
