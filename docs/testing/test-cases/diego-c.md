# Test Cases: Diego C

**Team number:** 07
**My area:** Data Storage

---

**Test ID:** DC-01
**From Part 6:** New
**Written by:** Diego Cardenas Pineda
**Title:** Anon cannot add a major
**Traces to:** NFR-DC-01
**Test type:** Security
**Preconditions:** Supabase URL and publishable key from lib/main.dart. Not signed in.
**Test data:** Major name: ZZ Test Major

**Steps:**
1. Run: `curl -i -X POST "{SUPABASE_URL}/rest/v1/majorslist" -H "apikey: {PUBLISHABLE_KEY}" -H "Content-Type: application/json" -d '{"name":"ZZ Test Major"}'`

**Expected result:** Status 401 or 403 with code 42501 (permission denied). The major is not added.
**Actual result:** Status 401. Code 42501, message "new row violates row-level security policy for table majorslist". The major was not added.
**Status:** Pass
**Severity:** N/A
**V or V:** N/A
**GitHub Issue:** N/A

---

**Test ID:** DC-02
**From Part 6:** New
**Written by:** Diego Cardenas Pineda
**Title:** Anon can read the full list of majors
**Traces to:** REQ-DC-01
**Test type:** Integration
**Preconditions:** Supabase URL and publishable key from lib/main.dart. Not signed in.
**Test data:** None

**Steps:**
1. Run: `curl "{SUPABASE_URL}/rest/v1/majorslist?select=name" -H "apikey: {PUBLISHABLE_KEY}"`
2. Look for "Other" in the output.

**Expected result:** The full list of majors, including "Other".
**Actual result:** 103 majors were returned. "Other" is not in the list.
**Status:** Fail
**Severity:** Major
**V or V:** Verification
**GitHub Issue:** [DC-02] Major list has no "Other"

---

**Test ID:** DC-03
**From Part 6:** New
**Written by:** Diego Cardenas Pineda
**Title:** Error message when the major list cannot load
**Traces to:** NFR-DC-02
**Test type:** Negative
**Preconditions:** App is running with `flutter run -d chrome`, on the Log In page.
**Test data:** Network set to Offline.

**Steps:**
1. Open Chrome DevTools (F12) and go to the Network tab.
2. Set throttling to Offline.
3. Click Register.
4. Wait 10 seconds.

**Expected result:** The spinner is replaced by "Could not load majors. Please try again."
**Actual result:** The spinner kept spinning after 10 seconds. No error message appeared.
**Status:** Fail
**Severity:** Major
**V or V:** Verification
**GitHub Issue:** [DC-03] No error message when the major list cannot load

---

**Test ID:** DC-04
**From Part 6:** New
**Written by:** Diego Cardenas Pineda
**Title:** Student can find and pick "Other" in the major dropdown
**Traces to:** G-DC-01
**Test type:** Acceptance
**Preconditions:** App is running with `flutter run -d chrome`, on the Log In page. Online.
**Test data:** Major: Other

**Steps:**
1. Click Register.
2. Open the "Select a major" dropdown.
3. Look for "Other" in the list.
4. Click "Other".

**Expected result:** "Other" is in the list. No option is blank or repeated. The dropdown shows "Other" after clicking it.
**Actual result:** "Other" is not in the dropdown, so it could not be selected.
**Status:** Fail
**Severity:** Major
**V or V:** Verification
**GitHub Issue:** [DC-04] "Other" is missing from the major dropdown

---
