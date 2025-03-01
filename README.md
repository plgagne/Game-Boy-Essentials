# Game Boy Essentials
## Tâches

### Ligne du temps
- régler l'absence de faits dans la timeline passé 2003
- Ajouter les catalogues de JC Penney et Sears sur la ligne du temps

### Long terme
- Ajouter des images dans la ligne du temps
- Ajouter un outil de comparaison de PDF pour visuellement vérifier mes livres (https://github.com/serhack/pdf-diff)
- Ajouter un Git Hook qui rapetisse les images ajoutés au repo (https://www.redhat.com/sysadmin/git-hooks)

## Liste de vérification pour publication d'un article
- [] Vérifier que toutes les dates sont bien incluses
- [] Corriger l'article final avec Antidote
- [] Appliquer les majuscules approprié avec Title Case Service
- [] Déplacer l'article dans le dossier website/articles
- [] Inscrire la date de la publication de l'article
- [] Rapetisser les nouvelles images avec ImageOptim.app
- [] Bâtir avec la tâche Production
- [] Synchroniser avec le serveur
- [] Vérifier que tout fonctionne en ligne
- [] Publier le lien de l'article sur Mastodon

## Liste de mauvaises idées
- Avoir une infolettre
- Écrire des notes de bas de page
  - C'est une mauvaise manière d'écrire.
- Convertir mon fichier de collection de Numbers à HTML
  - Les tables Markdown sont impossibles à regarder.
  - Tu perds la capacité de facilement jouer avec les données.
- Avoir un logo SVG inlcuant Game Boy tel qu'utilisé par Nintendo
  - Le logo du Game Boy n'est pas fait pour un écran d'ordinateur.
- Utiliser Github Pages pour le site web
  - C'est interdit de l'utiliser à des fins commerciales.
- Créer un _includes pour la page d'accueil
  - Le code apparait juste une fois, c'est inutile.
- Utiliser Mobygames pour la ligne du temps
  - Leurs données sont moins complètes que GameFAQs.
- Conserver des données avec YAML
  - JSON diminue en deux le temps de construction.
- Créer un eBook
  - Le livre aurait besoin de presque autant de CSS que le site web.
  - Les images nécessitent un CSS unique puisque leur résolution est trop petite.
  - Tu n'as aucune idée des attentes du lecteur puisque tu n'as pas de liseuse.
- Un transformateur de style de code comme Prettier
  - Liquid n'est pas assez bien supporté pour être beau à mes yeux.
  - Le code pour transposer le HTML en TeX est très dépendant de lignes bien délimités
- Changer le dossier des images de la ligne du temps
  - Il y a tellement d'exceptions que de construire une nouvelle structure ne vaut pas la peine

## Là où j'ai changé d'idée
- Automatiser la reliure du livre
- Retirer le texte souligné des liens
- Utiliser H1 pour le titre des articles
- Utiliser Grid et Flex pour le CSS
- Me servir de Github
- Passer à SCSS
- Avoir un serveur
- Ne plus avoir un serveur