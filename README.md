# Power BI Dashboard

## Data source
Import `../data/customer_complaints_1000.csv` into Power BI Desktop.

## Suggested dashboard layout
Top KPI cards: Total Complaints; Avg Resolution Hours; Avg CSAT; 24h SLA %; High Priority %.

Charts:
- Complaints by Category — clustered bar
- Complaints by Priority — donut
- Avg Resolution Hours by Category — bar
- Avg CSAT by Category — bar
- Complaints by Channel — column
- Complaint Trend by Date — line
- Detail table with Complaint ID, Category, Issue, Priority, Resolution Time, CSAT

Slicers: Category, Channel, Region, Product, Priority, Status

## DAX measures

Total Complaints = COUNTROWS(Complaints)

Avg Resolution Hours = AVERAGE(Complaints[Resolution_Time_Hours])

Avg CSAT = AVERAGE(Complaints[CSAT_Score])

High Priority % =
DIVIDE(
    CALCULATE([Total Complaints], Complaints[Priority] = "High"),
    [Total Complaints]
)

SLA 24h % =
DIVIDE(
    CALCULATE([Total Complaints], Complaints[Resolution_Time_Hours] <= 24),
    [Total Complaints]
)

Low CSAT Complaints =
CALCULATE([Total Complaints], Complaints[CSAT_Score] <= 2)
