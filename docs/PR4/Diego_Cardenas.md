# Diego Cardenas Pineda

## Bug 1: Availability accepts end time equal to or before start time
- Issue: https://github.com/Deismus/Group6Project/issues/147
- PR: https://github.com/Deismus/Group6Project/pull/148
- Before: <img width="1231" height="329" alt="diego_cardenas_issue147_before" src="https://github.com/user-attachments/assets/69b4f041-fdee-4911-bdfe-7f26bf6a9a67" />
- After: <img width="1226" height="568" alt="diego_cardenas_issue147_after" src="https://github.com/user-attachments/assets/1c6ad891-9d91-4330-a77f-eed5e4d63661" />
- Bucket: Code bug. The test correctly expects an error, and the constructor returned an Availability object with no check.
- AI disclosure: Claude helped me draft the test. 

## Bug 2: Password validation is missing
- Issue: https://github.com/Deismus/Group6Project/issues/153
- PR: https://github.com/Deismus/Group6Project/pull/155
- Before: <img width="1226" height="568" alt="diego_cardenas_issue153_before" src="https://github.com/user-attachments/assets/99998d8b-3177-4e75-a927-af9b05d58097" />
-After: <img width="701" height="56" alt="diego_cardenas_issue153_after" src="https://github.com/user-attachments/assets/ec24c30d-abe7-4d81-9b41-4ed6919f5703" />
- Bucket: Code bug. The tests are correct, and `validatePassword` was never written (compile error: Method not found).
- AI disclosure: Claude helped me draft the test. 
