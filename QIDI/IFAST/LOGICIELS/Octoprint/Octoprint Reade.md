**Instructions pour Utiliser OctoPrint avec l'Imprimante Qidi I-Fast**

**Date : 25 août 2024**

Spécifications de l'Imprimante Qidi I-Fast :
- **Modèle** : QIDI TECHNOLOGY I-Fast 3D Printer
- **Extrudeurs** : Double
- **Volume d'Impression** : 360×250×320mm

Ces instructions vous permettront de configurer OctoPrint avec votre imprimante Qidi I-Fast.
Assurez-vous de suivre chaque étape avec précaution hors tension pour éviter tout dommage aux composants internes de l'imprimante.

Pour utiliser le logiciel OctoPrint avec l'imprimante Qidi I-Fast, il est nécessaire d'ajouter un dongle USB vers un port série (VCC; RX; TX; GND), car l'imprimante n'est pas équipée d'origine d'un port USB. Voici les étapes à suivre :

1. **Retirer le Panneau de Droite** :
   - Démontez le panneau de droite de l'imprimante pour accéder aux composants internes.

2. **Localiser le Connecteur Série** :
   - Identifiez le connecteur série à l'intérieur de l'imprimante. Il existe deux ports série, Attention Qidi recommande de connecter le dongle USB au port situé à proximité immédiate du module Wi-Fi.
![Le PCB en question est celui visible sur la photo de droite :](https://github.com/sudtek/IMPRIMANTES_3D/blob/main/QIDI/IFAST/LOGICIELS/Octoprint/PCB_serial.png)

3. **Connecter le Dongle USB** :
   - Branchez le dongle USB au connecteur série identifié.
   - Utilisez une rallonge USB pour faciliter la connexion et l'accessibilité.

