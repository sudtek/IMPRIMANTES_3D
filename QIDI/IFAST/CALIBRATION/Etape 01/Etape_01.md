**Etape 01 Calibration des deux moteurs d'extrusions Z1 et Z2

Présentation :
Cette etape consiste à verifier si les extruders de la QIDI IFAST vont consommer une longueur precise de filament conforme à la consigne du gcode en general 100mm. Dans le cas contraire il y a deux cas soit l'imprimante fait de la :
Sur-extrusion : Exemple elle consome 111mm de filament pour une consigne initiale de 100mm 
Sous extrusion : Exemple elle consome 97mm de filament pour uen consigne initiale de 100mm

Ainsi on pourra calculer et definir les pas/mm pour chacun desmoteurs extrudeurs. Cette procédure doit imperativement être effectuée à chaque fois que vous remplacez / changez la tête de votre QIDI IFAST, donc si vous conservez toujours la même tête hormis usure execive ou autre probléme ces réglages ne devrait pas changées dans le temps. En cas de doute vous pourez toujours revérifier en chargeant le gcode de calibration [23_08_2024 Calibrage 2 extruders 100mm T1_G_Z2_PETG_235 & T0_D_Z1_PLA_205 OK.gcode](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2001/23_08_2024%20Calibrage%202%20extruders%20100mm%20T1_G_Z2_PETG_235%20%26%20T0_D_Z1_PLA_205%20OK.gcode)


