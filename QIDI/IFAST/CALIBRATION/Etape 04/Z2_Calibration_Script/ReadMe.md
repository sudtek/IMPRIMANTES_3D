**05/11/2024**

**Génerateur de séries de cubes à débit variable par pas décroissants constants de 1% / 0.1% pour calibration et encadrement du débit de Z2 (buse de gauche) sur imprimante 3D QIDI-IFAST.**

Aprés avoir réalisé la fastidieuse vidéo ??URL?? explicative pour approfondir (Etape 04 caractériser le % débit d'un nouveau filament)->[https://github.com/sudtek/IMPRIMANTES_3D/tree/f0b85f540401e21b22918730633c640832fa8458/QIDI/IFAST/CALIBRATION/Etape%2004] j'ai vite pris conscience que devoir systématiquement modifier manuellemment dans IDEAMAKER les débits de 11 cubes c'est long, fastidieux, sujet à erreur ... deplus les étiquettes de débit des cubes ex : 100% ; 99% ... devaient être sytématiquement mofifiées pour chaque nouvelle série de débit de cubes et pas afin de garder de la cohérence.  Devant ce constat je me suis lancé dans l'écriture d'un script python nommé **Z2_generate.py** qui génére automatiquement un gcode de calibration des cubes éprouvettes en posant 16 questions à l'utilisateur pour générer 11 cubes étiquettés de A (cube avec le débit maximum situé le plus à gauche) à K (cube avec le débit minimum situé le plus à droite). Plus besoins d'éditer le fichier sources .IDEA via IDEAMAKER et modifier manuellemment les débits d'écoulements et etiquettes. Attention au 05/11_2024ce script fonctionne uniquement pour la buze de gauche Z2 une variante pour calibrer Z1 devrait être réalisé ...

_Répertoire courant :_

- ReadMe.md : Ce fichier explicatif.
  
- (Z2_generate.py)->[https://github.com/sudtek/IMPRIMANTES_3D/blob/b0ba36f662e1e2850cdf81203b2ab84ad15976f0/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/Z2_generate.py] : Permet de générer un fichier gcode de sortie sous une forme explicite "**01_11_2024_Z2_Calibration_[92.0%..91.0%]_Pas_-0.1%_PETG_Blanc_SUNLU_235°c_1.724mm**". Il ne doit pas être édité hormis si vous désirerz modifer des valeurs par defaut des variables. Il ne requier aucun argument.
  
- (26_10_2024_Z2_Calibration_[X%..Y%]_Pas_N%_TEMPLATE_01.gcode)->[https://github.com/sudtek/IMPRIMANTES_3D/blob/b0ba36f662e1e2850cdf81203b2ab84ad15976f0/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/26_10_2024_Z2_Calibration_%5BX%25..Y%25%5D_Pas_N%25_TEMPLATE_01.gcode] -> C'est le fichier template qu'utilise "(Z2_generate.py)->[https://github.com/sudtek/IMPRIMANTES_3D/blob/b0ba36f662e1e2850cdf81203b2ab84ad15976f0/QIDI/IFAST/CALIBRATION/Etape%2004/Z2_Calibration_Script/Z2_generate.py]" pour rechercher et insérer des blocs de gcodes suites aux interactions avec l'utilisateur. Il doit être en lecture seule et ne doit pas être edité. Ce fichier doit impérativement être dans le même repertoire que Z2_generate.py. Ce fichier ne doit pas être lu avec un slicer car il contient des blocs de textes; il peut être ouvert avec un simple éditeur de texte.

_Répertoire Source :_
