**24_08_2024**

J'ai recement fait l'acquisition d'une imprimante de marque QIDI modéle IFAST avec une tête dual pour pouvoir imprimer mes piéces du PETG et les supports dans une matiere differente (PLA / PVA) qui n'hadére pas au PETG.
 
 Une imprimante dite "dual" est différent d'une "IDEX" qui posséde deux têtes totalement indépandantes, capables de travailler simultanément, en mirroir en clone...

Les deux extrudeurs de la QIDI IFAST sont montés sur une unique tête et sont alternativement sortis / retractés selon le besoin via une came lorsque la tête arrive en buté gauche / droite. 

Exemple : Si la tête arrive en buté gauche la tête Z2 situé à main gauche est abaissée à proximité du plateau afin de pouvoir imprimmer alors que la tête de droite z1 est elle est retactée.

J'utilise uniquement le sclicer Ideamaker pour convertir mes fichiers STL. Celui-ci identifie les têtes de gauche à droite comme T0,T1 ... ce qui n'est pas sans posser des pb avec la numerotation de QUIDI.


**QUIDI IFAST avec Firmware Marlin**
| Localisation Extrudeur | Gauche | Droite |
|------------------------|--------|--------|
| Identification QIDI    | Z2     | Z1     |
| Identification Ideamaker| T0     | T1     |
| Localisation           | Gauche | Droite |
| Impression              | Corps  | Supports |
| Matière à extruder      | PETG   | PLA     |
| Température extrudeurs (°C) | 235    | 205    |
| Température Bed (°C)    | 70   | 70      |
| Température enceinte (°C) | 55     | 55       |

- Localisation  : par convention lorsque l'on fait face à l'imprimante.
- Température extrudeurs (°C) : Par defaut ces températures donneront un bon resultat mais il faudra toujours calibrer vos bobines.
- Température Bed (°C)  : Toujours prevoir un filme de colle blanche pour assurer l'hadérence et limiter le warp et faciliter le retrait par spatulage.
- Température enceinte (°C) : Ne pas dépasser les 55°c sinon les supports / radeaux / jupes en PLA vont fondre et se deformer l'idéal est d'utiliser un pla+ 
- Note 1 : Aucune ventilation de l'impression en cours car cela fait warp le PETG
- Note 2 : A la fin de l'impression il est conseillé de faire via un gcode de baisser la temperature progressivement par palier pour eviter le warping du PETG.

**Mes observation :** Jai rapidement pu consater que les objets imprimés avec ma QIDI IFAST à 1500€ etaient bien moins précis que sur ma vielle X1 300€ calibrée ... La  QIDI Ifast est une imprimante technique qui necesite imperativement une calibration complexe de bout en bout il est impossible de se contenter des réglages par defaut d'usine. J'ai donc decidé de consigner mes périgrinations, methodes, informations, gcode, profils ideamakers et autres galéres ... pour aider les autres utilisateurs qui possédent une QIDI IFAST à tirer le meilleur parti de leur machine. J'ai pris contact avec le support QIDI qui est certes réactif et amical mais qui reste selon moi trop supperficiel sur certains points ... manque de documentation et finition logiciels ... 

**ATTENTION :** Les gcodes de cette catégorie sont trés specifiques aux imprimantex QIDI IFAST !! Vous pouvez vous en inspirer mais si vous avez un autre modele il faudra imperativement les adapter. J'ai pour habitude de documenter mafin que cela soit explicite néanmoins je vous recommande de toujours les relire et verifier avant de vous lancer.
