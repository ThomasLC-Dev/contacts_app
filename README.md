# Contacts
Application de répertoire de contacts téléphoniques, développée en Dart avec le SDK Flutter.

## Description
Le projet suivant cherche à reproduire une application de type "Contacts" ou "Répertoire" qui liste l'ensemble des contacts enregistrés par l'utilisateur/utilisatrice.  
L'application est développée en Dart version 2.19.2, avec le SDK Flutter version 3.7.3, à l'aide des IDEs Visual Studio Code et Android Studio (création émulateur).

## Fonctionnalités
### Ajout d'un contact
La fenêtre de l'application au premier démarrage se présente ainsi :  

![image](https://user-images.githubusercontent.com/114923734/218749272-7c3ce2f5-41e8-4555-8fbf-d8f2ec45b7c8.png)

Pour ajouter un contact, il suffit de cliquer sur le bouton "+" en bas à droite.  
L'utilisateur renseigne ensuite le nom, prénom et numéro de téléphone du contact :  

![image](https://user-images.githubusercontent.com/114923734/218689816-1fa1cfb3-060d-4155-baf0-8659c72d51d7.png)  

- Le bouton "Annuler" n'enregistre pas les informations saisies et l'utilisateur/utilisatrice revient sur la page de départ.
- Le bouton "Valider" enregistre les informations saisies comme suit :  

![image](https://user-images.githubusercontent.com/114923734/218749631-e83bffea-426d-4f7c-a3ec-26e072eb6cb0.png)

### Modification/suppression d'un contact
Pour modifier ou supprimer un contact, il faut cliquer sur le bouton bleu à droite des informations du contact :  

![image](https://user-images.githubusercontent.com/114923734/218751747-b1ac676b-408b-4830-b16a-012b618a6438.png)  

Les informations du contact s'affichent et sont modifiables.  

![image](https://user-images.githubusercontent.com/114923734/218693554-54ab4ad6-2bf7-41ba-9848-2700cd0608b2.png)  

- Le bouton "Annuler" n'enregistre pas les modifications saisies et l'utilisateur/utilisatrice revient sur la page de départ.
- Le bouton "Valider" enregistre les modifications :  

![image](https://user-images.githubusercontent.com/114923734/218693932-c5d83718-8f47-4ccf-8f60-d5590bff66d4.png)  
- Le bouton "Supprimer le contact" supprime le contact de la liste.  

### Appel
Pour appeler le contact enregistré, il suffit d'appuyer sur le bouton vert tout à droite :  

![image](https://user-images.githubusercontent.com/114923734/218709534-11fde38d-4cc3-4ed3-9b81-8dd6237f6a75.png)  
On peut ainsi appeler le numéro enregistré grâce à l'application "Appels" installée par défaut sur l'appareil de l'utilisateur/utilisatrice :  

![image](https://user-images.githubusercontent.com/114923734/218709931-d69ae883-069a-46fe-860e-7c665b198083.png)  

### Barre de recherche
Une barre de recherche permettant de filtrer les contacts se situe au-dessus de la liste des contacts :  

![image](https://user-images.githubusercontent.com/114923734/218753122-8ac1e97a-f560-4e08-92c9-4f941452205f.png)

Pour rechercher un contact, il suffit de cliquer sur l'icône en forme de loupe tout en haut à droite :  

![image](https://user-images.githubusercontent.com/114923734/218753643-44a3fe32-6010-42f8-bd04-4abe1129889c.png)

Pour afficher le résultat de la recherche, on clique sur la loupe dans le clavier :  

![image](https://user-images.githubusercontent.com/114923734/218753923-907d1093-b2e4-437b-8c41-53af271909e9.png)

Deux autres icônes sont cliquables :
- La croix sert à effacer le contenu de la barre.
- La flèche pointant vers la gauche sert à revenir à la liste complète des contacts.

## Éventuelles poursuites
- Possibilité d'ajouter une photo pour chaque contact, et de la modifier si besoin.  

## Installation
Lien d'un tutoriel pour installer Dart et Flutter :  
https://pythonforge.com/installer-flutter-dart-et-android-studio/

## Exécution
Exécuter le fichier home.dart sur un émulateur ou sur un navigateur (sélectionnez le navigateur de votre choix dans la partie indiquée de la capture d'écran ci-dessous) :  

![image](https://user-images.githubusercontent.com/114923734/218698527-a45b23b8-56e7-4f78-8a16-ee7df4e7b79a.png)  
(Capture d'écran Visual Studio Code)

## Auteurs
Thomas LE CORVEC et Timothée GAROT
