# Étape 02 : Calibration Mise à niveau / hauteur du plateau

## Prérequis avant de continuer :
- Vous devez avoir validé [l'étape 00 Réglage de l'alignement des deux buses / calibrage XY](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2000/Etape_00.md)
- Vous devez avoir validé [l'étape 01 Calibration des deux moteurs d'extrusion de Z1 et Z2](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2001/Etape_01.md)

## Présentation

La mise à niveau du plateau de la IFAST n'est pas automatique et doit être effectuée manuellement. Bien que QIDI explique comment réaliser cette mise à niveau dans son manuel, les informations fournies sont minimales. Je vais donc reprendre ces informations pour vous proposer un tutoriel détaillant ma méthode* pour la mise à niveau du plateau de la QIDI IFAST.

* J'applique une méthode quasie similaire à ma X1 artillery.

Les plateaux peuvent manquer d'adhérence mais également adhérer trop fortement (on dit "être amoureux" en jargon mécanique); ce comportement varie en fonction des températures de travail, des plateaux et des matières à extruder. Il est donc difficile de trouver le juste milieu, ce qui nécessite beaucoup de pratique, de tests empiriques et d'expérience. En effet, si votre objet 3D imprimé :
- Adhère trop : Le revêtement de votre plateau va se détériorer prématurément et marquera le dessous de votre impression, nécessitant un post-traitement tel que le ponçage. J'ai eu le cas d'un plateau en verre qui maintennait collé si fortement la piéce que le verre à fini par faire des éclats necesitant un ciseaux à bois pour les séparer du corps de piéce. 
- Adhère pas assez : La pièce se décolle pendant l'impression ... résulta un magnifique "plat de spaghettis", une perte de matière; de temps...

L'idéal est donc de trouver le juste milieu. Pour ma part, en impression 3D FDM, j'utilise systématiquement une technique simple et peu coûteuse : l'utilisation d'une couche d'interface. Cette technique consiste à diluer de la "colle blanche d'écolier en bâton" dans de l'eau, à étaler la matière liquide sur le plateau avec un pinceau en silicone, puis à passer plusieurs coups de rouleau croisés pour lisser et uniformiser l'épaisseur sur la zone d'impression. Cela crée une couche d'interface qui, à chaud, maintiendra fermement votre pièce en place sur le plateau et qui, après impression, avec la descente en température, facilitera la séparation sans endommager ni le plateau ni le dessous de la pièce. Le seul post-traitement nécessaire est un coup de microfibre avec de l'eau tiède pour éliminer les résidus de colle sur le dessous des pièces. Il n'est même pas nécessaire de nettoyer le plateau, il suffit de dissoudre le restant de colle l'eau et repasser un coup de rouleau. L'avantage de cette procédure est son faible coût, son caractère non toxique et sa recyclabilité à l'infini.

[Exemple en vidéo : Astuce Impression 3D : Améliorer l'accroche du bed pour impression](https://www.youtube.com/watch?v=7C0QPmg6328)

## Deux types de mise à niveau nommés "Levelling" sur la QIDI IFAST :

Pour accéder aux menus de leveling de la QIDI IFAST -> Icone Engrenage -> Icone Menu leveling.
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/1b44282f20c2ab513edb47a70c626f3488f8c479/QIDI/IFAST/CALIBRATION/Etape%2002/media/menu_leveling.jpg)

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/349c9b5b93062e623338f2681f15292e31eb9a76/QIDI/IFAST/CALIBRATION/Etape%2002/media/Menu_Fast_normal_levelling.jpg)

Le **"normal Leveling"** est primordial et doit être effectué au moins une fois à la réception de l'imprimante avant toute impression de test. Il permet de régler correctement la distance entre les buses et le plateau pour éviter d'être :
- Ni trop haut par rapport au plateau, car la matière extrudée n'adhérera pas au plateau et ne sera pas suffisamment serrée (préssée) contre le plateau. (Avec la matière en fusion qui est visqueuse pendant la phase d'extrusion, on peut faire une analogie avec les mortiers que l'on serre pour aider à l'adhérence sur un support.)
- Ni trop bas pour ne pas endommager le plateau (moins grave), les têtes (grave), voire endommager le système de déplacement vis sans fin et/ou cramer un moteur/driver (le drame ...).

À chaque nouvelle impression, il faut également veiller à systématiquement vérifier et recalibrer la distance via un **"fast leveling"** de la QIDI IFAST var j'ai constaté qu'à chaque nouveau homing en Z, lorsque le plateau descend en butée et remonte, il y a un jeu de décalage dans le Z de quelques milliémes qui est lié au choix technique de l'axe Z (sera discuté dans un fichier dédié).

## Prérequis

Quel que soit le type de leveling **"normal Leveling" ou "fast leveling"**, ils doivent impérativement être effectués à chaud dans les conditions de températures d'impression avec des buses propres. Pour nettoyer les buses j'utilise un chiffon de lin trés épais ainsi on ne se crame pas les doigts et cela resite trés bien à une temperature de 250°c. Si vous faites vos leveling à froid comme le préconise les constructeurs alors la machine ne sera pas correctement dilatée et vous perdrez beaucoup en précision pour la suite des réglages dit fins. Cela doit devenir une habitude, un réflexe de toujours faire vos leveling à chaud !

Lorsque j'imprime sur la QIDI IFAST, je fixe systématiquement mes températures en amont pour préchauffer avant de calibrer, par exemple :
- Buse Z1 à 205°C pour imprimer les supports en PLA.
- Buse Z2 à 235°C pour imprimer le corps de pièce en PETG.
- Plateau température située entre 60°C / 70°C Max si les supports PLA sont en contact avec le plateau. 80°C Max si uniquement du PETG en contact avec le plateau. 
  Note : La couche d'interface en colle permet d'abaisser de 10°C la température du plateau sans perte d'adhérence et/ou de risque de warping sur les premières couches.
- Enceinte chauffante 50°C max car les supports en PLA ne supportent pas une température supérieure et le but ici est de limiter le warping (déformation) du PETG pendant l'impression.
  Note : En fin d'impression de l'objet, penser à faire redescendre progressivement la température de l'enceinte avec un bout de gcode pour limiter le warping via le slicer.

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/349c9b5b93062e623338f2681f15292e31eb9a76/QIDI/IFAST/CALIBRATION/Etape%2002/media/Temperature_%20pr%C3%A9chauffages.jpg)
_Note 1 : Bien sûr, ces températures sont données à titre indicatif pour mes besoins et doivent être adaptées aux vôtres en fonction des matières que vous allez imprimer ..._
_Note 2 : QIDI recommande d'ouvrir le capot supérieur transparent lorsque l'on imprimme certaines matières. Si comme moi vous imprimez un corps de pièces en PETG, je vous conseille vivement de maintenir le capot fermé pour limiter le warping. De plus, si l'enceinte est ouverte par le haut l'effet cheminé fausse la calibration globale._

QIDI fournit une carte plastique de 0.2 mm d'épaisseur, dimensions 10cm x 15cm de couleur noire / marron dans le but de servir de cale étalon pour faire vos "normal Leveling" ou "fast leveling". Cependant, il y a plusieurs problèmes avec cette jauge d'épaisseur :
- Ce n'est pas un thermoplastique, donc en calibrant à chaud, celui-ci va fondre au contact de la buse, se coller et salir la buse et le plateau -> donc utilisable uniquement en calibration à froid qui selon moi ne devrait être effectuée que lors de la toute 1er mise en service au cas ou la tête aurait bougée pendant le transport.
- Si, comme moi, vous travaillez en enceinte close sans ouverture du capot supérieur (ou que votre imprimante est positionnée en hauteur), il vous sera impossible d'utiliser cette jauge plastique pour calibrer car elle n'est pas assez longue et ce n'est pas franchement pratique, il faut se contorsionner ...

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2002/media/Gauge_plastique_livr%C3%A9e_par_QIDI.jpg)

Je vous recommande de remplacer cette jauge par une feuille bristol A4 à petits carreaux de 5 mm d'épaisseur 0.2 mm. C'est le plus simple, le moins coûteux et le plus pratique.

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/4367d96d8e8fbc38b2ab900d8a624da749ba79bd/QIDI/IFAST/CALIBRATION/Etape%2002/media/Feuille_A4_Bristol_0%2C02mm.jpg)

Pour accéder au menu de **Normal leveling**.

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/5e3d47b0d32ce0c8ed1cd933c6c03586c30d1f84/QIDI/IFAST/CALIBRATION/Etape%2002/media/menu_leveling.jpg)

Le menu de **Normal leveling**.
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/338277bc2f0e9f8761f7f410eed4766f0eccd72d/QIDI/IFAST/CALIBRATION/Etape%2002/media/Menu_Ajustement_normal_levelling.jpg)

Il est impératif de régler la distance du plateau en désérant les écrous oreilles et tournant les 3 écrous pour ajuster ...
![](https://github.com/sudtek/IMPRIMANTES_3D/blob/e1d85f24cb858a651019100818edc7928fb74bdb/QIDI/IFAST/CALIBRATION/Etape%2002/media/Les_3_noix.jpg)

... en ayant impérativement positioné la feuille A4 entre le plateau et la buse afin de proteger plateau et buses d'un éventuel crash (contact direct entre plateau et buse) mais également dans le but de protéger le plateau d'un contact thermique direct avec le bout de la buse pendant le réglage succéssifs des trois écrous. Le fait de rester en position au même endroit pendant trop longtemps lorsque l'on tatone va irémédiablement affecter thermiquement votre plateau. Le bristol est un excelent isolant il va vous permettre de protéger thermiquement la zone de travail sans risquer la moindre déterrioration thermique ou crash.
La calibration à chaud requier un minimu de pratique et peut poser des pbds(crash, déterioration thermique plateau ...) si l'utilisateur se rate; C'est pour ces raisons que les constructeurs ne vous font pas faire des calibrages aux temperatures de travail / à chaud ... et favorisent le leveling à froid.

![](https://github.com/sudtek/IMPRIMANTES_3D/blob/e1d85f24cb858a651019100818edc7928fb74bdb/QIDI/IFAST/CALIBRATION/Etape%2002/media/Positionement_Buse.jpg)

Petit rappel : Sur la QUID IFAST la postion de la tête et des buses sont fixes selon l'axe Z c'est uniquement le plateau que l'on ajuste, il monte ou descent  !

Le réglage se fait succéssivements pour chaque écrous afin de régler la distance entre la buse et le plateau. Le but ici est de régler correctement la pression excercer sur la feuille sans bloquer la feuille ou quelle soit trop lâche afin d'obtenir la bonne distance. Cela requier de la pratique et un peu de doigté mais ce n'est pas insurmontable avec un peu de pratique :

- La pression exercé sur la feuille est trop élevée lorsque :
  - Vous poussez sur le bristol il se gondole, se deforme et ne recule pas.
  - Vous tirez sur le bristol il ne bouge pas. 
--> Tourner la molette dans le sens antihoraire (vers la droite) pour augmenter la distance entre la buse et le plateau en faisant descendre le plateau et libére la pression exercée sur la feuilleA 4 Bristol.

- La pression exercée sur la feuille est insufisante lorsque vous (poussez / tirez / deplacez latéralement de droite à gauche) la feuille A4 Bristol mais que vous ne percevez aucun vibration lié aux frotemments, votre buse est beaucoup trop haut elle n'est pas en contact avec le Bristol.
-->  Tourner la molette dans le sens horaire (vers la gauche) pour réduire la distance entre la buse et le plateau en faisant monter le plateau afin de pincer trés légèrement la feuille.
  
- La pression exercé sur la feuille est correcte lorsque :
  - Vous pouvez pousser, tirer et deplacer latéralement la feuille Bristl en resentant une légére resistance, vous devez faire en sorte de sentir le même niveau de resistance pour tous points de contrôles.
  - Vous pouvez tirer la feuille et parvenir à la réinserer entre la buse et le plateau sans déterriorer la feuille. 
--> Il vous faut sérer fermement l'écrou oreille pour bloquer la molette en postion.

Astuce : Pour trouver le bon compromis sans y passer trop longtemps je mets le bristol en mouvement en faisant des cercles tout en réglant et tournant simultanément la molette.

Note : J'ai remarqué qu'aprés avoir serré l'écrou on peut être trop proche du plateau et ne plus pouvoir renfiler la feuille entre la buse et le plateau alors que l'on avait trouvé une postion optimale. Ce probléme est lié au jeux des filets du systéme de sérrage / blocage ...  Si vous faites le même constat pas de panique il vous faut desserer l'écrou oreille et tournez la molette dans le sens antihoraire (vers la droite) de moins de 1/8 de tour puis revisser fermement l'écrou oreille pour bloquer en position. Essayer à nouveau de renfiler la feuille A4 Bristol entre la buse et le palteau. Il faut parfois si reprendre à plusieurs fois, 2 ou 3 iterations maximum. Ce qui ne faut surtout pas faire dans ce cas c'est faire des allers et retours en devissant trop puis en revissant car avec ce type de visserie et blocage vous induirez des decalages et des jeux et votre plateau n'aura plus une bonne assiète paralléle par rapport au plan de déplacement de la tête; autrement dit la distance plateau buse ne sera plus identique à tous les points de controle.

Bien sur cette technique est à repetée pour chacun des écrous ! Lorsque vous avez fait votre premier tout premier "Normal Leveling" à chaud n'hesitez pas à le recontroler aprés avoir laissé l'imprimante en température de travail 1/2 heure ** parcontre il vous faut imperativement penser à laisser le plateau à une distance minimum 50 mm des têtes pour ne pas faire une zone d'affectation thermique ! **. Au besoin relancer un "Normal leveling" pour réajuster cela vous garantira une base de départ parfaite pour vos futurs "Fast Leveling".

[Sur ce lien vous trouverez une vidéo explicant ma technique de Normal Leveling à chaud].()





