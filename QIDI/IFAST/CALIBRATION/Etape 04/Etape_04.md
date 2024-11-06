# Étape 04 : Calibration du pourcentage de débit d'écoulement de la buse Z1/Z2 en fonction du diamètre du filament

## Prérequis avant de continuer
Vous devez impérativement avoir effectué les étapes suivantes pour la QIDI IFAST : 
- [Etape 00 : Réglage de l'alignement des deux buses / calibrage XY](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2000/Etape_00.md)
- [Etape 01 : Calibration des deux moteurs d'extrusion de Z1 / Z2](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2001/Etape_01.md)
- [Etape 03 : Calibration du diamètre du filament](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2003/Etape_03.md)

_Note 05/10/2024 : Au moment ou j'écris ce tuto j'utilise une autre solution qui ne requier plus le IDEAMAKER via un script python qui génère un gcode customisé pour caractériser les filaments sur Z2. Les deux methodes seront inclues dans ce tutoriel à terme._

### Présentation
Dans ce processus de caractérisation du % de débit d'un filament pour une imprimante 3D QIDI-IFAST je vais montrer pas à pas comment trouver / encadrer le % débit pour obtenir des impressions de précision et de haute qualité. Le processus implique l'utilisation d'un fichier source qui slice des cubes éprouvettes à des débits variables, la mesure précise des parois des cubes et l'analyse des données permetra de déterminer le débit optimal d'un filament donné.

Exemple pour le logiciel sliccer IDEAMAKER c'est la valeur exacte du % débit propre à un filament donné que l'on cherche à définir (encadrée en rouge) dans ce tuto; le diamétre du filament (ex 1,724mm encadré en orange) doit impérativement avoir été defini avant de continuer ce tuto; à defaut se reporter à [Etape 03 : Calibration du diamètre du filament](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2003/Etape_03.md)    : 
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/7cd00734a7899714554ef4374b111f3f644160e2/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_profil_petg_01.png)

#### Objectif
L'objectif principal de ce tuto est de vous expliquer comment j'ai caractérisé pas à pas le débit en % de mon filament PETG SUNLU sur la buse Z2 (buse gauche) de ma QIDI-IFAST en utilisant une série de cubes de tests à des débits variables décroisants et trouver la valeur optimale de débit en % qui permet d'obtenir des parois de cube avec une épaisseur le pus proche de la valeur théorique de 1.6mm (0.4x4). Quel que soit votre slicer (IDEAMKER dans mon cas) il vous faudra toujours définir avec précision cette valeur (ainsi que le daimetre nominal)  afin de tirer le meilleur de votre imprimante ! Chaque filament est unique et doit être caracterisé une fois et avant d'en avoir besoin ... Par expérience je vous conseille de noter ces deux valeurs sur la bobine cela vous facilitera grandement la vie ! 

#### Méthode 01 Étapes du Processus avec les cubes de [100% .. 90%] par pas de 1%

**Chargement de Fichiers**
   
   **Cas 1** : Vous avez la même configuration que moi sur votre QIDI-IFAST du PETG sur Z2 et du PLA sur Z1 -> vous pouvez directement imprimer depuis la QIDI-IFAST la série de 11 cubes depuis le fichier [17_10_2024_Calibration_[100%..90%]_V2.gcode](https://github.com/sudtek/IMPRIMANTES_3D/blob/7b1b4db4feb8aaa148066c3f2ab6458e4ebc0bf5/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c/17_10_2024_Calibration_%5B100%25..90%25%5D_V2.gcode) et passer à l'étape 5. **Mesure des Parois des Cubes**
   
   **Cas 2 :** Vous n'avez pas la même configuration que moi et/ou vous désirez pouvoir (éditer / modififer / adapter) le fichier sources [17_10_2024_Calibration_[100%..90%]_V2.idea](https://github.com/sudtek/IMPRIMANTES_3D/blob/b954e0fb5198141b21f86ee10baec49635fdae2a/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c/17_10_2024_Calibration_%5B100%25..90%25%5D_V2.idea) à vos besoins :
  
  - Lancer le logiciel IDEAMAKER (V>5.0.6).
    
  - Charger le fichier [17_10_2024_Calibration_[100%..90%]_V2.idea](https://github.com/sudtek/IMPRIMANTES_3D/blob/b954e0fb5198141b21f86ee10baec49635fdae2a/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c/17_10_2024_Calibration_%5B100%25..90%25%5D_V2.idea)
    ![](https://github.com/sudtek/IMPRIMANTES_3D/blob/dd77a2579ed883ef5e8eff893bc009ba6bb62ccd/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_Chargement_Fichier_11cubes%5B100%25...90%25%5D1%25.png)
    
 - Depuis le menu de tranchage simplifié appuyer sur le stilo rouge ![](https://github.com/sudtek/IMPRIMANTES_3D/blob/0894b3a91323984d481de2000f3e4227fd0351bc/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_menu_tranchage_niveau_0.png)

   pour acceder au menu de tranchage detaillé qui devrait être vierge :
   ![](https://github.com/sudtek/IMPRIMANTES_3D/blob/5e340b0a7590bee1af5fe61316c21f14138fffa1/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_menu_tranchage_Vierge_niveau_1.png)
   
 - Importer de haut en bas les profils liés à l'imprimante QIDI-IFAST, au filament de gauche et de droite,  au template ... via les boutons "Plus"
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
 
_*(Note : ATTENTION risque de confusion plus tard avec mon template de la méthode #2 qui utilise aussi le terme template mais ils n'ont rien en commun !)_

Vous devriez avoir cette présentation : 
 ![](https://github.com/sudtek/IMPRIMANTES_3D/blob/0894b3a91323984d481de2000f3e4227fd0351bc/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER_menu_tranchage_niveau_1.png)

Importer le fichier paramétrage des 11 cubes "**Paramètres de groupes et couches**" -> "**Importer et Exporter**" -> "**Importer d'un disque Local**" 
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/3f0e0337d4df9fc1193c668eef40fb1c53a33e74/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER__menu_ParametresGroupesCouches_Vierge.png)

Choisir le fichier [17_10_2024_Calibration_[100%..90%]_V2_export.settinggroup](https://github.com/sudtek/IMPRIMANTES_3D/blob/7cd00734a7899714554ef4374b111f3f644160e2/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c/17_10_2024_Calibration_%5B100%25..90%25%5D_V2_export.settinggroup). Ce fichier contient toutes les paramètres qui **SURPASSENT (ECRASENT)** les paramètres du profil matériaux PETG sur Z2 afin de créeer des groupes possédant chacun un % de débit propre / unique qui ne dépend plus du profil du matériaux sur la buse Z2 située à gauche. Ainsi dans IDEAMKER chaque élement sur le plateau peut être customisé et avoir ses propres spécifités par groupe et / ou couche. 

Note : Les fichiers avec l'extension ".settinggroup" n'ont en général de sens qu'avec le fichier le fichier ".idea" au quel ils sont associées et sont pas nature que "peut" transposables / associables à d'autres items hormis pour récupérer des configurations particulières.

Si l'import des paramètres c'est bien déroulé vous devriez voir une liste de groupes correspondats aux éléments (Cubes, légende et tour de purge) :
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/c1b234019d060fd0832e5eb9d003cb621b1c3000/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER__menu_ParametresGroupesCouches_Final.png)

ET pouvoir parcourir les caractéristiques de chacun des éléments exemple pour le Cube B : 
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/c1b234019d060fd0832e5eb9d003cb621b1c3000/QIDI/IFAST/CALIBRATION/Etape%2004/media/IDEAMAKER__menu_ParametresGroupesCouches_CUBE_B.png)




xxxxxx -> ICI !!!!!




 
 -  l'imprimante et les paramètres des cubes de test disponibles [Etape 04
/Z2_Calibration_PETG_235°c](https://github.com/sudtek/IMPRIMANTES_3D/tree/7b1b4db4feb8aaa148066c3f2ab6458e4ebc0bf5/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c)

2. **Configuration de l'Imprimante**
   - Vérification de la taille du plateau de l'imprimante (330 mm sur l'axe X et 250 mm sur l'axe Y).
   - Configuration des extrudeurs : T1 pour le PETG et T0 pour le PLA.
   - Vérification du diamètre du filament PETG (1,724 mm).

3. **Préparation des Cubes de Test**
   - Création de cubes de test avec des débits variables de 100 à 90 %.
   - Ajout d'une tour de purge pour éviter les suintements de la buse.
   - Ajout d'une jupe de maintien pour éviter que les pièces ne se décollent.

4. **Impression des Cubes**
   - Impression des cubes de test avec les paramètres spécifiés.
   - Vérification visuelle des cubes imprimés pour s'assurer qu'ils sont corrects.

5. **Mesure des Parois des Cubes**
   - Utilisation d'un outil précis avec une molette pour mesurer les parois X1, X2, Y1 et Y2 de chaque cube.
   - Enregistrement des mesures dans un tableur
     [17_10_2024_Calibration_filament_Débit_Ecoulement.ods](https://github.com/sudtek/IMPRIMANTES_3D/blob/e164b41cd4a32ed06201bcb55994184bbe3e5474/QIDI/IFAST/CALIBRATION/Etape%2004/17_10_2024_Calibration_filament_D%C3%A9bit_Ecoulement.ods)

6. **Analyse des Données**
   - Calcul des valeurs moyennes des épaisseurs des parois pour chaque cube.
   - Création d'un diagramme pour visualiser les données.
   - Analyse des clusters de points pour déterminer la meilleure valeur de débit.

7. **Détermination du Débit Optimal**
   - Utilisation d'une méthode de dichotomie pour converger vers la valeur de débit optimale.
   - Conclusion que la valeur de 92,3 est la plus appropriée pour le PETG.

## Détail, explications de cette méthode de calibration du % de débit avec une série de 11 cubes de calibration 100% à 90%

[![Détail, explications et méthode de calibration du % de débit avec une série de 11 cubes de calibration 100% à 90%](https://i9.ytimg.com/vi_webp/gn3A1lFX0vc/mq2.webp?sqp=COirprkG-oaymwEmCMACELQB8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGD0gVChlMA8=&rs=AOn4CLAkej0COVnXFqI_hiDXwUg99ymBUw)](https://www.youtube.com/watch?v=gn3A1lFX0vc?si=RjfHDFoegoFpW7tH)


#### Conclusion
Le processus de caractérisation du débit de filament est crucial pour obtenir des impressions 3D de haute qualité. Il nécessite une série de mesures précises et une analyse rigoureuse des données pour déterminer la valeur de débit optimale. En suivant ce processus, il est possible de trouver la valeur de débit qui permet d'obtenir des parois de cube avec une épaisseur proche de la valeur théorique, garantissant ainsi des impressions de qualité.

#### Remarques Finales
Importance de la précision et de l'analyse des données dans le processus de caractérisation du débit de filament.l'utilité des outils de mesure précis et des méthodes d'analyse rigoureuses pour obtenir des résultats fiables. 
La méthode de dichotomie est efficace pour converger rapidement vers la valeur de débit optimale mais elle implique l'impression succésive de série de cubes visant à encadrer la solution et donc de devoir attendre que les cubes ce stabilisent à température anbiante -> c'est donc un processus plus long, plus fastideux.





-------------------------





Afin de comprendre comment  Nous venons de charger le fichier qui nous permettra de caractériser le débit du filament. Il s'agit de cubes dont le débit varie de 100 à 90. Ce chiffre correspond au débit de chaque cube, que ce soit en termes de flux ou de débit. Nous avons les profils d'Ida Maker, avec un profil spécifique pour l'imprimante.

Dans ce profil, nous trouvons deux informations cruciales : la taille du plateau et les extrudeurs. Sur les imprimantes Quid East, le plateau est annoncé comme étant de 360 mm, mais en réalité, il n'est exploitable que sur 330 mm selon l'axe X. Cela est dû à la double extrusion avec une seule tête. Nous avons deux extrudeurs : l'extrudeur de gauche est étiqueté T1 et l'extrudeur de droite est étiqueté T0. La taille maximale est donc de 0 à 330 mm sur l'axe X et de 0 à 250 mm sur l'axe Y.

Sur la Quid Fast, l'extrudeur de gauche (T1) correspond à la buse Z2 et imprime du PETG, tandis que l'extrudeur de droite (T0) correspond à la buse Z1 et imprime du PLA. L'extrudeur de droite est utilisé pour les supports. Nous imprimons sur la tête de gauche avec du PETG, qui a déjà été caractérisé. Le diamètre du filament PETG a été caractérisé à 1,724 mm, ce qui est crucial avant de calibrer le débit.

Le débit n'est pas de 100 % car il a déjà été caractérisé. Cette valeur est propre à chaque bobine de filament et ne peut être extrapolée ou transposée à un autre filament. Il est impératif de fixer cette valeur à 100 %. Le PLA ne sera pas utilisé puisque nous travaillons sur l'extrudeur de gauche.

Le fichier Quid Fast via Ida Maker peut utiliser plusieurs templates. Nous nous contenterons de charger celui fourni avec ce fichier. Lorsque nous importerons un fichier à partir du disque local, nous utiliserons celui du 17/10/224, intitulé "export printer". Il contient toutes les caractéristiques nécessaires. Si des modifications sont nécessaires, elles doivent être effectuées dans ce fichier, mais il ne faut pas toucher à la case permettant de contourner les paramètres du tranchage du profil liés aux matériaux.

Chaque cube a un débit différent, allant de 100 à 90. Cela permet de créer une tour de purge avec un bouclier d'essuyage pour éviter les suintements de la buse. Nous avons également une jupe de maintien pour éviter que les pièces ne se décollent.

Pour caractériser le débit, nous devons mesurer les parois de chaque cube. Nous utilisons un outil précis avec une molette pour assurer une pression constante. Nous mesurons les parois X1, X2, Y1 et Y2 de chaque cube et notons les valeurs dans un tableur.

Après avoir mesuré les cubes, nous reportons les valeurs moyennes dans un tableau pour créer un diagramme. Nous cherchons la valeur de débit qui donne une épaisseur de paroi proche de la valeur théorique. Nous préférons une légère surextrusion à une sous-extrusion, car il est plus facile d'enlever de la matière que d'en ajouter.

Enfin, nous analysons les clusters de points pour déterminer la meilleure valeur de débit. Nous utilisons une méthode de dichotomie pour converger vers la valeur optimale. Après plusieurs séries de tests, nous avons trouvé que la valeur de 92,3 est la plus appropriée pour notre PETG.

En résumé, la caractérisation du débit du filament nécessite une série de mesures précises et une analyse rigoureuse des données pour déterminer la valeur optimale.





