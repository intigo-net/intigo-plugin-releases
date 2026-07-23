# PrestaShop — Intigo Parcels v1.3.27

## « Re-détecter » dit enfin la vérité

Le bouton **Re-détecter la ville / délégation** affichait toujours
« Adresse re-détectée. » — même quand la détection avait **refusé** de confirmer
une zone. Le message ressemblait à une réussite, alors que la Ville restait vide
et que l'envoi restait bloqué, sans explication.

Désormais le message correspond au résultat réel :

- **Zone non confirmée** — « choisissez la ville et la délégation ci-dessous, puis
  enregistrez. L'envoi reste bloqué tant que la zone n'est pas renseignée. »
- **Zone détectée** — « Zone détectée : *Ville* / *Délégation*. Vérifiez-la avant
  d'envoyer. »
- **Colis déjà envoyé** — message inchangé.

L'envoi était déjà bloqué côté serveur tant que la ville et la délégation ne sont
pas renseignées ; cette version fait dire à l'interface ce qui se passe vraiment.

Aucune modification de structure de base de données.
