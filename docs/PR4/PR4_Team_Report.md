1) Bug Triage Table
  |Test Name|Bucket|Issue|Severity|Priority|Owner|Status|
  |-----|-----|-----|-----|-----|-----|-----|
  |DY-04|Code|#101|Minor|Low|Darrin|Fixed|
  |DC-03|Code|#121|Minor|Low|Diego|Fixed|

2) Regression Log:
   No regressions found. 

Sun Nov 22, 2026: baseline before fixes: 5 passed, 1 failed (supabase_test.dart, pre-existing)
Nov 22, 2026: ran the full suite (flutter test) after all fixes were merged to main. No regressions were found on any of the fixes. The only failing test is supabase_test.dart, which was already failing before any fix.

3) Final Test Run:

4) Feature Decision: Login, "As a student I want to be able to login so I can see profiles." We chose this feature as it enables other features to be implemented, and it's a major part of the program. Case 1: Registered information can be viewed in the data base and on the board. Case 2: The user will be able to use the login buttons and features to access their account.

5) Board Snapshot:<img width="255" height="331" alt="Screenshot 2026-11-22 231440" src="https://github.com/user-attachments/assets/ff8b2491-aa3e-480c-94f6-19a40aca921c" />
<img width="248" height="320" alt="Screenshot 2026-11-22 231453" src="https://github.com/user-attachments/assets/eb02d7eb-04c9-4809-ab5f-b9778e9c2095" />
<img width="253" height="319" alt="Screenshot 2026-11-22 231507" src="https://github.com/user-attachments/assets/819551b8-ee86-4a50-98bd-12394890f8c1" />

6) Sprint Summary:
   Mostly registration bugs are fixed, bugs like characters limits, deleting characters, loading majors. There are still some registration bugs that need to be addressed, as well as database bugs. The program has few features, and registration is the biggest one, so inevitable there were many bugs in relation to that. Next sprint we will look at the possibility of implementing a login feature. That makes the most sense to us, because without a login feature no other major features can even function. 
