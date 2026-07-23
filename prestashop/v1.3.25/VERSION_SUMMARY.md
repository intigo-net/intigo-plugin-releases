# PrestaShop — Intigo Parcels v1.3.25

## L'adresse complète part enfin chez Intigo

La v1.3.24 construisait bien l'adresse complète (rue, **code postal + ville**,
pays), mais ne l'utilisait que si le colis n'avait aucune adresse enregistrée.
Résultat : les commandes existantes continuaient d'envoyer **la rue seule**.

Désormais, une adresse encore enregistrée sous l'ancienne forme « rue seule » est
automatiquement complétée avec le code postal, la ville et le pays. Une adresse que
vous avez **modifiée à la main n'est jamais touchée** — elle part exactement telle
que vous l'avez saisie.

### Vérifié sur les deux adresses clients réelles

| Adresse PrestaShop | Adresse envoyée | Zone |
|---|---|---|
| 55, rue du 1er juin, Mutuelleville — 1082 Tunis | `55,rue du 1er juin. Mutuelleville., 1082 Tunis, Tunisie` | El Menzah / **Tunis** |
| Rue sidi Brahim riahi — 1002 Ariana | `Rue sidi Brahim riahi Ariana, 1002 Ariana, Tunisie` | Ariana Ville / **Ariana** |

Ces deux commandes partaient auparavant vers **Le Kef** et **Kasserine**.

## Rappel — ce que corrigeait la v1.3.24

- La zone détectée par le module est **toujours prioritaire** ; le code postal ne
  sert plus que de secours. C'est le code postal, résolu chez Intigo, qui envoyait
  un colis de Tunis (1082) vers Le Kef.
- **Plus aucune zone inventée** : sans confirmation dans l'adresse, le module refuse
  et vous demande de choisir la ville et la délégation.
- **« Re-détecter »** reste disponible après l'envoi (mise à jour locale ; utilisez
  **Renvoyer** pour recréer le colis chez Intigo).

Aucune modification de structure de base de données. Mise à jour directe depuis la
v1.3.23 ou la v1.3.24.
