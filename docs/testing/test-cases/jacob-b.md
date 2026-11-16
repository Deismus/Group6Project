Test Cases: [Jacob B]
Team number: [07] My area: [Scheduling]

Test ID: JB-01 From Part 6: (old test number, or New) 
Written by: Jacob Black
Title: User is able to register 2 sessions with the same day and time
Traces to: register.dart line 398
Test type: (Security) 
Preconditions: Open registration page
Test data:

Steps: Fill in information normally, add a session so that you are registering with 2 sessions, set the day and time of both sessions to be the same, click "submit data" button

Expected result: user receives an error message and stays on the registration page
Actual result: sessions are accepted and user is brought to selection page
Status: Fail
Severity: Minor
V or V: Verification
GitHub Issue: (#number, Fail only)

-

Test ID: JB-02 From Part 6: (old test number, or New) 
Written by: Jacob Black
Title: Password field says to enter a password between 8-20 characters despite CR-3 saying 8-30
Traces to: register.dart line 398
Test type: (Unit) 
Preconditions: Open registration page
Test data:

Steps: Select empty password field

Expected result: user is told to enter a password between 8-30 characters
Actual result: user is told to enter a password between 8-20 characters
Status: Fail
Severity: Minor
V or V: Validation
GitHub Issue: (#number, Fail only)

-

Test ID: JB-03 From Part 6: (old test number, or New) 
Written by: Jacob Black
Title: User is able to manually input times that are impossible
Traces to: register.dart line 398
Test type: (Negative) 
Preconditions: Open registration page
Test data:

Steps: Fill in information normally, making sure to choose times from the drop down menu so that the start is before the ends,
afterwards in either the start time or end time input fields, manually write in a time that is impossible such as "10:72"

Expected result: user recieves an error message and input is rejected
Actual result: input is accepted
Status: Fail
Severity: Major
V or V: Verification
GitHub Issue: (#number, Fail only)

-

Test ID: JB-04 From Part 6: (old test number, or New) 
Written by: Jacob Black
Title: User is able to manually input an end time that is before the start time
Traces to: register.dart line 398
Test type: (Negative) 
Preconditions: Open registration page
Test data:

Steps: Fill in information normally, making sure to choose times from the drop down menu so that the start is before the end,
afterwards in either the start time or end time input fields, manually write in a time so that the end time is before the start time

Expected result: user recieves the "end time must be after start time" error message and input is rejected
Actual result: input is accepted
Status: Fail
Severity: Major
V or V: Verification
GitHub Issue: (#number, Fail only)

-

Test ID: JB-05 From Part 6: (old test number, or New) 
Written by: Jacob Black
Title: User is able to manually input letters into the time fields
Traces to: register.dart line 398
Test type: (Negative) 
Preconditions: Open registration page
Test data:

Steps: Fill in information normally, making sure to choose times from the drop down menu so that the start is before the end,
afterwards in either the start time or end time input fields, manually write in letters or other characters

Expected result: user recieves an error message and input is rejected
Actual result: input is accepted
Status: Fail
Severity: Major
V or V: Verification
GitHub Issue: (#number, Fail only)
