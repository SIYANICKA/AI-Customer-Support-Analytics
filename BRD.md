# Business Requirements Document — AI Customer Support Analytics

## 1. Project Overview
Build an analytics solution for 1,000 customer complaints to identify recurring issues, prioritize cases, measure resolution performance, and improve customer satisfaction.

## 2. Business Problem
Customer complaints arrive through multiple channels. Manual categorization creates inconsistent reporting, slower routing, and limited visibility into root causes. Management needs a single dashboard for complaint volume, priority, resolution time, and CSAT.

## 3. Objectives
- Categorize complaints consistently.
- Identify the most common complaint categories/issues.
- Measure average resolution time and 24-hour SLA performance.
- Track customer satisfaction.
- Identify high-priority and low-CSAT areas.
- Recommend an AI-based auto-categorization workflow.

## 4. Scope
### In scope
Complaint categorization, priority analysis, resolution-time analysis, CSAT analysis, dashboard KPIs, SQL reporting, AI recommendation.

### Out of scope
Live CRM integration, production model deployment, automated customer replies, and personally identifiable customer data.

## 5. Stakeholders
Customer Support Manager; Operations Manager; Business Analyst; Data/BI Analyst; AI/ML Engineer; Customer Experience Team.

## 6. Functional Requirements
FR-01: Store complaint ID, date, channel, region, product, category, issue, priority, resolution time, CSAT, sentiment and status.
FR-02: Dashboard shall show total complaints.
FR-03: Dashboard shall show most common category/issue.
FR-04: Dashboard shall show average resolution time.
FR-05: Dashboard shall show average CSAT.
FR-06: Dashboard shall show priority distribution.
FR-07: Dashboard shall support filtering by category, channel, region, product and priority.
FR-08: AI service shall predict category from complaint text.
FR-09: AI service shall provide a confidence score.
FR-10: Low-confidence predictions shall be routed to human review.

## 7. Non-Functional Requirements
- Dashboard refresh target: daily.
- Prediction response target: under 2 seconds per complaint in an interactive workflow.
- Auditability: store predicted category, confidence and human-corrected category.
- Security: avoid unnecessary PII and mask sensitive customer data.

## 8. Key KPIs
Complaint volume; Average resolution time; 24-hour SLA %; Average CSAT; High-priority %; Category share; Low-CSAT complaint rate.

## 9. Acceptance Criteria
The dashboard must correctly represent all 1,000 records, allow filtering, and display KPI calculations consistently with the SQL queries.
