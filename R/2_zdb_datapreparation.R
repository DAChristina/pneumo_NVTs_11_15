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
sg15_list <- c("A", "B", "C", "F")

for (i in sg15_list){
  df <- read.csv(paste0("inputs/prepare_zdb/list_available_files15",
                        i,
                        ".csv"),
                 header = FALSE
  ) %>% 
    dplyr::transmute(
      name = V1,
      file = paste0("/mnt/d/naura_ashanna_cps_genes/inputs/prepare_zdb/serogroup_15/15", i, "/", name)
    ) %>%
    # view() %>% 
    glimpse()
  
  write.csv(df,
            paste0("inputs/prepare_zdb/list_available_files15", i, "_edited.csv"),
            quote = FALSE,
            row.names = FALSE)
}


# test
rest15A_edited <- read.csv("inputs/prepare_zdb/list_available_files15A_edited.csv") %>% 
  glimpse()

