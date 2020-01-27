#Charger les librairies les plus fréquentes
library(dplyr)
library(ggplot2)
library(data.table) # permet d'utiliser fread() & fwrite()

library(tidyverse) #ensemble dplyr, ggplot2

#### Autres ####

#Réorganiser les data
install.packages("reshape2")
library(reshape2)

#Extraire des tableaux de pdf
install.packages("tabulizer")
library(tabulizer)

#Gérer du texte de pdf
install.packages("pdftools")
library(pdftools)

#OCR
install.packages("tesseract")
library(tesseract)


#### >Outils utiles< ####

##### Formater un code departement à deux chiffres####
df <- data.frame(
  date = c("01/01/2019", "02/02/2019", "20/03/2019", "04/04/2019"), 
  com = c("651", "001", "007", "341"), 
  dep = c("29", "35", "1", "7"))

df$dep <-
  if_else(nchar(as.character(df$dep)) == 1,
          paste0("0", as.character(df$dep)),
          as.character(df$dep))

df$dep <- df$dep %>%
  mutate(if_else(nchar(as.character()) == 1,
         paste0("0", ),
         ))

#### Créer un tibble facilement ####
df2 <- tribble(
  ~date, ~commune, ~dep,
  "01/01/2019", "651", "29",
  "02/02/2019", "001", "35",
  "03/03/2019", "251", "1"
)