
#!/bin/bash

# Boucle qui va tout d'abord déchiffrer les fichiers contenant les clés
# symétriques grâce à la clé privée du serveur

for f in $(find /encFiles/* -type f)
do
        openssl rsautl -decrypt -inkey privateServer-key.pem -in $f -out ${f%.*} >/dev/null 2>&1
        rm $f > /dev/null 2>&1
done

# Boucle qui déchiffrera ensuite chaque fichier un par un grâce
# aux clés symétriques contenues dans les fichiers .gc qui viennent
# d'être déchiffrés

for f in $(find /home/camille/* -type f)
do
        nbFile=1
        KEY=""
        IV=""

        # Dans cette boucle, le programme ira tester chaque fichier .gc
        # pour trouver les clé symétriques corréspondants au fihcier

        for i in $(find /encFiles/* -type f)
        do
                cat $i
                KEY=$(grep -A1 $(realpath $f) /encFiles/encFile$nbFile.gc | grep -v $(realpath $f))
                echo $KEY
                if [ -z $KEY ]; then IV="" ; else IV=$(grep -A1 $KEY /encFiles/encFile$nbFile.gc | grep -v $KEY); fi
                echo $IV

                # Déchiffrement du fichier

                openssl enc -aes-256-cbc -nosalt -d -in $f -out ${f%.*} -K $KEY -iv $IV >/dev/null 2>&1
                ((nbFile++))
        done

        # On supprime les anciens fichiers cryptés

        rm $f
done

