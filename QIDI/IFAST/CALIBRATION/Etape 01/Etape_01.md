**Etape 01 Calibration des deux moteurs d'extrusions de Z1 et Z2**

### Présentation

Cette étape consiste à vérifier si les extrudeurs de la QIDI I-Fast consomment une longueur précise de filament conforme à la consigne du G-code, généralement 100 mm. Cette vérification nécessite au minimum un pied à coulisse ou une règle métallique de précision.

Si, en exécutant le G-code, chacun de vos extrudeurs consomme exactement 100 mm de filament, vous avez de la chance et n'avez rien à calibrer. Vous pouvez passer à l'étape suivante (LIEN?).

Dans le cas contraire, si un ou les deux extrudeurs présentent une sur-extrusion ou une sous-extrusion, vous devrez calculer et définir les pas/mm pour chacun des moteurs extrudeurs E. Les cas de sur-extrusion et de sous-extrusion sont définis comme suit :
- **Sur-extrusion** : Extrusion de 111 mm de filament pour une consigne initiale de 100 mm.
- **Sous-extrusion** : Extrusion de 97 mm de filament pour une consigne initiale de 100 mm.

Cette procédure doit impérativement être effectuée chaque fois que vous remplacez ou changez la tête de votre QIDI I-Fast. Si vous conservez toujours la même tête, sauf en cas d'usure excessive ou d'autres problèmes, ces réglages ne devraient normalement pas changer dans le temps. En cas de doute, vous pouvez à tout moment revérifier en chargeant le G-code de calibration adapté à vos besoins ou en modifiant les valeurs de température en fonction de la matiere de vos fialements. (voir explication ci-dessous)

Par principe on peut calibrer le pas de des moteurs d'extrudeurs avec n'importe quel type de filament basique peut importe la matiere PLA,PETG ... 
Dans mon cas j'utilise du PETG sur la tete de gauche nommée Z2 et du PLA sur la tête Z1. Le PETG me sert pour imprimmer les corps de pieces, le PLA lui est utilisé pour les supports. 

**IMPORTANT : Mon choix d'avoir affecté le PETG à Z2 et le PLA à Z1 n'est absoluement pas arbitraire mais est imposé par mon sliccer IDEAMAKER qui a une convention de referencement  des têtes / buses de gauche à droite (T0,T1, ...); du fait le profil de filament dominant pour le imprimmer un corps de piece est la tête la plus situé à main gauche dans ideamaker ce qui correspond à Z2. Si vous n'utilisez pas Ideamaker et que vous utilisez le logiciels sliccer de QIDI (ou un autre) vous n'êtes peut être pas concerné par ce cas mais je n'en suis pas certain puisque je ne l'utilise pas ... il vous incombe donc de verifier voir adapter le gcode en fonction de votre Slicer!** 

Récapitulatif pour la procedure de calibration des moteur pas à pas des extrudeurs de ma QIDI IFAST :

```markdown
| Extrudeur situé à main | Gauche | Droite |
|------------------------|--------|--------|
| Référence QIDI I-Fast  | Z2     | Z1     |
| Matière                | PETG   | PLA    |
| Température buse       | 235°C  | 205°C  |
| Couleur filament       | Blanc  | Mauve  |
| Débit d'écoulement     | 100%   | 100%   |
| Longueur de calibrage  | 100 mm | 100 mm |
```

Vous pouvez copier et coller ce tableau directement dans votre fichier README.md sur GitHub.



[ici](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2001/23_08_2024%20Calibrage%202%20extruders%20100mm%20T1_G_Z2_PETG_235%20%26%20T0_D_Z1_PLA_205%20OK.gcode). Ce G-code se chargera d'extruder les deux têtes de 100 mm l'une après l'autre.
