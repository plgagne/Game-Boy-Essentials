# Game Boy Essentials
[![site-build](https://github.com/plgagne/Game-Boy-Essentials/actions/workflows/site-build.yml/badge.svg)](https://github.com/plgagne/Game-Boy-Essentials/actions/workflows/site-build.yml)

## Tâches
- Ajouter jekyll_env=local_serve au serve de Nova
- Vérifier que la publication pour diffusion sur mon Mac n'a pas les nofollow
- Vérifier qu'un fil RSS sans liens complets est capable de trouver les images
- batir mes variables de bouton
  1. bouton noir, contour noir, texte noir
  2. bouton fond transparent, texte bleu
  3. bouton fond bleu, texte noir
- Finir de convertir le site web en BEM/SCSS
- Ajouter les catalogues de JC Penney et Sears sur la ligne du temps
- Vérifier la disponibilité du Volume 1
  - https://www.amazon.com/s?k=game+boy+essentials+book
  - https://www.barnesandnoble.com/s/game%20boy%20essentials

## Long terme
- Simplifier la structure des images de timeline
  - ensuite, ajouter des images non-disponible
- Jouer à https://taylormccue.itch.io/trauma
- Produire une automatisation pour faire un ebook
- Ajouter un outil de comparaison de PDF pour visuellement vérifier mes livres (https://github.com/serhack/pdf-diff)
- Ajouter un Git Hook qui rapetisse les images ajoutés au repo (https://www.redhat.com/sysadmin/git-hooks)
- Faire une infolettre pour être averti de mes nouvelles publications avec Amazon SES comme système d'envoi et mon courriel comme gestionnaire des abonnements
- Terminer l'intégration de backstopJS dans un postbuild.sh
- Trouver comment avoir des secrets dans un github public

## Liste de vérification pour publication d'un article
- [ ] Vérifier que toutes les dates sont bien incluses (incluant l'europe)
- [ ] Corriger l'article final avec Antidote
- [ ] Appliquer les majuscules approprié avec Title Case Service
- [ ] Déplacer l'article dans le dossier website/articles
- [ ] Rapetisser les nouvelles images avec ImageOptim.app
- [ ] Bâtir et synchronizer sur S3 avec la tâche Nova
- [ ] Vérifier que tout fonctionne en ligne sur https://gameboyessentials.com
- [ ] Publier le lien de l'article sur Mastodon

## Liste de mauvaises idées
- Avoir une infolettre
- Écrire des notes de bas de page
  - C'est une mauvaise manière d'écrire.
- Convertir mon fichier de collection de Numbers à HTML
  - Les tables Markdown sont impossibles à regarder
  - Tu perds la capacité de facilement jouer avec les données
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

## Là où j'ai changé d'idée
- Automatiser la reliure du livre
- Retirer le texte souligné des liens
- Utiliser H1 pour le titre des articles
- Utiliser Grid et Flex pour le CSS
- Me servir de Github
- Passer à SCSS