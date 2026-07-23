# PrestaShop — Intigo Parcels v1.3.28

## 1. La ville **ou** l'état — les deux fonctionnent

Certaines boutiques remplissent le champ **Ville**, d'autres le champ **État**.
Jusqu'ici le module ne lisait que la Ville : une commande dont la Ville était vide
et l'État renseigné n'avait, pour le module, aucun gouvernorat.

Désormais le gouvernorat est lu **indifféremment depuis l'État ou depuis la
Ville**, dans l'adresse de livraison puis, si besoin, dans l'adresse de
facturation de la même commande. L'État apparaît aussi sur l'adresse envoyée à
Intigo, pour que le bordereau reste lisible quand la Ville est vide.

| Adresse client | Avant | Maintenant |
|---|---|---|
| 55, rue du 1er juin. Mutuelleville — 1082, Ville **vide**, État **Tunis** | aucune zone | **Tunis / El Menzah / Mutuelle Ville** |

## 2. La zone est reconnue **exactement**, plus jamais devinée

Le module compare maintenant l'adresse à la **liste officielle des villes,
délégations et cités d'Intigo** — celle-là même qui remplit les menus déroulants —
en ignorant espaces, tirets et accents. Le client écrit « Mutuelleville », Intigo
enregistre « Mutuelle Ville » : c'est désormais une correspondance exacte.

Et quand la commande indique un gouvernorat, **la détection n'a plus le droit d'en
sortir**. Une adresse à Tunis ne peut plus être expédiée au Kef ou à Kasserine,
quelle que soit la réponse de la recherche automatique.

La pastille verte (envoi automatique) est maintenant réservée aux adresses où le
client a **écrit lui-même** le nom de la délégation ou de la cité. Tout le reste
passe en « à vérifier » : la zone est pré-remplie, il suffit d'un coup d'œil.

## 3. Sans **Ville** et **Délégation**, l'envoi est impossible

C'était la dernière faille : un code postal seul suffisait à envoyer un colis.
Intigo ré-interprétait alors ce code de son côté — et c'est exactement ainsi qu'un
colis de Tunis (1082) est parti au Kef.

Le code postal ne peut plus déclencher un envoi à lui seul. Il ne sert plus que de
**secours**, derrière une zone confirmée.

- Le bouton **Envoyer à Intigo** est **désactivé** tant que la Ville et la
  Délégation ne sont pas choisies — dans la liste des commandes, sur la page de
  modification et dans le panneau de la commande.
- Une alerte explique quoi compléter, et les menus manquants sont **encadrés en
  rouge**. L'infobulle nomme précisément le champ qui bloque.
- Le refus est aussi appliqué **côté serveur** : même un envoi forcé, un envoi
  groupé ou un envoi automatique par changement de statut est refusé.
- Quand seul le gouvernorat est certain, il est **pré-rempli** : vous n'avez plus
  qu'à choisir la délégation.

## Mise à jour

Aucune modification de structure de base de données. Mise à jour directe depuis
n'importe quelle version 1.3.x.

Les commandes **non encore envoyées** dont la zone avait été détectée
automatiquement sont remises à zéro et re-détectées avec les nouvelles règles.
Les zones saisies à la main et les colis déjà envoyés ne sont pas touchés.
