# Étape 02 : Calibration Mise à niveau / hauteur du plateau

## Prérequis avant de continuer :
- Vous devez avoir validé [l'étape 00 Réglage de l'alignement des deux buses / calibrage XY](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2000/Etape_00.md)
- Vous devez avoir validé [l'étape 01 Calibration des deux moteurs d'extrusion de Z1 et Z2](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2001/Etape_01.md)

## Présentation

La mise à niveau du plateau de la IFAST n'est pas automatique et doit être effectuée manuellement, ce qui peut prendre du temps. Bien que QIDI explique comment réaliser cette mise à niveau dans son manuel, les informations fournies sont minimales. Je vais donc reprendre ces informations pour vous proposer un tutoriel détaillant ma méthode pour la mise à niveau du plateau de la QIDI IFAST.

Les plateaux, quelle que soit leur matière, peuvent soit adhérer trop fortement (on dit "être amoureux" en jargon mécanique) et accrocher certaines matières, soit manquer d'adhérence. Ce comportement varie en fonction des températures de travail, des plateaux et des matières à extruder. Il est donc difficile de trouver le juste milieu, ce qui nécessite beaucoup de pratique, de tests empiriques et d'expérience. En effet, si votre objet 3D imprimé :
- Adhère trop : Le revêtement de votre plateau va se détériorer prématurément et marquera le dessous de votre impression, nécessitant un post-traitement tel que le ponçage.
- Adhère pas assez : La pièce se décolle pendant l'impression, résultant en un magnifique "plat de spaghettis", une perte de matière et de temps.

L'idéal est donc de trouver le juste milieu. Pour ma part, en impression 3D FDM, j'utilise systématiquement une technique simple et peu coûteuse : l'utilisation d'une couche d'interface. Cette technique consiste à diluer de la "colle blanche d'écolier en bâton" dans de l'eau, à étaler la matière liquide sur le plateau avec un pinceau en silicone, puis à passer plusieurs coups de rouleau croisés pour lisser et uniformiser l'épaisseur sur la zone d'impression. Cela crée une couche d'interface qui, à chaud, maintiendra fermement votre pièce en place sur le plateau et qui, après impression, avec la descente en température, facilitera la séparation sans endommager ni le plateau ni le dessous de la pièce. Le seul post-traitement nécessaire est un coup de microfibre avec de l'eau tiède pour éliminer les résidus de colle sur le dessous des pièces. Il n'est même pas nécessaire de nettoyer le plateau puisque la colle se dissout à l'eau. L'avantage de cette procédure est son faible coût, son caractère non toxique et sa recyclabilité à l'infini.

[Exemple en vidéo : Astuce Impression 3D : Améliorer l'accroche du bed pour impression](https://www.youtube.com/watch?v=7C0QPmg6328)

## Deux types de mise à niveau nommés "Levelling" sur la QIDI IFAST :

Pour accéder aux menus de leveling de la QIDI IFAST -> Icone Engrenage -> menu leveling.
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/1b44282f20c2ab513edb47a70c626f3488f8c479/QIDI/IFAST/CALIBRATION/Etape%2002/media/menu_leveling.jpg)

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/c6af5173c09b3a0ddf0b94d4a86707a78f4ec835/QIDI/IFAST/CALIBRATION/Etape%2002/media/Fast%20leveling%20VS%20normal%20leveling.jpg)

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/349c9b5b93062e623338f2681f15292e31eb9a76/QIDI/IFAST/CALIBRATION/Etape%2002/media/Menu_Fast_normal_levelling.jpg)

Le **"normal Leveling"** est primordial et doit être effectué au moins une fois à la réception de l'imprimante avant toute impression de test. Il permet de régler correctement la distance entre les buses et le plateau pour éviter d'être :
- Ni trop haut par rapport au plateau, car la matière extrudée n'adhérera pas au plateau et ne sera pas suffisamment serrée/écrasée contre le plateau. (Avec la matière en fusion qui est visqueuse pendant la phase d'extrusion, on peut faire une analogie avec les mortiers que l'on serre pour aider à l'adhérence sur un support.)
- Ni trop bas pour ne pas endommager le plateau (moins grave), les têtes (grave), voire endommager le système de déplacement vis sans fin et/ou cramer un moteur/driver (le drame...).

À chaque nouvelle impression, il faut également veiller à systématiquement vérifier et recalibrer la distance **"fast leveling"** après chaque impression sur la QIDI IFAST. J'ai constaté qu'à chaque nouveau homing en Z, lorsque le plateau descend en butée et remonte, il y a un jeu de décalage dans le Z de quelques millimètres. Ce point problématique lié au choix technique de l'axe Z sera discuté dans un fichier dédié.

## Prérequis

Quel que soit le type de leveling **"normal Leveling" ou "fast leveling"**, ils doivent impérativement être effectués à chaud dans les conditions de températures d'impression. Si vous faites vos leveling à froid, la machine ne sera pas correctement dilatée et vous perdrez en précision pour la suite des réglages. Cela doit devenir une habitude, un réflexe.

Lorsque j'imprime sur la QIDI IFAST, je fixe systématiquement mes températures en amont pour préchauffer avant de calibrer, par exemple :
- Buse Z1 à 205°C pour imprimer les supports en PLA.
- Buse Z2 à 235°C pour imprimer le corps de pièce en PETG.
- Plateau température située entre 60°C / 70°C Max si les supports PLA sont en contact avec le plateau. 80°C Max si uniquement du PETG en contact avec le plateau. Note : La couche d'interface en glue permet d'abaisser de 10°C la température du plateau sans perte d'adhérence et/ou de risque de warping sur les premières couches.
- Enceinte chauffante 50°C max car les supports en PLA ne supportent pas une température supérieure et le but ici est de limiter le warping (déformation) du PETG pendant l'impression. Note : En fin d'impression de l'objet, penser à faire redescendre progressivement la température de l'enceinte avec un bout de gcode pour limiter le warping via le slicer.

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/349c9b5b93062e623338f2681f15292e31eb9a76/QIDI/IFAST/CALIBRATION/Etape%2002/media/Temperature_%20pr%C3%A9chauffages.jpg)
_Note 1 : Bien sûr, ces températures sont données à titre indicatif pour mes besoins et doivent être adaptées aux vôtres en fonction des matières que vous allez imprimer._
_Note 2 : QIDI recommande d'ouvrir le capot supérieur transparent lorsque l'on imprime certaines matières. Si, comme moi, vous imprimez un corps de pièces en PETG, je vous conseille de maintenir le capot fermé pour limiter le warping. De plus, si l'enceinte est ouverte, cela fausse la calibration globale._

QIDI fournit une carte plastique de 0.2 mm d'épaisseur de 10x15 cm de couleur noire/marron dans le but de servir de cale étalon pour faire vos "normal Leveling" ou "fast leveling". Cependant, il y a plusieurs problèmes avec cette jauge d'épaisseur :
- Ce n'est pas un thermoplastique, donc en calibrant à chaud, celui-ci va fondre au contact de la buse, se coller et salir la buse et le plateau.
- Si, comme moi, vous travaillez en enceinte close sans ouverture du capot supérieur (ou que votre imprimante est en hauteur), il vous sera impossible d'utiliser cette jauge plastique pour calibrer. Elle n'est pas assez longue et ce n'est pas pratique, il faut se contorsionner.

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2002/media/Gauge_plastique_livr%C3%A9e_par_QIDI.jpg)

Je vous recommande de remplacer cette jauge par une feuille bristol A4 à petits carreaux de 5 mm d'épaisseur 0.2 mm. C'est le plus simple et le moins coûteux.

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/4367d96d8e8fbc38b2ab900d8a624da749ba79bd/QIDI/IFAST/CALIBRATION/Etape%2002/media/Feuille_A4_Bristol_0%2C02mm.jpg)

