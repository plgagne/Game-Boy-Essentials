# Game Boy Essentials
[![site-build](https://github.com/plgagne/Game-Boy-Essentials/actions/workflows/site-build.yml/badge.svg)](https://github.com/plgagne/Game-Boy-Essentials/actions/workflows/site-build.yml)

## URLs
- [Github Pages](https://plgagne.github.io/Game-Boy-Essentials/)
- [S3](http://gameboyessentials.com.s3-website-us-east-1.amazonaws.com/)

## Tâches
- AJouter au script qui élimine .html pour retirer les redirections à Jekyll et utiliser la fonctionnalité de S3
  - Contient une liste de toutes les redirections hors normes dont j'ai besoin:
    - [ ] /1989/slug
    - [ ] /1989/slug/
    - [x] /timeline/na
    - [x] /timeline/na/
    - [x] /timelines/na/
    - [x] /about/
    - [x] /book.html
    - [x] main.html
    - etc.
  - Passe à travers tous les articles, prendre le titre du fichier, et crée les redirections de ces articles:
    - /articles/slug/
    - /articles/slug/index.html
  - Batis la liste de toutes les redirections en XML je crois
  - Pousse la liste de redirection sur le bucket S3
- Produire une automatisation pour faire un ebook
  - Créer une façon d'avoir mes articles en html de la bonne structure pour Pandoc

## Ligne du temps
- Implanter une façon de changer les données de la ligne du temps de façon répétable
- régler l'absence de faits dans la timeline passé 2003
- Ajouter le mois d'avril comme sortie de Yoshi's Cookie en NA sur la timeline
- Ajouter les catalogues de JC Penney et Sears sur la ligne du temps

## Long terme
- Simplifier la structure des images de timeline
  - ensuite, ajouter des images non-disponible
- Jouer à https://taylormccue.itch.io/trauma
- Ajouter un outil de comparaison de PDF pour visuellement vérifier mes livres (https://github.com/serhack/pdf-diff)
- Ajouter un Git Hook qui rapetisse les images ajoutés au repo (https://www.redhat.com/sysadmin/git-hooks)
- Faire une infolettre pour être averti de mes nouvelles publications avec Amazon SES comme système d'envoi et mon courriel comme gestionnaire des abonnements

## Liste de vérification pour publication d'un article
- [ ] Vérifier que toutes les dates sont bien incluses
- [ ] Corriger l'article final avec Antidote
- [ ] Appliquer les majuscules approprié avec Title Case Service
- [ ] Déplacer l'article dans le dossier website/articles
- [ ] Rapetisser les nouvelles images avec ImageOptim.app
- [ ] Bâtir et synchronizer sur S3 avec la tâche Production
- [ ] Vérifier que tout fonctionne en ligne
- [ ] Publier le lien de l'article sur Mastodon

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

## Là où j'ai changé d'idée
- Automatiser la reliure du livre
- Retirer le texte souligné des liens
- Utiliser H1 pour le titre des articles
- Utiliser Grid et Flex pour le CSS
- Me servir de Github
- Passer à SCSS