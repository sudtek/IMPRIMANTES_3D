**05/11/2024**

**Génerateur de séries de cubes à débit variable par pas décroissants constants de 1% / 0.1% pour calibration et encadrement du débit de Z2 (buse de gauche) sur imprimante 3D QIDI-IFAST.**

Aprés avoir réalisé la vidéo [E01 de l'étape 04 du tutoriel de calibration pour trouver le débit % d'un filament sur Z2 QIDI-IFAST](https://youtu.be/gn3A1lFX0vc) explicative pour approfondir [Etape 04 caractériser le % débit d'un nouveau filament](https://github.com/sudtek/IMPRIMANTES_3D/tree/f0b85f540401e21b22918730633c640832fa8458/QIDI/IFAST/CALIBRATION/Etape%2004) j'ai pris conscience que devoir systématiquement modifier manuellemment dans IDEAMAKER les débits de 11 cubes c'est long, fastidieux, sujet à erreur ... deplus les étiquettes de débit des cubes ex : 100% ; 99% ... devaient être mofifiées pour chaque nouvelle série de débit de cubes / pas afin de garder un minimum de cohérence.  Devant ce constat je me suis lancé dans l'écriture d'un script python nommé **Z2_generate.py** qui génére automatiquement un gcode de calibration des cubes éprouvettes en posant 16 questions à l'utilisateur pour générer 11 cubes étiquettés de A (cube avec le débit maximum situé le plus à gauche) à K (cube avec le débit minimum situé le plus à droite). Plus besoins d'éditer le fichier source .IDEA via IDEAMAKER et modifier manuellemment les débits d'écoulements, etiquettes ... Attention à ce jour (05/11/2024) ce script fonctionne uniquement pour la buze de gauche Z2 une variante pour calibrer Z1 devrait être réalisé ...

[/.](https://github.com/sudtek/IMPRIMANTES_3D/tree/7fcbe4567642c7eb1b9e53f8b73f05a81d9aab80/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script) :

- [ReadMe.md](https://github.com/sudtek/IMPRIMANTES_3D/blob/7cafb12449ad44995997dd2e7e61ac8081cbc6da/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/ReadMe.md) : Ce fichier explicatif.
  
- [Z2_generate.py](https://github.com/sudtek/IMPRIMANTES_3D/blob/b0ba36f662e1e2850cdf81203b2ab84ad15976f0/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/Z2_generate.py) : Permet de générer un fichier gcode de sortie sous une forme explicite et compréhensible exemple : [01_11_2024_Z2_Calibration_[100.0%..90.0%]_Pas_-1.0%_PETG_Blanc_SUNLU_235°c_1.724mm.gcode](https://github.com/sudtek/IMPRIMANTES_3D/blob/7fcbe4567642c7eb1b9e53f8b73f05a81d9aab80/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/Exemples/01_11_2024_Z2_Calibration_%5B100.0%25..90.0%25%5D_Pas_-1.0%25_PETG_Blanc_SUNLU_235%C2%B0c_1.724mm.gcode). Ce script écrit en python V3.0 est simple et ne requier aucun argument. Il ne doit pas être édité hormis si vous désirez modifier des valeurs par defaut de certaines variables.
  
- [26_10_2024_Z2_Calibration_[X%..Y%]_Pas_N%_TEMPLATE_01.gcode](https://github.com/sudtek/IMPRIMANTES_3D/blob/b0ba36f662e1e2850cdf81203b2ab84ad15976f0/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/26_10_2024_Z2_Calibration_%5BX%25..Y%25%5D_Pas_N%25_TEMPLATE_01.gcode)  : est le fichier template qu'utilise "[Z2_generate.py](https://github.com/sudtek/IMPRIMANTES_3D/blob/b0ba36f662e1e2850cdf81203b2ab84ad15976f0/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/Z2_generate.py)" pour rechercher et insérer des blocs de gcodes suites aux interactions avec l'utilisateur. Il doit imperativement être en lecture seule au besoin modifier ses attributs car il et ne doit pas être edité. **Ce fichier doit impérativement être dans le même repertoire que Z2_generate.py**. Ce fichier ne doit pas être lu avec un slicer car il contient des blocs de textes; il peut être ouvert avec un simple éditeur de texte.

[/Source](https://github.com/sudtek/IMPRIMANTES_3D/tree/7fcbe4567642c7eb1b9e53f8b73f05a81d9aab80/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/SOURCE) :
- [ORI 25_10_2024_Calibration_[X%..Y%]_Pas_N%.gcode](https://github.com/sudtek/IMPRIMANTES_3D/blob/7fcbe4567642c7eb1b9e53f8b73f05a81d9aab80/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/SOURCE/ORI%2025_10_2024_Calibration_%5BX%25..Y%25%5D_Pas_N%25.gcode) : Le fichier gcode original sliccé généré par IDEAMAKER. Il est imprimable et fonctionel mais ce fichier est particulier; il est fourni pour mémoire car il m'a permis d'identifier et différentier les blocs de gcodes pour fabriquer le template. En effet ce gcode fait plus de 80OOO lignes j'ai donné des valeurs de débit volontairements particuliéres et uniques à chacun des élements afin de pouvoir les distinguer des les uns des autres. J'ai fait en sorte qu'aucun élements que j'ai créé n'est la valeur de débit = 100% ainsi j'ai pu identifier et trouver chacun des élements. Exemple :

Le cube A débit -> 101%, cube B débit -> 99 % ... decroisant de -1% ... cube K débit -> 90 %.

La tour de purge -> 105%.

La légende de A à K -> 103%.

- [Z2_recalibration.txt](https://github.com/sudtek/IMPRIMANTES_3D/blob/7fcbe4567642c7eb1b9e53f8b73f05a81d9aab80/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/SOURCE/Z2_recalibration.txt) : Fichier texte récapitulatif qui identifie tous les blocs BLOC_XXXXX_XXXXX , le nb d'occurences, le gcode à modifier  ... dans "ORI 25_10_2024_Calibration_[X%..Y%]_Pas_N%.gcode" pour en faire un template.

- [05_11_2024_IDEAMAKER_Calibration.zip](https://github.com/sudtek/IMPRIMANTES_3D/blob/25a1928895052bc615755bc975bd8cc815079d67/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/SOURCE/05_11_2024_IDEAMAKER_Calibration.zip) : Ce Zip contient tous les fichiers sources pour IDEAMAKER V5.0.6.8380 (ou supérieur) pour (ré)générer le gcode de départ cela inclus également tous mes profils (profil imprimante IFAST-QIDI, 2 profils filaments PETG & PLA, profils paramètres & groupes, profils.bin), les fichiers .STL pour la legende de A à K, le fichier code ci-dessus et le fichier 24_10_202_Calibration_[X%..Y%]_Pas_N%.idea qui au besoin vous permettront de générer n'importe quelle série manuellement via IDEAMAKER.

[/Exemples :
](https://github.com/sudtek/IMPRIMANTES_3D/tree/204e1972eb45fdd40d08dab5522a269e7cdda403/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/Exemples) :

[01_11_2024_Z2_Calibration_[100.0%..90.0%]_Pas_-1.0%_PETG_Blanc_SUNLU_235°c_1.724mm.gcode](https://github.com/sudtek/IMPRIMANTES_3D/blob/7fcbe4567642c7eb1b9e53f8b73f05a81d9aab80/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/Exemples/01_11_2024_Z2_Calibration_%5B100.0%25..90.0%25%5D_Pas_-1.0%25_PETG_Blanc_SUNLU_235%C2%B0c_1.724mm.gcode)

[01_11_2024_Z2_Calibration_[92.0%..91.0%]_Pas_-0.1%_PETG_Blanc_SUNLU_235°c_1.724mm](https://github.com/sudtek/IMPRIMANTES_3D/blob/7fcbe4567642c7eb1b9e53f8b73f05a81d9aab80/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/Exemples/01_11_2024_Z2_Calibration_%5B100.0%25..90.0%25%5D_Pas_-1.0%25_PETG_Blanc_SUNLU_235%C2%B0c_1.724mm.gcode).

Si vous desirez tester un gcode de calibration généré pour la IFAST-QIDI vous pouvez télécharger un des deux fichiers ci-dessus mais *Attention* ils ont été généré pour imprimer avec du PETG sur Z2 (et du PLA sur Z1) si vous êtes dans cette configuration vous pouvez les lancer direct sur votre IFAST mais si ce n'est pas le cas il vous faudra générer votre propre série en invoquant [Z2_generate.py](https://github.com/sudtek/IMPRIMANTES_3D/blob/b0ba36f662e1e2850cdf81203b2ab84ad15976f0/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/Z2_generate.py). Je placerai mes nouvelles séries (les plus courantes) au fur et à mesure dans ce répertoire ainsi vous pourrez en profiter mais il vous faudra toujours penser à remplacer la valeur **Filament Diameter #2** par celle de votre filament [Etape 03 : Calibration du diamètre du filament](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2003/Etape_03.md) :

```
;_DEBUT_[informations des filaments]
...
;Note : Modifier cette valeur avec le diamètre de VOTRE FILAMENT est impératif pour trouver votre débit ! 
;Filament Diameter #2: 1.724
...
;_FIN_[informations des filaments]
```
