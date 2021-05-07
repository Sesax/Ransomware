# Ransomware
Ransomware Bash

Pierre LABADIE, Zaccaria MALDRIE, Marc-Antoine TAISANT

Ce ransomware à été codé en bash, il peut être executé hors connection.

FONCTIONNEMENT

Le foncionnement du script est assez simple, après execution, il chiffre tout les FICHIERS contenu dans le répertoire /home et ses sous répertoires.
Pour cela, il utilise un système de chiffrement hybride.
Chaque fichier est chiffré grâce à un système de chiffrement symétrique et une clé UNIQUE lui est générée par le script.
Toutes les clés symétriques sont stockées dans un dossier à la racine.
Ce dossier est ensuite chiffré grâce à une clé publique qui est directement intégrée dans le ransomware. (publicServer-key.pem)
La clé privée correspondante est gardée sur le serveur d'origine tout le long de l'opération, la victime ne pourra donc pas, ou difficilement la récupérer.

AMELIORATIONS POSSIBLES

On pourrait mettre un ligne un site sur lequel la victime serait redirigée, sur lequel il serait inviter à payer vers une adresse Bitcoin générée par le script de façon à être difficilement traçable.

Le ransomware ne comprend pas de backdoor pour le moment, on pourrait envisager d'en ajouter une.

Pour un ransomware efficasse, il serait aussi nécessaire d'ajouter des fonctions de propagation dans le système et de le rendre difficilement détéctable par les anti-virus.
