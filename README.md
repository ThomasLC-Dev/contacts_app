# Contacts
Application de répertoire de contacts téléphoniques, développée en Dart avec le SDK Flutter.

## Description
Le projet suivant cherche à reproduire une application de type "Contacts" ou "Répertoire" qui liste l'ensemble des contacts enregistrés par l'utilisateur/utilisatrice.  
L'application est développée en Dart version 2.19.2, avec le SDK Flutter version 3.7.3, à l'aide des IDEs Visual Studio Code et Android Studio (création émulateur).

## Fonctionnalités
### Ajout d'un contact
La fenêtre de l'application au premier démarrage se présente ainsi :  

![image](https://user-images.githubusercontent.com/114923734/218689454-34ff6854-8ce2-4597-825b-9a6c947047de.png)  

Pour ajouter un contact, il suffit de cliquer sur le bouton "+" en bas à droite.  
L'utilisateur renseigne ensuite le nom, prénom et numéro de téléphone du contact :  

![image](https://user-images.githubusercontent.com/114923734/218689816-1fa1cfb3-060d-4155-baf0-8659c72d51d7.png)  

- Le bouton "Annuler" n'enregistre pas les informations saisies et l'utilisateur/utilisatrice revient sur la page de départ.
- Le bouton "Valider" enregistre les informations saisies comme suit :  

![image](https://user-images.githubusercontent.com/114923734/218690620-dd244a55-a998-484b-8c1c-5deaec08e70b.png)

### Modification/suppression d'un contact
Pour modifier ou supprimer un contact, il faut cliquer sur le bouton bleu à droite des informations du contact :  

![image](https://user-images.githubusercontent.com/114923734/218692263-07d2cc8f-71f4-431b-b91b-f3a8f2b8d322.png)  

Les informations du contact s'affichent et sont modifiables.  

![image](https://user-images.githubusercontent.com/114923734/218693554-54ab4ad6-2bf7-41ba-9848-2700cd0608b2.png)  

- Le bouton "Annuler" n'enregistre pas les modifications saisies et l'utilisateur/utilisatrice revient sur la page de départ.
- Le bouton "Valider" enregistre les modifications :  

![image](https://user-images.githubusercontent.com/114923734/218693932-c5d83718-8f47-4ccf-8f60-d5590bff66d4.png)  
- Le bouton "Supprimer le contact" supprime le contact de la liste.  

## Appel
Pour appeler le contact enregistré, il suffit d'appuyer sur le bouton vert tout à droite :  

![image](https://user-images.githubusercontent.com/114923734/218709534-11fde38d-4cc3-4ed3-9b81-8dd6237f6a75.png)  
On peut ainsi appeler le numéro enregistré grâce à l'application "Appels" installée par défaut sur l'appareil de l'utilisateur/utilisatrice :  

![image](https://user-images.githubusercontent.com/114923734/218709931-d69ae883-069a-46fe-860e-7c665b198083.png)

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
