05_11_2024

Generateur de serie de Cubes à pas decroissants pour calibration et encadrement du débit de Z2 (buse de gauche) sur QIDI-IFAST 

Aprés avoir réalisé la vidéo ??URL?? explicative pour clarifier tuto [Etape 04 caractériser le % débit d'un nouveau filament]->(https://github.com/sudtek/IMPRIMANTES_3D/tree/f0b85f540401e21b22918730633c640832fa8458/QIDI/IFAST/CALIBRATION/Etape%2004) j'ai pris conscience devoir systématiquement modifier manuellemment dans IDEAMAKER des débits de cubes c'est long, fastidieux, sujet à erreur ... du coup je me suis lancé dans l'ecriture d'un script python nommé **Z2_generate.py** qui va automatiquement générer un gcodes de calibration de cubes eprouvettes de débit en posant 16 questions ! Plus besoins d'éditer le fichier sources .IDEA via IDEAMAKER et modifier manuellemment les débits d'écoulements. A ce jour ce script fonctionne uniquement pour la buze de gauche Z2 une varainte pour calibrer Z1 devrait être réalisé en fonction de mes besoins et de mon temps libre ...

Ce que contient le répertoire courant :
- ReadMe.md - > Ce fchier explicatif.
- Z2_generate.py -> Permet de générer un fichier gcode de sortie sous la forme [ 
