library('dplyr')
care_state <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-04-08/care_state.csv')

care_state <- care_state %>% 
  mutate(waiting_time = end_date - start_date)

unique(care_state$state)
length(unique(care_state$state))

population_state <- data.frame(
  state_name = c("AK", "AL", "AR", "AS", "AZ", "CA", "CO", "CT", "DC", "DE",
          "FL", "GA", "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY",
          "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MP", "MS", "MT",
          "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK",
          "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VA",
          "VI", "VT", "WA", "WI", "WV", "WY"),
  population = c(740133, 5157699, 3088354, 49710, 7582384, 39431263, 5957493, 3675069,
                700000, 1051917, 23372215, 11180878, 153836, 1446146, 3241488, 2001619,
                12710158, 6924275, 2970606, 4588372, 4597740, 7136171, 6263220, 1405012,
                10140459, 5793151, 6245466, 47329, 2943045, 1137233, 11046024, 796568,
                2005465, 1409032, 9500851, 2130256, 3267467, 19867248, 11883304, 4095393,
                4272371, 13078751, 3153000, 1112308, 5478831, 924669, 7227750, 31290831,
                3503613, 8811195, 87146, 648493, 7958180, 5960975, 1769979, 587618)
)

care_state <- left_join(care_state, population_state, by = c("state" = "state_name"))

care_state <- care_state %>% 
  mutate(waiting_time = as.numeric(waiting_time))

cor(care_state$waiting_time, care_state$population)
#korelacja równa zero co oznacza brak powiazania czasu oczekiwania a populacji.
