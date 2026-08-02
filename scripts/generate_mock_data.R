library(dplyr)
set.seed(42)
n_records <- 1000
departments <- c("Sales", "Engineering", "Marketing", "HR", "Finance", "Operations")
locations <- c("New York", "London", "San Francisco", "Tokyo", "Remote")

mock_data <- data.frame(
  User_ID = paste0("EMP", 1000 + 1:n_records),
  User_Email = c(paste0("user", 1:(n_records - 10), "@company.com"), paste0("test_account", 1:5, "@company.com"), paste0("service_robot", 1:5, "@company.com")),
  Department = sample(c(departments, "", NA), n_records, replace = TRUE, prob = c(0.2, 0.2, 0.15, 0.1, 0.1, 0.2, 0.02, 0.03)),
  Location = sample(locations, n_records, replace = TRUE),
  Join_Date = sample(seq(as.Date('2023-01-01'), as.Date('2025-12-31'), by="day"), n_records, replace = TRUE),
  Last_Active_Date = sample(seq(as.Date('2026-01-01'), as.Date('2026-07-24'), by="day"), n_records, replace = TRUE),
  License_Tier = sample(c("Business Starter", "Business Standard", "Enterprise Plus"), n_records, replace = TRUE, prob = c(0.3, 0.5, 0.2)),
  Gmail_Sent = rpois(n_records, lambda = 45),
  Chat_Messages = rpois(n_records, lambda = 120),
  Docs_Created = rpois(n_records, lambda = 15),
  Drive_Files_Shared = rpois(n_records, lambda = 25),
  Meet_Minutes = rpois(n_records, lambda = 300)
)
mock_data$Last_Active_Date[1:50] <- sample(seq(as.Date('2025-01-01'), as.Date('2025-06-01'), by="day"), 50, replace = TRUE)
write.csv(mock_data, "data/raw/google_workspace_logs.csv", row.names = FALSE)
