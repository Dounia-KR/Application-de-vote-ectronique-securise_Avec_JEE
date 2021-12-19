# Application-de-vote-electronique-securise_Avec_JEE
Application de vote electronique securise Avec JEE
Développer une application web qui met en place un système de vote électronique sécurisé avec deux 
autorités centrales séparées. Une autorité pour identifier les votants et l’autre pour compter 
les votes. Aucune des deux autorités n’a assez de pouvoir pour tricher de son propre chef.

Enoncé du projet :

Dans une entreprise multinationale, son PDG (président-directeur général) désire organiser
un vote à distance électronique entre ces personnelles pour élire un nouveau responsable
dans son siège. Pour cela, un ensemble de n correspondant ou personnels désirent voter un
représentant parmi m candidats en utilisant la messagerie électronique sécurisée (OpenPGP).
Chaque votant Vi sera identifié par son nom, son prénom et sa date de naissance. On affecte
à chaque votant un numéro de vote I. Vi possède une clé publique KpVi connue de tout le
monde et une clé privée KprVi . Un votant envoie deux messages chiffrés contenant son
bulletin de vote B et son numéro d’identification I à deux centres.

1. Un centre de comptage CO : Ce centre reçoit un message chiffré d’un votant Vi,
contenant les informations (I, B chiffré et destiné à DE) avec les restrictions
suivantes : CO pourra lire I et ne doit pas accéder au bulletin de vote B. CO possède
une liste contenant nom, prénom, date de naissance et I de tous les votants. Son rôle
est de vérifier l’identité de Vi à partir de I et la clé publique de Vi. Ensuite, CO marque
Vi sur la liste pour éviter un second vote de I. Enfin, CO chiffre (I, B chiffré et destiné
à DE) et l’envoie au centre DE. Les clés privée et publique de CO sont KprCO et KpCO.
2. Un centre de dépouillement DE : Ce centre reçoit le message de CO et le message
chiffré de Vi contenant (I, B). Sa tâche consiste à déchiffrer les deux messages sans
possibilité d’identifier Vi. Si après déchiffrement les deux messages sont égaux à (I, B)
alors le vote de Vi sera validé. Les clés privée et publique de DE sont KprDE et KpDE. 

![page_principale](https://user-images.githubusercontent.com/76055517/146623052-91cc2d48-bbab-4c6e-a4e7-9499f406d3d1.PNG)

![page_vote](https://user-images.githubusercontent.com/76055517/146623387-95cd143e-5643-4a92-bb87-900fd9f5d62b.PNG)

![centre_CO](https://user-images.githubusercontent.com/76055517/146623395-995c9e1a-23e2-4e5c-bbd0-14ae31ab0be4.PNG)

![centre_DE](https://user-images.githubusercontent.com/76055517/146623408-319d32db-4967-44b9-adff-d8f335b19f1c.PNG)


![Resulta_vote](https://user-images.githubusercontent.com/76055517/146623415-40793ff2-89a5-4ded-9824-d9ca84580104.PNG)
