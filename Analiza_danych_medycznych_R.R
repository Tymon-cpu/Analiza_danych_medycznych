library('dplyr')
care_state <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-04-08/care_state.csv')

care_state <- care_state %>% 
  mutate(waiting_time = end_date - start_date)

