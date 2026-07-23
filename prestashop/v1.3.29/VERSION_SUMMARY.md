# PrestaShop — Intigo Parcels v1.3.29

## Le code postal ne crée plus jamais un colis

C'est **le code postal** qui a envoyé un colis de Tunis au Kef. Le module
envoyait `postal_code = 1082` **sans la zone**, et Intigo, de son côté, résout
1082 en **Le Kef**.

La v1.3.28 avait déjà retiré au code postal le droit de déclencher un envoi seul.
Il restait pourtant un cas : si Intigo refusait notre envoi normal — pour
n'importe quelle raison — le module **réessayait automatiquement** avec le seul
code postal, en retirant la ville et la délégation. Ce deuxième essai pouvait
donc, en silence, changer le gouvernorat de destination.

**Ce chemin est entièrement supprimé.** Un colis n'est plus jamais créé autrement
qu'avec la ville et la délégation vérifiées. Si l'envoi échoue, il échoue
visiblement, avec le message d'erreur — plutôt que de partir ailleurs sans rien
dire.

Le code postal reste affiché dans le back-office à titre indicatif.

## Rappel — ce qu'apporte la v1.3.28

- **Ville ou État** : le gouvernorat est lu indifféremment dans l'un ou l'autre
  champ (adresse de livraison, puis de facturation).
- **Reconnaissance exacte** : l'adresse est comparée à la liste officielle des
  villes, délégations et cités d'Intigo, espaces et accents ignorés — « Mutuelleville »
  correspond exactement à « Mutuelle Ville ».
- **Jamais hors du gouvernorat annoncé** : une adresse à Tunis ne peut plus être
  détectée au Kef ni à Kasserine.
- **Envoi bloqué** sans Ville ni Délégation, bouton désactivé et champs manquants
  encadrés en rouge — refus appliqué aussi côté serveur.

## Mise à jour

Aucune modification de structure de base de données. Mise à jour directe depuis
n'importe quelle version 1.3.x.

> **Colis déjà envoyés au mauvais gouvernorat** : la re-détection corrige la zone
> **localement seulement**. Utilisez **Renvoyer** pour annuler le colis chez Intigo
> et le recréer avec la bonne zone.
