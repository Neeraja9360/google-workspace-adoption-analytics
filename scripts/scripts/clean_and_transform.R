library(dplyr)
library(tidyr)
library(lubridate)

raw_workspace <- read.csv("data/raw/google_workspace_logs.csv")
current_date <- as.Date("2026-07-24")

cleaned_workspace <- raw_workspace %>%
  filter(!grepl("test|service", User_Email, ignore.case = TRUE)) %>%
  mutate(
    User_ID = as.character(User_ID),
    Department = if_else(is.na(Department) | Department == "", "Unassigned", Department),
    Join_Date = ymd(Join_Date),
    Last_Active_Date = ymd(Last_Active_Date)
  ) %>%
  mutate(
    Company_Tenure_Days = as.numeric(current_date - Join_Date),
    Days_Since_Last_Active = as.numeric(current_date - Last_Active_Date),
    License_Cost_Monthly = case_when(
      License_Tier == "Business Starter"  ~ 6,
      License_Tier == "Business Standard" ~ 12,
      License_Tier == "Enterprise Plus"   ~ 30
    ),
    Adoption_Status = case_when(
      Days_Since_Last_Active <= 7  ~ "Power User",
      Days_Since_Last_Active <= 30 ~ "Regular User",
      Days_Since_Last_Active <= 90 ~ "At Risk",
      TRUE                         ~ "Inactive"
    ),
    Communication_Score = Gmail_Sent + Chat_Messages,
    Content_Creation_Score = Docs_Created + Drive_Files_Shared,
    Total_Interactions = Communication_Score + Content_Creation_Score + Meet_Minutes,
    Productivity_Quadrant = case_when(
      Communication_Score >= median(Communication_Score) & Content_Creation_Score >= median(Content_Creation_Score) ~ "Power Collaborator",
      Communication_Score < median(Communication_Score) & Content_Creation_Score >= median(Content_Creation_Score)  ~ "Silent Creator",
      Communication_Score >= median(Communication_Score) & Content_Creation_Score < median(Content_Creation_Score)  ~ "High Communicator",
      TRUE                                                                                                          ~ "Underutilizer"
    )
  )

write.csv(cleaned_workspace, "data/processed/tableau_workspace_adoption_final.csv", row.names = FALSE)
