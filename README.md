[Card database and deck builder](https://klanz-deckbuilder.herokuapp.com/) for online CCG [http://klanz.ru](klanz.ru)

![alt tag](http://s010.radikal.ru/i312/1702/85/9d06cb6c9496.png)

### Players feedback on the game forum: [here](http://old.klanz.ru/forums/1/topics/30429).

### Features:
* Flexible and fast card search and filters
* Player's decks database
* Star cards sale schedule
* Cards parser

##### How to parse all cards?
1. In the lib directory there is a parser.rb
2. Run it as usual ruby script
3. Wait until all cards are parsed
4. You can find the result cards data in the cards.json in the same folder

### What about images?
    art_link = card.at_css('.avatar-wrap').at_css('img').attributes['src']
    download_art art_link, id
    
If you want arts to be downloaded too just uncomment this code and all images will be downloaded.

There is some issues: on the main site arts are stored in the different formats: jpg, png, gif.
The worst thing is that some cards are stored with _no_ extension though they are still jpg.

Thats it!

_Ruby on Rails pet-project_
