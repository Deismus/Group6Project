# Test Cases: [Darrin Y]

**Team number:** [07]
**My area:** [Signup]

<!--
HOW TO USE THIS FILE
1. Copy this file. Name the copy with your first name and last initial, like  maria-g.md
2. Leave TEMPLATE.md untouched for your teammates.
3. If a Part 6 test belongs to your area, upgrade it first and put it in the first block.
   Write at least 4 test cases using at least 3 test types. Include 1 Acceptance test that traces to your Stakeholder Goal.
   Run every test on the inherited system. Every Fail gets a GitHub Issue.
4. Copy the block between the lines for each new test case.
5. Test IDs: use your initials plus a number, like  MG-01, MG-02. This keeps IDs unique across your team.
   "Traces to" must name one of YOUR requirement IDs, like REQ-MG-02.
6. See docs/TESTING_FIELD_GUIDE.md for the sample test case TC-00.
-->

---

**Test ID:** DY-01
**From Part 6:** (old test number, or New)
**Written by:** Darrin Yun
**Title:** Password boundary test
**Traces to:** register.dart line 346
**Test type:** Boundary
**Preconditions:** Go to register page.
**Test data:** 12345678901234567890

**Steps:**
1. Register new account.
2. Fill fields.
3. Attempt a password between 8 and 20 characters.

**Expected result:** Accept password and move to next if statement
**Actual result:** passwordError = 'Password must be 8-20 characters long';
**Status:** (Pass / Fail) Fail
**Severity:** (Critical / Major / Minor, Fail only) Minor
**V or V:** (Verification / Validation, Fail only) Verification
**GitHub Issue:** #114

---

**Test ID:** DY-02
**Written by:** Darrin Yun
**Title:** saveProfile() return bug
**Traces to:** student.dart saveProfile()
**Test type:** Unit
**Preconditions:** Create a new profile, and update it.
**Test data:** redID: 231532623, pw: 12341234 confirm pw: 12341234 phone: 619-111-1111, major: compsci class: intro to comp sci availability: sunday 12:00 13:00

**Steps:**
1. Register account.
2. Enter fields.
3. Create account.

**Expected result:** 'Could not save your profile. Please try again.'
**Actual result:** successful save
**Status:** Working as intended.
**Severity:** Minor
**V or V:** Verification
**GitHub Issue:** #115

---

**Test ID:** DY-03
**Written by:** Darrin Yun 
**Title:** Infinite loading to select major and class
**Traces to:** register.dart line 136
**Test type:** Integration
**Preconditions:** Attempt to register.
**Test data:**

**Steps:**
1. Run the program.
2. Register for a class.
3.

**Expected result:** [Select Major] [Select Course] boxes
**Actual result:** infinite loading
**Status:** Confirmed
**Severity:** Critical
**V or V:** Verification
**GitHub Issue:** #116

---

**Test ID:**G-DY-01
**Written by:** Darrin Yun
**Title:** Reset Password
**Traces to:** register.dart
**Test type:** Security
**Preconditions:** None
**Test data:** None

**Steps:**
1.
2.
3.

**Expected result:** None
**Actual result:** Unimplemented entirely
**Status:** Not Confirmed
**Severity:** Major
**V or V:** Validation
**GitHub Issue:** #117

---
