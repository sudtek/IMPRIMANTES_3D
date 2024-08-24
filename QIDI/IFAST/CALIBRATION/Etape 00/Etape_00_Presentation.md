**Etape 00  Réglage de l'alignement des deux buses  / calibrage XY**

Contexte : Cette étape est certes documentée par QUIDI (dans différents facicules et langues) néanmoins elle souffre de lacunes. En effet lorsque l'on acquier une imprimante de type QIDI IFAST avec double extrudeur c'est géneralement dans le but de réaliser des impressions techniques. Dans mon cas entre autres pouvoir imprimmer des protypes des corps de piéces en PETG avec des supports dans une autre matiere (PLA) afin de faciliter leurs retraits dans les zones difficiles mais egalement avoir une couche d'appui physique pour certains surplombs, ponts ... En effet si on utilise le même materiaux pour le corps et les supports sans prevoir une couche de séparation ils fusionnent et on ne peut plus retirer les supports. De plus lorsque l'on imprime du PETG on ne peut pas activer la ventilation car le petg refroidi rapidement warp donc impossible de faire des ponts verticaux il faut beaucoup des supports. 

**Calibration de l'offsetdes buses Z2/Z1 selon l'axe X :**

Prerequis pour pouvoir calibrer les deux buses : 

P1) Il faut imperativement que les deux buses extrudent la même matiere du PLA ! Vous ne pouvez pas mixer les bobines et mettre par exemple une bobine de PETG en Z2 et une de PLA sur Z1. 
Note : Le gcode integré à l'interface de l'imprimante va fixer la temperature du bed et des buses pour le PLA qui est inferieures au besoin par exemple d'un PETG.  

P2) Charger ddeux bobines bien séches et désydratés.

P3) Les couleurs des bobines doivent être contrastés exemple une Rouge et une Blanche. Ne pas utiliser de couleur noir ou sombre car il n'y aura pas de contraste avec le bed et la lecture sera dificile.

P4) Nettoyer soigneusement le bed avec une microfibre.

P5) Dégraisser le bed avec un alcool ménager et une microfibre.
  
P6) passer une couche fine de colle UHU stick au centre sur un carré de 150 mm de section 

QIDI a integré un programme pour faciliter 

