<?xml version="1.0" encoding="UTF-8"?>

<!-- Déclaration d'une entité pour les nouvelles lignes qui sera utilisée plusieurs fois dans la transformation -->
<!DOCTYPE xsl:stylesheet [
    <!ENTITY newLine "<br/>">
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- Configuration de la sortie en HTML -->
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <!-- Méthode pour éviter les espaces indésirés -->
    <xsl:strip-space elements="*"/>
    
    
    <xsl:template match="/">
        
        <!-- Récupération du chemin et du nom du fichier courant -->
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), '.xml', '')"/>
        </xsl:variable>
        
        <!-- Définition des différentes sorties HTML -->
        <xsl:variable name="pathApropos">
            <xsl:value-of select="concat($witfile, '_apropos','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathBibliographie">
            <xsl:value-of select="concat($witfile, '_bibliographie','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathTranscription">
            <xsl:value-of select="concat($witfile,'_transcription','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathNormalisation">
            <xsl:value-of select="concat($witfile,'_normalisation','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathIndexNoms">
            <xsl:value-of select="concat($witfile,'_indexNoms','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathIndexLieux">
            <xsl:value-of select="concat($witfile, '_indexLieux','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathAccueil">
            <xsl:value-of select="concat($witfile, '_accueil','.html')"/>
        </xsl:variable>
        
        <!-- Définition des variables nécessaires pour l'affichage des pages -->
        <!-- Configuration des métadonnées -->
        <xsl:variable name="head">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title><xsl:value-of select="$title"/></title>
                <!-- Définition des styles à appliquer sur toutes les pages -->
                <style type="text/css">
                    body {
                        padding-left : 10px ;
                        padding-right : 10px ;
                    }
                    h2 {
                        font-style: italic;
                    }
                </style>
                <!-- Lien vers le framework Bootstrap -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous"/>
            </head>
        </xsl:variable>
        
        <!-- Configuration de l'en-tête des pages -->
        <xsl:variable name="header">
            <header>
                <!-- Mise en place d'une barre de navigation pour pouvoir se déplacer à travers les pages -->
                <nav class="navbar navbar-expand-md navbar-light justify-content-md-between" style="background-color: #c6c6c6">
                    <a class="navbar-brand" href="{$pathAccueil}">Présentation</a>
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item"><a class="nav-link" href="{$pathTranscription}">Transcription originale</a></li>
                        <li class="nav-item"><a class="nav-link" href="{$pathNormalisation}">Transcription normalisée</a></li>
                        <li class="nav-item"><a class="nav-link" href="{$pathBibliographie}">Notice bibliographique de l'oeuvre</a></li>
                        <li class="nav-item"><a class="nav-link" href="{$pathIndexNoms}">Index des noms de personnages</a></li>
                        <li class="nav-item"><a class="nav-link" href="{$pathIndexLieux}">Index des lieux</a></li>
                        <li class="nav-item"><a class="nav-link" href="{$pathApropos}">À propos</a></li>
                    </ul>
                </nav>
                <div class="text-center p-5" style="background-color: #e6dae3">
                    <h1><b><xsl:value-of select="concat('Édition numérique d', $apos ,'un extrait du roman-feuilleton ', $title, ' d', $apos, $author)"/></b></h1>
                </div>
            </header>
        </xsl:variable>
        
        
        <!-- Structuration de la page d'accueil -->
        <xsl:result-document href="{$pathAccueil}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$header"/>
                    <h2>Présentation</h2>
                    <p>Réalisée grâce à une transformation XSLT, cette visualisation d'une édition numérique  a été effectuée à partir d'un extrait du roman historique <i><xsl:value-of select="$title"/></i> 
                        d'<xsl:value-of select="$author"/>.</p>
                    <p>En naviguant à travers les différentes pages, plusieurs informations sur l'édition vous seront accessibles :
                        <ul>
                            <li>La transcription originale de l'extrait</li>
                            <li>La transcription normalisée de l'extrait</li>
                            <li>Une notice bibliographique du roman</li>
                            <li>Un index des personnages ainsi que la description de leurs relations</li>
                            <li>Un index des lieux ainsi que la description des relations entre lieux et personnages</li>
                            <li>Une page "À propos" comportant des informations sur l'origine de cette transformation</li>
                        </ul>
                    </p>
                    <p>En vous souhaitant une agréable visite !</p>
                </body>
            </html>
        </xsl:result-document>
        <!-- Structuration de la page comportant la transcription originale -->
        <xsl:result-document href="{$pathTranscription}" method="html" indent="yes">       
            <html>
                <xsl:copy-of select="$head"/>
                <!-- Configuration d'un style spécifique pour les transcriptions afin de reproduire au mieux l'édition disponible sur Gallica -->
                <style type="text/css">
                    li {
                    list-style: none;
                    }
                    q {
                    quotes:none;
                    }
                </style>
                <body>
                    <xsl:copy-of select="$header"/>
                    <h2>Transcription originale</h2>
                    <p>Ci-dessous est rapportée la version originale de notre extrait. Pour sa mise en page, il a été choisi de respecter l'écriture en colonnes en modifiant l'apparition de 
                        ces dernières. Ainsi, de manière à faciliter la lecture, les deux colonnes suivantes représentent les deux chapitres de notre extrait.
                    De même, il a été rajouté pour chaque chapitre des numéros de paragraphe qui, en correspondant à la linéarité de notre extrait, visent à faciliter 
                    la compréhension des index pour le visiteur.</p>
                    <!-- Structuration du texte en colonnes à l'aide du framework Bootstrap -->
                    <div class="container">
                        <div class="row align-items-start">
                            <div class="col">
                                <h2>Chapitre I</h2>
                                &newLine;
                                <xsl:apply-templates select="//div[@type='chapter'and @n='I']" mode="orig"/>
                            </div>
                            <div class="col">
                                <h2>Chapitre II</h2>
                                &newLine;
                                <xsl:apply-templates select="//div[@type='chapter' and @n='II']" mode="orig"/>
                            </div>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>  
        <!-- Structuration de la page comportant la transcription corrigée -->
        <xsl:result-document href="{$pathNormalisation}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <style type="text/css">
                    li {
                    list-style: none;
                    }
                    q {
                    quotes:none;
                    }
                </style>
                <body>
                    <xsl:copy-of select="$header"/>
                    <h2>Transcription normalisée</h2>
                    <p>Ci-dessous est rapportée la version corrigée de notre extrait. Pour sa mise en page, il a été choisi de respecter l'écriture en colonnes en modifiant l'apparition de 
                        ces dernières. Ainsi, de manière à faciliter la lecture, les deux colonnes suivantes représentent les deux chapitres de notre extrait.
                        De même, il a été rajouté pour chaque chapitre des numéros de paragraphe qui, en correspondant à la linéarité de notre extrait, visent à faciliter 
                        la compréhension des index pour le visiteur.</p>
                    <div class="container">
                        <div class="row align-items-start">
                            <div class="col">
                                <h2>Chapitre I</h2>
                                &newLine;
                                <xsl:apply-templates select="//div[@type='chapter'and @n='I']" mode="reg"/>
                            </div>
                            <div class="col">
                                <h2>Chapitre II</h2>
                                &newLine;
                                <xsl:apply-templates select="//div[@type='chapter' and @n='II']" mode="reg"/>
                            </div>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        <!-- Structuration de la page comportant la notice bibliographique -->
        <xsl:result-document href="{$pathBibliographie}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$header"/>
                    <h2>Notice bibliographique</h2>
                    <p>Cette visualisation porte sur le roman historique <i><xsl:value-of select="$title"/></i> d'<xsl:value-of select="$author"/>.</p>
                    <p>Écrivain et député français, l'oeuvre littéraire d'<xsl:value-of select="$author"/> est
                        principalement connue pour ses romans-feuilletons. De fait, la première publication
                        de <i><xsl:value-of select="$title"/></i> revêt cette forme au sein de la 
                         <i>Revue des deux Mondes</i>. Publié pour la première fois en <xsl:value-of select="//profileDesc//date"/>, le
                        roman rencontre une certaine popularité puisqu'une adaptation théâtrale est créée en
                        1840 et que plusieurs éditions sont recensées dans la seconde moitié du XIXe siècle.</p>
                     <p>Ce roman évoque un épisode précis de l'histoire : celui du complot de
                         <xsl:value-of select="$title"/> à l'encontre du roi de France Louis XIV en 1674. Ayant pour visée
                        l'instauration d'une République en France, ce complot échoue et ses membres sont
                        exécutés. Le complot tire son nom de celui qui l'aurait provoqué, Gilles Duhamel de
                        Latréaumont, un noble français.</p>
                    <p>L'édition numérique à l'origine de cette visualisation s'appuie sur une publication de 
                        <xsl:value-of select="//fileDesc//date"/> disponible en ligne sur la plateforme
                        <a href="{//distributor/@facs}" target="_blank">Gallica</a> et éditée par les 
                        <xsl:value-of select="//publisher"/> (<xsl:value-of select="//pubPlace//addrLine"/>).</p>
                     <p>Notre extrait prend place aux pages 4 à 6 de cette publication et est situé dans la première partie du roman intitulée : <xsl:value-of select="//div[@type='part']/head"/></p>
                </body>
            </html>
        </xsl:result-document>
        <!-- Structuration de la page comportant l'index des noms de personnages ainsi que les relations entre ces derniers -->
        <xsl:result-document href="{$pathIndexNoms}" method="html" indent="yes">          
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$header"/>
                    <h2>Index des personnages</h2>
                    <p>Voici les différents noms de personnages apparaissant dans notre extrait accompagnés du chapitre et du numéro de paragraphe correspondants à chaque occurrence. 
                        Si elles existent, différentes informations sont rajoutées pour décrire les personnages.</p>
                    <div>
                        <ul><xsl:call-template name="names_index"/></ul>
                    </div>
                    <h2>Relations entre personnages</h2>
                    <ul><xsl:call-template name="names_relations"/></ul>
                </body>
            </html>
        </xsl:result-document>
        <!-- Structuration de la page comportant l'index des lieux ainsi que les relations entre lieux et personnages -->
        <xsl:result-document href="{$pathIndexLieux}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$header"/>
                    <h2>Index des lieux</h2>
                    <p>Voici les différents lieux apparaissant dans notre extrait accompagnés du chapitre et du numéro de paragraphe correspondants à chaque occurrence.
                    Pour chaque lieu, une note est ajoutée afin d'apporter des informations complémentaires sur le contexte de l'époque.</p>
                    <div>
                        <ul><xsl:call-template name="places_index"/></ul>
                    </div>
                    <h2>Relations concernant les lieux</h2>
                    <ul><xsl:call-template name="places_relations"/></ul>
                </body>
            </html>
        </xsl:result-document>
        <!-- Structuration de la page d'à propros -->
        <xsl:result-document href="{$pathApropos}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$header"/>
                    <h2>À propos</h2>
                    <p>Cette transformation XSLT vers HTML a été effectuée par 
                        <xsl:value-of select="concat(//respStmt//forename, ' ', //respStmt//surname)"/> 
                        dans le cadre de l'évaluation du module XSLT du M2 TNAH de l'École nationale des chartes pour l'année scolaire 2020-2021.</p>
                    <p>Elle s'appuie sur une édition numérique réalisée par la même autrice présentant un encodage XML-TEI, un schéma ODD ainsi qu'une documentation HTML.</p>
                    <p>L'esthétique de la visualisation a été élaborée à l'aide du framework <a href="https://getbootstrap.com/" target="_blank">Bootstrap</a>.</p>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    

    <!-- Définition des variables pour faciliter la mise en page des pages HTML -->
    <xsl:variable name="title">
        <xsl:value-of select="//fileDesc/titleStmt/title"/>
    </xsl:variable>
    
    <xsl:variable name="author">
        <xsl:value-of select="concat(//fileDesc/titleStmt/author//forename, ' ', //fileDesc/titleStmt/author//surname)"/>
    </xsl:variable>
    
    <xsl:variable name="apos">'</xsl:variable>
    
    
    <!-- Règles générales de présentation textuelle s'appliquant à toutes les transcriptions -->
    <xsl:template match="div[@type='chapter']/head" mode="#all">
        <xsl:element name="h4">
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="lg" mode="#all">
        <xsl:element name="ul">
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="l" mode="#all">
        <li>
            <xsl:apply-templates mode="#current"/>
        </li>   
    </xsl:template>
    
    <xsl:template match="title" mode="#all">
        <xsl:element name="cite">
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="quote" mode="#all">
        <xsl:element name="q">
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="cit" mode="#all">
        <xsl:element name="blockquote">
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="lb" mode="#all">
        &newLine;
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template match="p" mode="#all">
        <xsl:element name="p">
            <!-- Mise en place de la numérotation des paragraphes propre à chaque chapitre -->
            <small style="margin-left:25px">
                <i>Numéro de paragraphe : <xsl:number count="p" level="multiple" format="1"/></i>
            </small>
            <br/>
            <xsl:apply-templates mode="#current"/> 
        </xsl:element>
    </xsl:template>
    
    
    <!-- Règles pour le respect de la graphie d'origine -->
    <xsl:template match="hi[@rend='italic']" mode="#all">
        <xsl:element name="i">
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="hi[@rend='bold']" mode="#all">
        <xsl:element name="b">
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    
    <!-- Règles pour l'affichage des différentes transcriptions -->
    <xsl:template match="choice" mode="orig">
        <xsl:value-of select=".//sic/text()"/>
    </xsl:template>
    
    <xsl:template match="choice" mode="reg">
        <xsl:value-of select=".//corr/text()"/>
    </xsl:template>


    <!-- Règle pour l'index des noms de personnages -->
    <xsl:template name="names_index">
        <xsl:for-each select="//listPerson//persName">
            <xsl:variable name="idPerson">
                <xsl:value-of select="parent::person/@xml:id"/>
            </xsl:variable>
            <!-- Vérification que le nom du personnage est bien cité par l'auteur dans l'extrait et qu'il ne situe pas qu'uniquement dans l'encodage (cas de Jules Duhamel de Latréaumont) -->
            <xsl:if test="ancestor::TEI//body//persName[replace(@ref, '#','')=$idPerson]">
                <li>
                    <i><xsl:value-of select="."/></i>
                    &newLine;
                    
                    <!-- Récupération des notes du personnage -->
                    <xsl:text>Note : </xsl:text><xsl:value-of select="parent::person/note"/>
                    &newLine;
                    
                    <!-- Si elles existent, récupération des informations sur la naissance du personnage -->
                    <xsl:if test="parent::person/birth">
                        <xsl:text>Naissance : </xsl:text><xsl:value-of select="concat('Le ', parent::person/birth/text(), ' à ', parent::person/birth/placeName,'.')"/>
                        &newLine;
                    </xsl:if>
                    
                    <!-- Si elles existent, récupération des informations sur le décès du personnage -->
                    <xsl:if test="parent::person/death">
                        <xsl:text>Décès : </xsl:text><xsl:value-of select="concat('Le ', parent::person/death/text(), ' à ', parent::person/death/placeName,'.')"/>
                        &newLine;
                    </xsl:if>
                    
                    <!-- Vérification de la présence des occurrences recherchées -->
                    <xsl:if test="ancestor::TEI//body//div[@type='chapter' and @n='I']/p//persName[replace(@ref, '#','')=$idPerson]">
                        <!-- Si la condition est vraie, configuration d'un index pour le premier chapitre -->
                        <xsl:text>Occurrence(s) dans le premier chapitre : </xsl:text>
                        <xsl:for-each select="ancestor::TEI//body//div[@type='chapter' and @n='I']/p//persName[replace(@ref, '#','')=$idPerson]">
                            <xsl:value-of select="."/>
                            <xsl:text> (p.</xsl:text>
                            <!-- Décompte des paragraphes -->
                            <xsl:value-of select="count(ancestor::p/preceding-sibling::p) + 1"/>
                            <xsl:text>)</xsl:text>
                            <xsl:choose>
                                <xsl:when test="position() = last()">.</xsl:when>
                                <xsl:otherwise>, </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        &newLine;
                    </xsl:if>
                    
                    <!-- Vérification de la présence des occurrences recherchées -->
                    <xsl:if test="ancestor::TEI//body//div[@type='chapter' and @n='II']/p//persName[replace(@ref, '#','')=$idPerson]">
                        <!-- Si la condition est vraie, configuration d'un index pour le deuxième chapitre -->
                        <xsl:text>Occurrence(s) dans le deuxième chapitre : </xsl:text>
                        <xsl:for-each select="ancestor::TEI//body//div[@type='chapter' and @n='II']/p//persName[replace(@ref, '#','')=$idPerson]">
                            <xsl:value-of select="."/>
                            <xsl:text> (p.</xsl:text>
                            <!-- Décompte des paragraphes -->
                            <xsl:value-of select="count(ancestor::p/preceding-sibling::p) + 1"/>
                            <xsl:text>)</xsl:text>
                            <xsl:choose>
                                <xsl:when test="position() = last()">.</xsl:when>
                                <xsl:otherwise>, </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:if>
                    
                </li>
                &newLine;
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
   
    
    <!-- Règle pour l'index des noms de lieux -->
    <xsl:template name="places_index">
        <xsl:for-each select="//listPlace//placeName">
            <xsl:variable name="idPlace">
                <xsl:value-of select="parent::place/@xml:id"/>
            </xsl:variable>
            <li>
                <i><xsl:value-of select="."/></i>
                &newLine;
                
                <!-- Récupération des notes du lieu -->
                <xsl:text>Note : </xsl:text><xsl:value-of select="parent::place/note"/>
                &newLine;
                
                <!-- Vérification de la présence des occurrences recherchées -->
                <xsl:if test="ancestor::TEI//body//div[@type='chapter' and @n='I']/p//placeName[replace(@ref, '#','')=$idPlace]">
                    <!-- Si la condition est vraie, configuration d'un index pour le premier chapitre -->
                    <xsl:text>Occurrence(s) dans le premier chapitre : </xsl:text>
                    <xsl:for-each select="ancestor::TEI//body//div[@type='chapter' and @n='I']/p//placeName[replace(@ref, '#','')=$idPlace]">
                        <xsl:value-of select="."/>
                        <xsl:text> (p.</xsl:text>
                        <!-- Décompte des paragraphes -->
                        <xsl:value-of select="count(ancestor::p/preceding-sibling::p) + 1"/>
                        <xsl:text>)</xsl:text>
                        <xsl:choose>
                            <xsl:when test="position() = last()">.</xsl:when>
                            <xsl:otherwise>, </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    &newLine;
                </xsl:if>
                
                <!-- Vérification de la présence des occurrences recherchées -->
                <xsl:if test="ancestor::TEI//body//div[@type='chapter' and @n='II']/p//placeName[replace(@ref, '#','')=$idPlace]">
                    <!-- Si la condition est vraie, configuration d'un index pour le deuxième chapitre -->
                    <xsl:text>Occurrence(s) dans le deuxième chapitre : </xsl:text>
                    <xsl:for-each select="ancestor::TEI//body//div[@type='chapter' and @n='II']/p//placeName[replace(@ref, '#','')=$idPlace]">
                        <xsl:value-of select="."/>
                        <xsl:text> (p.</xsl:text>
                        <!-- Décompte des paragraphes -->
                        <xsl:value-of select="count(ancestor::p/preceding-sibling::p) + 1"/>
                        <xsl:text>)</xsl:text>
                        <xsl:choose>
                            <xsl:when test="position() = last()">.</xsl:when>
                            <xsl:otherwise>, </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                
            </li>
            &newLine;
        </xsl:for-each>
    </xsl:template>
    
    
    <!-- Règles pour décrire les différentes relations entre les personnages -->
    <xsl:template name="names_relations">
        <!-- Ici, il a été privilégié d'utiliser une boucle en considérant l'existence de plusieurs relations qui ne sont pas du type propriété -->
        <xsl:for-each select="//listRelation[@type!='propriete']">
            <xsl:variable name="active">
                <xsl:value-of select="./relation/replace(@active, '#', '')"/>
             </xsl:variable>
             <xsl:variable name="passive">
                 <xsl:value-of select="./relation/replace(@passive, '#', '')"/>
             </xsl:variable>
            <li>
                <xsl:value-of select="concat($active/replace($active, '_', ' '), ' est le ', ./relation/@name, ' de ', $passive/replace($passive, '_', ' '), '.')"/>
            </li>
        </xsl:for-each> 
    </xsl:template>
    
    
    <!-- Règles pour décrire les différentes relations entre les personnages et les lieux -->
    <xsl:template name="places_relations">
        <!-- Dans le cas suivant, l'utilisation d'un if a été choisi considérant l'existence que d'une relation de type propriété -->
        <xsl:if test="//listRelation[@type='propriete']">
            <xsl:variable name="lieu_active">
                <xsl:value-of select="//listRelation[@type='propriete']/relation/replace(@active, '#', '')"/>
            </xsl:variable>
            <xsl:variable name="lieu_passive">
                <xsl:value-of select="//listRelation[@type='propriete']/relation/replace(@passive, '#', '')"/>
            </xsl:variable>
            <xsl:variable name="lieu_type">
                <xsl:value-of select="//listRelation[@type='propriete']/relation/replace(@name, 'ie', 'ié')"/>
            </xsl:variable>
            <li>
                <xsl:value-of select="concat($lieu_active/replace($lieu_active, '_', ' '), ' est le ', $lieu_type, ' de l',$apos, $lieu_passive/replace($lieu_passive, '_', ' '), '.')"/>
            </li>   
        </xsl:if>
    </xsl:template>
 
</xsl:stylesheet>