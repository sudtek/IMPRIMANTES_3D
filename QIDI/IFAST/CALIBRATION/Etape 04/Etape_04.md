# Étape 04 : Calibration du pourcentage de débit d'écoulement de la buse Z1/Z2 en fonction du diamètre du filament

## Prérequis avant de continuer
Vous devez impérativement avoir effectué les étapes suivantes pour la QIDI IFAST : 
- [Etape 00 : Réglage de l'alignement des deux buses / calibrage XY](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2000/Etape_00.md)
- [Etape 01 : Calibration des deux moteurs d'extrusion de Z1 / Z2](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2001/Etape_01.md)
- [Etape 03 : Calibration du diamètre du filament](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2003/Etape_03.md)

### Présentation
Dans ce processus détaillé de caractérisation du débit de filament pour une imprimante 3D QIDI-IFAST je vais montrer pas à pas comment trouver / encadrer le % débit de filament pour obtenir des impressions de précision et de haute qualité. Le processus implique l'utilisation d'un fichier sources qui slice des cubes de test avec des débits variables, la mesure précise des parois des cubes, et l'analyse des données pour déterminer le débit optimal. Au moment ou j'écris ce tuto 05/10/2024 j'utilise une autre solution via un script python qui génère un gcode customisé pour caractériser les filaments sur Z2 qui est dérivé de celle-ci. Les deux methodes seront inclues dans ce tutoriel à terme.

#### Objectif
L'objectif principal est de caractériser le débit en % d'un filament PETG SUNLU sur la buse Z2 (gauche) de la QIDI-IFAST en utilisant une série de cubes de tests avec des débits variables décroisant. Le processus vise à trouver la valeur de débit en % optimale qui permet d'obtenir des parois de cube avec une épaisseur le pus proche de la valeur théorique de 1.6mm (0.4x4).

#### Méthode 01 Étapes du Processus avec les cubes de [100% .. 90%] par pas de 1%

e1. **Chargement de Fichiers**
   Il y a deux cas : 
   Cas 1 : Vous avez la même configuration que moi sur votre QIDI IFAST du PETG sur Z2 et du PLA sur Z1 -> vous pouvez directement imprimer la serie de 11 cubes depuis le fichier [17_10_2024_Calibration_[100%..90%]_V2.gcode](https://github.com/sudtek/IMPRIMANTES_3D/blob/7b1b4db4feb8aaa148066c3f2ab6458e4ebc0bf5/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c/17_10_2024_Calibration_%5B100%25..90%25%5D_V2.gcode) et passer à l'étape e5. **Mesure des Parois des Cubes**
   - Si vous désirez éditer et modififer le fichier sources 17_10_2024_Calibration_[100%..90%]_V2.idea Charger les fichiers contenant les profils de l'imprimante et les paramètres des cubes de test disponibles [Etape 04
/Z2_Calibration_PETG_235°c](https://github.com/sudtek/IMPRIMANTES_3D/tree/7b1b4db4feb8aaa148066c3f2ab6458e4ebc0bf5/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_PETG_235%C2%B0c)


   - Utilisation des profils d'Ida Maker pour l'imprimante.

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
   - Enregistrement des mesures dans un tableur.

6. **Analyse des Données**
   - Calcul des valeurs moyennes des épaisseurs des parois pour chaque cube.
   - Création d'un diagramme pour visualiser les données.
   - Analyse des clusters de points pour déterminer la meilleure valeur de débit.

7. **Détermination du Débit Optimal**
   - Utilisation d'une méthode de dichotomie pour converger vers la valeur de débit optimale.
   - Conclusion que la valeur de 92,3 est la plus appropriée pour le PETG.

#### Conclusion
Le processus de caractérisation du débit de filament est crucial pour obtenir des impressions 3D de haute qualité. Il nécessite une série de mesures précises et une analyse rigoureuse des données pour déterminer la valeur de débit optimale. En suivant ce processus, il est possible de trouver la valeur de débit qui permet d'obtenir des parois de cube avec une épaisseur proche de la valeur théorique, garantissant ainsi des impressions de qualité.

#### Remarques Finales
Importance de la précision et de l'analyse des données dans le processus de caractérisation du débit de filament.l'utilité des outils de mesure précis et des méthodes d'analyse rigoureuses pour obtenir des résultats fiables. 
La méthode de dichotomie est efficace pour converger rapidement vers la valeur de débit optimale mais elle implique l'impression succésive de serie de cubes visant à encadrer la solution et donc de devoir attendre que les cubes ce stabilisent à température anbiante -> c'est donc un processus plus long, plus fastideux.





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


## Détail, explications et méthode de calibration du % de débit avec une série de 11 cubes de calibration 100% à 90%


[![Détail, explications et méthode de calibration du % de débit avec une série de 11 cubes de calibration 100% à 90%](https://i9.ytimg.com/vi_webp/gn3A1lFX0vc/mq2.webp?sqp=COirprkG-oaymwEmCMACELQB8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGD0gVChlMA8=&rs=AOn4CLAkej0COVnXFqI_hiDXwUg99ymBUw)](https://www.youtube.com/watch?v=gn3A1lFX0vc?si=RjfHDFoegoFpW7tH)

[17_10_2024_Calibration_filament_Débit_Ecoulement.ods](https://github.com/sudtek/IMPRIMANTES_3D/blob/e164b41cd4a32ed06201bcb55994184bbe3e5474/QIDI/IFAST/CALIBRATION/Etape%2004/17_10_2024_Calibration_filament_D%C3%A9bit_Ecoulement.ods)
