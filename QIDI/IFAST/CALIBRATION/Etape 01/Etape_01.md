**Étape 01 : Calibration des deux moteurs d'extrusion de Z1 et Z2**

Prérequis : Vous devez avoir validé [l'étape 00](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2000/Etape_00.md) avant de continuer !

### Présentation

Cette étape consiste à vérifier si les extrudeurs de la QIDI I-Fast consomment une longueur précise de filament conforme à la consigne du G-code, généralement 100 mm. Cette vérification nécessite au minimum un pied à coulisse ou une règle métallique de précision.

Si, en exécutant le G-code, chacun de vos extrudeurs consomme exactement 100 mm de filament, vous avez de la chance et n'avez rien à calibrer. Vous pouvez passer à l'étape suivante (LIEN?).

Dans le cas contraire, si un ou les deux extrudeurs présentent une sur-extrusion ou une sous-extrusion, vous devrez calculer et définir les pas/mm pour chacun des moteurs extrudeurs E. Les cas de sur-extrusion et de sous-extrusion sont définis comme suit :
- **Sur-extrusion** : Extrusion de 111 mm de filament pour une consigne initiale de 100 mm -> vous avez consommé plus de filament que prévu.
- **Sous-extrusion** : Extrusion de 97 mm de filament pour une consigne initiale de 100 mm -> vous avez consommé moins de filament que prévu.

Cette procédure doit impérativement être effectuée chaque fois que vous remplacez ou changez la tête de votre QIDI I-Fast. Si vous conservez toujours la même tête, sauf en cas d'usure excessive ou d'autres problèmes, ces réglages ne devraient normalement pas changer dans le temps. En cas de doute, vous pouvez à tout moment revérifier en chargeant le G-code de calibration adapté avec des valeurs de températures adaptées en fonction de la matière de vos filaments.

Par principe, on peut calibrer les pas des moteurs d'extrudeurs avec n'importe quel type de filament, peu importe la matière PLA, PETG...

Dans mon cas, j'utilise du PETG sur la tête de gauche nommée Z2 et du PLA sur la tête Z1. Le PETG me sert pour imprimer les corps de pièces, le PLA lui est utilisé pour les supports, ce qui facilite le retrait des supports après impression.

### Important

Mon choix d'affecter le PETG à Z2 et le PLA à Z1 n'est pas totalement arbitraire : Cette décision est "imposée" par mon slicer IdeaMaker, qui utilise une convention de référencement des têtes/buses particulière. Par conséquent, le profil de filament dominant pour imprimer un corps de pièce est la tête la plus à gauche dans IdeaMaker, ce qui correspond à Z2. Si vous n'utilisez pas IdeaMaker et que vous utilisez le logiciel slicer de QIDI (ou un autre), il se peut que vous ne soyez pas concerné par ce cas. Cependant, je ne peux pas en être certain puisque je n'utilise pas d'autres logiciels de slicing. Il vous incombe donc de vérifier et d'adapter le G-code en fonction de vos besoins.

Note : Si plus tard vous envisagez d'utiliser IdeaMaker, je vous recommande d'adopter les mêmes choix que moi ainsi vous pourrez directement utiliser mes profils IdeaMakers.

Récapitulatif des paramètres pour la procédure de calibration des moteurs pas à pas des extrudeurs de ma QIDI IFAST :

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

Si vous voulez calibrer votre imprimante avec deux filaments identiques type PLA / PETG, il faudra télécharger le fichier gcode adapté à votre situation sont/seront disponibles [ICI](QIDI/IFAST/CALIBRATION/Etape%2001) ou à défaut l'éditer et adapter les valeurs de température attendues par la matière que vous avez choisi d'extruder. Exemple de modification du gcode de mon programme pour avoir du PLA sur Z1 et Z2 à 205°C :

```gcode
; ----------------------------------------------------
; Fixer la température des deux buses

; Buse de gauche Z2 alias T1 pour du PLA à 205°C
M109 T1 S205

; Buse de droite Z1 alias T0 pour du PLA à 205°C
M109 T0 S205

; Note : M109 attend que la température de consigne soit atteinte avant de continuer -> ne pas remplacer par M104
; ----------------------------------------------------
```

Note : Pour cette opération, le plateau peut rester en bas, il est donc inutile de le faire chauffer, idem pour l'enceinte !

P1) Charger deux bobines bien sèches et désydratées, prévoir 24 heures de désydratation, dans mon cas : bobine de gauche PETG blanc bobine de droite PLA mauve.

P2) Ne pas installer les tubes de guidage PTFE bleu, au besoin les retirer car ils vous empêcheront de marquer et mesurer les longueurs de filaments.

P3) Via le menu de la QIDI IFAST, déplacer la tête au centre du plateau XY, (ATTENTION ne jamais déplacer la tête à la main).

P4) À l'aide d'un réglé ou d'un pied à coulisse, mesurer précisément 100 mm sur chacun des filaments et dessiner une trace précise avec un feutre, soyez le plus précis possible, cela aura de l'influence. Réaliser une seconde trace à 150 mm de la tête (en cas de sur-extrusion). Je vous mets en garde sur un point important : lorsque vous prendrez appui sur la tête, vous serez appuyé sur un bloc guide tube PTFE qui a tendance à s'enfoncer lorsque vous prendrez appui avec le réglé / pied à coulisse et qui risque de faire varier la mesure de quelques millimètres... Ces millimètres sont cruciaux donc faites attention et soyez le plus précis possible !

P5) Fixer manuellement la température de préchauffage des filaments, dans mon cas Z2 à 235°C et Z1 à 205°C. Bien que mon programme se charge de fixer ces valeurs et d'attendre qu'elles soient atteintes avant d'enchaîner, cette habitude vous évitera un jour d'extruder par erreur à trop basse température et détériorer une tête...

P6) Exécuter le gcode [23_08_2024 Calibrage 2 extruders 100mm T1_G_Z2_PETG_235 & T0_D_Z1_PLA_205 OK.gcode](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2001/23_08_2024%20Calibrage%202%20extruders%20100mm%20T1_G_Z2_PETG_235%20%26%20T0_D_Z1_PLA_205%20OK.gcode). Z2 et Z1 vont monter en température et extruder tour à tour une longueur proche de 100 mm.

P7) Mesurer la distance entre le 0 de référence (le collier non enfoncé) de la tête et le 1er trait pour Z2, idem pour Z1.

Exemple de tests réalisés sur ma IFAST avec débit 100% pour 100 mm :

- Gauche Z2 PETG 235°C et en sous-extrusion il reste +4 mm de filament.
- Droite Z1 PLA 205°C et en sous-extrusion il reste +6.2 mm de filament.

S'il reste quelques mm entre le colier et le trait mais que vous n'arrivez pas à mesurer voici l'astuce : Mesurer la distance entre le 0 de référence (le collier non enfoncé) de la tête et le second trait pour par exemple Z2 (idem pour Z1).
Exemple :

- Extrudeur de gauche Z2 PETG 235°C sous-extrusion la longueur de filament restante jusqu'au second trait est de +51.5 mm soit (51.5-50) = +1.5 mm  ... cela vous evitera de galérer et vous contortionner ;)  
  
_Attention si vous avez un cas de sur-extrusions, vous ne pourrez pas mesurer la distance puisque votre trait de référence sera passé sous le collier... on discutera ce cas dans la prochaine section _

P8) Appliquer la formule suivante pour calculer les nouveaux E de Z2 et Z1 :
- Extrudeur de gauche Z2 PETG 235°C sous-extrusion reste de +4 mm -> (100-4)*0.0073/100 = 0.0070
- Extrudeur de droite Z1 PLA 205°C sous-extrusion reste de +6.2 mm -> (100-6.2)*0.0073/100 = 0.0068

### Le cas particulier de la sur-extrusion :

A ma connaisance ce cas ne devrait normalement jamais survenir car dans le gcode "23_08_2024 Calibrage 2 extruders 100mm T1_G_Z2_PETG_235 & T0_D_Z1_PLA_205 OK.gcode" on réinitialise  les deux moteurs en position 0 via "G92 E0" afin que vous soyez toujours dans un cas de sous-extrusion. 

```gcode
;...
; Fixe la nouvelle position de l'extruder E <pos> E0 = initialisation
G92 E0
;...
```
Si la remise à 0 de l'extrudeur échoue je vous conseille de contacter le suport QIDI avant d'updater votre firmware avec une valeur d'extrusion négative !

<s>
Etant donné que vous ne pourrez pas mesurer la distance puisque votre trait de référence sera passé sous le collier. C'est la que le second trait trouve toute son utilité, Mesurer la distance entre le 0 de référence (le collier non enfoncé) de la tête et le second trait pour Z2 (idem pour Z1).
Exemple :
- Extrudeur de gauche Z2 PETG 235°C sur-extrusion la longueur de filament restante jusqu'au second trait est de +45 mm soit (45-50) = 5 mm manquant -> (45-50)*0.0073/100 = -0.0036
- Extrudeur de droite Z1 PLA 205°C sur-extrusion la longueur de filament restante jusqu'au second trait est de +38.2 mm soit (38.2-50) 11.8 mm manquant -> (38.2-50)*0.0073/100 = -0.0008
</s>

J'insiste ce cas ne devrait jamais subvenir si c'est le cas alors prendre contact avec le support QIDI et me tenir informer que j'update cette note que tout le monde en profite !

### Sauvegarder la nouvelle valeur dans le firmware de la QUIDI IFAST :

Pour remplacer et sauvegarder les nouvelles valeurs afin de définir les nouveaux pas/mm pour E correspondant à votre Z1 et Z2 il sufit de copier le bout de code suivant,  remplacer par vos valeurs, le sauvegarder sous "JJ_MM_AAAA_QIDI_IFAST_calibration_01_EstepZ1Z2.gcode" et l'executer en l'imprimant sur la QIDI IFAST, cela prendra 1 seconde. 

```gcode
; // À vérifier avec QIDI !!
; Définir le pas/mm pour E de Z1 = S ? et Z2 = P ? 
; S -> Secondary Z2 ?
; P -> Primary Z1 ?
; Quelle précision après la virgule acceptée ?

M8011 S0.0068 P0.0070
```
### Vérification de l abonne prise en compte des nouvelle valeur du firmware de la QUIDI IFAST :

Aprés mise à jour faites : 

- Redémarer / rebooter votre IFAST.

- Faites un fast Leveling.

Relancer une nouvelle procédure depuis l'étape P4 pour vérifier que l'extrusion de 100mm sur les des deux buses soit bien au niveau du collier !  Si c'est bien le cas alors l'extrusion de votre machine est parfaitement calibrée pour les deux buses et avez totalement validé cette étape.


_Note importante pour les utilisateurs Ideamaker : Dans le profil de l'imprimante Ideamaker intégre une variable nommée: **step E / mm = 0.00** ; par defaut elle vaut 0.00 si vous changez cette valeur alors Ideamaker ne tiendra pas compte de notre calibrage et appliquera la valeur au deux moteurs d'extrusion ... donc assurez-vous que dans le profil imprimante Ideamaker votre variable nommée vaut 0.00 ! **step E / mm = 0.00**_. Cette variable est un option acceptable si et seulement si vous avez un seul moteur d'extrusion E !
