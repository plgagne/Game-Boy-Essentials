# Game Boy Essentials
[![site-build](https://github.com/plgagne/Game-Boy-Essentials/actions/workflows/site-build.yml/badge.svg)](https://github.com/plgagne/Game-Boy-Essentials/actions/workflows/site-build.yml)

## URLs
- [Github Pages](https://plgagne.github.io/Game-Boy-Essentials/)
- [S3](http://gameboyessentials.com.s3-website-us-east-1.amazonaws.com/)

## Tâches
- Plan A: Utiliser https://github.com/ivoanjo/s3_website_revived
- Plan B: Ajouter programmatiquement des objets de redirection pour chaque article
  - [ ] copier les redirections historiques (/1989/slug.html) en format JSON dans le bucket
  - [ ] Faire un find qui trouve tous les fichiers .html
  - [ ] exclure /index.html
  - [ ] retirer le .html de chaque fichier
  - [ ] synchroniser sur S3 tous les fichiers sans extensions comme text/html
  - [ ] synchroniser sur S3 tous les fichiers avec extensions excluant .html
  - [ ] Faire un autre find qui trouve tous les fichiers sans extensions
  - [ ] Créer un fichier .html vide pour chaque fichier vide (je pense que Jekyll va cruncher ces fichiers à chaque build)
  - [ ] Vérifier si le fichier existe sur S3
    - [ ] Copier le fichier s'il n'existe pas
  - [ ] Vérifier si un /slug/index.html existe
    - [ ] créer un dossier avec le nom du fichier
    - [ ] créer un fichier index.html dans chaque nouveau dossier
  - [ ] Vérifier si le fichier existe sur S3
    - [ ] Copier le fichier s'il n'existe pas
  - https://docs.aws.amazon.com/AmazonS3/latest/userguide/how-to-page-redirect.html
  - https://stackoverflow.com/questions/32393026/exclude-multiple-folders-using-aws-s3-sync
  - https://stackoverflow.com/questions/41871948/aws-s3-how-to-check-if-a-file-exists-in-a-bucket-using-bash
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