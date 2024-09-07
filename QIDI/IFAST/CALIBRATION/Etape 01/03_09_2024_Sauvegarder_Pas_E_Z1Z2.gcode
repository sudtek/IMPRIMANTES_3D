; 07_septembre_2024
; Ifast QIDI
; Procedure de sauvegarde de la valeur E de chaque moteur pas à pas des extrudeurs Z1 & Z2
; QIDI IFAST : T0 = buse de droite = Z1
; QIDI IFAST : T1 = buse de gauche = Z2
;
;
;???????????????????
;M8513 ; Semble être une commande spécifique à un certain type de carte mère ou de firmware d'imprimante 3D, pas standard dans les firmwares open-source comme Marlin
;
; ==================================
;
; [ Support de sauvegarde  / backup en cas de coupure de courant ]
;
; Le réglage prend effet après redémarrage.
; I1 signifie backup activé (VALEUR PAR DEFAUT)
; I0 signifie backup desactivé 
;
;M8000 I1
;
; ==================================
;
; [ Support de l'arrêt de l'imprimante ]
;
; I1 Active le support de l'arrêt de l'imprimante. (VALEUR PAR DEFAUT)
; I0 signifie non supporté, le réglage prend effet après redémarrage
;
;M8001 I1
;
; ==================================
;
;
; Définir le pas/mm pour E
; S -> Z1 -> T0 -> buse de droite
; P -> Z2 -> T1 -> buse de gauche

; Note : QIDI Quelle précision après la virgule acceptée ?

; Terminer l'étap 01 de calibration : 
; #1 Changer les valeurs de S et de P avec vos valeurs 
; #2 Imprimer ce gcode sur la QIDI IFAST pour sauvegarder les valeurs
; #3 Faites un reboot de la QIDI IFAST

M8011 S0.0068 P0.0070

; [ Sauvegarder les paramètres ]
; Indispensable, sinon les paramètres ne seront pas sauvegardés sur l'appareil
; Sauvegarder la configuration
M8500
