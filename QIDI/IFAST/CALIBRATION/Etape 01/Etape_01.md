**Etape 01 Calibration des deux moteurs d'extrusions de Z1 et Z2**

Prérequis : Vous devez avoir validé [l'étape 00](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2000/Etape_00.md) avant de continuer !

### Présentation

Cette étape consiste à vérifier si les extrudeurs de la QIDI I-Fast consomment une longueur précise de filament conforme à la consigne du G-code, généralement 100 mm. Cette vérification nécessite au minimum un pied à coulisse ou une règle métallique de précision.

Si, en exécutant le G-code, chacun de vos extrudeurs consomme exactement 100 mm de filament, vous avez de la chance et n'avez rien à calibrer. Vous pouvez passer à l'étape suivante (LIEN?).

Dans le cas contraire, si un ou les deux extrudeurs présentent une sur-extrusion ou une sous-extrusion, vous devrez calculer et définir les pas/mm pour chacun des moteurs extrudeurs E. Les cas de sur-extrusion et de sous-extrusion sont définis comme suit :
- **Sur-extrusion** : Extrusion de 111 mm de filament pour une consigne initiale de 100 mm -> vous avez consommé plus de filament que prévu.
- **Sous-extrusion** : Extrusion de 97 mm de filament pour une consigne initiale de 100 mm -> vous avez consommé moins de filament que prévu.

Cette procédure doit impérativement être effectuée chaque fois que vous remplacez ou changez la tête de votre QIDI I-Fast. Si vous conservez toujours la même tête, sauf en cas d'usure excessive ou d'autres problèmes, ces réglages ne devraient normalement pas changer dans le temps. En cas de doute, vous pouvez à tout moment revérifier en chargeant le G-code de calibration adapté avec des valeurs de températures adaptés en fonction de la matiere de vos fialements.

Par principe on peut calibrer les pas des moteurs d'extrudeurs avec n'importe quel type de filament basique peut importe la matiere PLA,PETG ...

Dans mon cas j'utilise du PETG sur la tete de gauche nommée Z2 et du PLA sur la tête Z1. car le PETG me sert pour imprimmer les corps de pieces, le PLA lui est utilisé pour les supports cela facile le retrait des supports aprés impression.

### Important
Mon choix d'affecter le PETG à Z2 et le PLA à Z1 n'est pas toalement arbitraire : Cette décision est "imposée" par mon slicer IdeaMaker, qui utilise une convention de référencement des têtes/buses particuliere. Par conséquent, le profil de filament dominant pour imprimer un corps de pièce est la tête la plus à gauche dans IdeaMaker, ce qui correspond à Z2. Si vous n'utilisez pas IdeaMaker et que vous utilisez le logiciel slicer de QIDI (ou un autre), il se peut que vous ne soyez pas concerné par ce cas. Cependant, je ne peux pas en être certain puisque je n'utilise pas d'autres logiciels de sliccing. Il vous incombe donc de vérifier et d'adapter le G-code en fonction de vos besoins. 
note : Si plus tard vous envisagez d'utiliser Ideamaker je vous recommande d'adopter les mêmes choix que moi ainsi vous pourrez directement utiliser mes profils Ideamakers.

Récapitulatif des paramètres pour la procedure de calibration des moteur pas à pas des extrudeurs de ma QIDI IFAST :

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
Mon fichier gcode de calibrage disponible [23_08_2024 Calibrage 2 extruders 100mm T1_G_Z2_PETG_235 & T0_D_Z1_PLA_205 OK.gcode](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2001/23_08_2024%20Calibrage%202%20extruders%20100mm%20T1_G_Z2_PETG_235%20%26%20T0_D_Z1_PLA_205%20OK.gcode) se chargera d'extruder les deux têtes de 100 mm l'une après l'autre à la bonne température.

Si vous voulez calibrer votre imprimente avec deux filaments identiques type PLA / PETG il faudra télécharger le fichier gcode adapté à votre situation sont/seront disponibles [ICI](QIDI/IFAST/CALIBRATION/Etape%2001) ou a defaut l'éditer et adapter les valeurs de temperature attendu par la matiere que vous avez choisi d'extruder. Exemple de modification du gcode code de mon programme pour avoir du PLA sur Z1 et Z2 à 205°c : 

```gcode
; ----------------------------------------------------
; Fixer la temperature des deux buses

; Buse de gauche Z2 alias T1 pour du PLA à 205°c 
M109 T1 S205

; Buse de droite Z1 alias T0 pour du PLA à 205°c
M109 T0 S205

; Note : M109 attend que la temperature de consigne soit atteinte avant de continuer -> ne pas remplacer par M104
; ----------------------------------------------------
```
note : Pour cette opération le plateau peut rester en bas il donc est inutile de le faire chauffer, idem pour l'enceinte !

P1) Charger deux bobines bien séches et désydratés prévoir 24 heures de désydration.

P2) Ne pas installer les tubes de guidage PTFE bleu, au besoin les retirer car ils vous empecheront de marquer et mesurer les longeurs de filaments.

P3) Via le menu déplacer la tête au centre du plateau XY , (ATTTENTION ne jamais déplacer la tête à la main) 

P4) A l'aide d'un réglé ou d'un pied à coulisse mesurer precisement 100mm sur chacun des filaments et faite une trace precises avec un feutre soyez le plus précis possibles cela aura de l'influence.Faites une seconde trace à 150mm de la tête ( en cas de sur extrusion). Je vous mets en garde sur un point important lorsque vous prendrez appui sur la tête vous serez appuyé sur un bloque guide tube ptfe qui à tendance à s'enfoncer lorsque vous prendrez appui avec le reglet / pied à coulisse et qui risque de faire varier la mesure de quelques milimetres ... Ces milimetres sont cruciaux donc faites attention et soyez précis ...

P5) Fixer manuellement la temperature de prechaufage des filaments dans mon cas Z2 à 235°c et Z1 à 205°c. Bien que mon programme se charge de fixer ces valeurs et d'attendre quelle soient atteintes avant d'enchainer cette habitude vous evitera un jour d'extruder par erreur à trop basse temperature et casser une tête ...

P6) Executer le gcode [23_08_2024 Calibrage 2 extruders 100mm T1_G_Z2_PETG_235 & T0_D_Z1_PLA_205 OK.gcode](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2001/23_08_2024%20Calibrage%202%20extruders%20100mm%20T1_G_Z2_PETG_235%20%26%20T0_D_Z1_PLA_205%20OK.gcode) 

La buse Z2 va extruder une longeur proche de 100mm puis ce serra le tour de la buse Z1.

P7) Mesurer la distance entre le 0 de reference (le colier non enfoncé) de la tête et le trait pour Z2 et pour Z1.
    Exemple de tests realisés sur ma IFAST avec debit 100% pour 100mm
    Dans mon cas l'extruder :
    Gauche Z2 PETG 235°c et en sous extrusion il reste +4 mm de filament 
    Droite Z1 PLA 205°c et en sous extrusion il reste +6.2 mm de filament 

    Note : Attention si vous avez un cas de sur-extrusions vous ne pourrez pas mesurer la distance puisque votre trait de reference serra passé sous le colier ... (on traitera ce cas plus tard !) 

P8) Appliquer la formule suivant pour calculer les nouveau E de Z2 et Z1 :
    Extruder de gauche Z2 PETG 235°c sous extrusion reste de +4 mm -> (100-4)*0.0073/100 = 0.007008
    Extruder de droite Z1 PLA 205°c sous extrusion reste de +6.2 mm -> (100-6.2)*0.0073/100 = 0.0068474
    
PX) Remplacer ces valeurs dans le Gcode suivant pour définir le pas/mm pour E correspondant à Z1 et Z2 etlancer une impression :
;
; Définir le pas/mm pour E de Z1 = S ? et Z2 = P ? // A verifier !!
M8011 S0.0068474 P0.007008

P) Lorsque l'extrusion des deux buses sont terminées dans l'ideal le deux traits devraient être au niveau du colier le 0 ce qui voudrait dire que votre machine est parfaitement calibrée pour les deux buses et qu'il ny aurait plus rien à faire ... mais en pratique   
    sil est encore visible 




