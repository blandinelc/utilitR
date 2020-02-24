library(tidyverse)




## Grouper selon une variable pour une courbe par entité
ggplot(df, aes(x, y, group = variable)) +
  geom_line()

    #sur le group avec ggplot : https://ggplot2.tidyverse.org/reference/aes_group_order.html



## Modifier le style des libellés d'axes ----



### Modifier l'apparence des axes
  
  #pour un style épuré :
  theme_minimal()
  
  #enlever les lignes d'un axe
  theme(panel.grid.minor.y = element_blank(), #lignes intermédiaire de y
        panel.grid.major.y = element_blank(), #lignes majeures de y
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.x = element_blank())
  
  #ou, sans distinction x et y :
  theme(panel.grid.minor = element_blank(),
        panel.grid.major = element_blank())
  
  
  
### Modifier le nom des axes
  labs(x = "titre_de_l_axe_x",
       y = "titre_de_l_axe_y")

  
  
### Modifier la police des libellés d'axes
  
  theme(#modifier la taille des ticks
        axis.text = element_text(size = 6),
        
        #modifier la taille du libellé des axes
        axis.title = element_text(size = 9),

        #incliner les libellés des ticks
        axis.text.x = element_text(angle = 90))

  
## Modifier les textes accompagnant le graphique ----

      #https://www.datanovia.com/en/fr/blog/ggplot-titre-sous-titre-et-legende/#centrez-la-position-du-titre

  
  ### Le texte du titre
  labs(title = "Titre du graphique")
  
  
  ### La mention de la source
  labs(caption = "Source")
  
  
  ### Modifier le style de la source
  theme(plot.caption = element_text(size = 10, hjust = 0.5))
  
  
  ### Centrer le titre
  theme(plot.title = element_text(#modifier l'alignement
    
                                  #aligner au centre
                                  hjust = 0.5,
                                  #aligner à gauche
                                  hjust = 0,
                                  #aligner à droite
                                  hjust = 1,
                                  
                                  #modifier la taille
                                  size = 20))
  
  
  
## Modifier la légende ----
  
  
  ### Modifier le titre
  labs(title = "Les cas pour 1000 habitants en 2019 sur 11 délits")
  
  
  ### Modifier la position
  theme(legend.position = "bottom")
  
  
  ### Modifier manuellement les noms et les couleurs
  scale_fill_manual(name = "Titre de la légende", 
                    breaks = c("USA", "Russia", "China", "Autre"), 
                    values = c("blue", "red", "green", "grey"))

    #ou pour un meilleur contrôle de l'ordre, on fait un vecteur de correspondance
  
  couleurs <- c("categorie 1" = "#386cb0", 
                "categorie 2" = "#d95f02", 
                "categorie 3" = "#fdc086", 
                "categorie 4" = "grey")
  
  scale_fill_manual(name = "Titre de la légende", 
                    #permet de changer l'ordre d'affichage
                    breaks = c("categorie 2", "categorie 1", "categorie 3", "categorie 4"), 
                    #appeler les couleurs prédéfinies
                    values = couleurs)
  
  
  
## Modifier les titres et aspects en facet_wrap() ----
  
  
  facet_wrap(~ variable_wrap,
             
             #définir le nombre de colonnes ou lignes
             ncol = 5, 
             nrow = 2,
             
             #compresser le titre des wraps sur plusieurs lignes
             labeller = label_wrap_gen(width = 20))
  
  
  
## Faire apparaître les valeurs sur le graphique ----
  
  
  geom_text(size = 2, 
            hjust = "center", 
            nudge_y = 1)
  
  
  
  
