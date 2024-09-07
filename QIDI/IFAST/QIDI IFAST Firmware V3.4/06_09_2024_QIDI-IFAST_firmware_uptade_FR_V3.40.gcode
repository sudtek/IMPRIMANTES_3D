; 06_05_2024
;
; QIDI-IFAST update firmware V3.40 pour Carte mère ChituSystems basé sur marlin (mais pas 100% marlin)
; Fimware update fournir par QIDI
; Traduction, adaptation et commentaires par YS 
;
;
;
M8513 ; Semble être une commande spécifique à un certain type de carte mère ou de firmware d'imprimante 3D, pas standard dans les firmwares open-source comme Marlin
;
; ==================================
;
; [ Support de sauvegarde  / backup en cas de coupure de courant ]
;
; Le réglage prend effet après redémarrage.
; I1 signifie backup activé (VALEUR PAR DEFAUT)
; I0 signifie backup desactivé 
;
M8000 I1
;
; ==================================
;
; [ Support de l'arrêt de l'imprimante ]
;
; I1 Active le support de l'arrêt de l'imprimante. (VALEUR PAR DEFAUT)
; I0 signifie non supporté, le réglage prend effet après redémarrage
;
M8001 I1
;
; ==================================
;
; [ Contrôle de la direction des moteurs pas à pas]
;
; I1 et I-1 ont des directions opposées, donc, si la direction du moteur est incorrecte, changez soit le câblage (non !), soit ce paramètre de direction
; Configure les directions des moteurs pas à pas pour les axes X, Y, Z et les extrudeuses E, E2, E3
; Direction du moteur pas à pas X, I1 ou I-1 (VALEUR PAR DEFAUT)
; I-1 (VALEUR PAR DEFAUT)
;
M8002 I-1
;
; ==================================
;
; [ Direction du moteur pas à pas Y ]
;
; I-1 (VALEUR PAR DEFAUT)
;
M8003 I-1
;
; ==================================
;
; [ Direction du moteur pas à pas Z ]
;
; I1 (VALEUR PAR DEFAUT)
;
M8004 I1
;
; ==================================
;
; [ Direction du moteur pas à pas E ]
;
; I1 (VALEUR PAR DEFAUT)
;
M8005 I1
;
; ==================================
; [ Direction du deuxième moteur pas à pas E, I1 E2 ou I-1 E2 ]
;
; Si vous n'avez pas plusieurs têtes, ignorez ce réglage
; I1 E2 (VALEUR PAR DEFAUT)
;
M8005 I1 E2
;
; ==================================
;
; ==================================
; [Direction du troisième moteur pas à pas E, I1 E3 ou I-1 E3 ]
;
; Si vous n'avez pas plusieurs têtes, ignorez ce réglage, trois têtes supportent actuellement trois entrées et une sortie
; I1 E3 (VALEUR PAR DEFAUT)
;
M8005 I1 E3
;
; ==================================
;
; ==================================
; [ Configuration de déplacement de la tête d'extrusion / plateforme sur les axes XYZ ]
;
; Note : Affecte uniquement déplacement manuel
; Note : Actuellement, la plupart des machines ont la tête d'extrusion qui se déplace sur l'axe X
; 0: Déplacement de la tête d'extrusion sur l'axe X (VALEUR PAR DEFAUT)
; 1: Déplacement de la plateforme sur l'axe X
;
M8005 X0
;
; ----------------------------------
; 0: Déplacement de la tête d'extrusion sur l'axe Y (VALEUR PAR DEFAUT)
; 1: Déplacement de la plateforme sur l'axe Y
; Actuellement, la structure I3 a la plateforme qui se déplace sur l'axe Y, delta, ultimaker et makerbot ont la tête d'extrusion qui se déplace sur l'axe Y
;
M8005 Y0
;
; ----------------------------------
; 0: Déplacement de la tête d'extrusion sur l'axe Z
; 1: Déplacement de la plateforme sur l'axe Z (VALEUR PAR DEFAUT)
; Actuellement, la structure I3 et delta a la tête d'extrusion qui se déplace sur l'axe Z, ultimaker et makerbot ont la plateforme qui se déplace sur l'axe Z
;
M8005 Z1
;
; ==================================
;
; ==================================
; [ Réglages vitesse en mm/s ]
;
; Vitesse de démarrage maximale, lorsque la vitesse de déplacement dépasse cette vitesse, elle démarrera à cette vitesse
; Cette vitesse est principalement pour éviter les pertes de pas, cette valeur trop petite peut causer des bosses aux coins lors de l'impression de cercles
; Valeur comprise entre [80 mm/s^2 .. 120mm/s^2] -> [I80..I120] 
; Valeur par defaut [80mm/s^2] -> [I80]
;
M8006 I80
;
; =================================
;
; ==================================
; [ Accélération maximale en trajectoire courbure en mm/s^2 ]
;
; (correspond à la vitesse de jerk dans le firmware open source)
; Si la vitesse réelle de courbure de trajectoire est supérieure à cette valeur, le mouvement sera forcé de ralentir.
; Lors de l'impression de remplissage, il y a beaucoup de mouvements de va-et-vient, cette valeur élevée augmente le bruit et les pertes de pas.
; Cette valeur basse ralentit la vitesse, affectant la qualité d'impression à haute vitesse
; Valeur par defaut [25mm/s^2] -> [I25]
;
M8007 I15
;
; ==================================
;
; ==================================
; [ Accélération mm/s^2 ]
;
; Plus cette valeur est grande, plus la vitesse moyenne réelle est grande, mais le bruit augmente également, une petite valueur réduit la vitesse réelle
; Valeur acceleration comprise entre [600mm/s^2 .. 1100mm/s^2] -> [I600..I1100]
; (Valeur par defaut) [1000mm/s^2] -> [I1000]
;
M8008 I1000
;
; ==================================
;
; ==================================
; [ Paramètres de la machine ]
;
; Après avoir défini les paramètres, imprimez un cube et mesurez les dimensions pour confirmer que les paramètres sont corrects :
; Valeur en mm pour chaque pas de XY, par exemple 20 dents, pas de dent de 2.032mm, moteur pas à pas de 1.8 degrés, 16 micro-pas, alors (20*2.032)/((360/1.8)*16)
; (Valeur par defaut) S0.01061083
;
M8009 S0.01061083
;
; ----------------------------------
; Si vous devez définir séparément les paramètres des moteurs pas à pas X, Y, utilisez cette commande
;
; (Valeur par defaut) X0.010625  Y0.010625
;
; M8009 X0.010625  Y0.010625
;
; ----------------------------------
; Valeur en mm pour chaque pas de Z, formule de calcul : pas de vis / ((360/1.8)*16), le pas de vis est la hauteur que la plateforme monte lorsque la vis tourne d'un tour
;
; (Valeur par defaut) S0.0025
;
M8010 S0.0025
;
; ==================================
;
; ==================================
; [ Calibration et calcul de E extrudeurs Z1 Z2 ]
; Valeur en mm pour chaque pas de E, cette valeur est égale à la circonférence de l'engrenage d'extrusion divisée par 3200, si vous avez un réducteur, divisez également par le rapport de réduction.
; Si vous trouvez que l'extrusion est trop fine ou qu'il y a souvent des couches manquantes, il est recommandé de régler cette valeur légèrement inférieure à la valeur réelle pour une meilleure extrusion.
; Note YS : Attention correspond à l'etape de calibrage de sur/sous-extrusion de mes extrudeurs vous devez imperativement calculer la votre voir explications en suivant ce tutoriel :
; https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/CALIBRATION/Etape%2001/Etape_01.md
;
; (Valeur par defaut) M8011 S0.0073 P0.0073
;
; Note YS 06_09_2024 mes valeurs aprés Etape 01:
; 
M8011 S0.0069 P0.0069
;
; ==================================
;
; ==================================
; [ Valeur maximale de divers paramètres de vitesse ]
;
; Pour garantir la stabilité de la machine, veuillez définir en fonction des résultats de test.
; Vitesse maximale de déplacement sur les axes XY en mm/s
; Valeur par defaut 200mm/s -> I200
;
M8012 I200
;
; ----------------------------------
; Vitesse maximale de déplacement sur l'axe Z en mm/s
; Valeur par defaut [5mm/s..25mm/s] -> I5 .. I25
;
M8013 I10
;
; ----------------------------------
; Vitesse maximale de l'extrudeuse en mm/s
; Valeur par defaut [120mm/s] -> I120
;
M8014 I120
;
; ----------------------------------
;
; Vitesse de retour à zéro de l'axe Z, le logiciel de découpe Makerware ignore cette vitesse de retour à zéro, car son gcode spécifie une vitesse de retour à zéro
; Première vitesse de retour à zéro de l'axe Z, vitesse relativement rapide
;
M8015 I8
;
; ----------------------------------
; Première vitesse de retour à zéro des axes XY, vitesse relativement rapide
;
M8015 S30
;
; ----------------------------------
; Deuxième vitesse de retour à zéro de l'axe Z, vitesse relativement lente
;
M8016 I4
;
; ----------------------------------
; Deuxième vitesse de retour à zéro des axes XY, vitesse relativement lente
;
M8016 S5
;
; ==================================
;
; ==================================
; [ Pré-extrusion avant impression ]
;
; Longueur de pré-extrusion en mm, l'adhérence de la première couche au plateau affecte directement la qualité d'impression, une pré-extrusion supplémentaire améliore l'adhérence au plateau.
; VALEUR PAR DEFAUT = 1mm = I1
;
M8017 I1
;
; ==================================
;
; ==================================
; [ Vitesse maximale de pré-extrusion de l'extrudeuse en mm/s ]
;
; Pour les engrenages d'extrusion non réduits (? direct drive ?) , la vitesse maximale est généralement supérieure à 100mm/s
; Plage de valeurs par defaut [20mm/s .. 80mm/s] -> [I20 .. I80] 
; VALEUR PAR DEFAUT = 20mm/s = I20
;
M8018 I20
;
; ==================================
;
; ==================================
; [ Special ]
;
; Les deux paramètres suivants sont étroitement liés à la compatibilité avec le logiciel Replicator/Makerware, si vous ne prévoyez pas de compatibilité avec ce type de logiciel, vous pouvez les ignorer
; Vitesse maximale de retrait supportée, en mm/s,
; lorsque la valeur est 0, cela signifie qu'elle est la même que la vitesse maximale de E. Par défaut, le retrait de Makerware en double tête est très lent, le temps d'arrêt de retrait est très long
; Plage de valeurs par defaut [50mm/s .. 100mm/s] -> [I50 .. I100] ou I0
; VALEUR PAR DEFAUT = 50mm/s = I50
;
M8019 I50
;
; ==================================
;
; ==================================
; [ Longueur de retrait / distance de retrait en mm ] 
;
; Un retrait trop petit peut causer des coulures / bavures
; Un retrait trop grand et un temps d'arrêt trop long peuvent causer des stringing et des coulures,
; Veuillez définir raisonnablement en fonction de votre type de tête d'extrusion.
; Si la valeur est 0, la longueur de retrait est fixé par le logiciel de Slicing
; VALEUR PAR DEFAUT = 0 = S0
;
M8020 S0
;
; ==================================
;
; ==================================
; [ Longueur de retrait lors du changement de tête d'extrusion ] 
;
; Dans le logiciel Makerware, le retrait spécifié par Makerware est très long, ce qui peut causer des blocages lors du retour d'extrusion,
; Si la valeur est 0, la longueur de retrait est fixé par le logiciel de Slicing
; VALEUR PAR DEFAUT = 0 = S0
;
M8033 S0
;
; ==================================
;
; ==================================
; [ Diamètre de filament par défaut ] 
; Diamètre de filament en mm
; VALEUR PAR DEFAUT = 1.75mm = S1.75
;
M8021 S1.75
;
; ==================================
;
; ==================================
; [ Température maximale de la tête d'extrusion ]
;
; Température maximale supportée par la tête d'extrusion, définir cette température pour éviter les dommages à la tête d'extrusion en cas de mauvaise manipulation de la température de la tête d'extrusion ne pourra jamais dépasser cette température
; Note : Attention la résistance chauffante ne doit pas monter à plus de 260, car le tube PEEK commence à ramollir à 260 degrés !
; VALEUR PAR DEFAUT 350°c  = I350
;
M8022 I350
;
; ==================================
;
; ==================================
; [ Interface de filament, température minimale d'extrusion ]
;
; Température minimale requise pour extruder le filament dans l'interface de filament
; VALEUR PAR DEFAUT 230°c  = T230
;
M8022 T230
;
; ==================================
;
; ==================================
; [ Température maximale du lit chauffant ]
;
; Note : Une température trop élevée peut endommager le lit chauffant
; VALEUR PAR DEFAUT 120°c  = T120
;
M8023 I120
;
; ==================================
;
; ==================================
; [ Détection d'erreur de température ] 
;
; Note : Il est fortement recommandé de ne pas désactiver cette fonction !
; La détection d'erreur de température par défaut affichera un avertissement si le capteur de température n'est pas bien branché ou si la puissance de chauffage est trop faible :
; 0: Activer la détection de température
; 1: Désactiver la détection d'erreur de température de la tête d'extrusion et du lit chauffant
; 2: Désactiver uniquement la détection d'erreur de température du lit chauffant
; VALEUR PAR DEFAUT 0
;
M8023 T0
;
; ==================================
; [ Température maximale de la chambre chauffante ]
;
; Note : Une température trop élevée peut endommager le lit chauffant !
; VALEUR PAR DEFAUT 80°c  = C80
;
M8023 C80
;
; ==================================
;
; ==================================
; [ X, Y, Z course maximale en mm ]
;
; Veuillez définir en fonction de la taille d'impression réelle, en mm le volume d'impression.
; Veuillez définir ce paramètre avec soin !!!!!! 
; Si la valeur est trop petite, les parties dépassant la course définie ne pourront pas être imprimées.
; Si la valeur est trop grande, alors si les instructions de déplacement de découpe dépassent la course réelle de la machine, cela ne limitera pas les positions dépassant, ce qui peut provoquer une collision /crash du moteur !
;
; [ Course maximale de X ]
;
; Note : Lorsque le LCD active le son, le déplacement dépassant la course provoquera un bip du buzzer
; Valeur par defaut de Xmax = 372.5mm -> I372.5
;
M8024 I372.5
;
M8024 T4
; ==================================
; [ Course maximale de Y ]
;
; Valeur par defaut de Ymax = 250mm -> I250
;
M8025 I250
;
; ==================================
; [ Course maximale de Z ]
;
; Valeur par defaut de Zmax = 322mm -> I322
;
M8026 I322
;
; ==================================
;
; ==================================
; [ Définir le nombre de têtes d'extrusion ] 
;
; Au moins 1, 2 ou 3 têtes d'extrusion, actuellement au maximum 3, dans le cas de trois têtes, seules trois entrées et une sortie sont supportées
; Configurer le nombre de têtes d'extrusion
; Valeurs [1 , 2 , 3] VALEUR PAR DEFAUT 2 -> I2
;
M8027 I2
;
; ----------------------------------
; [ Est-ce une tête d'extrusion multi-entrées et une sortie ?] 
;
; Les têtes d'extrusion multi-entrées et une sortie partagent un capteur de température, un corps chauffant
; 0: Non multi-entrées et une sortie (VALEUR PAR DEFAUT)
; 1: Multi-entrées et une sortie
;
M8027 S0
;
; ----------------------------------
; [ Fonction spéciale multi-Y ou multi-Z ]
;
; Si vous activez cette fonction, cochez la case devant
; 0: Mode double Z double limite, le deuxième limiteur est connecté à X+ (VALEUR PAR DEFAUT) 
; 1: Mode double Z simple limite, un seul interrupteur de limite est nécessaire
; 3: Mode triple Z, le troisième axe Z est connecté au port d'extension ext.
;
M8027 Z0
;
; ==================================
;
; ==================================
; [ Utiliser la deuxième tête d'extrusion E2 comme Y ]
;
; Si vous activez cette fonction, decommenter (VALEUR PAR DEFAUT)
; M8027 Y0
; ----------------------------------
;
; [ Utiliser la deuxième tête d'extrusion E2 comme la première tête d'extrusion E1]
;
; Si vous activez cette fonction, decommenter (VALEUR PAR DEFAUT)
; M8027 E0
; ==================================
;
; ==================================
; [ Désactiver le lit chauffant]
;
; 1: Activer le lit chauffant (VALEUR PAR DEFAUT)
; 0: Désactiver le lit chauffant
;
M8027 T1
;
; ==================================
;
; ==================================
; [ Réglages avancés ]
;
; Compensation de retrait, après retrait, l'extrusion reprend, en raison de l'élasticité, elle recule légèrement par rapport à la position d'origine, si vous ne comprenez pas, mettez simplement zéro
; Note : Compensation d'inertie / jeux entre deux extrusions ? 
;
M8028 S0.00
;
; ==================================
;
; ==================================
; [Type de position des interrupteurs de fin de course XY ]
;
; 0: Limite de bord unique (gauche avant), comme mendel, i3... (VALEUR PAR DEFAUT)
; 1: Limite de bord unique (arrière droit), comme le modèle makerbot
; 2: Limite double, comme le modèle ultimaker, la carte mini a seulement trois limites XYZ, ne configurez pas cette option pour utiliser ce choix
; 3: Limite arrière gauche (très rare)
; 4: Limite avant droite (très rare)
;
M8029 I0
;
; ==================================
;
; ==================================
; [ Type de câblage des interrupteurs de fin de course XYZ ]
;
; Si ce réglage est incorrect, lors de l'utilisation manuelle des moteurs, le moteur ne pourra pas se déplacer dans une certaine direction et le buzzer émettra un bip. Méthode simple de vérification,
; Si le réglage est normal, lorsque vous passez de non limité à limité, le buzzer émettra un bip, mais lorsque vous passez de limité à non limité, le buzzer ne sonnera pas. Si vous trouvez le comportement inverse, modifiez ce réglage
; 0: Interrupteur de fin de course normalement ouvert (non limité - et la tension S est haute, limité - la tension S est basse) (VALEUR PAR DEFAUT)
; 1: Interrupteur de fin de course normalement fermé (non limité - et la tension S est basse, limité - la tension S est haute)
;
M8029 T0
;
; ==================================
;
; ==================================
; [ Position de l'interrupteur de fin de course Z ]
;
; 0: Limite lorsque la tête d'extrusion est la plus proche de la plateforme, limite connectée à Z-
; 1: Limite lorsque la tête d'extrusion est la plus éloignée de la plateforme, limite connectée à Z+ (VALEUR PAR DEFAUT)
;
M8029 S1
;
; ==================================
; [ Retour à la position (0,0,0) après retour à l'origine des axes XYZ, uniquement pour les types de machines XYZ ou hbot ]
;
; 0: Retour à la position XYZ (0,0,0), c'est-à-dire que la tête d'extrusion retourne à la position avant gauche de la plateforme.
; 1: Reste à la position de limite (VALEUR PAR DEFAUT)
;
M8029 C1
;
; ==================================
;
; ==================================
; [ Activation de la détection de rupture de filament ]
;
; L'interrupteur de rupture de filament est connecté à l'interface de limite correspondante de la tête d'extrusion, c'est-à-dire les interfaces E1 et E2
; 0: Désactiver la détection de rupture de filament
; 1: Activer la détection de rupture de filament (VALEUR PAR DEFAUT)
;
M8029 D1
; ----------------------------------
; [ Configuration du type de limite des interfaces E1 et E2 de détection de rupture de filament ]
; 1: Même type de limite que XYZ          
; -1: Type de limite opposé à XYZ (VALEUR PAR DEFAUT)
;
M8029 E-1
M8029 P-1
; ==================================
;
; ==================================
; [ Contrôle du ventilateur de la tête d'extrusion ]
;
; Ce ventilateur refroidit le modèle, il est recommandé de définir l'activation et la désactivation du ventilateur dans le logiciel de découpe / slicing
; >0: Si vous devez forcer l'activation du ventilateur de la tête d'extrusion lorsque la température dépasse une certaine valeur, définissez une température supérieure à 0.
; 0: Si défini à 0, l'activation du ventilateur de la tête est contrôlée par le logiciel de découpe (VALEUR PAR DEFAUT)
;
M8030 I0
;
; --------------------------------------
;
; [ Contrôle du ventilateur de la buse ]
;
; Ce ventilateur est utilisé pour refroidir la buse. La température de démarrage automatique doit être définie après la commande M8030 I0.
; Le paramètre après I représente la température, lorsqu'il est 0, cela signifie que le ventilateur de la carte mère ne changera pas avec la température, sinon, lorsque la température de la tête d'extrusion atteint la température spécifiée, le ventilateur s'activera.
; 50°c = I50 (VALEUR PAR DEFAUT) 
;
M8030 I50 T-1
;
; ==================================
;
; ==================================
; [ Définir le décalage en mm de la deuxième tête d'extrusion (tête d'extrusion droite) ]
;
; S'il y a une  seule tête, les deux paramètres suivants sont invalides -> définissez le décalage double tête à 0 dans Cura ou autres sclicer. 
; Décalage sur l'axe X en mm (gauche-droite) 35mm -> S-35 (VALEUR PAR DEFAUT)
;
M8031 S-35
;
; ------
;
; [ Décalage sur l'axe Y (avant-arrière) ]
;
; 0mm -> S0 (VALEUR PAR DEFAUT)
;
M8032 S0
;
; ==================================
;
; ==================================
; [ Support des dossiers sur la carte SD ]
;
; 0: Non supporté
; 1: Supporté (VALEUR PAR DEFAUT)
;
M8034 I1
;
; ==================================
;
; ==================================
; [ Points de test de nivellement ]
;
; Minimum 3 points... Maximum 5 points, X, Y sont des nombres flottants, si X, Y sont tous deux inférieurs à 1, cela signifie le rapport par rapport à la course, sinon cela signifie les coordonnées absolues X, Y, en mm
; Si la course est (200,200), alors M8036 X0.1 Y0.1 a le même effet que M8036 X20 Y20, si la valeur absolue est inférieure à 1, cela signifie un rapport, sinon ce sont des coordonnées absolues
; Nombre de points de nivellement 3 = I3 (VALEUR PAR DEFAUT)
;
M8035 I3
;
; Dans le test de nivellement manuel XYZ et delta, il y a autant de points qu'il y a de cette commande.
; si c'est un nivellement automatique delta, la position du premier point est la distance entre le capteur et le centre de la tête d'extrusion (droite arrière est positive), les autres paramètres de point sont invalides
;
M8036 X10 Y10
M8036 X320 Y10
M8036 X165 Y240
M8036 X0.2 Y0.8 ; YS : Mais pourquoi 4 points alors que 3 definis par M8035 ? -> 5 points plus logique !
; ==================================
;
; ==================================
; [ Type de capteur de température ] 
;
; Veuillez définir le type de thermistance correct
; La différence de température affichée peut atteindre 40 degrés, selon le type de thermistance :
; 0: Thermistance NTC 100K 1% 3950 B idéale
; 1: Thermocouple de type K (VALEUR PAR DEFAUT)
; 2: Thermistance NTC 100K 1% 3950 B, correspond au type de capteur 1 de Marlin, la grande majorité sur le marché sont de ce type
;
M8081 I1
;
; ==================================
;
; ==================================
; [ Activer le nivellement automatique ] 
;
; 0: Désactiver l'activation du nivellement automatique (dans la structure XYZ, cela deviendra automatiquement un mode de nivellement semi-automatique, recherchez "赤兔主板——调平点配置" sur Youku)
; 1: Autoriser l'activation du nivellement automatique (par defaut)
; note : Le nivellement automatique de la structure XYZ, l'interrupteur de nivellement est directement connecté à Z-, enlevez l'interrupteur de limite d'origine, en même temps utilisez la commande M8084 Z*
;
; M8083 I1
;
; ==================================
; [Angle de levage et d'abaissement du servomoteur lors du nivellement ]
;
; Note : Uniquement valide lorsque le nivellement automatique est activé !
; Note de YS 06_09_2024 : C'est pas clair QIDI ... peut-on regler le plateau et faire des tilt sur la QIDI IFAST ?
; D après l'angle de levage du servomoteur, P après l'angle d'abaissement du servomoteur, si les deux angles sont les mêmes, cela signifie qu'aucun support de servomoteur n'est nécessaire.
; L'angle que le servomoteur peut atteindre est déterminé par le servomoteur spécifique, un servomoteur à angle de rotation de 180 degrés, notre plage de test mesurée est comprise entre -85 et 105 degrés
M8083 D0 P0
M8083 C-45.0 R372.0 ; C après le paramètre de position de limite logicielle gauche de l'axe X, R après le paramètre de position de limite logicielle droite de l'axe X
;
; ==================================
; [ Décalage de limite de nivellement Z, paramètre avancé, ne pas modifier ]
;
; La hauteur de décalage de limite de nivellement Z sur les machines de nivellement automatique XYZ = position Z de limite de nivellement - position zéro Z
;
; 0: Désactiver le décalage, la course Z est déterminée par "définir Z comme zéro", les instructions gcode d'impression n'ont pas besoin d'ajouter des instructions de nivellement automatique, ce mode est recommandé
; non-0: La position actuelle de Z est déterminée automatiquement lorsque la limite de nivellement est déclenchée, dans la structure DELTA,
; l'instruction de nivellement automatique G29 doit être connectée après l'instruction de retour à zéro G28, avant les instructions d'impression.
; Si la limite de nivellement est photoélectrique, c'est généralement une valeur positive,
; !!!! ATTENTION ( Pb de traduction ci dessous !!! )
; Si la limite est lorsque la tête d'extrusion colle à la carte mère, alors c'est une valeur négative.
; VS 
; Si la limite est lorsque la tête d'extrusion colle au plateau c'est une valeur négative ?
;
M8084 Z0.15
;
; ==================================
; [ Durée d'afichage du logo de démarrage ]
;
; Minimum 100ms, maximum 6000ms -> 3 secondes = I3000 (VALEUR PAR DEFAUT)
;
M8085 I3000
;
; ==================================
; [Durée de l'économiseur d'écran]
;
; Durée d'inactivité avant d'entrer en mode économiseur d'écran, en secondes (s).
; 0, cela signifie que l'économiseur d'écran est désactivé (VALEUR PAR DEFAUT)
;
M8085 T0
; ==================================
;
; ==================================
; [ Fonction d'arrêt automatique en veille (nécessite le module de fonction d'arrêt après impression) ]
;
; Durée d'inactivité avant d'éteindre la machine, cette fonction ne peut être utilisée que si le module de fonction d'arrêt après impression est installé,
; en secondes (s), lorsque la valeur est 0, cela signifie que la fonction d'arrêt automatique en veille est désactivée
; P0 (VALEUR PAR DEFAUT)
;
M8085 P0
;
; ==================================
;
; ==================================
; [ Division logicielle ] ( Attention ne pas modifier ce paramètre !)
; Division logicielle, certains utilisateurs utilisent des moteurs avec un pas de 0.9 degré ou des pilotes externes avec 32 micro-pas,
; souhaitant atteindre un pas de 1.8 degré ou 16 micro-pas, vous pouvez définir la division à 2, par défaut à 1 (VALEUR PAR DEFAUT), sans division
; I1 (VALEUR PAR DEFAUT)
;
M8086 I1
;
; ==================================
; [ Réglages intensité en mA des moteurs ]
;
; Le paramètre S représente le courant du pilote / driver.
; La valeur du courant du pilote est recommandé entre 200 et 1500mA (maximum 2000mA), au-dessus de 1000mA, Ajouter un ventilateur de refroidissement.
;
; ------ Configuration du courant du moteur X, S après représente le courant du pilote, en milliampères mA -------
M8091 I0 S650 P3 D3 C5 R6 F5 T0	
; ==================================
; ------ Configuration du courant du moteur Y, S après représente le courant du pilote, en milliampères mA -------
M8091 I1 S650 P3 D3 C5 R6 F5 T0
; ==================================
; ------ Configuration du courant du moteur Z, S après représente le courant du pilote, en milliampères mA -------
M8091 I2 S325 P3 D3 C5 R6 F5 T0
; ==================================
; ------ Configuration du courant du moteur E, S après représente le courant du pilote, en milliampères mA -------
M8091 I3 S650 P3 D3 C5 R6 F5 T0
; ==================================
; ------ Configuration du courant du moteur E2, S après représente le courant du pilote, en milliampères mA -------
M8091 I4 S650 P3 D3 C5 R6 F5 T0
; ==================================
; ------ Configuration du courant du moteur EXT, S après représente le courant du pilote, en milliampères mA -------
M8091 I5 S800 P3 D3 C5 R6 F5 T0
; ==================================
; ------ Configuration du courant du moteur Z2, S après représente le courant du pilote, en milliampères mA -------
M8091 I6 S325 P3 D3 C5 R6 F5 T0
; ==================================
;
; ==================================
; [ ?????????????????? ]
;
; Note YS : Cette commande semble être utilisée pour le remappage des broches (pin remapping).
; Le paramètre I0 pourrait indiquer que le remappage des broches est désactivé
; Cette commande semble être une commande de configuration spécifique au firmware ou à la carte mère utilisée
;
M8092 I0
;
; ==================================

; [ PWM du ventilateur de la carte mère lors de l'auto-démarrage ]
;
; Reglage du rapport PWM du ventilateur de la carte mère lors de l'auto-démarrage, le maximum est 256, certains ventilateurs de carte mère ont une puissance de ventilation assez forte et un bruit assez élevé. Vous pouvez changer ce paramètre pour modifier la puissance du ventilateur (et donc le bruit).
: 230 (VALEUR PAR DEFAUT)  -> I230
;
M8489 I230
;
; ==================================
;
; ==================================
; [ Vitesse d'extrusion de l'interface de filament ]
;
; Dans l'interface de filament, la vitesse d'extrusion du filament, en mm/s,
; une vitesse d'extrusion trop rapide peut provoquer une extrusion insuffisante, entraînant des pertes de pas de l'extrudeuse
;
M8489 T2
;
; ==================================
;
; ==================================
; [ Action après l'impression ]
; 0: Éteindre tous les moteurs & le chauffage. (VALEUR PAR DEFAUT)
; 1: Ne rien faire après l'impression, suivre complètement les instructions gcode
; 2: Retour à l'origine après l'impression, les moteurs ne sont pas coupés
; 3: Descendre à la course maximale de Z après l'impression, les moteurs ne sont pas coupés
; 4: Attendre que la température de la tête d'extrusion 1 descende à 50 degrés avant de signaler la fin de l'impression
;
M8489 P0
;
; ==================================
; [ Réglages des paramètres PID de température ]
;
; Par defaut [M301 P18 I1.08 D98]
; Si vous n'êtes pas un expert et que votre contrôle de température actuel est assez stable, vous n'avez pas besoin de modifier ce paramètre.
; Configurez d'abord, veuillez cocher la case devant
;M301 P10.9 I0.22 D180 ;(pour mémoire VALEUR PAR DEFAUT)
;M302 P10.9 I0.22 D180 ;(pour mémoire VALEUR PAR DEFAUT)
;
M301 P10.9 I0.22 D180
M302 P10.9 I0.22 D180
;
; ==================================
;
; ==================================
; [ Support laser ]
;
; 1: Supporte les configurations de gravure laser
; 0: Ne supporte pas les configurations de gravure laser, les fonctionnalités associées sont définies dans le bouton "more" (VALEUR PAR DEFAUT)
;
M8520 I0
;
; ==================================
;
; [ Réglage de la température initiale de la chambre chauffante ]
; 80°c (VALEUR PAR DEFAUT)
;
M8525 I80
;
; ==================================
;
; [ Avertissement de fenêtre contextuelle pour insuffisance de puissance de chauffage ou capteur de température non fonctionnel ]
;
; 1: Activer l'avertissement (VALEUR PAR DEFAUT)
; 0: Désactiver l'avertissement
;
M8525 T1
;
; ==================================
; [ Activer l'affichage de la détection de rupture de filament ]
;
; 1 Activer affichage de la détection de rupture de filament (VALEUR PAR DEFAUT)
; 0 Désactiver affichage de la détection de rupture de filament
;
M8528 I1
;
; ==================================
; [ Coordonnées X et Y après retour à l'origine ]
;
;M8100 D-9.5  ; Coordonnée X après retour à l'origine (pour mémoire VALEUR PAR DEFAUT)
;M8100 P0  ; Coordonnée Y après retour à l'origine (pour mémoire VALEUR PAR DEFAUT)
;
M8100 D-9.5  ; Coordonnée X après retour à l'origine
M8100 P0  ; Coordonnée Y après retour à l'origine
;
; ==================================
; [ Fréquence PWM du ventilateur MB_FAN de la tête d'extrusion 1 et 2]
;
; I Fréquence PWM du ventilateur MB_FAN de la tête d'extrusion 1, plage 1 octet de [0..255] -> 255 = I255 (VALEUR PAR DEFAUT)
; T Fréquence PWM du ventilateur MB_FAN de la tête d'extrusion 2, plage 1 octet de [0..255] -> 255 = T255 (VALEUR PAR DEFAUT)
M8529 I255 T255
;
; ==================================
; [ Intervalle de temps (secondes) de détection de changement de température ]
;
; D Intervalle de temps de détection de changement de température (vérifie la température toutes les 3 secondes) (VALEUR PAR DEFAUT)
; P Durée totale de l'avertissement de température (25 secondes sans chauffage à 40 degrés pour le lit chauffant, 140 degrés pour la tête d'extrusion 1)
M8101 D3 P25
;
; ==================================
; [ Paramètres PID de température du lit chauffant ]
;
M304 P71.039 I2.223 D567.421	; Paramètres PID de température du lit chauffant
;
; 0 Désactiver le PID du lit chauffant
; 1 Activer le PID du lit chauffant (VALEUR PAR DEFAUT) 
; 
M8600 I1
;
; ==================================
; [ Température de la tête d'extrusion pendant la pause ]
;
; 0, Ne pas abaiser température de la tête lors d'une pause
; 1, Abaiser températurede la tête lors d'une pause (VALEUR PAR DEFAUT)
(VALEUR PAR DEFAUT)
M8530  I1
;
; ==================================
;
; [ Sauvegarder les paramètres ]
;
; Indispensable, sinon les paramètres ne seront pas sauvegardés sur l'appareil
; Sauvegarder la configuration
;
M8500
;
; ==================================
; [ ?????? Fonction ?????? ]
;
; Note YS 06_09_2024 : Semble être une commande spécifique à un certain type de carte mère ou de firmware d'imprimante 3D, pas standard dans les firmwares open-source comme Marlin
;
M7507 I1 T0
; 
