#!/usr/bin/env python3
#
# 31/10/2024 (JJ/MM/YYYY)
# nom du script : Z2_generate.py
# Version : V01
# Version interpreter python : 3.7.0 64 bits
#
# Contenu : Script interactif génerateur de fichier .gcode permet de caractériser le debit en % d'un filament pour Z2 (gauche) sur impriante 3D QIDI-IFAST dual. 
# Il génère 11 cubes 20x20x20 (mm) en lignes etiquetés de A à K avec des % de débits décroissants de gauche à droite par pas constant de -0.1% ou -1%
# Il ainsi possible de caractériser un nouveau filament sans avoir à editer et modifier le fichier sources sous IDEAMAKER et regénérer le fichier gcode.
# Le fichier Template "26_10_2024_Z2_Calibration_[X%..Y%]_Pas_N%_TEMPLATE_01.gcode" en lecture seule doit impéraitevment être dans le même repertoire que le script. 
#
# yannick SUDRIE

import os
import platform
from datetime import datetime

def cls():
    if platform.system() == "Windows":
        os.system('cls')
    else:
        os.system('clear')

def resume():
        while True:
            touchePresse = input(f"\n Presser la touche (C) pour continuer ou Presser (X) pour quitter ! ")
            if (touchePresse.upper() == "C") : 
                break
            if (touchePresse.upper()  == "X") : exit(1)
    

# VAR fichier TEMPLATE à utiliser pour rechercher et remplacer les valeurs 
FICHIER_TEMPLATE = "26_10_2024_Z2_Calibration_[X%..Y%]_Pas_N%_TEMPLATE_01.gcode"
# Vérifiez si le fichier template existe dans le repertoire courant 
if not os.path.isfile(FICHIER_TEMPLATE):
    print(f"Le fichier template '{FICHIER_TEMPLATE}' n'a pas été trouvé ou est absent !")
    exit(1)

# VAR INFORMATIONS IMPRIMANTE 3D
IMPRIMANTE3D_MARQUE = "QIDI"
IMPRIMANTE3D_MODELE = "IFAST"
IMPRIMANTE3D_SPE = "Type Double extrusion / dual (pas IDEX) "

# VAR INFORMATION / PRESENTATION / UTILISATION / UTILISATEUR
PRESENTATION = "\n Ce script interactif en 16 questions génère un fichier .gcode custom pour caracteriser votre filament sur l'imprimante 3D " + IMPRIMANTE3D_MARQUE + " " + IMPRIMANTE3D_MODELE  + " " + IMPRIMANTE3D_SPE + "."
INFORMATION = " \n Il est uniquement utilisable afin de caractériser le filament localisé à main gauche buse Z2 \n La dimension de référence des parois de cube est de 1.6mm (0.4mm * 4 coques)"
UTILISATION = " \n Ce reporter au tutoriel d'utilisation : https://github.com/sudtek/IMPRIMANTES_3D/tree/35fbb7b4d120f7a413834af2183f85b400363702/QIDI/IFAST/CALIBRATION/Etape%2004"

cls() # Effacer le terminal / Nettoyer la console

print(PRESENTATION + INFORMATION + UTILISATION)

# VAR
DEBIT_GLOBAL_DEFAUT = 100.00 # 100.00%
DEBIT_GLOBAL_BMAX_DEFAUT = 200.00 # 200.00%
DEBIT_GLOBAL_BMIN_DEFAUT = 20.00 # 20.00%

# Informations BUSES Z1 & Z2
FILAMENTS_DIAMETRE_DEFAUT = 1.750 # 1.750mm 
FILAMENTS_DIAMETRE_BMAX_DEFAUT = 2.5 # 2.5mm 
FILAMENTS_DIAMETRE_BMIN_DEFAUT = 1.0 # 1.0mm 
BUSES_TEMPERATURE_BMAX_DEFAUT = 300 # 300°c Attention les tubes PTFE standards fondent aux alentours des 280°c
BUSES_TEMPERATURE_BMIN_DEFAUT = 180 # 180°c Attention en dessous de 180°c les materiaux ne peuvent être extrudés il y a un risque pour la tête

# Filament Buse de droite Z1 
FILAMENT_Z1_DROITE_DIAMETRE = FILAMENTS_DIAMETRE_DEFAUT # 1.75mm  
FILAMENT_Z1_DROITE_TEMPERATURE = 205 # 205°c 
FILAMENT_Z1_DROITE_DEBIT = 100.00 # !!!! oujours à 100% par defaut ne pas toucher !!!
FILAMENT_Z1_DROITE_TYPE = "PLA"
FILAMENT_Z1_DROITE_COULEUR = "Mauve"
FILAMENT_Z1_DROITE_NOM =  IMPRIMANTE3D_MARQUE + "-" + IMPRIMANTE3D_MODELE + " " + FILAMENT_Z1_DROITE_TYPE + " " + FILAMENT_Z1_DROITE_COULEUR # Ex :  QIDI-IFAST PLA Mauve
FILAMENT_Z1_DROITE_DENSITE =  1240.00  # densité ? ou module de young ? necesite une question ?
FILAMENT_Z1_DROITE_MARQUE =  "SUNLU"  # Votre marque par defaut  

# Filament Buse de gauche Z2 (Le filament à caracteriser est sur cet extrudeur )
FILAMENT_Z2_GAUCHE_DIAMETRE = FILAMENTS_DIAMETRE_DEFAUT  # 1.75mm 
FILAMENT_Z2_GAUCHE_TEMPERATURE = 235 # 235°c 
FILAMENT_Z2_GAUCHE_DEBIT = 100.00 # !!!! oujours à 100% par defaut ne pas toucher !!!
FILAMENT_Z2_GAUCHE_TYPE = "PETG"
FILAMENT_Z2_GAUCHE_COULEUR = "Blanc" 
FILAMENT_Z2_GAUCHE_NOM =  IMPRIMANTE3D_MARQUE + "-" + IMPRIMANTE3D_MODELE + " " + FILAMENT_Z2_GAUCHE_TYPE + " " + FILAMENT_Z2_GAUCHE_COULEUR # Ex :  QIDI-IFAST PETG BLanc
FILAMENT_Z2_GAUCHE_DENSITE = 1240.00 # densité ? ou module de young ? necesite une question ?
FILAMENT_Z2_GAUCHE_MARQUE =  "SUNLU"  # Votre marque par defaut

# Plateau 
PLATEAU_TEMPERATURE_DEFAUT = 65 # 65°c
PLATEAU_TEMPERATURE = PLATEAU_TEMPERATURE_DEFAUT # Attention la temperature du plateau depend du filament à caractériser ici 65°c est une valeur par defaut pour le PETG
PLATEAU_TEMPERATURE_BMAX_DEFAUT = 130 # 130°c
PLATEAU_TEMPERATURE_BMIN_DEFAUT = 0 # 0°c -> Plateau chauffant desactivée

# Enceinte
ENCEINTE_TEMPERATURE_DEFAUT = 40 # 40°c
ENCEINTE_TEMPERATURE = ENCEINTE_TEMPERATURE_DEFAUT # Attention la temperature de l'enceinte depend du filament à caractériser ici 40°c est une valeur par defaut pour le PETG
ENCEINTE_TEMPERATURE_BMAX_DEFAUT = 100 # 100°c
ENCEINTE_TEMPERATURE_BMIN_DEFAUT = 0 # 0°c -> enceinte desactivée

# Legende des lettres A à K sur le plateau devant chaque cube
LEGENDE_DEBIT_DEFAUT = 100.0 # %
LEGENDE_DEBIT = LEGENDE_DEBIT_DEFAUT
LEGENDE_DEBIT_BMAX_DEFAUT = 120.0 # %
LEGENDE_DEBIT_BMIN_DEFAUT = 80.0 # %

# Tour de purge avant d'imprimer les cube A à K
TOUR_DEBIT_DEFAUT = 100.0 # %
TOUR_DEBIT = TOUR_DEBIT_DEFAUT
TOUR_DEBIT_BMAX_DEFAUT = 120.0 # %
TOUR_DEBIT_BIN_DEFAUT = 80.0 # %

# Serie de cubes
CUBES_DEBIT_DEFAUT = 100.0 
CUBE_A_DEBIT = CUBES_DEBIT_DEFAUT # Débit du cube situé le plus à gauche etiquette A
CUBE_K_DEBIT = 0 # Débit du cube situé le plus à droite etiquette K (ne pas modifier valeur 0 juste pour initialisation propre)
CUBES_DEBIT_BMAX_DEFAUT = 120.0 # %
CUBES_DEBIT_BMIN_DEFAUT = 80.0 # %
CUBES_LISTE_PAS = ["0.1", "1"]  # Le pas ne peut prendre que deux valeurs 0.1 ou 1 de cette liste.

LISTE_CUBES= ["A","B","C","D","E","F","G","H","I","J","K"]  # Etiquettes des 11 CUBES (ne pas toucher de cubes !)

# On part du principe qu'il y a uniquement 11 cubes 20x20x20 creux / sans remplissages internes: ils sont disposés sur 1 ligne selon l'axe X format 11C x 1L (vue de face).
# Les cubes sont ordonnées de gauche à droite dans un ordre de débit décroissant; la légende etant amenée à varier il est plus judicieux d'utiliser des invariantes 
# de type lettres pour ordonner la série que des chiffres exemple :
# Une série de 11 cubes compris entre 91 et 90 par pas de 0.1 % : # BOX_A=91.0 ; BOX_B=90.9 ; BOX_C=90.8 ... BOX_K=90.0
# Une série de 11 cubes compris entre 100 et 90 par pas de 1 % : # BOX_A=100.0 ; BOX_B=99.0 ; BOX_C=98.0 ... BOX_K=90.0


resume() #  continuer ou quiter le script ?


# -------------------- DEBUT QUESTIONNAIRE ----------------------

# Demander à l'utilisateur de spécifier la valeur de PAS
while True:
    pas = input(f"\n Q1 / 16 -> Veuillez spécifier la valeur de PAS {CUBES_LISTE_PAS[0]} ou {CUBES_LISTE_PAS[1]} (valeur par defaut 1 %): ")
    if (pas == "") : # Permet de charger la valeur par defaut 1 %
        PAS = 1.0
        break

    if pas in CUBES_LISTE_PAS:
        PAS = float(pas)
        break
    else:
        print(f"Valeur invalide. Veuillez entrer {CUBES_LISTE_PAS[0]} ou {CUBES_LISTE_PAS[1]} !")
print(f"La valeur de PAS est : {PAS}" + " %")

# Demander à l'utilisateur de spécifier la valeur de debit max pour le cube A (le plus à gauche)
while True:
    cube_A_debit = input(f"\n Q2 / 16 -> Veuillez spécifier une valeur de debit Maximum [ {CUBES_DEBIT_BMIN_DEFAUT} .. {CUBES_DEBIT_BMAX_DEFAUT} ]% pour le cube A situé le plus à gauche (valeur par defaut {CUBES_DEBIT_DEFAUT} %)  ? : ")
    if (cube_A_debit == "") : break # Permet de charger la valeur par defaut
    if ((float(cube_A_debit) >= CUBES_DEBIT_BMIN_DEFAUT) and (float(cube_A_debit) <= CUBES_DEBIT_BMAX_DEFAUT)) :
        CUBE_A_DEBIT = round(float(cube_A_debit),1) # On utilise que des valeurs arrondies pour les cubes exemple 100,0%,99,1%,89,5% ...
        break
    else:
        print(f"Valeur invalide. Veuillez entrer un debit [ {CUBES_DEBIT_BMIN_DEFAUT} .. {CUBES_DEBIT_BMAX_DEFAUT} ]% !")
print(f"\n La valeur de debit (Maximum) pour le cube A situé le plus à gauche est : {CUBE_A_DEBIT}" + " %" )

# La valeur de debit min le cube K (le plus à droite) est automatiquement calculé !
# exemple : pour un CUBE_A_DEBIT de 100% alors CUBE_K_DEBIT vaut 90% si le pas = 1% et 99% si le pas = 0.1%
CUBE_K_DEBIT = CUBE_A_DEBIT - (10.0 * PAS)
print(f"\n La valeur de debit (Minimum) pour le cube K situé le plus à droite est de : {CUBE_K_DEBIT} %")

# ------------------------------------------------------------------------------------------------------------------------

# ----- Filament sur Z1  -----

# Demander à l'utilisateur de spécifier le diametre du filament Z1
while True:
    FZ1_diametre = input(f"\n Q3 / 16 -> Buse Z1 (DROITE) Veuillez spécifier le diamètre du filament (defaut {FILAMENTS_DIAMETRE_DEFAUT} mm) : ")
    if (FZ1_diametre == "") : break # Permet de charger la valeur par defaut
    if (float(FZ1_diametre) >= FILAMENTS_DIAMETRE_BMIN_DEFAUT) and (float(FZ1_diametre) <= FILAMENTS_DIAMETRE_BMAX_DEFAUT) : 
        FILAMENT_Z1_DROITE_DIAMETRE = float(FZ1_diametre)
        break
    else :
        print(f"Valeur invalide. Veuillez entrer un diamètre entre [ {FILAMENTS_DIAMETRE_BMIN_DEFAUT} .. {FILAMENTS_DIAMETRE_BMAX_DEFAUT} ]mm !")
print(f"Valeur du diamètre du filament Z1 : {FILAMENT_Z1_DROITE_DIAMETRE} mm")


# Demander à l'utilisateur de spécifier la température du filament Z1
while True:
    FZ1_temperature = input(f"\n Q4 / 16 -> Buse Z1 (DROITE) Veuillez spécifier la température du filament [ {BUSES_TEMPERATURE_BMIN_DEFAUT} .. {BUSES_TEMPERATURE_BMAX_DEFAUT} ]°c (defaut {FILAMENT_Z1_DROITE_TEMPERATURE} °c) : ")
    if (FZ1_temperature == "") : break # Permet de charger la valeur par defaut
    if (int(FZ1_temperature) >= int(BUSES_TEMPERATURE_BMIN_DEFAUT)) and (int(FZ1_temperature) <= int(BUSES_TEMPERATURE_BMAX_DEFAUT)) : 
        FILAMENT_Z1_DROITE_TEMPERATURE = int(FZ1_temperature)
        break
    else :
        print(f"Valeur invalide. Veuillez entrer une température entre [ {BUSES_TEMPERATURE_BMIN_DEFAUT} .. {BUSES_TEMPERATURE_BMAX_DEFAUT} ]°c !")
print(f"Valeur de la température du filament sur Z1 : {FILAMENT_Z1_DROITE_TEMPERATURE} °c")


# Demander à l'utilisateur de spécifier la matière du filament sur Z1
while True:
    FZ1_type = input("\n Q5 / 16 -> Buse Z1 (DROITE) Veuillez spécifier la matière du filament exemple PLA, ... : ")
    if (FZ1_type == "") : break # charge la valeur par defaut -> PLA
    if not (FZ1_type == "") : 
        FILAMENT_Z1_DROITE_TYPE = FZ1_type
        break
    else :
        print("Valeur invalide. Veuillez spécifier la matière du filament exemple PLA, PETG, ...  ! ")
print(f"Materiaux du filament sur Z1 : {FILAMENT_Z1_DROITE_TYPE}")


# Demander à l'utilisateur de spécifier la matière du filament sur Z1
while True:
    FZ1_couleur = input("\n Q6 / 16 -> Buse Z1 (DROITE) Veuillez spécifier la couleur du filament exemple Blanc, Mauve, ... : ")
    if (FZ1_couleur == "") : break # charge la valeur par defaut -> Mauve
    if not (FZ1_couleur == "") : 
        FILAMENT_Z1_DROITE_COULEUR = FZ1_couleur
        break
    else :
        print("Valeur invalide. Veuillez spécifier la couleur du filament exemple Blanc, Mauve, ...  ! ")
print(f"Couleur du materiaux du filament sur Z1 : {FILAMENT_Z1_DROITE_COULEUR}")


# Demander à l'utilisateur de spécifier la marque du filament sur Z1
while True:
    FZ1_marque = input("\n Q7 / 16 -> Buse Z1 (DROITE) Veuillez spécifier la marque du filament exemple Sunlu, ... : ")
    if (FZ1_marque == "") : break # charge la valeur par defaut -> Sunlu
    if not (FZ1_marque == "") : 
        FILAMENT_Z1_DROITE_MARQUE = FZ1_marque
        break
    else :
        print("Valeur invalide. Veuillez spécifier la marque du filament exemple Noname,Sunlu, ... ! ")
print(f"Marque du filament sur Z1 : {FILAMENT_Z1_DROITE_MARQUE}")


# ------------------------------------------------------------------------------------------------------------------------

# ----- Filament sur Z2  -----

# Demander à l'utilisateur de spécifier le diametre du filament Z2
while True:
    FZ2_diametre = input(f"\n Q8 / 16 -> Buse Z2 (GAUCHE) Veuillez spécifier le diamètre du filament (defaut {FILAMENTS_DIAMETRE_DEFAUT} mm) (OBLIGATOIRE) : ")
    # if (FZ2_diametre == "") : break # Permet de charger la valeur par defaut # ATTENTION Le diametre réel du filament à caracteriser doit imperativement être spécifié !!!! (ne pas effacer pour mémoire)
    if (FZ2_diametre == "") : FZ2_diametre = 0.0
    if (float(FZ2_diametre) >= FILAMENTS_DIAMETRE_BMIN_DEFAUT) and (float(FZ2_diametre) <= FILAMENTS_DIAMETRE_BMAX_DEFAUT) : 
        FILAMENT_Z2_GAUCHE_DIAMETRE = float(FZ2_diametre)
        break
    else :
        print(f"Valeur invalide. Veuillez entrer un diamètre [ {FILAMENTS_DIAMETRE_BMIN_DEFAUT} .. {FILAMENTS_DIAMETRE_BMAX_DEFAUT} ]mm !")
print(f"Valeur du diamètre du filament Z2 : {FILAMENT_Z2_GAUCHE_DIAMETRE} mm")


# Demander à l'utilisateur de spécifier la température du filament Z2
while True:
    FZ2_temperature = input(f"\n Q9 / 16 -> Buse Z2 (GAUCHE) Veuillez spécifier la température du filament [ {BUSES_TEMPERATURE_BMIN_DEFAUT} .. {BUSES_TEMPERATURE_BMAX_DEFAUT} ]°c (defaut {FILAMENT_Z2_GAUCHE_TEMPERATURE} °c) (OBLIGATOIRE) : ")
    if (FZ2_temperature == "") : break # Permet de charger la valeur par defaut
    if (int(FZ2_temperature) >= BUSES_TEMPERATURE_BMIN_DEFAUT) and (int(FZ2_temperature) <= BUSES_TEMPERATURE_BMAX_DEFAUT) : 
        FILAMENT_Z2_GAUCHE_TEMPERATURE = int(FZ2_temperature)
        break
    else :
        print(f"Valeur invalide. Veuillez entrer une température de filament entre [ {BUSES_TEMPERATURE_BMIN_DEFAUT} .. {BUSES_TEMPERATURE_BMAX_DEFAUT}]°c ! ")
print(f"Valeur de la température du filament sur Z2 : {FILAMENT_Z2_GAUCHE_TEMPERATURE} °c")


# Demander à l'utilisateur de spécifier la matière du filament sur Z2
while True:
    FZ2_type = input("\n Q10 / 16 -> Buse Z2 (GAUCHE) Veuillez spécifier la matière du filament ex PETG, ABS, ... (OBLIGATOIRE) : ")
    if (FZ2_type == "") : break # charge la valeur par defaut -> PETG
    if not (FZ2_type == "") : 
        FILAMENT_Z2_GAUCHE_TYPE = FZ2_type
        break
    else :
        print("Valeur invalide. Veuillez spécifier la matière du filament ex PLA, PETG, ... : ")
print(f"Materiaux du filament sur Z2 : {FILAMENT_Z2_GAUCHE_TYPE}")


# Demander à l'utilisateur de spécifier la matière du filament sur Z2
while True:
    FZ2_couleur = input("\n Q11 / 16 -> Buse Z2 (GAUCHE) Veuillez spécifier la couleur du filament ex Blanc, Mauve (OBLIGATOIRE) : ")
    if (FZ2_couleur == "") : break # charge la valeur par defaut -> Mauve
    if not (FZ2_couleur == "") : 
        FILAMENT_Z2_GAUCHE_COULEUR = FZ2_couleur
        break
    else :
        print("Valeur invalide. Veuillez spécifier la couleur du filament ex Blanc, Mauve, ...  !")
print(f"Couleur du materiaux du filament sur Z2 : {FILAMENT_Z2_GAUCHE_COULEUR}")

# Demander à l'utilisateur de spécifier la marque du filament sur Z2
while True:
    FZ2_marque = input("\n Q12 / 16 -> Buse Z2 (GAUCHE) Veuillez spécifier la marque du filament exemple Sunlu, ... : ")
    if (FZ2_marque == "") : break # charge la valeur par defaut -> Sunlu
    if not (FZ2_marque == "") : 
        FILAMENT_Z2_GAUCHE_MARQUE = FZ2_marque
        break
    else :
        print("Valeur invalide. Veuillez spécifier la marque du filament exemple Noname,Sunlu, ... ! ")
print(f"Marque du filament sur Z2 : {FILAMENT_Z2_GAUCHE_MARQUE}")
# ------------------------------------------------------------------------------------------------------------------------


# Demander à l'utilisateur de spécifier la température du plateau pour imprimer un filament via Z2 
while True:
    plateau_temperature = input(f"\n Q13 / 16 -> Veuillez spécifier la température du plateau [ {PLATEAU_TEMPERATURE_BMIN_DEFAUT} .. {PLATEAU_TEMPERATURE_BMAX_DEFAUT} ]°c , ATTENTION dépend du filament à caractériser (défaut {PLATEAU_TEMPERATURE} °c) (OBLIGATOIRE) : ")
    if (plateau_temperature == "") : break # charge la valeur par defaut 65°c
    if (int(plateau_temperature) >= PLATEAU_TEMPERATURE_BMIN_DEFAUT) and (int(plateau_temperature) <= PLATEAU_TEMPERATURE_BMAX_DEFAUT) : 
        PLATEAU_TEMPERATURE = int(plateau_temperature)
        break
    else :
        print(f"Valeur invalide. Veuillez entrer une température entre [ {PLATEAU_TEMPERATURE_BMIN_DEFAUT} °c .. {PLATEAU_TEMPERATURE_BMAX_DEFAUT} °c ] !")
print(f"Température du plateau {PLATEAU_TEMPERATURE} °c pour imprimer du {FILAMENT_Z2_GAUCHE_TYPE} {FILAMENT_Z2_GAUCHE_COULEUR} à {FILAMENT_Z2_GAUCHE_TEMPERATURE}°c !")
# -------------------------------------------------------------------------------------------------------------------------


# Demander à l'utilisateur de spécifier la température de l'enceinte pour imprimer un filament via Z2
# Note : Pour se prémunir des flucuations hivernales / estivales des temperatures ambiantes il est préferable de toujours imprimer à une temperature minimum de 40°c
while True:
    enceinte_temperature = input(f"\n Q14 / 16 -> Veuillez spécifier la température de l'enceinte [{ENCEINTE_TEMPERATURE_BMIN_DEFAUT} .. {ENCEINTE_TEMPERATURE_BMAX_DEFAUT} ]°c ATTENTION dépend du filament à caractériser (défaut {ENCEINTE_TEMPERATURE} °c) (OBLIGATOIRE) : ")
    if (enceinte_temperature == "") : break # charge la valeur par defaut 40°c
    if (int(enceinte_temperature) >= 0) and (int(enceinte_temperature) <= 130) : 
        ENCEINTE_TEMPERATURE = int(enceinte_temperature)
        break
    else :
        print(f"Valeur invalide. Veuillez entrer une température entre [ {ENCEINTE_TEMPERATURE_BMIN_DEFAUT} .. {ENCEINTE_TEMPERATURE_BMAX_DEFAUT} ]°c !")
print(f"Température de l'enceinte {ENCEINTE_TEMPERATURE} °c pour imprimer du {FILAMENT_Z2_GAUCHE_TYPE} {FILAMENT_Z2_GAUCHE_COULEUR} à {FILAMENT_Z2_GAUCHE_TEMPERATURE} °c !")
# -------------------------------------------------------------------------------------------------------------------------


# Demander à l'utilisateur de spécifier le débit pour imprimer via Z2 la legende composée de lettres de chaque cube A à K sur le plateau 
while True:
    debit_legende = input(f"\n Q15 / 16 -> Veuillez spécifier une valeur de debit [ {LEGENDE_DEBIT_BMIN_DEFAUT} .. {LEGENDE_DEBIT_BMAX_DEFAUT} ]% pour la legende des cubes situé sur le plateau (valeur par defaut {LEGENDE_DEBIT_DEFAUT} %)  ? : ")
    if (debit_legende == "") : break # Permet de charger la valeur par defaut
    if ((float(debit_legende) >= LEGENDE_DEBIT_BMIN_DEFAUT) and (float(debit_legende) <= LEGENDE_DEBIT_BMAX_DEFAUT)) :
        LEGENDE_DEBIT = round(float(debit_legende),1) # On utilise que des valeurs arrondies pour les lettres exemple 100,0%; 99,1%; 89,5% ...
        break
    else:
        print(f"Valeur invalide. Veuillez entrer un debit [ {LEGENDE_DEBIT_BMIN_DEFAUT} % .. {LEGENDE_DEBIT_BMAX_DEFAUT} % ] !")
print(f"La valeur de debit pour la legende des cubes situé sur le plateau est : {LEGENDE_DEBIT} %" )
# -------------------------------------------------------------------------------------------------------------------------


# Demander à l'utilisateur de spécifier le débit pour imprimer la tour de purge sur le plateau 
while True:
    debit_tour = input(f"\n Q16 / 16 -> Veuillez spécifier une valeur de debit [{TOUR_DEBIT_BIN_DEFAUT} .. {TOUR_DEBIT_BMAX_DEFAUT} ]% pour la tour de purge situé sur le plateau (valeur par defaut {TOUR_DEBIT_DEFAUT} %)  ? : ")
    if (debit_tour == "") : break # Permet de charger la valeur par defaut
    if ((float(debit_tour) >= TOUR_DEBIT_BIN_DEFAUT) and (float(debit_tour) <= TOUR_DEBIT_BMAX_DEFAUT)) :
        TOUR_DEBIT = round(float(debit_tour),1) # On utilise que des valeurs arrondies pour la tour exemple 100,0%; 99,1%; 89,5% ...
        break
    else:
        print(f"Valeur invalide. Veuillez entrer un debit [ {TOUR_DEBIT_BIN_DEFAUT} .. {TOUR_DEBIT_BMAX_DEFAUT} ]% !")
print(f"La valeur de debit pour la tour de purge situé sur le plateau est : {TOUR_DEBIT} %" )
# -------------------------------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------------------

# ------ Recapitulatif de sortie --------------

cls() # Effacer le terminal / Nettoyer la console

# On resume les données pour l'utilisateur avant de generer un fichier de sortie
print(f"Z1 (DROITE) : Aucun objet ne sera imprimé avec le filament {FILAMENT_Z1_DROITE_MARQUE} {FILAMENT_Z1_DROITE_TYPE} {FILAMENT_Z1_DROITE_COULEUR} de diamétre nominal de {FILAMENT_Z1_DROITE_DIAMETRE} mm à {FILAMENT_Z1_DROITE_TEMPERATURE} °c \n")
print(f"Z2 (GAUCHE) : Objets à imprimmer avec le filament {FILAMENT_Z2_GAUCHE_MARQUE} {FILAMENT_Z2_GAUCHE_TYPE} {FILAMENT_Z2_GAUCHE_COULEUR} de diamétre nominal de {FILAMENT_Z2_GAUCHE_DIAMETRE} mm à {FILAMENT_Z2_GAUCHE_TEMPERATURE} °c : " )
print(f"- 11 cubes étiquetés de A ( débit : {CUBE_A_DEBIT} % ) à K ( débit : {CUBE_K_DEBIT} % ) par pas décroisants de -{PAS} %.")
print(f"- Légende plateau A à K debit : {LEGENDE_DEBIT} %")
print(f"- Tour de purge débit : {TOUR_DEBIT} %")
print(f"- Température du plateau : {PLATEAU_TEMPERATURE} °c")
print(f"- Température de l'enceinte : {ENCEINTE_TEMPERATURE} °c")

resume() #  continuer ou quiter ?


# ------ Fichier de sortie --------------

# Demander à l'utilisateur d'utiliser un nom de fichier automatique OU de spécifier le nom du nouveau fichier


# Génerer un nom automatique de fichier de sortie
# Exemple du format du nom explicite de fichier : 31_10_2024_Z2_Calibration_[100%..90%]_Pas_1%_PETG_BLANC_SUNLU_235°c_1.724mm

MAINTENANT = datetime.now()
DATE_JOUR = MAINTENANT.strftime("%d_%m_%Y_")
NOUVEAU_FICHIER_NOMAUTO = DATE_JOUR + "Z2_Calibration_[" + str(CUBE_A_DEBIT) + "%.." + str(CUBE_K_DEBIT) + "%]_Pas_-" + str(PAS) + "%_" + str(FILAMENT_Z2_GAUCHE_TYPE) + "_" + str(FILAMENT_Z2_GAUCHE_COULEUR) + "_" +  str(FILAMENT_Z2_GAUCHE_MARQUE) + "_" + str(FILAMENT_Z2_GAUCHE_TEMPERATURE) + "°c_" + str(FILAMENT_Z2_GAUCHE_DIAMETRE) + "mm"  
print (f"\n Proposition pour le nom de fichier de sortie : {NOUVEAU_FICHIER_NOMAUTO}")

NOUVEAU_FICHIER_NOM = NOUVEAU_FICHIER_NOMAUTO

while True:
    touchePresse = input(f"\n Presser la touche (C) pour continuer et utiliser le nom de fichier {NOUVEAU_FICHIER_NOM} \n OU BIEN \n Presser (S) pour saisir un nom de fichier sans inclure l'extension .gcode) ! ")
    if (touchePresse.upper() == "C") :
        #NOUVEAU_FICHIER_NOM = NOUVEAU_FICHIER_NOMAUTO
        break
    if (touchePresse.upper()  == "S") :
        while True:
            nouveau_fichier_nom = input("\n Veuillez spécifier le nom du fichier à générer (sans extension): ")
            if (not(nouveau_fichier_nom == "") or ("{nouveau_fichier_nom}" +".gcode" == FICHIER_TEMPLATE)) : 
                NOUVEAU_FICHIER_NOM = nouveau_fichier_nom
                break
            else :
                ("Nom de fichier invalide ou manquant !")

print(f"\n Le nouveau fichier sera nomé : {NOUVEAU_FICHIER_NOM}")

# ------------------------------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------------------

# -------------------- FIN QUESTIONNAIRE ----------------------



# -------------------- DEBUT DES BLOCS DE TEXTE A REMPLACER --------------------

# BLOC_INFORMATION_FILAMENTS à remplacer dans le template 
# NBoccurence = 1
bloc_information_filaments = f"""
;Filament Diameter #1: {FILAMENT_Z1_DROITE_DIAMETRE}
;Filament Diameter #2: {FILAMENT_Z2_GAUCHE_DIAMETRE}
;Filament Compensation #1: {FILAMENT_Z1_DROITE_DEBIT}
;Filament Compensation #2: {FILAMENT_Z2_GAUCHE_DEBIT}
;Filament Type #1: {FILAMENT_Z2_GAUCHE_TYPE}
;Filament Type #2: {FILAMENT_Z1_DROITE_TYPE}
;Filament Density #1: {FILAMENT_Z2_GAUCHE_DENSITE}
;Filament Density #2: {FILAMENT_Z1_DROITE_DENSITE}
;Filament Name #1: {FILAMENT_Z2_GAUCHE_NOM}
;Filament Name #2: {FILAMENT_Z1_DROITE_NOM}
"""
# --------------------

# BLOC_TEMPERATURE_PLATEAU à remplacer dans le template
# NBoccurence = 1
bloc_temperature_plateau = f"""
M190 S{PLATEAU_TEMPERATURE}
"""
# --------------------

# BLOC_TEMPERATURE_FILAMENTS à remplacer dans le template 
# NBoccurence = 1
bloc_temperature_filaments = f"""
M104 T0 S205
M109 T1 S{FILAMENT_Z2_GAUCHE_TEMPERATURE}
M109 T0 S205
"""
# --------------------

# BLOC_TEMPERATURE_ENCEINTE
# NBoccurence = 1
bloc_temperature_enceinte = f"""
;On fixe la temperature de l'enceinte {ENCEINTE_TEMPERATURE} degres celsius
M141 S{ENCEINTE_TEMPERATURE}
"""
# --------------------
# BLOC_TEMPERATURE_FILAMENT_GAUCHE
# NBoccurence = 13
bloc_temperature_filament_gauche = f"""
M104 T1 S{FILAMENT_Z2_GAUCHE_TEMPERATURE}
"""
# --------------------

# BLOC_DEBIT_CUBE_A_à_K_FILAMENT_GAUCHE
debit_temp = CUBE_A_DEBIT
# Dictionnaire pour stocker les blocs de débit
blocs_debit = {}
for unCube in LISTE_CUBES:
    #print(f"Génération des commandes G-code pour le cube {unCube} {round(debit_temp,1)} %") #DEBUG 
    #print(f"Génération des commandes G-code pour le cube {unCube} {debit_temp} %") #DEBUG 
    # Exemple de commande G-code pour chaque cube
    blocs_debit[f"BLOC_DEBIT_CUBE_{unCube}_FILAMENT_GAUCHE"] = f"""M221 T1 S{debit_temp}"""
    debit_temp = round((debit_temp - PAS),1) # la fonction round evite des arondis succesifs de la mantisse avec la valeur 0.1 % voi ci dessous ! 
    
    # Sans la fonction round(VAR,1) avec la valeur 0.1 % la mantisse dégénère par arrondis sucésifs 
    """
    BLOC_TEMPERATURE_FILAMENT_GAUCHE : M104 T1 S235
    BLOC_DEBIT_CUBE_A_FILAMENT_GAUCHE : M221 T1 S92.0
    BLOC_DEBIT_CUBE_B_FILAMENT_GAUCHE : M221 T1 S91.9
    BLOC_DEBIT_CUBE_C_FILAMENT_GAUCHE : M221 T1 S91.80000000000001
    BLOC_DEBIT_CUBE_D_FILAMENT_GAUCHE : M221 T1 S91.70000000000002
    BLOC_DEBIT_CUBE_E_FILAMENT_GAUCHE : M221 T1 S91.60000000000002
    BLOC_DEBIT_CUBE_F_FILAMENT_GAUCHE : M221 T1 S91.50000000000003
    BLOC_DEBIT_CUBE_G_FILAMENT_GAUCHE : M221 T1 S91.40000000000003
    BLOC_DEBIT_CUBE_H_FILAMENT_GAUCHE : M221 T1 S91.30000000000004
    BLOC_DEBIT_CUBE_I_FILAMENT_GAUCHE : M221 T1 S91.20000000000005
    BLOC_DEBIT_CUBE_J_FILAMENT_GAUCHE : M221 T1 S91.10000000000005
    """
    # Avec la fonction round(VAR,1) avec la valeur 0.1 % la mantisse ne dégénère plus par arrondis sucésifs
    """
    BLOC_TEMPERATURE_FILAMENT_GAUCHE : M104 T1 S235
    BLOC_DEBIT_CUBE_A_FILAMENT_GAUCHE : M221 T1 S92.0
    BLOC_DEBIT_CUBE_B_FILAMENT_GAUCHE : M221 T1 S91.9
    BLOC_DEBIT_CUBE_C_FILAMENT_GAUCHE : M221 T1 S91.8
    BLOC_DEBIT_CUBE_D_FILAMENT_GAUCHE : M221 T1 S91.7
    BLOC_DEBIT_CUBE_E_FILAMENT_GAUCHE : M221 T1 S91.6
    BLOC_DEBIT_CUBE_F_FILAMENT_GAUCHE : M221 T1 S91.5
    BLOC_DEBIT_CUBE_G_FILAMENT_GAUCHE : M221 T1 S91.4
    BLOC_DEBIT_CUBE_H_FILAMENT_GAUCHE : M221 T1 S91.3
    BLOC_DEBIT_CUBE_I_FILAMENT_GAUCHE : M221 T1 S91.2
    BLOC_DEBIT_CUBE_J_FILAMENT_GAUCHE : M221 T1 S91.1
    """
# --------------------

# BLOC_DEBIT_LEGENDE_FILAMENT_GAUCHE
# Bloc_serie_de_lettres_A_??_K.stl
# NBoccurence = 10
bloc_debit_legende_filament_gauche = f"""
M221 T1 S{LEGENDE_DEBIT}
"""
# --------------------

# BLOC_DEBIT_TOURDEPURGE_FILAMENT_GAUCHE
# Bloc_TOUR_DE_PURGE.3mf
# NBoccurence = 10
bloc_debit_tourdepurge_filament_gauche = f"""
M221 T1 S{TOUR_DEBIT}
"""
# --------------------

# -----------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------


# -------------------- DEBUT RECHERCHE ET REMPLACE DANS LE FICHIER -------------------
# Lire le fichier template
with open(FICHIER_TEMPLATE, 'r') as unFichier:
    contenu = unFichier.read()

# Remplacer la variable BLOC_INFORMATION_FILAMENTS par le bloc de texte
print(f"BLOC_INFORMATION_FILAMENTS : \n {bloc_information_filaments.strip()}") # DEBUG
contenu = contenu.replace("BLOC_INFORMATION_FILAMENTS", bloc_information_filaments.strip())

# Remplacer la variable BLOC_TEMPERATURE_PLATEAU par le bloc de texte
print(f"\n BLOC_TEMPERATURE_PLATEAU : {bloc_temperature_plateau.strip()}") # DEBUG
contenu = contenu.replace("BLOC_TEMPERATURE_PLATEAU", bloc_temperature_plateau.strip())

# Remplacer la variable BLOC_TEMPERATURE_FILAMENTS par le bloc de texte
print(f"\n BLOC_TEMPERATURE_FILAMENTS : \n {bloc_temperature_filaments.strip()}") # DEBUG
contenu = contenu.replace("BLOC_TEMPERATURE_FILAMENTS", bloc_temperature_filaments.strip())

# Remplacer la variable BLOC_TEMPERATURE_ENCEINTE par le bloc de texte
print(f"\n BLOC_TEMPERATURE_ENCEINTE : \n {bloc_temperature_enceinte.strip()}") # DEBUG
contenu = contenu.replace("BLOC_TEMPERATURE_ENCEINTE", bloc_temperature_enceinte.strip())

# Remplacer la variable BLOC_TEMPERATURE_FILAMENT_GAUCHE par le bloc de texte
print(f"\n BLOC_TEMPERATURE_FILAMENT_GAUCHE : {bloc_temperature_filament_gauche.strip()}") # DEBUG
contenu = contenu.replace("BLOC_TEMPERATURE_FILAMENT_GAUCHE", bloc_temperature_filament_gauche.strip())

# Remplacer la variable BLOC_DEBIT_CUBE_?_FILAMENT_GAUCHE par le bloc de texte
for cube, bloc in blocs_debit.items():
    print(f"\n {cube} : {bloc}") # Afficher les blocs de débit pour vérification
    # Remplacer la variable par le bloc de texte
    contenu = contenu.replace(cube, bloc.strip())

# Remplacer la variable BLOC_DEBIT_LEGENDE_FILAMENT_GAUCHE par le bloc de texte
print(f"\n BLOC_DEBIT_LEGENDE_FILAMENT_GAUCHE : {bloc_debit_legende_filament_gauche.strip()}") # DEBUG
contenu = contenu.replace("BLOC_DEBIT_LEGENDE_FILAMENT_GAUCHE", bloc_debit_legende_filament_gauche.strip())

# Remplacer la variable BLOC_DEBIT_TOURDEPURGE_FILAMENT_GAUCHE par le bloc de texte
print(f"\n BLOC_DEBIT_TOURDEPURGE_FILAMENT_GAUCHE : {bloc_debit_tourdepurge_filament_gauche.strip()}") # DEBUG
contenu = contenu.replace("BLOC_DEBIT_TOURDEPURGE_FILAMENT_GAUCHE", bloc_debit_tourdepurge_filament_gauche.strip())

# -----------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------


# -------------------- ENREGISTREMENT DU FICHIER DE SORTIE --------------------

# Créer le nouveau fichier
nouveau_fichier = f"{NOUVEAU_FICHIER_NOM}.gcode"
with open(nouveau_fichier, 'w') as f:
    print("FIN !")
    f.write(contenu)


print(f"\n Le nouveau fichier '{nouveau_fichier}' a été créé avec succès !")

# -----------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------
