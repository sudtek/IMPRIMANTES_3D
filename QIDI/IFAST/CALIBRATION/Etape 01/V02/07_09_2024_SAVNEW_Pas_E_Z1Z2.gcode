; 07_septembre_2024
; Ifast QIDI
; Procedure de sauvegarde de la valeur E de chaque moteur pas à pas des extrudeurs Z1 & Z2

; QIDI IFAST : T0 = buse de droite = Z1 = S
; QIDI IFAST : T1 = buse de gauche = Z2 = P

; Terminer l'étap 01 de calibration : 
; #1 Changer les valeurs de S et de P avec vos valeurs 
; #2 Imprimer ce gcode sur la QIDI IFAST pour sauvegarder les valeurs
; #3 Faites un reboot de la QIDI IFAST
;
; Valeurs par defaut de  S0.0073 et  P0.0073
; P -> Z2 -> T1
; S -> Z1 -> T0
M8011 S0.0069 P0.0069

; [ Sauvegarder les paramètres ]
; Indispensable, sinon les paramètres ne seront pas sauvegardés sur l'appareil
; Sauvegarder la configuration
M8500
