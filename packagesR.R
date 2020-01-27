#Charger les librairies les plus fréquentes
library(tidyverse) #intègre dplyr, tidyr, stringr, ggplot2 en base / readxl et XML à charger explicitement
library(data.table) # permet d'utiliser fread() & fwrite()
library(foreign) #pour lire les fichiers .dbf via read.dbf()


#### Autres ####

## Réorganiser les data
install.packages("reshape2") #un peu daté, privilégier tidyr avec pivot_longer() & co
library(reshape2)

## Sauvegarder des variables

  #basique
save(brasseries, file = "brasseries.RDATA") #basique

  #plus rapide avec le package fst
install.packages("fst")
library(fst)
# https://www.fstpackage.org/

write.fst(df, "dataset.fst")
df <- read.fst("dataset.fst")

  #possibilité de sélectionner des colonnes spécifiques à importer
df_subset <- read.fst("dataset.fst", c("Logical", "Factor"), from = 2000, to = 5000)

## Extraire des tableaux de pdf
install.packages("tabulizer")
library(tabulizer)

## Gérer du texte de pdf
install.packages("pdftools")
library(pdftools)

## OCR
install.packages("tesseract")
library(tesseract)


#### >Outils utiles< ####

##### Formater un code departement à deux chiffres####

# méthode avec stringr
df <- df %>%
  mutate(dep = str_pad(dep, width = 2, pad = 0),
         com = str_pad(com, width = 5, pad = 0))


# old-school
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
