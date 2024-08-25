; 23_08_2024 
; Ifast QIDI
; Procedure de calibration des moteur pas à pas des extrudeurs
,
; Extrudeur situé à main gauche Z2
; - PETG 235°c
; - 100% de debit
; - Longueur de calibrage 100mm

; Extrudeur situé à main droite Z1
; - PLA 205°c
; - 100% de debit
; - Longueur de calibrage 100mm

;Firmware: Marlin
;Custom Toolhead: T1 T0

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

; Buse de gauche Z0 alias T1 pour du PETG à 235°c 
M109 T1 S235

; Buse de droite Z1 alias T0 pour du PLA à 205°c
M109 T0 S205

; Note : M109 attend que la temperature de consigne soit atteinte avant de continuer -> ne pas remplacer par M104
; ----------------------------------------------------

; ----------------------------------------------------
; Extrudeur Z2 (gauche) alias T1 filament PETG
T1

; Pas de ventilation de la buse / No fan
M107

; Fixe la nouvelle position de l'extruder E <pos> E0 = initialisation
G92 E0
G1 X330 E0 F2400

; Extrude 100mm de filament à vitesse constante maximum ente le debut et la fin d'extrusion de 125
G1 E100 F125
; ------------------------------------------------

; ------------------------------------------------
; Extrudeur Z1 (droite) alias T0
T0

; Pas de ventilation de la buse / No fan
M107

; Fixe la nouvelle position de l'extruder E <pos> E0 = initialisation
G92 E0
G1 X330 E0 F2400

; On extrude 100mm de filament à vitesse constante maximum ente le debut et la fin d'extrusion de 125
G1 E100 F125
; ------------------------------------------------

; ------------------------------------------------
; ------------------------------------------------
; ------------------------------------------------
; ------------------------------------------------
; Note : 
; Effectuer un test de calibrage avec une longueur minimum de 100mm à 1000 mm maximum de filament
; Mesurer les sur(-) ou sous(+) extrusions des deux filaments pour calculer la compensation de chacun des extrudeurs.
; Appliquer la formule suivant pour calculer le nouveau E :
;
; Exemple : Si on fixe la longueur à extruder à 100mm, mais que seulement 93mm on été extrudés il reste +7mm donc un cas de sous extrusion.
; 100-93=+7mm
; le E correct doit être 93*0.0073/100 = 0.006789
;
; Exemple de Tests realisés sur ma IFAST avec debit 100% pour 100mm
; Extruder de gauche PETG 235°c sous extrusion reste de +4 mm -> (100-4)*0.0073/100 = 0.007008
; Extruder de droite PLA 205°c sous extrusion reste de +6.2 mm -> (100-6.2)*0.0073/100 = 0.0068474
; ------------------------------------------------
; ------------------------------------------------
; ------------------------------------------------
; ------------------------------------------------
