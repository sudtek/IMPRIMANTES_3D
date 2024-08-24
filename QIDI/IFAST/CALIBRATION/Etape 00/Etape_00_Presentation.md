**Etape 00  Réglage de l'alignement des deux buses / calibrage XY**

Contexte : Cette étape est certes documentée par QUIDI (dans différents facicules et langues) néanmoins elle souffre de lacunes. En effet lorsque l'on acquier une imprimante de type QIDI IFAST avec double extrudeur c'est géneralement dans le but de réaliser des impressions techniques. Dans mon cas entre autres pouvoir imprimmer des protypes des corps de piéces en PETG avec des supports dans une autre matiere (PLA) afin de faciliter leurs retraits dans les zones difficiles mais egalement avoir une couche d'appui physique pour certains surplombs, ponts ... En effet si on utilise le même materiaux pour le corps et les supports sans prevoir une couche de séparation ils fusionnent et on ne peut plus retirer les supports. De plus lorsque l'on imprime du PETG on ne peut pas activer la ventilation car le petg refroidi rapidement warp donc impossible de faire des ponts verticaux il faut beaucoup des supports. 

**Calibration de l'offsetdes buses Z2/Z1 selon l'axe XY :**

Prerequis pour pouvoir calibrer les deux buses : 

P1) Il faut imperativement que les deux buses extrudent la même matiere du PLA ! Vous ne pouvez pas mixer les bobines et mettre par exemple une bobine de PETG en Z2 et une de PLA sur Z1. 
Note : Le gcode integré à l'interface de l'imprimante va automatiquement fixer la temperature du bed et des buses à 198°c pour le PLA qui est trés inférieures au besoin par exemple d'un PETG 235°c, cela peut déterriorer la tête si la temperature d'extrusion est beaucoup trop base par rapport à la temperature de fusion du filament.  

P2) Charger deux bobines bien séches et désydratés (le PLA absorbe l'eau) donc prevoir 24 heures de désydration.

P3) Les couleurs des bobines doivent être contrastés exemple une Rouge et une Blanche. Ne pas utiliser de couleur noir ou sombre car il n'y aura pas de contraste avec le bed et la lecture sera dificile -> uniquement des couleurs vives.

P4) Nettoyer soigneusement le bed avec une microfibre.

P5) Dégraisser le bed avec un alcool ménager et une microfibre.
  
P6) Appliquer une couche fine de colle UHU stick premier prix au centre sur un carré de 150 mm de section. Ne faites pas de sur épaisseur, personellement j'utilise une colle UHU diluée à l'eau que j'applique avec un petit rouleau pour uniformiser.
[Technique d'application de colle soluble en baton au rouleau](https://youtu.be/7C0QPmg6328?si=Unesij_6ZGf4jkct)

P7) Faites préchauffer en fixant manuelement le bed à 60°c.

P8) Faites préchauffer en fixant les buses à 200°c.

P9) Extruder manuellement au minimum 100mm de filament sur les têtes Z1/Z2. 

P9) QIDI a integré un programme lancer la calibration XY 
