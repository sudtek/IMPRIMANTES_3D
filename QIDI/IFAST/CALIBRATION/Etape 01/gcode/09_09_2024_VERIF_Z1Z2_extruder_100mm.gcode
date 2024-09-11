; 09_09_2024 
; QIDI IFAST
; Procedure de verification de la valeur E des moteurs pas à pas des extrudeurs

; Extrudeur situé à main gauche Z2 T1 sur QIDI IFAST
; - PETG 235°c
; - 100% de debit
; - Longueur de calibrage 100mm

; Extrudeur situé à main droite Z1 T0 sur QIDI IFAST
; - PLA 205°c
; - 100% de debit
; - Longueur de calibrage 100mm

; Firmware: Basé sur Marlin (ce n'est pas un pur Marlin)
; Custom Toolhead: T1 T0

; ----------------------------------------------------
; ----------------------------------------------------
; ----------------------------------------------------
; ----------------------------------------------------

; ----------------------------------------------------
; Fixe les Débits d'écoulement à 100% des deux buses
M221 T1 S100.00
M221 T0 S100.00
; ----------------------------------------------------

; ----------------------------------------------------
; Debut de sequence de Homming
G28
; Deplacement pour homing en position (0,0) vitesse 3600
G0 X0 Y0 F3600
; ----------------------------------------------------

; ----------------------------------------------------
; Fixer la temperature des deux buses

; Buse de gauche Z2 alias T1 pour du PETG à 235°c 
M109 T1 S235

; Buse de droite Z1 alias T0 pour du PLA à 205°c
M109 T0 S205

; Note : M109 attend que la temperature de consigne soit atteinte avant de continuer -> ne pas remplacer par M104
; ----------------------------------------------------

; ----------------------------------------------------
; Extrudeur Z2 (main gauche) alias T1 filament PETG
T1

; Pas de ventilation de la buse / No fan
M107

; Fixe la nouvelle position de l'extruder E <pos> E0 = initialisation
;G92 E0
G1 X330 E0 F2400

; Extrude 100mm de filament à vitesse constante maximum ente le debut et la fin d'extrusion de 125
G1 E100 F125
; ------------------------------------------------

; ------------------------------------------------
; Extrudeur Z1 (main droite) alias T0
T0

; Pas de ventilation de la buse / No fan
M107

; Fixe la nouvelle position de l'extruder E <pos> E0 = initialisation
;G92 E0
G1 X330 E0 F2400

; On extrude 100mm de filament à vitesse constante maximum ente le debut et la fin d'extrusion de 125
G1 E100 F125
; ------------------------------------------------
