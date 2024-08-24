24_08_2024

Contexte : J'ai recement fait l'acquisition d'une imprimante de marque QIDI modéle IFAST avec une tête dual (Pas IDEX) pour pouvoir imprimer mes piéces du PETG et les supports dans une matiere differente (PLA / PVA) qui n'hadére pas au PETG.

Important : Les deux extrudeurs de la QIDI IFAST sont montés sur une même unique tête et sont sortis / retractés selon le besoin via une came lorsque la tête arrive en buté gauche / droite. 

Exemple : Si la tête arrive en buté gauche la tête Z2 situé à main gauche est mise à hauteur afin de pouvoir imprimer à l'inverse la tête de droite z1 est elle est retactée.  
J'utilise le sclicer ideamaker qui identifie les têtes de gauche à droite comme T0,T1 ... ce qui n'est pas sans posser des pb avec la numerotation de QUIDI

QUIDI IFAST
            
| Localisation* Extrudeur  |  Gauche   |  Droite   |
|   identification QIDI    |    Z2     |    Z1     |
| identifcation ideamaker  |    T0     |    T1     |
----------------------------------------------
|      Impression          |   Corps   |  Supports |
|   Matière à extruder     |    PETG   |    PLA    |
| Temperature extrudeurs°c |    235    |    205    |
| Temperature Bed °c       |          70**         | // Toujours prevoir un filme de colle blanche pour assurer l'hadérence et limiter le warpinget faciliter le retrait par spatulage 
| Temperature enceinte °c  |          55**         | // Ne pas dépasser les 55°c sinon les supports /radeaux/ jupes en PLA vont fondre et se deformer l'idéal est d'utiliser un pla haute température 

* Localisation par convention lorsque l'on fait face à l'imprimante.
note : A la fin de l'impression Il est conseillé de faire baisser la temperature de l'enceinte par palier pour eviter le warping.


Jai rapidement pu consater que les objets imprimés etaient bien moins précis que sur ma vielle X1 et la QIDI ifast necesite une calibration de bout en bout et que l'on ne peut pas se contenter des réglages par defaut d'usine.
J'ai donc decidé de consigner methodes,informations,gcode, profils ideamakers ... pour aider les autres utilisateurs qui possédent une QIDI IFAST à tirer le meilleur parti de leur machine.
Attention les gcodes de cette catégorie sont specifiques à une imprimante QIDI IFAST !!
J'ai pour habitude de documenter mes scripts / gcodes afin qu'ils soient explicites néanmoins je vous recommande de toujours les relire et verifier avant de les lancer.
