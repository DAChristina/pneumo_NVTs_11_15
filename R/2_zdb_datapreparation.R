library(tidyverse)

# edit list for 11A ############################################################
rest11A <- read.csv("inputs/prepare_zdb/list_available_files11A.csv",
                    header = FALSE
                    ) %>% 
  dplyr::transmute(
    name = V1,
    file = paste0("/mnt/d/naura_ashanna_cps_genes/inputs/prepare_zdb/11A/", name)
    ) %>%
  glimpse()

write.csv(rest11A,
          "inputs/prepare_zdb/list_available_files11A_edited.csv",
          quote = FALSE,
          row.names = FALSE)


rest11A_edited <- read.csv("inputs/prepare_zdb/list_available_files11A_edited.csv") %>% 
  glimpse()

# edit list for serogroup 15 ###################################################
rest15 <- read.csv("inputs/prepare_zdb/list_available_files15.csv",
                    header = FALSE
) %>% 
  dplyr::filter(!stringr::str_detect(V1, "/mnt/d/"),
                !stringr::str_detect(V1, ".html"),
                !stringr::str_detect(V1, ".png")
                ) %>% 
  dplyr::transmute(
    name = V1,
    file = paste0("/mnt/d/naura_ashanna_cps_genes/inputs/prepare_zdb/*/", name)
  ) %>%
  # view() %>% 
  glimpse()

write.csv(rest15,
          "inputs/prepare_zdb/list_available_files15_edited.csv",
          quote = FALSE,
          row.names = FALSE)


rest15_edited <- read.csv("inputs/prepare_zdb/list_available_files15_edited.csv") %>% 
  glimpse()

