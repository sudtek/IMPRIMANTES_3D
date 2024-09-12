**Étape 02 : Calibration Mise à niveau du plateau**

Prérequis avant de continuer : 
- Vous devez avoir validé [l'étape 00 Réglage de l'alignement des deux buses / calibrage XY](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2000/Etape_00.md)
- - Vous devez avoir validé [l'étape 01 Calibration des deux moteurs d'extrusion de Z1 et Z2](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2001/Etape_01.md) 

### Présentation
La mise à niveau du plateau de la IFAST n'est pas automatique, ce fait 100% manuellement etprend du temps. Dans son manuel QIDI explique comment réaliser cette mise à niveau du plateau mais à mon gout QIDI se contente vraiement du minimum syndical. Je vais donc reprendre les informations afin de faire un tutoriel / howto pour vous exposer ma methode pour la mise à niveau du plateau de la QIDI IFAST.

Les plateaux quelques soient leurs matieres sont toujours sujet à soit trop hadérer soit manquer d'ahdérence et ce comportement varie avec les températures ... il est donc dificile de trouver le juste millieucela  necesite de la pratique et de l'experience car si votre Objet 3D imprimé :
- Hadére trop : Le revetement de votre plateau va se détirorer prématurement et marquera le dessous de votre impression nécesitant une post traitement de poncage.
- Hadére pas assez : La piece se décole pendant l'impression et on finit avec un "plat de spagetis", del aperte de matiere, du temps ...

L'idéal est de trouver le juste milieu; pour ma part en impresion 3D fdm j'ai systématiquement recours à une technique simple et peut couteuse l'utilisation d'une couche d'interface. elle consite à diluer de la "colle blanche d'écolier en baton" premiers pris dans de l'eau, étaler sur le plateau la matiere liquide avec un pinceaux en silicone suivi de plusieurs coups de rouleaux croissées pour lisser et uniformiser l'épaisseur su rla zone d'impression. Cela créé une couche d'interface qui à chaud maintiendra trés fermement votre piece en place sur le plateau et qui aprés impression avec la descente en temperature facilitera une la séparation sans endomager ni le plateau ni le dessous de la piéce. le seul post traitements necessaire et un coup de microfibre avec de l'eau tiedes pour éliminer  les residus de colles sur le dessous de la pieces. L'avantage de ce procdede est un faible coup , non toxique et recyclable à l'infini. 
[Astuce Impression 3D : Améliorer l'accroche du bed pour impression](https://www.youtube.com/watch?v=7C0QPmg6328)  

Sur la QUID IFAST  Il y a deux types de mise à niveaux nommés "Levelling" !

Le "normal Leveling" est primordial et doit être fait au moins une fois à la reception de l'imprimante avant toute impresion de test  ! Il permet de correctement régler la distance entre les buses et le plateau pour eviter d'être : 
- Ni trop haut par rapport au plateau car la matiere extrudée n'haderera pas au plateau elle ne serra pas sufisemnt serrée* / écrasée contre le plateau. (* Avec la matiere en fusion qui est visceuse pendant la phase d'extrusion on peut faire une analogie avec les mortiers que l'on serre pour aider à l'ahdérence sur un support) 
- Ni trop bas pour ne pas endommager le plateau (moins grave), les têtes (grave), voir endomager le systéme de déplacement vis sans fin et ou crammer un moteur /driver (le drame ...)

Il faut egalement veiller à systématiquement récalibrer (fast leveling) cette distance aprées chaque impression sur la QIDI IFAST car le 

buse à chaud et exactement à la température de travail. 
Lorsque j'imprime sur la QUIDI IFAST une pieces en PETG 235°c sur Z2 pour le corps de la piéces et du PLA 205°c pour les supports, mon plateau lui est à une temperature situé entre 60 et 70° et une enceinte car les support en PLA ne supporte pas une temperature superieure
Quidi fourni une carte plastique de 0.2mm épaisseur et de 10xmx15cm dasn le but de servir de cale étalons pour verifier .

//INSERER PHOTO 



Photo

Par defaut la QIDI IFAST offre une methode integrée qui releve 4 points  
