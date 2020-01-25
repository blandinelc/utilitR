#### Importer plusieurs fichiers à la fois ####


#Ajouter le nom des donnees à part, sans réécrire le nom
tous <- setNames(lapply(csv, fread), csv)

#Grouper et exporter
substance_bzh <- bind_rows(tous, .id = "csv")
fwrite(substance_bzh, file = "substance_bzh_20132018.csv", sep = ";")

#Extraire les différents ID
substance_bzh %>% 
  distinct(csv)