# PrestaShop — Intigo Parcels v1.3.24

## Correctif important — la zone de livraison n'est plus devinée

Un colis destiné à **Tunis** (« 55, rue du 1er juin, Mutuelleville, 1082 Tunis »)
est parti vers **Le Kef**, à environ 200 km. Ce correctif rend ce type d'erreur
impossible.

### Ce qui se passait

Le module avait pourtant trouvé la **bonne** zone (Tunis / El Menzah) à partir de
l'adresse. Mais tant que la détection n'était pas jugée « certaine », l'envoi
utilisait à la place le **code postal seul** : les identifiants de zone corrects
étaient supprimés du colis, et la zone était re-calculée à l'arrivée. Pour le code
postal 1082, ce calcul donnait Le Kef.

Le critère de « certitude » reposait sur la stabilité des résultats de recherche
d'adresses — un signal peu fiable. En pratique, presque toutes les commandes
passaient donc par le code postal.

### Ce qui change

- **La zone détectée par le module est désormais toujours prioritaire** quand elle
  est complète. Le code postal ne sert plus que de secours, si aucune zone n'est
  exploitable ou si l'envoi est refusé.
- **Plus aucune zone inventée.** Quand rien dans l'adresse ne confirme une
  correspondance, le module refuse et vous demande de choisir la ville et la
  délégation, au lieu de retenir la première suggestion approchante.
- **Nettoyage à la mise à jour.** Les commandes **non encore envoyées** dont la zone
  venait de l'ancienne détection sont remises à zéro et re-détectées avec les
  nouvelles règles. Les colis déjà envoyés et les zones saisies à la main ne sont
  pas touchés.

### Deux améliorations demandées

- **« Adresse de livraison » contient désormais l'adresse complète** : rue, code
  postal + ville, pays — au lieu de la rue seule. Le livreur (et la détection de
  zone) disposent enfin de l'adresse entière.
- **« Re-détecter la ville / délégation » reste disponible après l'envoi.** La
  re-détection met alors la zone à jour **ici seulement** ; utilisez **Renvoyer**
  pour recréer le colis chez Intigo avec la zone corrigée.

Aucune modification de structure de base de données.

### Exemples vérifiés

| Adresse | Avant | Après |
|---|---|---|
| 55, rue du 1er juin, Mutuelleville, 1082 Tunis | Le Kef Est / **Kef** | El Menzah / **Tunis** |
| Rue sidi Brahim riahi, 1002 Ariana | Sbiba / **Kasserine** | Ariana Ville / **Ariana** |

### À vérifier de votre côté

Les colis déjà expédiés gardent la zone envoyée à l'époque. Si vous suspectez une
zone erronée sur un colis en cours, vérifiez-la chez Intigo et utilisez
**Renvoyer** pour le recréer avec la bonne zone.
