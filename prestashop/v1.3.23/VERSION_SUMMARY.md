# PrestaShop — Intigo Parcels v1.3.23

## What changed — trois nouveaux chiffres dans « Petits faits »

Le tableau de bord affiche désormais, en plus du jour le plus actif :

- **Record : N colis le JJ/MM** — votre meilleure journée depuis le début.
- **Moyenne : N colis par jour actif** — combien vous expédiez les jours où
  vous expédiez.
- **Rythme global : N colis/jour depuis le premier envoi** — votre cadence
  réelle, jours calmes compris.

Les deux moyennes répondent à des questions différentes et sont volontairement
affichées ensemble : la première mesure votre intensité, la seconde votre
régularité.

Tout est calculé en local à partir des colis déjà envoyés (une seule requête
groupée, aucun appel réseau). Rien ne s'affiche sur une boutique sans colis.

Aucune modification de base de données. Mise à jour directe depuis la v1.3.22.
