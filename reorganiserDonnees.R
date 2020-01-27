library(data.table)
library(reshape2)
library(dplyr)

population <- fread("D:/Mes Documents/DATA/elections/indicateurs municipales/OK_population.csv", header=TRUE, sep = ",", encoding = "UTF-8")
colnames(population)[4:14] <- c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016")

popReorg <- melt(data = population, 
                  na.rm = FALSE, 
                  id.vars = "code_insee", 
                  measure.vars = c("2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016"),
                  variable.name = "annee",
                  value.name = "population")
popReorg$annee <- as.character(popReorg$annee)

age <- fread("D:/Mes Documents/DATA/elections/indicateurs municipales/OK_population_tranche_age.csv", header = TRUE, sep = ",", encoding = "UTF-8")
age <- replace(age, age == 0, NA)
age <- replace(age, age == "", NA)

ageFiltre <- select(age, insee = 2, "annee", 13:18)
ageFiltre$annee <- as.character(ageFiltre$annee)

PopEtAge <- left_join(popReorg, ageFiltre, by = c("code_insee" = "insee", "annee"))


# as.list(distinct(ageFiltre, ageFiltre$annee))
