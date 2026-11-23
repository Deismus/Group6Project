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

5) Board Snapshot:

6) Sprint Summary: 
