# Étape 03 : Calibration du diamètre du filament

## Prérequis avant de continuer
- Ce tutoriel doit être effectué avec des bobines qui sont parfaitements désidratées.
- Un appareil de mesure de précision type pied à coulisse ou un palper et nécessaire pour correctement mesurer le diamétre, vous reporter à la section [A propos des instruments de mesures](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2003/Etape_03.md#a-propos-des-instruments-de-mesures) pour plus de détails.
- Une régle de minimum 20cm ou un métre ruban de 2m maximum pour positioner 10 points de mesures.
- Un marqueur indélébile dont la couleur contraste avec le filament. 

## Présentation
Le diamètre standard le plus répandu et commun pour les bobines de filaments de nos imprimates 3D FDM est de 1.75mm* néanmoins à matiére équivalente (PETG, PLA, ABS ...) chaque bobine de filament est différente voir "unique". Si vous achetez plusieurs lot de bobines chez un même fournisseur il y a fort à parier qu'il y aura des differences entre leurs diametres de filament respectifs ... le pire cas est lorsque au sein d'une même bobine le diametre varie énormenent du début à la fin de la bobine. Si vous imprimez des objets de décoration ce n'est généralement pas critique / problématique mais si faites des objets mécaniques et avez besoin d'un minimum de precision dimensionnelle à respecter cela peut devenir un trés gros probléme ... Les variations de "diamètres moyens" de chaque filament impacte systématiquement le facteur d'écoulement / débit de la buse (exprimée en % dans les logiciels slicers ); donc si vous imprimez des objets de + de 1Kg qui nécèsittent forcément un changement de filament, oubien imprimez avec des bobines non caractérisées vous constaterez irrémédiablement :

- Une changement de densité qui va affecter les couches, cela se traduit par des couches d'aprence plus translucide / opaques que les couches précédentes avant changement de bobine.
  
- Des variations dimensionnelles importantes dans la structure entrainant des risques de ruptures.

Ces changement dans les couches ne sont pas purements esthétiques et sont liées à une variation du diamètre du nouveau filament et donc d'un facteur d'écoulement / debit qui n'est plus adapté et en relation avec le nouveau diamétre du filament de la nouvelle bobine. Exemple : Si le diamètre du filament de la nouvelle bobine est supèrieur à l'ancien avec facteur découlement inchangé vous aurez forcément des parrois plus épaisses et donc l'objet aura des dimensions hors tout supèrieures ... inversement si le diamétre du filament de la nouvelle bobine est inférieur à celle que vous venez de terminer / remplacer alors les parrois seront plus fines et l'objet aura des dimensions inférieures ... 

_* Il existe aussi des bobines avec filament de 3mm de diamètre mais c'est moins répandu sur les imprimantes grand public._

Attention dans le cas de la QIDI IFAST ou bien de toute autre imprimante qui posséde plusieurs moteurs extruders si vous caracatérisez et calibrez un filament pour l'utiliser pour Z2 vous ne pouvez pas espérer l'utiliser directement sur Z1 et avoir les dimensions attendus ... Certe le diamètre moyen du filament est le même mais le facteur d'écoulement / débit de la bobine est propre à chaque tête d'extrusion ... c'est comme si vous le mètiez sur une autre impimante non calibrée et espèriez avoir les bonnes dimensions ...

En résumé, **toute nouvelle bobine déshydratée doit d'être caractérisée pour un extruder avant utilisation afin de définir au minimum trois facteurs propres et unique à cette seule bobine** :
1) L'identifcateur d'extrudeur Z1 ou Z2 sur le quelle elle va être utilisée. 
2) Le diamètre moyen du filament sur 1 metre de longueur -> ce sera le but de ce tutoriel !
3) Calculer le facteur d'écoulement / débit de la bobine en fonction du diamètre moyen de l'extrudeur Z1 et / ou Z2 , la méthode de calcul sera détailée dans un tutoriel dédié.

Je vous conseille de coller une étiquette indiquant ces 3 paramètres bien visibles sur le support bobine avant stockage sous vide de la bobine pour pouvoir mofifier les parametres de votre slicer au chargement de la bobine.

## Méthode de calcul du diamètre moyen

La procédure de calcul du diamètre moyen est simple :

E1) Dérouler 1,1 mètre de filament.

E2) Bloquer le filament avec une épingle pour éviter que la bobine se déroule et s'en mêle.

E3) Si le début du fil est pincé, endommagé ... supprimer la parti endomagée puis à l'aide d'un double decimètre ou d'un double mètre ruban réaliser un 1er trait à 5 cm du debut de la bobine avec un feutre indélébile suivi de 9 autres points. Les points doivent être bien visibles et contrastés sur le filament. La précision entre les points est de +- 5 mm. 

E4) A l'aide de votre pied à coulisse, palper ... mesurer successivement le diamètre des 10 points et consigner les valeurs.

E5) Faites une simple moyenne arithmétique pour trouver le diamètre moyen. Au besoin vous pouvez vous aider de ce fichier tableur qui effectuera la moyenne pour vous aprés avoir saisi vos valeurs [Calcul_Diamètres_Moyens_Filaments_Z1&Z2](https://github.com/sudtek/IMPRIMANTES_3D/blob/0d3eb917c344bd84f99bd5797aadb5fb99b3cbc7/QIDI/IFAST/CALIBRATION/Etape%2003/Calcul_Diam%C3%A8tres_Moyens_Filaments_Z1%26Z2.ods)

Exemple 

PETG Sunlu diamètre théorique donné pour 1,75mm +-0,2mm mesuré avec le bec plat = 1,724mm
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/1949d0320007ef1ac88599cf782de5bff678bacf/QIDI/IFAST/CALIBRATION/Etape%2003/media/Exemple_Mes_mesures_Diametre_filament_PETG_Z2_bec_large_OK.png)

VS

PETG Sunlu diamètre théorique donné pour 1,75mm +-0,2mm mesuré avec le bec plat = 1,744mm
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/1949d0320007ef1ac88599cf782de5bff678bacf/QIDI/IFAST/CALIBRATION/Etape%2003/media/Exemple_Mes_mesures_Diametre_filament_PETG_Z2_bec_Fin_NOK.png)

Nous allons retenir la 1er série avec Dmoyen = 1,724mm dans le but de Calculer le % du facteur du débit d'écoulement  il faut fixer cette valeur dans le slicer.

## Configuration IDEAMAKER

Dans Ideamaker vous devez modifier les parametres des materiaux de L (Z2 gauche) "PETG blanc sunlu materiel principal" (note perso ajouter lien vers mes profils) :

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/9c71bebcd73ebe26cbfa5ed9e6e1c0c3ab731e08/QIDI/IFAST/CALIBRATION/Etape%2003/media/IDEAMAKER_configurer_extrudeur_gauche.png)

Il faut impérativement outrepasser les parametres de tranchages dans les profils liés au materiau (Cocher cette case permet de configurer et calibrer chaque buse independament en fonction du matériau en écrasant les « parametres de l’imprimante » -> On fixe le Diamétre du filament à 1,724 mm

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/9c71bebcd73ebe26cbfa5ed9e6e1c0c3ab731e08/QIDI/IFAST/CALIBRATION/Etape%2003/media/IDEAMAKER_Fixer_Diametre_moyen_filament.png)

Vous pouvez télécharger sur ce lien le récapitulatif des (Prérequis_Calibration_Filament_Z2.ods)[https://github.com/sudtek/IMPRIMANTES_3D/blob/76d8e661b3302f08bcbbb2e3dc6a70d64314f03e/QIDI/IFAST/CALIBRATION/Etape%2003/media/IDEAMAKER_Pr%C3%A9requis_Calibration_Filament_Z2.ods]

Note : Si nécessaire je ferais une vidéo explicative de la procédure.

---------

## A propos des instruments de mesures
L'idéal pour mesurer le diamètre d'un filament est d'utiliser un instrument de mesure adapté type pied à coulisse au 1/50mm en utilisant la partie dite du "bec large" (en vert) du pied à coulisse ou un palper au 1/100.

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/e99904c9acdcf9f56b102b82c60a71e22e481a74/QIDI/IFAST/CALIBRATION/Etape%2003/media/pied_coulisse_manuel_bec_etroit.png)


Le "bec large" (en vert) est une zone rectifiée de quelque mm² du pied à coulisse situé aprés le bec fin (en rouge). Le bec large formé de 2 plans rectifiées permet une meilleur mesure moyenne que si vous utilisiez le bec fin car lorsque vous poussez sur la molette (jaune) avec trop d'effort cela va avoir tendance à deformer le filament et fausser votre mesure ... bien sur utiliser un pied à coulisse manuel nécesssite un minimum d'apprentissage pour savoir lire correctement une valeur. Il existe une alternative, le pied à coulisse dit numérique mais c'est selon moi une fausse bonne idée car pour avoir un bon pied à coulisse numerique de qualité il faut investir plusieurs centaines d'euros (entre 500€ et 1000€) sinon ils sont trop imprécis dans les mesures des valeurs au point d'être selon moi inutiles voir contre productif.
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/427b35bd2aba677db02372aaf2093f94eb496b77/QIDI/IFAST/CALIBRATION/Etape%2003/media/pied_coulisse_numerique.png)

Mon preferé reste de loin le "palper" qui permet des mesures moyennes précises au 1/100, ils sont tous équipées d'une vis limitant le couple de serrage du vernier (la bague gradué mobile) ainsi lorsque vous mesurez le filament vous appliquez toujours un effort constant donc plus de risque de fausser vos mesures en écrasant le filament ! Celui sur l'image ci-dessous à des becs plats cylindriques (il existe d'autres modéles de becs). Le tarrif de la version manuelle est un peu plus cher qu'un bon pied à coulisse mais bien plus pratique. La version numérique de qualité coute une véritable fortune, ce n'est pas indispensable ... mais tellement pratique lorsque en viellisant la vue baisse ;)  
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/427b35bd2aba677db02372aaf2093f94eb496b77/QIDI/IFAST/CALIBRATION/Etape%2003/media/palper.png)

_Note : Comme tous outils de précision ils n'aiment pas être ni mal traités, ni mal utilisés ... s'ils sont bien entretenus, utilisés et rangés ils feront plusieurs générations !_





  




