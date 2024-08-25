**Etape 01 Calibration des deux moteurs d'extrusions de Z1 et Z2**

### Présentation

Cette étape consiste à vérifier si les extrudeurs de la QIDI I-Fast consomment une longueur précise de filament conforme à la consigne du G-code, généralement 100 mm. Cette vérification nécessite au minimum un pied à coulisse ou une règle métallique de précision.

Si, en exécutant le G-code, chacun de vos extrudeurs consomme exactement 100 mm de filament, vous avez de la chance et n'avez rien à calibrer. Vous pouvez passer à l'étape suivante (LIEN?).

Dans le cas contraire, si un ou les deux extrudeurs présentent une sur-extrusion ou une sous-extrusion, vous devrez calculer et définir les pas/mm pour chacun des moteurs extrudeurs E. Les cas de sur-extrusion et de sous-extrusion sont définis comme suit :
- **Sur-extrusion** : Extrusion de 111 mm de filament pour une consigne initiale de 100 mm.
- **Sous-extrusion** : Extrusion de 97 mm de filament pour une consigne initiale de 100 mm.

Cette procédure doit impérativement être effectuée chaque fois que vous remplacez ou changez la tête de votre QIDI I-Fast. Si vous conservez toujours la même tête, sauf en cas d'usure excessive ou d'autres problèmes, ces réglages ne devraient pas changer dans le temps. En cas de doute, vous pouvez à tout moment revérifier en chargeant le G-code de calibration disponible [ici](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2001/23_08_2024%20Calibrage%202%20extruders%20100mm%20T1_G_Z2_PETG_235%20%26%20T0_D_Z1_PLA_205%20OK.gcode). Ce G-code se chargera d'extruder les deux têtes de 100 mm l'une après l'autre.



