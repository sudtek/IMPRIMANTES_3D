; 09_septembre_2024
; QIDI Ifast
; Restorer les valeurs E de chaque moteur pas à pas des extrudeurs Z1 & Z2
; Valueurs par defaut S = P 0.0073
;
; QIDI IFAST : T0 = buse de droite = Z1 = S
; QIDI IFAST : T1 = buse de gauche = Z2 = P
;
; Valeurs par defaut de  S0.0073 et  P0.0073
M8011 S0.0073 P0.0073
;
; [ Sauvegarder les paramètres ]
; Indispensable, sinon les paramètres ne seront pas sauvegardés
; Sauvegarder la configuration
M8500
;
; Faire un reboot de l'imprimante.
