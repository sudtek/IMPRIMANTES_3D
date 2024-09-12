**Étape 02 : Calibration Mise à niveau / hauteur du plateau**

Prérequis avant de continuer : 
- Vous devez avoir validé [l'étape 00 Réglage de l'alignement des deux buses / calibrage XY](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2000/Etape_00.md)
- - Vous devez avoir validé [l'étape 01 Calibration des deux moteurs d'extrusion de Z1 et Z2](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2001/Etape_01.md) 

### Présentation
La mise à niveau du plateau de la IFAST n'est pas automatique, ce fait 100% manuellement et prend du temps. Dans son manuel QIDI explique comment réaliser cette mise à niveau du plateau mais à mon gout QIDI se contente vraiement du minimum syndical. Je vais donc reprendre les informations afin de faire un tutoriel / howto pour vous exposer ma methode pour la mise à niveau du plateau de la QIDI IFAST.

Les plateaux quelques soient leurs matieres sont toujours sujet à soit trop hadérer (on dit être amoureux en jargon méca) et accorcher fort certaines matiéres soit manquer d'hadérence ... et ce comportement varie en fonction des températures de travail, des plateaux et des matiéres à extruder ... il est donc dificile de trouver le juste millieu cela necesite beaucoup de pratique, tests empiriques et de l'experience car si votre Objet 3D imprimé :
- Hadére trop : Le revetement de votre plateau va se détirorer prématurement et marquera le dessous de votre impression nécesitant une post traitement de type poncage.
- Hadére pas assez : La piece se décole pendant l'impression et on finit avec un magnifique "plat de spagetis", de la perte de matiere, du temps ...

L'idéal est donc de trouver le juste milieu; pour ma part en impresion 3D fdm j'ai systématiquement recours à une technique simple et peut couteuse l'utilisation d'une couche d'interface. Cette technique consite à diluer de la "colle blanche d'écolier en baton" premiers pris dans de l'eau, étaler sur le plateau la matiere liquide avec un pinceaux en silicone suivi de plusieurs coups de rouleaux croissées pour lisser et uniformiser l'épaisseur sur la zone d'impression. Cela créé une couche d'interface qui à chaud maintiendra trés fermement votre piece en place sur le plateau et qui aprés impression avec la descente en temperature facilitera la séparation sans endomager ni le plateau ni le dessous de la piéce. Le seul post traitement necessaire et un coup de microfibre avec de l'eau tiedes pour éliminer  les residus de colles sur le dessous de la pieces il n'y a même pas besoin de netoyer le plateau puisque la colle se dissout à l'eau. L'avantage de cet procedure est un faible coup , non toxique et recyclable à l'infini. 
[Exemple en vidéo Astuce Impression 3D : Améliorer l'accroche du bed pour impression](https://www.youtube.com/watch?v=7C0QPmg6328)  

Deux types de mise à niveaux nommés "Levelling" sur la QUID IFAST :

Le **"normal Leveling"** est primordial et doit être fait au moins une fois à la reception de l'imprimante avant toute impresion de test  ! Il permet de correctement régler la distance entre les buses et le plateau pour eviter d'être : 
- Ni trop haut par rapport au plateau car la matiere extrudée n'haderera pas au plateau elle ne serra pas sufisemnt serrée* / écrasée contre le plateau. (* Avec la matiere en fusion qui est visceuse pendant la phase d'extrusion on peut faire une analogie avec les mortiers que l'on serre pour aider à l'ahdérence sur un support) 
- Ni trop bas pour ne pas endommager le plateau (moins grave), les têtes (grave), voir endomager le systéme de déplacement vis sans fin et ou crammer un moteur /driver (le drame ...)

A chaque nouvelle impresison il faut egalement veiller à systématiquement verifier et récalibrer **"fast leveling"** cette distance aprées chaque impression sur la QIDI IFAST j'ai constaté à chaque nouveau homming en Z lorsque le plateau descent en butée et remonte il ya un jeu de decalage dans le Z de quelques milliemes. Ce point problématique lié au choix technique de l'axe Z sera discuté dans un fichier dédié.

### Prérequis

Quelque soit le type de leveling **"normal Leveling" ou "fast leveling**" ils doivent impérativement être effectuées à chaud dans les conditions de températures d'impression ! Si vous faites vos levelling à froid la machine ne sera pas en palce correstement dilatée et vous perdrez en précision pour la suite des réglages, cela doit être une habitude , un reflexe !

Lorsque j'imprime sur la QUIDI IFAST je  fix systématiquement mes températures en amont pour préchaufer avant de calibrer, exemple : 
- Buse Z1 à 205°c pour imprimer les supports en PLA.
- Buse Z2 à 235°c pour imprimer le corps de piece en PETG.
- Plateau température situé entre 60°c / 70°c Max si les supports PLA sont en contact avec le plateau. 80°c Max si uniquement du PETG en contact avec le plateau. Note : La couche dinterface en glue permet d'abaisser de 10°c la temperature du plateau sans perte d'adherence et/ou de risque de warping sur les 1er couches. 
- Enceinte chaufante 50°c max car les support en PLA ne supporte pas une temperature superieure et le but ici est de limiter le warping (deformation) du PETG pendant l'impression. Note : En fin d'impression de l'objet penser à faire redesendre progressivement la temperature de  l'enceinte avec un bout de gcode pour limiter le warping via le sliccer.
  
_Note 1 : Bien sur ces temperatures sont données à titre indicatif pour mes besoins et à adaptées aux votres en fonction des matieres que vous allez imprimer._
_Note 2 : QIDI recommande d'ouvrir le capot superieur transparent lorsque l'on imprime certaines matieres, si comme moi vous imprimez un corps de pieces en petg je vous conseille de mainteneir fermer pour limiter le warping, de plus si l'enceinte ouverte cela fausse la calibration globale._
  
Quidi fourni une carte plastique de 0.2mm épaisseur de 10xmx15cm couleur  noire / marron dans le but de servir de cale étalons pour faire vos "normal Leveling" ou "fast leveling", mais il y a plusieurs problémes avec cette gauje d'épaisseur : 
- Ce n'est pas un thermo plastic du coup en calibrant à chaud celui-ci va fondre au contact de la buse, se coller et salir la buse etcoler au plateau ...
- Si comme moi vous travaillé en enceinte close sans ouverture du capot superieur (ou que votre imprimante est en hauteur) il vous sera impossible d'utiliser cette gauge plastique pour calibrer elle est pas assez longue ... c'est pas pratique il faut se contortionner.

//INSERER PHOTO gauge plastic

Je vous recommande de remplacer cette gauge par une feuille bristrol A4 à petit carreaux 5mm epaisseur 0.2mm c'est le plus simple et le moins couteux.






---------

Par defaut la QIDI IFAST offre une methode integrée qui releve 4 points  
