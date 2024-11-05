05_11_2024
Pour QIDI-IFAST

Generateur de serie d'une série de 11 Cubes à pas décroissants constants de 1% / 0.1% pour calibration et encadrement du débit de Z2 (buse de gauche) sur QIDI-IFAST 

Aprés avoir réalisé la fastidieuse vidéo ??URL?? explicative pour approfondir [Etape 04 caractériser le % débit d'un nouveau filament]->(https://github.com/sudtek/IMPRIMANTES_3D/tree/f0b85f540401e21b22918730633c640832fa8458/QIDI/IFAST/CALIBRATION/Etape%2004) j'ai vite pris conscience que devoir systématiquement modifier manuellemment dans IDEAMAKER les débits de 11 cubes c'est long, fastidieux, sujet à erreur ... deplus les étiquettes des cubes ex : 100%;99% ... devaient être sytématiquement mofifié pour chaque nouvelle serie de cubes afin de garder un minimum de cohérence.  Devant ce constat je me suis lancé dans l'écriture d'un script python nommé **Z2_generate.py** qui va automatiquement générer un gcodes de calibration des cubes eprouvettes en posant 16 questions et générer 11 cubes étiquettés de A (cube avec le débit maximum situé le plus à gauche ) à K (cube avec le débit minimum situé le plus à droite), plus besoins d'éditer le fichier sources .IDEA via IDEAMAKER et modifier manuellemment les débits d'écoulements et etiquettes. Attention ce script fonctionne uniquement pour la buze de gauche Z2 une variante pour calibrer Z1 devrait être réalisé ...

Répertoire courant :

- ReadMe.md : Ce fchier explicatif.
  
- Z2_generate.py : Permet de générer un fichier gcode de sortie sous une forme explicite "01_11_2024_Z2_Calibration_[92.0%..91.0%]_Pas_-0.1%_PETG_Blanc_SUNLU_235°c_1.724mm". Il ne doit pas être édité hormis si vous désirerz modifer des valeurs par defaut des variables.
  
- 26_10_2024_Z2_Calibration_[X%..Y%]_Pas_N%_TEMPLATE_01.gcode -> C'est le fichier template qu'utilise "Z2_generate.py" pour rechercher et insérer des blocs de gcodes. Il doit être en lecture seule et ne doit pas être edité. Ce fichier doit impérativement être dans le même repertoire que Z2_generate.py. Ce fichier ne doit pas être lu avec un slicer il contient des blocs de textes; il peut être ouvert avec un editeur de texte.

Répertoire Source :
