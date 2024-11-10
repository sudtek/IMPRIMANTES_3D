# Étape 04 : Détermination du débit % en fonction du diamètre du filament

## Prérequis avant de continuer
Vous devez impérativement avoir effectué les étapes suivantes pour la QIDI IFAST : 
- [Etape 00 : Réglage de l'alignement des deux buses / calibrage XY](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2000/Etape_00.md)
- [Etape 01 : Calibration des deux moteurs d'extrusion de Z1 / Z2](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2001/Etape_01.md)
- [Etape 03 : Calibration du diamètre du filament](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2003/Etape_03.md)

_Note 05/10/2024 : Une nouvelle solution de Détermination du débit % ne nécessite plus l'utilisation d'IDEAMAKER. Un script Python est employé pour générer un fichier Gcode personnalisé, permettant de caractériser les filaments sur la buse Z2._

## Présentation
Ce tutoriel détaille étape par étape la méthode pour déterminer et encadrer le pourcentage de débit optimal d'un filament afin d'obtenir des impressions avec une précision dimensionnelle accrue. Le processus comprend tous les fichier source pour génèrer des cubes éprouvettes à des débits variables, la mesure précise des parois des cubes et l'analyse des données pour déterminer le débit optimal d'un filament donné.

Exemple pour le logiciel sliccer IDEAMAKER : 

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/527fa37f381f61b011b10b9d9b2914b11b05b939/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_profil_petg_01.png)

Pour déterminer la valeur exacte du pourcentage de débit propre à un filament donné (encadrée en rouge) il est impératif que le diamètre du filament (par exemple, 1,724 mm, encadré en orange) ait été défini avant de poursuivre ce tutoriel. En cas de non-définition, veuillez vous reporter à[Etape 03 : Calibration du diamètre du filament](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2003/Etape_03.md)

_Note : Toutes les méthodes mises en œuvre dans ce tutoriel consistent à imprimer les éléments du plateau couche par couche, sans recourir à l'impression séquentielle. Cette approche est nécessaire car l'impression séquentielle ne permet pas d'imprimer 11 cubes côte à côte avec une distance intercubes de 5 mm sans risquer de collisions.._ 

## Objectif
L'objectif principal de ce tutoriel est d'expliquer étape par étape, comment le débit en pourcentage d'un filament PETG SUNLU est caractérisé sur la buse Z2 (buse gauche) d'une QIDI-IFAST, en utilisant une série de cubes de test à des débits variables décroissants. Le but est de trouver la valeur optimale de débit en pourcentage qui permet d'obtenir des parois de cube avec une épaisseur la plus proche possible de la valeur théorique de 1,6 mm (0,4 mm x 4). Quel que soit le slicer utilisé (IDEAMAKER dans mon cas), il est toujours nécessaire de définir cette valeur avec précision (ainsi que le diamètre nominal) pour tirer le meilleur de votre imprimante. Chaque filament est unique et doit être caractérisé avant utilisation. Par expérience, je vous conseille de noter ces deux valeurs sur la bobine, ce qui vous facilitera grandement la tâche.

![image](https://github.com/user-attachments/assets/1195653a-5a88-4350-ae09-b2b6b5d9bc97)# Étape 04 : Calibration du pourcentage de débit d'écoulement de la buse Z1/Z2 en fonction du diamètre du filament

## Méthodologie de principe : Étapes du Processus avec les cubes de [100% .. 90%] par pas de 1%

**Chargement de Fichiers**
   
   **Cas 1** : Vous avez la même configuration que moi sur votre QIDI-IFAST du PETG sur Z2 et du PLA sur Z1 -> vous pouvez lancer l'[Impression des Cubes](https://github.com/sudtek/IMPRIMANTES_3D/edit/main/QIDI/IFAST/CALIBRATION/Etape%2004/Etape_04.md#pr%C3%A9paration-de-limprimante-avant-dimprimer-le-gcode) de la série de 11 cubes du fichier [17_10_2024_Calibration_[100%..90%]_V2.gcode](https://github.com/sudtek/IMPRIMANTES_3D/blob/7b1b4db4feb8aaa148066c3f2ab6458e4ebc0bf5/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c/17_10_2024_Calibration_%5B100%25..90%25%5D_V2.gcode).
   ![](https://github.com/sudtek/IMPRIMANTES_3D/blob/6f4cdd068f3487245cee3358175c3eef3447ab7e/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c/Vue_01.png)
   
   
   **Cas 2 :** Vous n'avez pas la même configuration que moi et/ou vous désirez (éditer / modifier / adapter) le fichier sources [17_10_2024_Calibration_[100%..90%]_V2.idea](https://github.com/sudtek/IMPRIMANTES_3D/blob/b954e0fb5198141b21f86ee10baec49635fdae2a/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c/17_10_2024_Calibration_%5B100%25..90%25%5D_V2.idea) à vos besoins, tous les fichiers peuvent être téléchargés sur ce lien [Etape 04
/Z2_Calibration_PETG_235°c](https://github.com/sudtek/IMPRIMANTES_3D/tree/7b1b4db4feb8aaa148066c3f2ab6458e4ebc0bf5/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c)

  - Lancer le logiciel IDEAMAKER (Version >= 5.0.6).
    
  - Charger le fichier [17_10_2024_Calibration_[100%..90%]_V2.idea](https://github.com/sudtek/IMPRIMANTES_3D/blob/b954e0fb5198141b21f86ee10baec49635fdae2a/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c/17_10_2024_Calibration_%5B100%25..90%25%5D_V2.idea)
    ![](https://github.com/sudtek/IMPRIMANTES_3D/blob/dd77a2579ed883ef5e8eff893bc009ba6bb62ccd/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_Chargement_Fichier_11cubes%5B100%25...90%25%5D1%25.png)
    
 - Depuis le menu de tranchage simplifié appuyer sur l'icone stilo rouge ![](https://github.com/sudtek/IMPRIMANTES_3D/blob/0894b3a91323984d481de2000f3e4227fd0351bc/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_menu_tranchage_niveau_0.png)

   pour acceder au menu de tranchage detaillé qui devrait être vierge :
   ![](https://github.com/sudtek/IMPRIMANTES_3D/blob/5e340b0a7590bee1af5fe61316c21f14138fffa1/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_menu_tranchage_Vierge_niveau_1.png)
   
 - Importer de haut en bas les profils liés à l'imprimante QIDI-IFAST, du filament de gauche et celui de droite, du template ... via les boutons "Plus"
   
 De haut en bas :

 #1 Importer le profil de l'imprimante 
 [17_10_2024_IFAST-export.printer](https://github.com/sudtek/IMPRIMANTES_3D/blob/667637b22536c230eb82010f8e05996019708a51/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c/17_10_2024_IFAST-export.printer)
dans la 1er ligne en appuyant sur Plus :
 ![](https://github.com/sudtek/IMPRIMANTES_3D/blob/4566f302fe43216aef2d1f766e220cac8bce1b17/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_menu_tranchage_Ligne1_IMPRIMANTE.png)

 #2 Importer le profil du matériaux sur la buse Z2 située à gauche (L) pour LEFT (en)
 [17_10_2024_QIDI_IFAT_PETG blanc_export_Gauche.filament](https://github.com/sudtek/IMPRIMANTES_3D/blob/4566f302fe43216aef2d1f766e220cac8bce1b17/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c/17_10_2024_QIDI_IFAT_PETG%20blanc_export_Gauche.filament)
dans la seconde ligne en appuyant sur Plus :
 ![](https://github.com/sudtek/IMPRIMANTES_3D/blob/4566f302fe43216aef2d1f766e220cac8bce1b17/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_menu_tranchage_Ligne2_PETG.png)

 #3 Importer le profil du matériaux sur la buse Z1 située à droite (R) pour RIGHT (en)
 [17_10_2024_QIDI_IFAT_PLA_Rouge_export_Droite.filament](https://github.com/sudtek/IMPRIMANTES_3D/blob/3f0e0337d4df9fc1193c668eef40fb1c53a33e74/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c/17_10_2024_QIDI_IFAT_PLA_Rouge_export_Droite.filament)
dans la troisième ligne en appuyant sur Plus :
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/4566f302fe43216aef2d1f766e220cac8bce1b17/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_menu_tranchage_Ligne3_PLA.png)

 #4 Importer le profil du template* matériaux
 [Etape 04/Z2_Calibration_PETG_235°c/17_10_2024_Template PETG Principal GAUCHE_QIDI_Z2T0 VS PLA supports DROITE_QIDI_Z1_T1 SAVE_17_octobre_2024_nonPOST_Tout-Support_OK_export.bin](https://github.com/sudtek/IMPRIMANTES_3D/tree/4566f302fe43216aef2d1f766e220cac8bce1b17/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c)
dans la seconde ligne en appuyant sur Plus :
 ![](https://github.com/sudtek/IMPRIMANTES_3D/blob/4566f302fe43216aef2d1f766e220cac8bce1b17/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_menu_tranchage_Ligne4_TEMPLATEMATERIAUX.png)
 
_*(Note : ATTENTION risque de confusion : Dans le tutoriel utilisant le script utilise aussi le terme template mais ils n'ont rien en commun !)_

Vous devriez avoir cette présentation : 
 ![](https://github.com/sudtek/IMPRIMANTES_3D/blob/0894b3a91323984d481de2000f3e4227fd0351bc/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_menu_tranchage_niveau_1.png)

Importer le fichier paramétrage des 11 cubes "**Paramètres de groupes et couches**" -> "**Importer et Exporter**" -> "**Importer d'un disque Local**" 
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/3f0e0337d4df9fc1193c668eef40fb1c53a33e74/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER__menu_ParametresGroupesCouches_Vierge.png)

Choisir le fichier [17_10_2024_Calibration_[100%..90%]_V2_export.settinggroup](https://github.com/sudtek/IMPRIMANTES_3D/blob/7cd00734a7899714554ef4374b111f3f644160e2/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c/17_10_2024_Calibration_%5B100%25..90%25%5D_V2_export.settinggroup). Ce fichier contient toutes les paramètres qui **SURPASSENT (ECRASENT)** les paramètres du profil matériaux PETG sur Z2 afin de créeer des groupes possédant chacun un pourcentage de débit propre / unique qui ne dépend plus du profil du matériaux sur la buse Z2 située à gauche. Ainsi dans IDEAMAKER chaque élement du plateau peut être customisé et avoir ses propres spécifités par groupe et / ou couche. 

_Note : Les fichiers avec l'extension "**.settinggroup**" n'ont en général de sens qu'avec le fichier le fichier "**.idea**" auquel ils sont associés et par nature ne sont que "peut" transposables / associables à d'autres items hormis pour récupérer des configurations particulières.
_

Si l'import des paramètres c'est bien déroulé vous devriez voir une liste de groupes correspondats aux éléments des 11 Cubes, de la légende et de la tour de purge :
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/c1b234019d060fd0832e5eb9d003cb621b1c3000/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER__menu_ParametresGroupesCouches_Final.png)

Exemple : Détails des paramètres propres et uniques à chaque groupe, ici le groupe B : 
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/c1b234019d060fd0832e5eb9d003cb621b1c3000/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER__menu_ParametresGroupesCouches_CUBE_B.png)
 
Paramètres customisés du Cube débit 99.0% :

**Ordre d'impression*** : N'est pas le même que les autres objets du plateau; le cube du groupe B à ses parois imprimés dans un ordre précis #1 la parois / coque périphérie externe, #2 la parois / coque coque périphérie interne et finalement #3 le remplissage entre les deux coques, ce choix assure un positionement plus précis et une précision de l'épaisseur finale des parois en limitant les effets liés à des poussés latérales.
_Note : Attention le terme Ordre d'impression dans cette option n'a rien avoir avec la possibilité d'impression séquentiel qui consiste elle à imprimer intégralement un cube de la première couche z=0mm à la derniere couche z=20mm avant de passer au prochain cube.
_
**Densité du remplissage** : Ne concerne que l'intérieur du cube, ce paramètre est fixé à 0% afin que notre cube soit vide pour pouvoir mesurer les parois au  1/100 avec un micromètre.

**Couche de remplissage solide** : C'est le nombre de couches en contact avec le plateau / bed. On aurait pu se contenter de la valeur par défaut contenu dans le profil du matériaux PETG (Z2) mais je désirais avoir un nombre de coques uniforme sur toutes l'éprouvette pour limiter les déformations des éprouvettes mais également pouvoir les recyler en récipients ...  

**Débit du matériaux gauche (Ecrase les réglages du materiaux)** : Chaque cube a un débit customisé unique qui est propre à son groupe, le cube du groupe B est imprimé à 99%; le cube suivant du groupe C est imprimé à 98%, etc ... écrasant les réglages des matériaux.

**Activer le mur de netoyage** : Inclus mais désactivé, par défaut cette option est toujours activée dans mon "profil du matériaux" pour le PETG car j'imprime avec deux filaments, mais dans le cadre de la calibration afin de pouvoir imprimer les cubes sur une seule et unique ligne j'ai choisi de désactiver cette option au niveau des groupes cela a pour avantages de ne pas avoir à (re)modifier mon profil matériaux, éviter des colisions entre murs de netoyages étant donné que la distance intercubes est de 5mm mais également accélérer l'impression du plateau. La tour de purge 10x10x20mm elle n'integre pas cette option et donc posséde un mur de netoyage.

Les **Paramètres de couches** : Egalement customisés avec des options qui concernent uniquement la témpérature des extrudeurs dans le but de faciliter la réutilisation et modification de ce plateau pour caracteriser d'autres types de filaments nécèssitant d'autres températures, il faut donc modifier ces valeurs dans chacun des groupes et faire impérativement une verification des valeurs thermiques appliqués à la buse avant d'exporter et imprimer un gcode. Mes vaparamêtres :
Buse Z2 située à gauche (L) 235°c pour le PETG
Buse Z1 située à droite (R) 205°c pour le PLA -> Attention même si ce plateau imprime du PETG la QIDI-IFAST au départ de chaque impression la QIDI-IFAST fait un trait de purge de 100mm de longueur, si la température de Z1 n'est pas adéquate avec la température du filament que vous avez chargé il y a un risque de casser / endomager la tête et/ou boucher la buse. 

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/9b1b6daf2745e975ca76cbf3927c7ab1c6f96028/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_Visualisation_temperature.png)

 La température de l'enceinte est fixé par defaut à 40°c, elle peut être modifiée dasn IDEAMAKER en éditant le matériaux principal sur Z2 -> "**IFAST PETG BLANC SUNLU**" -> "**Modifier les paramètres du Matériaux selectionné**" -> "**Gcode Personalisé**" et modifiant le gcode "**M141 S40**". Le choix de cette température n'est pas anodine cela  permet à la fois d'imprimer n'importe quel type de filament tout en ayant une dilation totalement controlée de l'imprimante. En effet etant donné que ma QIDI est localisée dans un atelier elle subit une amplitude thermique d'environ 35°c entre la saison hivernale et estivale; ainsi travailler dans une enceinte à température constante et contrôlée assure une meilleure répétatiblité d'impression et une constance des réglages indépendement de la saison, les mécanismes d'entrainements sont sensibles aux dilations d'ou l'idée de travailler toujours à température constante de 40°.

La température du plateau est fixée à 65°c car j'imprime en PETG le corps de piéce et mes supports en PLA [sur une fine couche de colle soluble](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2002/Etape_02.md#pr%C3%A9requis), il faut donc trouver une temperature medianne qui est compatible avec les deux filaments.
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/7696ddd079a5c97c509103294c85bcd0db28b6b0/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_MATERIEL_GAUCHE_Z2_PETG_BLANC_SUNLU_Temperature.png)

Rendu de la serie de cubes de calibrage de 100% à 90% à débits dècroissants par pas de 1.0% afin de s'assurer que tout est correct.![](https://github.com/sudtek/IMPRIMANTES_3D/blob/6f4cdd068f3487245cee3358175c3eef3447ab7e/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c/Vue_02.png)

Faites un export du fichier .gcode [17_10_2024_Calibration_[100%..90%]_V2.gcode](https://github.com/sudtek/IMPRIMANTES_3D/blob/8bae97a4e72fbc0f8e1de0a924a69d353455d964/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c/17_10_2024_Calibration_%5B100%25..90%25%5D_V2.gcode) vers une clef USB.

### Préparation de l'imprimante avant d'imprimer le gcode
Fixer manuellement les températures des materiaux, du plateau et de l'enceinte via le menu de l'imprimante et laisser l'imprimante se dilater et stabiliser au moins 15 minutes avant de lancer votre impression. Je vous invite à vous reporter aux explications détaillés sur ce point l'[Etape 2 Calibration Mise à niveau / hauteur du plateau](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2002/Etape_02.md#pr%C3%A9requis)

Faites un fast Leveling à chaud de l'imprimante au besoin se reporter à [Étape 02 : Calibration Mise à niveau / hauteur du plateau](https://github.com/sudtek/IMPRIMANTES_3D/blob/8bae97a4e72fbc0f8e1de0a924a69d353455d964/QIDI/IFAST/CALIBRATION/Etape%2002/Etape_02.md#pr%C3%A9requis)

### Impression des Cubes
L'impression va durer environ 4 heures 1/4 et consommer 37g de filament.

Chaque couche de cube est imprimée avec un débit d'écoulement unique décroissant 100.0%; 99.0% ... 90.0% mais la QIDI-IFAST a un bug* d'affichage ... L'écran de l'imprimante QIDI-IFAST n'est jamais mis à jour avec la valeur du débit courant et il faut forcer manuelement le rafraichissement de cette valeur en basculant entre l'écran 1/2 et 2/2 pour verifier que les bon paramètres de debit sont appliqué à chacun des cubes. 
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/590ed48f2fef80f08a1cb919f9494207e8ea42d6/QIDI/IFAST/CALIBRATION/Etape%2004/media/QIDI_IFAST_ECRAN_BUG_MAJ_DEBIT.jpg)

_* Note : J'ai signalé ce bug de màj d'affichage au support de QIDI mais à ce jour aucun correctif ..._

Laisser les cubes refroidir sur le plateau le temps qu'ils reviennent à temperature ambiante cela limitera le risque de déformation.
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/0c5fa474c00300508d8980d77553aec96af0cd91/QIDI/IFAST/CALIBRATION/Etape%2004/media/PRINTCUBE_01.png)

Proceder a une inspection visuelle des cubes imprimés pour s'assurer qu'ils sont correctements imprimés et conformes.
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/5a3fb5728029d8960e37ff5dc597c570d68dc350/QIDI/IFAST/CALIBRATION/Etape%2004/media/PRINTCUBE_02.png)

### Mesure des Parois des Cubes

Mesurer avec precision les parois X1, X2, Y1 et Y2 de chacuns des cubes à l'aide d'un micrometre precision 1/100.

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/f1941dd6f5dbcfc983f447e04092b3a1cd396673/QIDI/IFAST/CALIBRATION/Etape%2004/media/MESURE_00.png)

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/f1941dd6f5dbcfc983f447e04092b3a1cd396673/QIDI/IFAST/CALIBRATION/Etape%2004/media/MESURE_02.png)

Télécharger le fichier tableur [17_10_2024_Calibration_filament_Débit_Ecoulement.ods](https://github.com/sudtek/IMPRIMANTES_3D/blob/e164b41cd4a32ed06201bcb55994184bbe3e5474/QIDI/IFAST/CALIBRATION/Etape%2004/17_10_2024_Calibration_filament_D%C3%A9bit_Ecoulement.ods)

Dupliquer l'onglet **PROFORMAT_Debit_Filament_Matrice_Cubes_10C_x_1L_Y%..Z%_Pas_N%** pour y saisir les valeurs des parois X1,X2,Y1,Y2 de chacun de vos cubes.

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/69b40453d07beb1fe1b0a7f14bf69deeda3c96fa/QIDI/IFAST/CALIBRATION/Etape%2004/media/PROFORMAT_Vierge.png)

### Analyse des Données

Le tableur calculera les valeurs moyennes arithmétiques (x1+x2+y1+y2)/4 de chaque cube et dessinera automatiquement un graphe composé d'une polyligne. Ce graphe a pour but de vous aider à localiser un intervale solution ou vous pourrez trouver à minima une solution. Un intervale solution c'est une ligne entre deux points Mmoy et Nmoy qui coupe pour une valeur d'épaisseur 1,6mm. Cette valeur correspond à lépaisseur d'une coque * nombre de coques qui compose une paroi (0,4mm*4=1,6mm). Dans le fichier tableur vous trouverez un onglet intitulé :"Exemple_Test_Debit_Filament_Matrice_Cubes_10C_x_1L_100%..90%_Pas_1%" qui correspond à une serie que j'ai effectuée suite à la caractérisation d'une de mes bobines de PETG qui me servira de référence pour la suite de mes explications. 

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/3bf69e476241725de97882081f60ca12b5b21d91/QIDI/IFAST/CALIBRATION/Etape%2004/media/TABLEUR_Exemple_Moyenne_01.png)

_Note : Si vous ne trouvez pas d'intervale solution compris dans l'intervale inital [100% .. 90%]% de débit il doit se situer à proximité immédiate de la borne inférieure ou supérieure, si ce n'est pas le cas il y a fort à parier que vous avez mal caractérisé le diamétre principal de votre filament reportez-vous à l'[Étape 03 : Calibration du diamètre du filament](https://github.com/sudtek/IMPRIMANTES_3D/blob/8ec18aae8171912256d8da4de497ad06e5ea1aaa/QIDI/IFAST/CALIBRATION/Etape%2003/Etape_03.md) et reprendre ce tuto depuis le début._

Cette polyligne composée de segments coupe pour une valeur d'épaisseur 1,6mm entre les cubes de débit de 92.0% et 91.0%; il y a bien une solution dans cet intervale sachant que graphiquement on constate que ces deux bornes ne sont pas solutions. Le % débit solution est donc compris dans l'intervale ]92% .. 91%[ (entre le cube 92% et le cube 91% exclus). Sachant que la précision de saisi dans le sliccer IDEAMAKER pour le % de débit est 1/10 (0.1)

Vous pouvez au choix :

- Vous arreter ici et "couper la poire en deux" en choisisant une valeur intermédiare; en observant soigneusement le graphique on comprend intuitivement que la solution est située dans le demi intervale de gauche compris entre ]92% .. 91.5%[ soit au choix {91.6%;91.7%;91.8%} avec une erreur de maximum de +- 0.2% c'est trois points sont acceptable.

- Rechercher la valeur exacte à 0,1% ce qui implique d'imprimer une nouvelle série de cubes de débit dans l'intervale [92.0% 91.0%]

### Détermination du Débit Optimal
Avant de réaliser ce tutoriel, j'avais opté pour une méthode de dichotomie pure, consistant à effectuer plusieurs séries de deux cubes, représentant les bornes supérieure et inférieure d'un intervalle. Cependant, cette méthode nécessite l'impression récursive d'environ six séries de cubes pour converger et déterminer la valeur du débit à 0,1 % près. Cette approche est chronophage et fastidieuse, car il faut laisser chaque série de cubes revenir à température ambiante avant de procéder aux mesures, et il est crucial de ne pas se tromper dans la mise en œuvre de la dichotomie (choix de l'intervalle).

Le seul avantage de cette solution est qu'elle met en évidence l'existence de plusieurs candidats solutions dans l'intervalle global pour le pourcentage de débit, certains étant de meilleurs candidats que d'autres en raison du phénomène de dispersion/regroupement autour de la valeur consigne de 1,6 mm. Ainsi, pour un même filament, j'ai pu trouver deux bons candidats : 91,7 % et 92,3 %.

Pour les plus curieux, reportez-vous à cette vidéo qui reprend tout le modus operandi de la recherche du pourcentage de débit pour l'intervalle de 100 % à 90 %, présentée ci-dessus  [![Détail, explications et méthode de calibration du % de débit avec une série de 11 cubes de calibration 100% à 90%](https://i9.ytimg.com/vi_webp/gn3A1lFX0vc/mq2.webp?sqp=COirprkG-oaymwEmCMACELQB8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGD0gVChlMA8=&rs=AOn4CLAkej0COVnXFqI_hiDXwUg99ymBUw)](https://www.youtube.com/watch?v=gn3A1lFX0vc?si=RjfHDFoegoFpW7tH)

## Conclusion
Le processus de caractérisation du % débit de filament est crucial pour obtenir des impressions 3D de precision. Il nécessite une ou deux séries de cubes, plusieurs mesures précises et une analyse rigoureuse des données pour déterminer la valeur de débit optimale.  Étant donné que chaque nouveau filament doit être caractérisé et que ce travail est fastidieux, ingrat et chronophage, j'ai développé un script Python interactif. Ce script permet de générer directement un fichier Gcode pour un intervalle de travail donné [Xmax% .. Ymin%] avec un pas de 1 % / 0,1 %, sans avoir besoin d'un slicer. Pour l'instant, ce script fonctionne uniquement pour la buse Z2. Afin de ne pas alourdir ce tutoriel, j'ai séparé les explications et je vous invite à vous y reporter : [Génerateur de séries de cubes à débit variable par pas décroissants constants de 1% / 0.1% pour calibration et encadrement du débit de Z2 (buse de gauche) sur imprimante 3D QIDI-IFAST](https://github.com/sudtek/IMPRIMANTES_3D/tree/787a158a1ccf9bd3e518755a8b3c06576e8295ef/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script).

-------------------------





