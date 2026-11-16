# Traceability Matrix

**Team number:** 07
**Filled in by (captain):** Diego Cardenas Pineda

Fill this in **after** everyone's work is merged. One row per requirement.

## Requirements to Tests

| Requirement ID | From Part 5 | Owner | Test case IDs | Result | GitHub Issue # |
|---|---|---|---|---|---|
| REQ-MG-01 *(example)* | CR-3 | Maria | MG-01, MG-02 | 1 Pass, 1 Fail | #12 |
| G-DY-01 | New | Darrin | G-DY-01 | 1 Fail | #117 |
| REQ-DY-01 | CR-1 | Darrin | DY-01 | 1 Fail | #114 |
| REQ-DY-02 | CR-4 | Darrin | DY-02 | Marked "Working as intended" (no Pass/Fail) | #115 |
| REQ-DY-03 | New | Darrin | DY-03 | 1 Fail | #116 |
| NFR-DY-01 | New | Darrin | None | Not tested | N/A |
| G-DC-01 | New | Diego | DC-04 | 1 Fail | #122 |
| REQ-DC-01 | CR-2 | Diego | DC-02 | 1 Fail | #120 |
| REQ-DC-02 | CR-5 | Diego | None | Not tested | N/A |
| REQ-DC-03 | New | Diego | None | Not tested | N/A |
| REQ-DC-04 | New | Diego | None | Not tested | N/A |
| REQ-DC-05 | New | Diego | None | Not tested | N/A |
| NFR-DC-01 | New | Diego | DC-01 | 1 Pass | N/A |
| NFR-DC-02 | New | Diego | DC-03 | 1 Fail | #121 |
| REQ-JB-01 | New | Jacob | JB-03 | 1 Fail | None filed |
| REQ-JB-02 | New | Jacob | JB-05 | 1 Fail | None filed |
| REQ-JB-03 | New | Jacob | JB-01 | 1 Fail | None filed |
| REQ-JB-04 | CR-3 | Jacob | JB-04 | 1 Fail | None filed |
| NF-JB-01 | New | Jacob | None | Not tested | N/A |
| G-DF-01 | New | Dylan | DF-05 | 1 Fail | #130 |
| REQ-DF-01 | New | Dylan | DF-01, DF-06 | 2 Fail | #128, #129 |
| REQ-DF-02 | New | Dylan | DF-02 | 1 Pass | N/A |
| REQ-DF-03 | New | Dylan | DF-03 | 1 Pass | N/A |
| REQ-DF-04 | New | Dylan | DF-04 | 1 Pass | N/A |
| NFR-DF-01 | New | Dylan | DF-02, DF-03, DF-04 | 3 Pass | N/A |

## Gaps

- Requirements with no test: NFR-DY-01, REQ-DC-02, REQ-DC-03, REQ-DC-04, REQ-DC-05, NF-JB-01
- Goals with no test: G-DC-02, G-DC-03, G-JB-01
- Tests with no requirement: JB-02 (password hint says 8-20 instead of 8-30; Jacob has no requirement for it)
- Part 5 requirements or Part 6 tests nobody brought over: None. All five Part 5 requirements (CR-1, CR-2, CR-3, CR-4, CR-5) were carried over, and no test file lists a Part 6 test as upgraded.

## Test Type Coverage

Put a Test ID next to each type. Team minimum: all 7.

| Test type | Test ID |
|---|---|
| Unit | DY-02 |
| Integration | DC-02, DF-01, DY-03 |
| System (E2E) | None |
| Acceptance | DC-04, DF-05 |
| Boundary Value | DF-02, DF-04, DF-06, DY-01 |
| Negative | DC-03, DF-03, JB-03 |
| Security | DC-01, JB-01, G-DY-01 |

## Validation Findings

A Validation finding means the system does what the requirement says, but the requirement does not serve the Stakeholder Goal. Remember the alphabetical leaderboard.

| Requirement ID | Goal it fails | Why | Issue # |
|---|---|---|---|
| REQ-JB-01 to REQ-JB-04, NF-JB-01 | G-JB-01 | All of these only validate session time input. None of them makes students who share my major appear at the top of the list, so the goal can pass every requirement and still not be met. | None filed |
| (no requirement) | G-DY-01 | The goal is to reset a password via phone number, but no requirement covers it and the feature is not implemented. | #117 |

**If you found none,** explain in 2 to 3 sentences why every requirement truly serves its Goal:

> N/A. Validation findings were found, see the table above.

## Summary

| | Count |
|---|---|
| Part 5 requirements carried over | 5 |
| New requirements added | 16 |
| Part 6 tests upgraded (out of 3) | 0 |
| Total requirements | 21 |
| Total test cases | 19 |
| Passed | 4 |
| Failed | 14 |
| Issues opened | 10 |
| Critical issues | 1 |

**In one sentence, would you ship this system today? Why or why not?**

> No. 14 of 19 tests failed, including a critical bug where the major and class lists load forever on Register, so a new student can't finish signing up.
