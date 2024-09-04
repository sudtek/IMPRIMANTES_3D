; 03_septembre_2024
; Ifast QIDI
; Procedure de sauvegarde de la valeur E de chaque moteur pas à pas des extrudeurs Z1 & Z2
; QIDI IFAST : T0 = buse de droite = Z1
; QIDI IFAST : T1 = buse de gauche = Z2

; Définir le pas/mm pour E
; S -> Z1 -> T0 -> buse de droite
; P -> Z2 -> T1 -> buse de gauche

; Note : QIDI Quelle précision après la virgule acceptée ?

; Terminer l'étap 01 de calibration : 
; #1 Changer les valeurs de S et de P avec vos valeurs 
; #2 Imprimer ce gcode sur la QIDI IFAST pour sauvegarder les valeurs
; #3 Faites un reboot de la QIDI IFAST

M8011 S0.0068 P0.0070
