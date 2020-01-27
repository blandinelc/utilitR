#### Importer plusieurs fichiers à la fois ####

#Traiter plusieurs csv en une fois
csv <- list.files(path = "./dossier_avec_csv/", 
                  pattern = ".csv", 
                  full.names = TRUE) %>% #full.names permet d'inclure le dossier si pas le même que le wd
  #Ajouter le nom des csv
  setNames(.,              #Définit le pattern (modèle) à utiliser
           sub("\\.csv$",  #Texte à remplacer via fonction sub()
               "",         #Texte de remplacement
               basename(.))) #Les valeurs caractères à utiliser, ici le nom de base du pattern

tous <- lapply(csv, fread)

#Ajouter le nom des donnees à part, sans réécrire le nom
tous <- setNames(lapply(csv, fread), csv)

#Grouper et exporter
df <- bind_rows(tous, .id = "csv")
fwrite(df, file = "substance_bzh_20132018.csv", sep = ";")

#Extraire les différents ID
df %>% 
  distinct(csv)

