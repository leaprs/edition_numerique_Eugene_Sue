# À propos

Ce projet d'édition numérique d'un extrait du roman feuilleton _Latréaumont_ d'Eugène Sue (1859) se divise en deux parties :
- la création d'un encodage XML-TEI de l'extrait ainsi que d'une ODD documentée
- la transformation XSLT de cet endodage afin d'obtenir plusieurs visualisations

# Structure du dépôt

```
encodage_EAD
    ├── documentation
    │      ├── lautreaumont_ODD.html                    --> Documentation HTML
    │      ├── lautreaumont_ODD.rng                     --> Fichier Relax NG lié à l'encodage
    |      └── lautreaumont_ODD.xml                     --> ODD
    ├── pages                                           --> Résultats de la transformation XSLT
    │      ├── lautreaumont_accueil.html 
    │      ├── lautreaumont_apropos.html 
    │      ├── lautreaumont_bibliographie.html 
    │      ├── lautreaumont_indexLieux.html
    │      ├── lautreaumont_indexNoms.html 
    │      ├── lautreaumont_normalisation.html 
    │      └── lautreaumont_transcription.html 
    ├── lautreaumont.xml                                --> Encodage XML-TEI
    └── lautreaumont.xsl                                --> Feuille de transformation XSL
```
