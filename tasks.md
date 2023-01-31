# Tâches
- Traduire les mauvaises idées
- Ajouter un outil de comparaison de PDF pour visuellement vérifier mes livres (https://github.com/serhack/pdf-diff)
- Fermer mon compte Twitter
- Envoyer des copies de mes livres à Bibliothèque et Archives (https://bibliotheque-archives.canada.ca/fra/services/editeurs/depot-legal/Pages/depot-publications-imprimees.aspx)
- Prendre une photo de mes livres pour la page des livres
- Ajouter les catalogues de JC Penney et Sears sur la ligne du temps
- Faire une infolettre pour être averti de mes nouvelles publications avec Amazon SES comme système d'envoi et mon courriel comme gestionnaire des abonnements
- Ajouter un script que je roule avant Jekyll build et serve qui crée une image spéciale du start-screen avec Imagemagick pour la distribution de Open Graph et Twitter Card (bordure noire et taille plus grande pour le flou d'agrandissement)
    - ImageMagick border manual (https://www.imagemagick.org/Usage/crop/#border)
    - Testeur de Open Graph (https://developers.facebook.com/tools/debug/)

# Liste de vérification pour publication d'un article
- [ ] Check that you have all release dates (Europe included)
- [ ] Edit final article with Antidote
- [ ] Run titles with Title Case Service
- [ ] Move article to the articles folder
- [ ] Run ImageOptim.app on all new images
- [ ] Insert release dates in the timeline
- [ ] Build with Jekyll
- [ ] Synchronize with Nova task
- [ ] Check that everything is OK
- [ ] Publish link to Mastodon

# Liste de mauvaises idées
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
- Using Github Pages to publish the website
    - The plugins you use are too niche to work with the classic Github Pages interface. Any of the custom Github Actions require more fiddling with Git than you know about. And Github Actions are not free, I think?
    - Tu l'utilises en ce moment mais il y a un bogue qui l'arrête de fonctionner. C'est un chateau de cartes trop compliqué.

# The Shit I Went Back On
- Programmatically making the book
- Removing underlines from links
- Have the title of articles as H1 and increasing the font
- Moving the CSS to a Grid or Flex model
- Using Github as a sync engine