#!/bin/bash

# ==============================
# Script : arborescence_camera-acoustique_linux.sh
# Objectif : créer automatiquement l'arborescence pour les relevés caméra et acoustique
# ==============================

echo "=== Création d'une arborescence CAMERA / ACOUSTIQUE ==="

# Création des dossiers racine
mkdir -p camera acoustique

# Demande du nombre de gradients
read -p "Combien de gradients souhaitez-vous créer ? " nb_gradients

for ((i=1; i<=nb_gradients; i++)); do
    read -p "Nom du gradient n°$i (3 lettres majuscules, ex: MGR) : " gradient

    # Création des dossiers pour le gradient
    mkdir -p "camera/$gradient"
    mkdir -p "acoustique/$gradient"

    # Demande du nombre de placettes
    read -p "Combien de placettes pour le gradient $gradient ? " nb_placettes

    for ((j=1; j<=nb_placettes; j++)); do
        read -p "Altitude de la placette n°$j pour le gradient $gradient : " altitude

        # Dossiers pour acoustique (nommés uniquement par altitude)
        mkdir -p "acoustique/$gradient/$altitude"

        # Dossiers pour caméra (nommés par gradient puis altitude)
        mkdir -p "camera/$gradient/$altitude/Cam1/Timelapse"
        mkdir -p "camera/$gradient/$altitude/Cam2/Timelapse"
    done
done

# Affichage de la structure finale
echo
echo "=== Arborescence créée avec succès ==="
tree camera acoustique

