# Dashboard Plan

## Dashboard Purpose
This dashboard is designed to simulate how a bank fraud analytics team would monitor fraud activity, evaluate rule performance, assess investigator workload, and support management decision-making.

## Primary Users
- Fraud analysts
- Fraud operations leads
- Risk managers
- Senior leadership / executives

## Main Dashboard Goal
Turn fraud data into clear monitoring and decision-support views that help answer:
- Where fraud is happening
- Which channels are riskiest
- Which rules are effective
- Which rules are noisy
- How much operational burden is being created
- What management should do next

## Proposed Dashboard Pages

### 1. Executive Overview
Purpose:
Provide a high-level summary of fraud exposure, detection outcomes, and workload.

Likely content:
- Total cases reviewed
- Confirmed fraud cases
- False positive cases
- Total confirmed loss
- Total recovery amount
- Net loss
- Confirmed fraud rate
- Top risk channel
- Top performing rule
- Busiest queue

### 2. Fraud Trends
Purpose:
Show how fraud activity is changing over time.

Likely content:
- Cases by case open date
- Fraud by transaction date
- Confirmed fraud trend by channel
- Daily loss trend

### 3. Rule Performance
Purpose:
Show how well detection rules are working.

Likely content:
- Alert volume by rule
- Confirmed fraud by rule
- Conversion rate by rule
- False positive rate by rule
- Loss captured by rule

### 4. Workload and Operations
Purpose:
Show operational burden on the fraud team.

Likely content:
- Cases handled by investigator
- Alert burden by queue
- Average turnaround time by investigator
- High-priority alert concentration

### 5. Customer / Segment Risk View
Purpose:
Show fraud concentration across customer groups and regions.

Likely content:
- KPIs by customer segment
- KPIs by region
- Fraud loss by segment
- Fraud case count by region

## Design Principles
- Keep visuals simple and decision-focused
- Separate executive view from operational detail
- Highlight both fraud risk and operational burden
- Avoid clutter
- Use business language, not technical language
- Make key takeaways obvious

## Next Build Step
Map each dashboard page to the SQL queries already created.

## SQL Query Mapping

### 1. Executive Overview
Likely SQL sources:
- `sql/02_kpis/01_core_fraud_kpis.sql`
- `sql/02_kpis/02_kpis_by_channel_and_segment.sql`

Key metrics supported:
- Total cases reviewed
- Confirmed fraud cases
- False positive cases
- Total confirmed loss
- Total recovery amount
- Net loss
- Confirmed fraud rate
- Top risk channel
- High-risk customer segment
- High-loss region

### 2. Fraud Trends
Likely SQL sources:
- `sql/03_fraud_trends/01_fraud_trend_overview.sql`

Key metrics supported:
- Cases by case open date
- Fraud by transaction date
- Confirmed fraud trend by channel
- Daily loss trend

### 3. Rule Performance
Likely SQL sources:
- `sql/04_rule_performance/01_rule_performance_overview.sql`

Key metrics supported:
- Alert volume by rule
- Confirmed fraud by rule
- Conversion rate by rule
- False positive rate by rule
- Loss captured by rule

### 4. Workload and Operations
Likely SQL sources:
- `sql/05_workload_analysis/01_investigator_workload.sql`

Key metrics supported:
- Cases handled by investigator
- Alert burden by queue
- Average turnaround time by investigator
- Queue pressure indicators

### 5. Customer / Segment Risk View
Likely SQL sources:
- `sql/02_kpis/02_kpis_by_channel_and_segment.sql`

Key metrics supported:
- KPIs by customer segment
- KPIs by region
- Fraud loss by segment
- Fraud case count by region

## Executive Overview Page Design

### Page Purpose
Give leadership a high-level summary of fraud exposure, detection outcomes, and operational burden in one view.

### Recommended Visuals

#### 1. KPI Cards
Show these as top summary cards:
- Total Cases Reviewed
- Confirmed Fraud Cases
- False Positive Cases
- Total Confirmed Loss
- Total Recovery Amount
- Net Loss
- Confirmed Fraud Rate %

#### 2. Fraud Loss by Channel
Visual type:
- Bar chart

Purpose:
Show which transaction channels are contributing the most confirmed fraud loss.

#### 3. Reviewed Cases by Customer Segment
Visual type:
- Bar chart or column chart

Purpose:
Show which customer groups are contributing the most reviewed fraud cases.

#### 4. Fraud Loss by Region
Visual type:
- Bar chart or map later if needed

Purpose:
Show where confirmed fraud loss is concentrating geographically.

#### 5. Rule Performance Snapshot
Visual type:
- Small table or ranked bar chart

Purpose:
Show top rules by confirmed fraud cases or total confirmed loss.

#### 6. Operational Snapshot
Visual type:
- Small table or KPI cards

Purpose:
Show busiest queue and investigator with the highest case volume.

### Key Message This Page Should Communicate
Fraud risk is not evenly distributed. Loss, case volume, rule performance, and operational burden should be visible at a glance so leadership can prioritize action quickly.

## Fraud Trends Page Design

### Page Purpose
Show how fraud activity, reviewed cases, and confirmed fraud loss change over time.

### Recommended Visuals

#### 1. Cases Reviewed by Case Open Date
Visual type:
- Line chart

Purpose:
Show daily case review volume over time.

#### 2. Confirmed Fraud Cases by Transaction Date
Visual type:
- Line chart

Purpose:
Show when fraud activity actually occurred, based on transaction date.

#### 3. Confirmed Fraud Trend by Channel
Visual type:
- Multi-line chart or stacked column chart

Purpose:
Show which channels are driving fraud over time.

#### 4. Daily Confirmed Loss Trend
Visual type:
- Line chart

Purpose:
Show daily movement in confirmed fraud loss.

#### 5. False Positive Trend Over Time
Visual type:
- Line chart

Purpose:
Show whether alert noise is increasing or decreasing over time.

### Key Message This Page Should Communicate
Fraud is dynamic. Trend views help the fraud team and leadership see whether risk is rising, shifting across channels, or becoming more operationally difficult over time.


## Rule Performance Page Design

### Page Purpose
Show how well fraud detection rules are performing in terms of alert volume, confirmed fraud capture, false positives, and loss impact.

### Recommended Visuals

#### 1. Alert Volume by Rule
Visual type:
- Bar chart

Purpose:
Show which rules are firing most often.

#### 2. Confirmed Fraud Cases by Rule
Visual type:
- Bar chart

Purpose:
Show which rules are associated with the most real fraud detections.

#### 3. Alert-to-Fraud Conversion Rate by Rule
Visual type:
- Bar chart

Purpose:
Show which rules convert alerts into confirmed fraud most effectively.

#### 4. False Positive Rate by Rule
Visual type:
- Bar chart

Purpose:
Show which rules are generating the most noise.

#### 5. Confirmed Loss by Rule
Visual type:
- Bar chart

Purpose:
Show which rules are linked to the highest fraud loss amounts.

#### 6. Rule Performance Summary Table
Visual type:
- Table

Purpose:
Show rule name, alert count, confirmed fraud cases, conversion rate, false positive rate, total loss, and net loss in one view.

### Key Message This Page Should Communicate
Not all rules create the same value. Some rules catch meaningful fraud efficiently, while others generate noise and operational burden. This page helps identify which rules should be maintained, adjusted, or reviewed.

## Workload and Operations Page Design

### Page Purpose
Show the operational burden created by alerts and fraud case handling across investigators and queues.

### Recommended Visuals

#### 1. Cases Handled by Investigator
Visual type:
- Bar chart

Purpose:
Show which investigators are handling the most cases.

#### 2. Confirmed Fraud Cases by Investigator
Visual type:
- Bar chart

Purpose:
Show how confirmed fraud work is distributed across investigators.

#### 3. Alert Burden by Queue
Visual type:
- Bar chart

Purpose:
Show which queues are receiving the most alerts.

#### 4. Alert Priority Mix by Queue
Visual type:
- Stacked bar chart

Purpose:
Show whether queue burden is mostly high, medium, or low priority.

#### 5. Average Turnaround Time by Investigator
Visual type:
- Bar chart

Purpose:
Show how long cases take to close by investigator.

#### 6. Operational Summary Table
Visual type:
- Table

Purpose:
Show investigator, case volume, confirmed fraud cases, false positive cases, total loss handled, and average turnaround time in one view.

### Key Message This Page Should Communicate
Fraud monitoring is not only about losses and rules. It is also about whether the fraud operation can absorb the alert volume, investigate efficiently, and maintain performance under pressure.

## Customer / Segment Risk View Page Design

### Page Purpose
Show how fraud risk and confirmed loss are distributed across customer groups and regions.

### Recommended Visuals

#### 1. Reviewed Cases by Customer Segment
Visual type:
- Bar chart

Purpose:
Show which customer segments are generating the most reviewed cases.

#### 2. Confirmed Fraud Cases by Customer Segment
Visual type:
- Bar chart

Purpose:
Show which customer segments are linked to the most confirmed fraud cases.

#### 3. Confirmed Loss by Customer Segment
Visual type:
- Bar chart

Purpose:
Show where fraud loss is concentrating by customer group.

#### 4. Reviewed Cases by Region
Visual type:
- Bar chart

Purpose:
Show which regions are generating the most investigated cases.

#### 5. Confirmed Loss by Region
Visual type:
- Bar chart

Purpose:
Show which regions are carrying the highest fraud loss.

#### 6. Segment / Region Summary Table
Visual type:
- Table

Purpose:
Show segment or region, reviewed cases, confirmed fraud cases, false positives, total confirmed loss, total recovery amount, and net loss in one view.

### Key Message This Page Should Communicate
Fraud is not evenly distributed across the customer base. Segment and regional views help management identify concentration of risk and decide where stronger controls or closer monitoring may be needed.

## Executive Overview Mock Layout

### Top Row: KPI Cards
Place these in a single top row:
- Total Cases Reviewed
- Confirmed Fraud Cases
- False Positive Cases
- Total Confirmed Loss
- Total Recovery Amount
- Net Loss
- Confirmed Fraud Rate %

### Middle Left
Fraud Loss by Channel
- Large bar chart

### Middle Right
Rule Performance Snapshot
- Small ranked table or bar chart showing top rules by confirmed fraud or loss

### Bottom Left
Reviewed Cases by Customer Segment
- Bar chart

### Bottom Middle
Fraud Loss by Region
- Bar chart

### Bottom Right
Operational Snapshot
- Small table or KPI card area showing busiest queue and top investigator by case volume

### Page Design Logic
- Top row gives instant summary
- Middle row highlights major fraud concentration and rule value
- Bottom row shows who is affected and where operational pressure exists

## Fraud Trends Mock Layout

### Top Left
Cases Reviewed by Case Open Date
- Line chart

Purpose:
Show daily review activity over time.

### Top Right
Confirmed Fraud Cases by Transaction Date
- Line chart

Purpose:
Show when fraud activity actually occurred.

### Middle Full Width
Confirmed Fraud Trend by Channel
- Multi-line chart or stacked column chart

Purpose:
Show which channels are driving fraud over time.

### Bottom Left
Daily Confirmed Loss Trend
- Line chart

Purpose:
Show movement in confirmed fraud loss over time.

### Bottom Right
False Positive Trend Over Time
- Line chart

Purpose:
Show whether alert noise is increasing or decreasing.

### Page Design Logic
- Top row separates review activity from actual fraud activity
- Middle section highlights channel movement
- Bottom row shows financial impact and noise trend

## Rule Performance Mock Layout

### Top Left
Alert Volume by Rule
- Bar chart

Purpose:
Show which rules are firing most often.

### Top Right
Confirmed Fraud Cases by Rule
- Bar chart

Purpose:
Show which rules are associated with the most real fraud detections.

### Middle Left
Alert-to-Fraud Conversion Rate by Rule
- Bar chart

Purpose:
Show which rules convert alerts into confirmed fraud most effectively.

### Middle Right
False Positive Rate by Rule
- Bar chart

Purpose:
Show which rules are generating the most noise.

### Bottom Left
Confirmed Loss by Rule
- Bar chart

Purpose:
Show which rules are linked to the highest fraud loss.

### Bottom Right
Rule Performance Summary Table
- Table

Purpose:
Show rule name, alert count, confirmed fraud cases, conversion rate, false positive rate, total loss, and net loss in one view.

### Page Design Logic
- Top row shows rule volume and real fraud capture
- Middle row shows rule quality versus noise
- Bottom row shows financial impact and detailed summary

## Workload and Operations Mock Layout

### Top Left
Cases Handled by Investigator
- Bar chart

Purpose:
Show which investigators are handling the most cases.

### Top Right
Confirmed Fraud Cases by Investigator
- Bar chart

Purpose:
Show how confirmed fraud work is distributed across investigators.

### Middle Left
Alert Burden by Queue
- Bar chart

Purpose:
Show which queues are receiving the most alerts.

### Middle Right
Alert Priority Mix by Queue
- Stacked bar chart

Purpose:
Show whether queue burden is mostly high, medium, or low priority.

### Bottom Left
Average Turnaround Time by Investigator
- Bar chart

Purpose:
Show how long cases take to close by investigator.

### Bottom Right
Operational Summary Table
- Table

Purpose:
Show investigator, case volume, confirmed fraud cases, false positive cases, total loss handled, and average turnaround time in one view.

### Page Design Logic
- Top row shows investigator case burden
- Middle row shows queue pressure
- Bottom row shows speed and operational summary

## Customer / Segment Risk View Mock Layout

### Top Left
Reviewed Cases by Customer Segment
- Bar chart

Purpose:
Show which customer segments are generating the most reviewed cases.

### Top Right
Confirmed Fraud Cases by Customer Segment
- Bar chart

Purpose:
Show which customer segments are linked to the most confirmed fraud cases.

### Middle Left
Confirmed Loss by Customer Segment
- Bar chart

Purpose:
Show where fraud loss is concentrating by customer group.

### Middle Right
Reviewed Cases by Region
- Bar chart

Purpose:
Show which regions are generating the most investigated cases.

### Bottom Left
Confirmed Loss by Region
- Bar chart

Purpose:
Show which regions are carrying the highest fraud loss.

### Bottom Right
Segment / Region Summary Table
- Table

Purpose:
Show segment or region, reviewed cases, confirmed fraud cases, false positives, total confirmed loss, total recovery amount, and net loss in one view.

### Page Design Logic
- Top row shows customer-group concentration
- Middle row shows loss concentration and regional case volume
- Bottom row shows regional loss and detailed summary

## Full Dashboard Mock Logic

### Page 1: Executive Overview
Purpose:
Give leadership a one-glance summary of fraud exposure, detection quality, concentration of risk, and operational pressure.

### Page 2: Fraud Trends
Purpose:
Show how fraud activity, reviewed cases, confirmed loss, and noise are moving over time.

### Page 3: Rule Performance
Purpose:
Show which rules are effective, which are noisy, and which are linked to meaningful fraud loss.

### Page 4: Workload and Operations
Purpose:
Show whether the fraud team can absorb alert and case volume efficiently.

### Page 5: Customer / Segment Risk View
Purpose:
Show where fraud is concentrating across customer groups and regions.

## Dashboard Build Readiness
At this point, the project has:
- SQL logic for key fraud analysis areas
- documented dashboard pages
- mapped SQL-to-dashboard structure
- page-level mock layouts

This means the project is ready for dashboard build preparation in Power BI.


## Fraud Trends Visual Specification

### Visual 1
Type:
- Line Chart

Title:
- Cases Reviewed by Case Open Date

Data Source:
- `sql/03_fraud_trends/01_fraud_trend_overview.sql`

### Visual 2
Type:
- Line Chart

Title:
- Confirmed Fraud Cases by Transaction Date

Data Source:
- `sql/03_fraud_trends/01_fraud_trend_overview.sql`

### Visual 3
Type:
- Multi-Line Chart or Stacked Column Chart

Title:
- Confirmed Fraud Trend by Channel

Data Source:
- `sql/03_fraud_trends/01_fraud_trend_overview.sql`

### Visual 4
Type:
- Line Chart

Title:
- Daily Confirmed Loss Trend

Data Source:
- `sql/03_fraud_trends/01_fraud_trend_overview.sql`

### Visual 5
Type:
- Line Chart

Title:
- False Positive Trend Over Time

Data Source:
- `sql/03_fraud_trends/01_fraud_trend_overview.sql`

### Page Build Note
This page should emphasize movement over time, with line visuals used to make trend direction easy to see.

## Rule Performance Visual Specification

### Visual 1
Type:
- Bar Chart

Title:
- Alert Volume by Rule

Data Source:
- `sql/04_rule_performance/01_rule_performance_overview.sql`

### Visual 2
Type:
- Bar Chart

Title:
- Confirmed Fraud Cases by Rule

Data Source:
- `sql/04_rule_performance/01_rule_performance_overview.sql`

### Visual 3
Type:
- Bar Chart

Title:
- Alert-to-Fraud Conversion Rate by Rule

Data Source:
- `sql/04_rule_performance/01_rule_performance_overview.sql`

### Visual 4
Type:
- Bar Chart

Title:
- False Positive Rate by Rule

Data Source:
- `sql/04_rule_performance/01_rule_performance_overview.sql`

### Visual 5
Type:
- Bar Chart

Title:
- Confirmed Fraud Loss by Rule

Data Source:
- `sql/04_rule_performance/01_rule_performance_overview.sql`

### Visual 6
Type:
- Table

Title:
- Rule Performance Summary

Data Source:
- `sql/04_rule_performance/01_rule_performance_overview.sql`

### Page Build Note
This page should make it easy to compare rule volume, rule quality, and rule loss impact side by side.

## Workload and Operations Visual Specification

### Visual 1
Type:
- Bar Chart

Title:
- Cases Handled by Investigator

Data Source:
- `sql/05_workload_analysis/01_investigator_workload.sql`

### Visual 2
Type:
- Bar Chart

Title:
- Confirmed Fraud Cases by Investigator

Data Source:
- `sql/05_workload_analysis/01_investigator_workload.sql`

### Visual 3
Type:
- Bar Chart

Title:
- Alert Burden by Queue

Data Source:
- `sql/05_workload_analysis/01_investigator_workload.sql`

### Visual 4
Type:
- Stacked Bar Chart

Title:
- Alert Priority Mix by Queue

Data Source:
- `sql/05_workload_analysis/01_investigator_workload.sql`

### Visual 5
Type:
- Bar Chart

Title:
- Average Turnaround Time by Investigator

Data Source:
- `sql/05_workload_analysis/01_investigator_workload.sql`

### Visual 6
Type:
- Table

Title:
- Operational Summary

Data Source:
- `sql/05_workload_analysis/01_investigator_workload.sql`

### Page Build Note
This page should focus on investigator burden, queue pressure, and handling speed.

## Customer / Segment Risk View Visual Specification

### Visual 1
Type:
- Bar Chart

Title:
- Reviewed Cases by Customer Segment

Data Source:
- `sql/02_kpis/02_kpis_by_channel_and_segment.sql`

### Visual 2
Type:
- Bar Chart

Title:
- Confirmed Fraud Cases by Customer Segment

Data Source:
- `sql/02_kpis/02_kpis_by_channel_and_segment.sql`

### Visual 3
Type:
- Bar Chart

Title:
- Confirmed Fraud Loss by Customer Segment

Data Source:
- `sql/02_kpis/02_kpis_by_channel_and_segment.sql`

### Visual 4
Type:
- Bar Chart

Title:
- Reviewed Cases by Region

Data Source:
- `sql/02_kpis/02_kpis_by_channel_and_segment.sql`

### Visual 5
Type:
- Bar Chart

Title:
- Confirmed Fraud Loss by Region

Data Source:
- `sql/02_kpis/02_kpis_by_channel_and_segment.sql`

### Visual 6
Type:
- Table

Title:
- Segment and Region Summary

Data Source:
- `sql/02_kpis/02_kpis_by_channel_and_segment.sql`

### Page Build Note
This page should highlight concentration of fraud risk across customer groups and geographies.

## Dashboard Build Status
At this point, the dashboard plan includes:
- page purposes
- page layouts
- SQL mapping
- visual specifications
- chart titles
- suggested visual types

This means the project is ready for Power BI build preparation.