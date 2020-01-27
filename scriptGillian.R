library("data.table")
library("dplyr")

data <- fread ("insee_deces.csv",nrows = 1000)


data2 <- data %>%
  mutate(ANNEE = substring(date_deces,1,4),DEPT_NAISS = substring(code_lieu_naissance,1,2),DEPT_DECES = substring(code_lieu_deces,1,2) ) %>%
 # filter( DEPT_DECES == 90) %>%
  group_by(DEPT_NAISS,DEPT_DECES) %>%
  summarise(NB_NAISS = n())

fwrite(data,"data_gch.csv",sep=";",col.names = TRUE,row.names = FALSE)