# Google Workspace Adoption & Cost Optimization Analytics

An end-to-end data pipeline built in R to parse, clean, and engineer behavioural metrics from 1,000 corporate user logs. The processed outputs are structured specifically to build interactive data visualizations and cost optimization dashboards.

## 📌 Project Overview
This project identifies software license waste, tracks user adoption segments, and charts employee productivity metrics across 6 operational business departments (Sales, Engineering, Marketing, HR, Finance, and Operations).

### Key Data Metrics Engineered
- **Adoption Status:** Categorizes users into *Power User*, *Regular User*, *At Risk*, or *Inactive* profiles based on how recently they logged in.
- **Financial Cost Waste:** Calculates direct monthly monetary losses from underutilized licenses across different subscription tiers ($6, $12, and $30).
- **Productivity Quadrant:** Maps Communication (emails/chats) vs. Content Creation (docs/files shared) scores to discover "Silent Creators", "Power Collaborators", or "Underutilizers".

## 📁 Repository Structure
- `scripts/generate_mock_data.R`: R script that generates the raw behavioral logs.
- `scripts/clean_and_transform.R`: R pipeline that filters test accounts, cleans missing data, and engineers features.
- `google_workspace_logs.csv`: Raw, uncleaned user interaction data.
- `tableau_workspace_adoption_final.csv`: Processed, dashboard-ready analytics dataset.

## 🚀 Getting Started

### Prerequisites
To run this pipeline locally, you need R installed along with the following standard libraries:
```R
install.packages(c("dplyr", "tidyr", "lubridate"))
```

### Running the Pipeline Locally
1. Run the data transformation script to process the raw records:
   ```bash
   Rscript scripts/clean_and_transform.R
   ```

## 📊 Summary of Analytics Results

### 1. High-Level Data Insights
- **Workforce Activity:** A significant percentage of tracked corporate users fall into the *Inactive* or *At Risk* adoption category.
- **Financial Drain:** Underutilized subscription profiles create consistent, monthly license budget losses.
- **Operational Gaps:** The "Unassigned" department segment holds the highest density of inactive software profiles.

### 2. Dashboard Visualization
*(Drag and drop your dashboard screenshot image on the empty line below while editing this file to display your visual results)*


## 📄 License
This project is open-source and available under the MIT License.
