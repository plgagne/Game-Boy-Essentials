# Game Boy Essentials
[![site-build](https://github.com/plgagne/Game-Boy-Essentials/actions/workflows/site-build.yml/badge.svg)](https://github.com/plgagne/Game-Boy-Essentials/actions/workflows/site-build.yml)

# Tâches
- Envoyer des copies de mes livres à Bibliothèque et Archives (https://bibliotheque-archives.canada.ca/fra/services/editeurs/depot-legal/Pages/depot-publications-imprimees.aspx)
- Terminer timeline
    - Migrer les données de timeline sur Mobygames
- Traduire les mauvaises idées
- Ajouter les catalogues de JC Penney et Sears sur la ligne du temps
- Vérifier la disponibilité du Volume 1
    - https://www.amazon.com/s?k=game+boy+essentials+book
    - https://www.barnesandnoble.com/s/game%20boy%20essentials

## Long terme
- Jouer à https://taylormccue.itch.io/trauma
- Produire une automatisation pour faire un ebook
- Ajouter un outil de comparaison de PDF pour visuellement vérifier mes livres (https://github.com/serhack/pdf-diff)
- Ajouter un Git Hook qui rapetisse les images ajoutés au repo (https://www.redhat.com/sysadmin/git-hooks)
- Faire une infolettre pour être averti de mes nouvelles publications avec Amazon SES comme système d'envoi et mon courriel comme gestionnaire des abonnements
- Terminer l'intégration de backstopJS dans un postbuild.sh
- Implanter SASS
- Avoir une liste complète des logiciels nécessaires pour les mettre à jour (xelatex, kramdown, backstopJS, curl)
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
- Have the further reading section with the same width as the article
    - It’s never influencing the width of the page and it’s drawing attention to it when its wider
- Simplifying the CSS
    - It’s already very simple without getting rid of legibility; from 5kb to 3kb max gain with hardcore legibility cuts
- Having a newsletter
    - The HTML and CSS is complicated; the appeal will be very limited; you’d be moving away from core competency; seriously, nobody would care
    - To get a Mailchimp account you need a physical address; it’s not worth it at all.
- Use ?v=1 to version your files
    - Coda very poorly handles it and this means it would take more effort than simply invalidating the file in Cyberduck. Not a time gain, a time waste.
- Footnotes
    - It’s bad writing.
- Moving the collection spreadsheet to HTML
    - Markdown tables are a mess
    - You lose the ability to play with the data
- Having an SVG logo that includes the Game Boy wordmark
    - The Game Boy wordmark is ugly on a computer screen. Another idea for a logo would be needed.
- Having Full Bleed images in articles
    - Achieving it with display:grid means you would have to abandon the use of figure
    - It breaks the overall aesthetic of the website when it works; it would require a thorough redesign
- Redesigning the Home Page game lists
    - You just don’t know enough CSS to make it sharp; what would be beautiful cannot be achieved with the ethos of simple, readable CSS
- Using SCSS
    - Fuck that noise; clean, simple CSS is one file, written in a reasonable order and SCSS introduces weird edge cases that I cannot figure out.
- Utiliser Github Pages pour le site web
    - C'est interdit de l'utiliser à des fins commerciales.
- Créer un _includes pour la page d'accueil
    - Le code apparait juste une fois, c'est inutile.

## Là où j'ai changé d'idée
- Automatiser la reliure du livre
- Retirer le texte souligné des liens
- Utiliser H1 pour le titre des articles
- Utiliser Grid et Flex pour le CSS
- Me servir de Github