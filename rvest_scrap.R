library(rvest)
library(tidyverse)

text_rvest <- read_html("http://www.gutenberg.org/cache/epub/132/pg132.html") %>% html_text()

dist_lev <- read_html("https://fr.wikipedia.org/wiki/Distance_de_Levenshtein")

dist_lev %>%
  html_nodes("h2") %>%
  html_text()


vieillescharrueswk <- read_html("https://fr.wikipedia.org/wiki/Programmation_du_festival_des_Vieilles_Charrues")
vieillescharrueswk %>%
  html_nodes("h2") %>%
  html_text()

vieillescharrueswk %>%
  html_node("table") %>%
  html_table()
