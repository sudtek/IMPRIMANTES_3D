Ce qu'il va falloir faire ....

<s>
;//FAIT
; A faire Fixer avant la temperature de la buse et attendre X minutes
; exemple : ideal extruding length is 100mm,but actually it flew out 93mm.
; So the correct e step should be 93*0.0073/100,it is 0.006789
;//FAIT
</s>
;
;Bloc 1 : Pour régler indépendamment les paramètres des moteurs pas-à-pas XY, utilisez cette commande (cochez la case dans le cadre ci-dessus).
M8009 X0.010625 Y0.010625

;Bloc 2 : La valeur en mm de chaque pas est calculée à l'aide de la formule suivante : pas (360/18)*16. Le pas est la distance que la plate-forme monte lorsque la vis tourne d'un tour.
M8010 S0.0025

**
;
;Bloc 3 : La valeur en mm de chaque pas est égale à la circonférence de la roue d'entraînement d'extrusion divisée par 3200.
;         Si vous avez un dispositif de réduction, divisez également par le rapport de réduction. Si vous constatez que le filament est extrudé de manière trop lâche, ou... 
          Une nouvelle suggestion est de rendre cette valeur légèrement inférieure à la valeur réelle, l'extrusion sera meilleure.
;M8011 S0.0073 P0.0073
;M8011 S0.0067 P0.0067
;**

;Bloc 4 : Vitesse maximale pour les mouvements XY en mm/s. Afin d'assurer la stabilité de la machine, veuillez régler cette valeur en fonction des résultats de vos tests.
M8012 1200

Bloc 5 : Vitesse maximale pour les mouvements Z en mm/s.
M8013 110

;Bloc 6 : Vitesse maximale de l'extrudeur en mm/s.
M8014 1120
 
;Bloc 7 : La première vitesse de homing de l'axe Z. La vitesse est relativement rapide. Le logiciel de découpage MakerWare ignorera cette vitesse de homing car le G-code qu'il génère spécifie une vitesse de homing.
Explications supplémentaires (basées sur les commentaires)
* Paramètres des moteurs pas-à-pas: Les commandes M8009 et M8010 permettent de régler la précision des mouvements des axes X et Y en fonction des caractéristiques des moteurs et de la vis mère.
* Calcul du pas: Le commentaire explique comment calculer le pas de l'axe Z en fonction du pas de la vis mère. Cette valeur est essentielle pour une extrusion précise du filament.
* Vitesse d'extrusion: La commande M8011 et le commentaire associé concernent la vitesse maximale à laquelle le filament peut être extrudé. Une valeur trop élevée peut entraîner des problèmes d'adhérence ou de sous-extrusion.
* Vitesses maximales: Les commandes M8012, M8013 et M8014 définissent les vitesses maximales pour les mouvements des axes X, Y et Z, ainsi que pour l'extrusion. Ces valeurs doivent être ajustées en fonction des capacités de la machine et du matériau utilisé.
* Homing de l'axe Z: Le dernier commentaire mentionne que la vitesse de homing de l'axe Z peut être ignorée par certains logiciels de découpage, car ils spécifient leur propre vitesse dans le G-code généré.
