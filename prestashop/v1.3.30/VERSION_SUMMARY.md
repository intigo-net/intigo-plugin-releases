# PrestaShop — Intigo Parcels v1.3.30

## Une délégation est toujours proposée quand le gouvernorat est connu

Certaines adresses nomment un lieu qu'Intigo classe dans un **autre** gouvernorat —
par exemple « Ksar Said », qu'Intigo range sous Tunis, sur une commande de
**Manouba**. Le module trouvait bien la **ville** (Mannouba) mais laissait la
**délégation** vide, et la commande restait bloquée. Cliquer sur « Re-détecter »
ne changeait rien de visible : frustrant.

Désormais, **dès que le gouvernorat est confirmé** (via l'État ou la Ville), le
module propose automatiquement la meilleure délégation **à l'intérieur de ce
gouvernorat** :

1. la meilleure correspondance du moteur de recherche dans ce gouvernorat
   (Ksar Said → **Mannouba**, correct) ;
2. à défaut, la délégation principale (chef-lieu) ;
3. à défaut, la première de la liste.

La commande passe en **« à vérifier »** : la zone est pré-remplie et l'envoi est
possible, mais un coup d'œil est recommandé.

**Garde-fou :** cette proposition ne **sort jamais** du gouvernorat annoncé. Une
adresse à Manouba ne peut être proposée que dans une délégation de Manouba — jamais
au Kef ni à Tunis. Sans gouvernorat identifiable **et** sans lieu reconnu dans
l'adresse, la commande reste bloquée (aucune supposition).

## Message plus clair

Quand la ville est trouvée mais pas la délégation, le bandeau et le message de
« Re-détecter » disent maintenant **« Ville détectée : … — choisissez la
délégation »**, au lieu de demander de choisir aussi la ville alors qu'elle est
déjà remplie.

## Rappel — v1.3.29

Le chemin d'envoi par **code postal** a été entièrement supprimé : un colis n'est
jamais créé autrement qu'avec la ville et la délégation vérifiées.

## Mise à jour

Aucune modification de structure de base de données. Mise à jour directe depuis
n'importe quelle version 1.3.x.

> Les commandes déjà bloquées ne se corrigent pas toutes seules : ouvrez-les et
> cliquez **Re-détecter la ville / délégation** — la délégation se remplit
> maintenant. Vérifiez-la, puis envoyez.
