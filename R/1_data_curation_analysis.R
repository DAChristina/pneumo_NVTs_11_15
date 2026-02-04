library(tidyverse)

data <- readxl::read_excel("raw_data/Penelitian Naura Shanna.xlsx") %>%   
  dplyr::mutate(
    name_fasta1 = stringr::str_replace(name_fasta, "Streptococcus_pneumoniae_", "*"),
    name_fasta_final = paste0(name_fasta1, "*q.gz")
                ) %>%
  dplyr::select(name_fasta_final) %>%

  # view() %>% 
  glimpse()

write.csv(data, "inputs/list_all_data.csv",
          quote = F,
          row.names = F, col.names = F)


# delete available file from list 1 ############################################
rest1 <- dplyr::anti_join(
  read.csv("inputs/list_all_data.csv") %>% 
    dplyr::mutate(
      name_fasta_final = stringr::str_extract(name_fasta_final,
                                              "(?<=\\*)[^*]+(?=\\*)")
    )
  ,
  read.csv("inputs/list_available_files1.csv", header = F) %>% 
    dplyr::mutate(V1 = stringr::str_extract(V1,
                                            "[^*]+(?=\\.f)"),
                  V1 = stringr::str_remove(V1, "_1|_2")
    ) %>% 
    dplyr::distinct()
  ,
  by = c("name_fasta_final" = "V1")
  ) %>% 
  
  # adapt file for list update
  dplyr::mutate(
    name_fasta_final = paste0("*", name_fasta_final, "*q.gz")
  ) %>% 
  glimpse()

write.csv(rest1, "inputs/list_all_data2.csv",
          quote = F,
          row.names = F, col.names = F)


# delete available file from list 2 ############################################
rest2 <- dplyr::anti_join(
  read.csv("inputs/list_all_data.csv") %>% 
    dplyr::mutate(
      name_fasta_final = stringr::str_extract(name_fasta_final,
                                              "(?<=\\*)[^*]+(?=\\*)")
    )
  ,
  read.csv("inputs/list_available_files2.csv", header = F) %>% 
    dplyr::mutate(V1 = stringr::str_extract(V1,
                                            "[^*]+(?=\\.f)"),
                  V1 = stringr::str_remove(V1, "_1|_2")
    ) %>% 
    dplyr::distinct()
  ,
  by = c("name_fasta_final" = "V1")
) %>% 
  
  # adapt file for list update
  dplyr::mutate(
    name_fasta_final = paste0("*", name_fasta_final, "*q.gz")
  ) %>% 
  glimpse()

write.csv(rest2, "inputs/list_all_data3.csv",
          quote = F,
          row.names = F, col.names = F)





