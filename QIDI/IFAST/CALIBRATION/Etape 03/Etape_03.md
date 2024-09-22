# Étape 03 : Calibration du diamètre du filament

## Prérequis avant de continuer
Ce tutoriel doit être effectué avec des bobines qui sont parfaitements d'hésidratées. 

## Présentation
Le diamètre standard le plus répandu et commun pour les bobines de filaments de nos imprimates 3D fdm est de 1.75mm* néanmoins à matiére équivalente (PETG, PLA, ABS ...) par nature chaque bobine de filament est différente voir "unique" du fait même si vous achetez plusieurs lot de bobines chez un même fournisseur il y a fort à parier qu'il y aura des differences entre leurs diametres respectifs ... le pire cas est lorsque certain filament manque de constance au sein d'une même bobine et que le diametre varie énormenent du début à la fin de la bobine. Si vous imprimez des objets de décoration ce n'est généralement pas trés problématique mais si faites des objets mécaniques et avez besoin d'un minimum de precision dimensionnelle cela peut devenir un trés gros probléme ... Les variations de "diamètres moyens" de chaque filament impacte systématiquement le facteur d'écoulement / débit de la buse (exprimée en % dans les logiciels slicers ); donc si vous imprimez des objets de + de 1Kg qui nécèsittent forcément un changement de filament vous constaterez irrémédiablement :

- Une changement de densité qui va affecter les nouvelles couches, cela se traduit par des couches plus translucide / opaques que les couches precedentes avant la nouvelle bobine.
  
- Des variations dimensionnelles importantes dans la structure entrainant des risques de ruptures.

Ces changement dans les couches ne sont pas purements esthétiques il sont liées à une variation du diamètre du nouveau filament et donc d'un facteur d'écoulement / debit qui n'est plus adapté et en relation avec le nouveau diamétre du filament de la nouvelle bobine. Exemple : Si le diamétre du filament de la nouvelle bobine est superieur à l'ancien avec facteur découlement inchangé vous aurez forcément des parrois plus épaisses et donc l'objet aura des dimensions supèrieures ... inversement si le diamétre du filament de la nouvelle bobine est inférieur à celle que vous nenez de terminer les parrois seront plus fines et l'objet aura des dimensions inférieures ... 

_* Il existe aussi des bobines avec filament de 3mm de diamètre mais c'est moins répandu sur les imprimantes grand public._

En résumé, **toute nouvelle bobine déshydratée doit d'être caractérisée avant utilisation afin de définir au minimum deux facteurs propres à cette seule bobine** :
1) Le diamètre moyen du filament sur 1 metre de longueur -> ce sera le but de ce tutoriel !
2) Calculer le facteur d'écoulement / débit de la bobine en fonction du diamètre moyen, la méthode de calcul sera détailée dans un tutoriel dédié.

_Note : Je vous conseille de coller une étiquette indiquant ces deux facteurs sur le support bobine avant stockage._

  




