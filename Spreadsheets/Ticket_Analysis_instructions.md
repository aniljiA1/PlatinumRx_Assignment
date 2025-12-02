This file explains step-by-step how to build the spreadsheet tasks in Excel or Google Sheets.


1. Create workbook `Ticket_Analysis.xlsx` with two sheets: `ticket` and `feedbacks`.


2. Columns for `ticket` sheet (example):
- A: ticket_id
- B: created_at (datetime)
- C: closed_at (datetime)
- D: outlet_id
- E: cms_id


3. Columns for `feedbacks` sheet (example):
- A: cms_id
- B: feedback_at
- C: feedback_rating
- D: ticket_created_at (to be filled)


4. Populate data (copy/paste sample rows provided in assignment).


5. In `feedbacks!D2`, use INDEX/MATCH:
```excel
=IFERROR(INDEX(ticket!$B:$B, MATCH($A2, ticket!$E:$E, 0)), "")