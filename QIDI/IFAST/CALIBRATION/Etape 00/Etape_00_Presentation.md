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
  
P7) Faites préchauffer en fixant manuelement le bed à 60°c.

P8) Faites préchauffer en fixant les buses à 200°c.

P9) Extruder manuellement au minimum 100mm de filament sur les têtes Z1 et Z2 pour verifier la bonne homogénéité de l'extrusion et qu'il n'y est pas présence de bulles lié à un filament mal déshydraté ... 

P10) Lancer un "standard bed leveling"* et utiliser une feuille papier A4 pour pour régler la distance plateau buse via les 3 molettes à 120° situées sous le plateau. Ne sjamais utiliser la carte en plastique d'épaisseur 0.20mm livrée à cet effet car elle est en plastique et fondra au contact des buses chaudes. De plus elle n'est pas pratique car pas assez longue.

P11) Toujours à temperature de travail buses +200°c / 60°c bed faites une serie succesives de 3 fasts leveling avec la feuille A4. Je recommande d'attendre au moins 5 minutes entre les fast bedeleveling le temps que la mécanique se dilate et mette en place.

* Note : Cette étape est cruciale, le leveling doit être toujours fait à chaud en conditons d'utilisations et jamais à froid pour des raisons de dilatations ! Il faut que la feuille puisse bouger mais que vous sentiez une légère resitance en tirant et poussant sur la feuille A4. si en poussant la feuille A4 se gondole et ne bouge pas il vous faudra abaisser le plateau pour liberer la pression exercé par la buse sur la feuille A4. (je ferais une vidéo explicative car ce n'est pas trivial)  

P10 ) Appliquer une fine couche de colle UHU stick premier prix au centre sur un carré de 150 mm de section sans faire de  surépaisseur. j'utilise une colle UHU diluée à l'eau que j'applique avec un petit rouleau pour uniformiser.
[Technique d'application de colle soluble en baton au rouleau](https://youtu.be/7C0QPmg6328?si=Unesij_6ZGf4jkct)

P11) Enlever le couvercle superieur transparent pendant l'impression du PLA. 
_Note : C'est recommandé pour le PLA néanmoins dans la pratique je prefere avoir mon enciente à temperature constante mais bon ce n'est pas un point crucial dans l'étape 00._

P12) QIDI a integré un menu de calibration XY accesible depuis l'interface mais ... pour l'utiliser il faut obligatoirement utiliser la clef usb livrée avec l'imprimante, la connecter à l'imprimante et lancer le programme E_calibration.gcode ...


_Note: Je trouve cela pas franchement pratique pour ne pas dire trés mal pensé ... pourquoi ne pas avoir tout integré dans le menu QIDI ?_ 


