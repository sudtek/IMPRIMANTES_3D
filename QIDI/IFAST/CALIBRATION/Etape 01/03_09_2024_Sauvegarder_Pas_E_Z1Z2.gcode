; 03_septembre_2024
;
; but : Définir le pas/mm pour E de Z1 = S ? et Z2 = P ?
; QIDI IFAST : T0 = buse de droite = Z1
; QIDI IFAST : T1 = buse de gauche = Z2
; S -> Secondary Z2 ?
; P -> Primary Z1 ?
; Note : Quelle précision après la virgule acceptée ?
; Terminer l'étap 01 de calibration : 
; #1 Changer les valeurs de S et de P avec vos valeurs 
; #2 Imprimer ce gcode sur la QIDI IFAST pour sauvegarder les valeurs
; #3 Faites un reboot de la QIDI IFAST
M8011 S0.0068 P0.0070
