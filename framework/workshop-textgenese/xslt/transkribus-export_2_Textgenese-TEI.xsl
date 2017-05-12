<?xml version="1.0" encoding="UTF-8"?>
<!-- 
TEI Workshop Textgenese, 12.5.2017, Wien
Transformiert Transkribus-Export in TEI-Datei zur Weiterbearbeitung

- erzeugt <teiHeader> für workshoprelevante Metadaten
- erhält <facsimile> mit Referenzen auf Transkribus
- transformiert <text> in <sourceDoc> mit <surface>, <zone>, <line>...

Transkribus Export Settings:
TEI
Zone per region
Zone per line
Line Breaks:
Line tags <l>...</l>
Select Tags (del, add, ...)

Autor:
Ingo Börner (ingo.boerner@univie.ac.at)
-->


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  version="2.0">
  <xsl:output encoding="UTF-8"/>
  <xsl:strip-space elements="tei:p tei:text tei:teiHeader"/>


  <!-- IdentityTransform -->
  <xsl:template xmlns="http://www.tei-c.org/ns/1.0" match="/ | @* | node() | comment()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()" />
    </xsl:copy>
  </xsl:template>
  
  <xsl:template xmlns="http://www.tei-c.org/ns/1.0" match="tei:teiHeader">
    <xsl:element name="teiHeader">
      <xsl:call-template name="fileDesc"/>
      <xsl:text>&#xa;</xsl:text>
      <xsl:call-template name="encodingDesc"/>
      <xsl:text>&#xa;</xsl:text>
      <xsl:call-template name="profileDesc"/>
      <xsl:text>&#xa;</xsl:text>
      <xsl:call-template name="revisionDesc"/>
      <xsl:text>&#xa;</xsl:text>
    </xsl:element>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>
  
  <xsl:template xmlns="http://www.tei-c.org/ns/1.0" name="fileDesc">
    <xsl:element name="fileDesc">
    <xsl:element name="titleStmt">
      <xsl:element name="title">
        <xsl:attribute name="type" select="'main'"/>
        <xsl:comment>Titel des Textes/der Edition</xsl:comment>
        <xsl:text>&#xa;</xsl:text>
        <xsl:value-of select="root()//tei:titleStmt/tei:title"/>
      </xsl:element>
      <xsl:element name="author">
        <xsl:element name="persName">
          <xsl:comment>Autor des Textes</xsl:comment>
          <xsl:text>&#xa;</xsl:text>
        </xsl:element>
      </xsl:element>
      <xsl:comment>weitere Autoren</xsl:comment>
      <xsl:text>&#xa;</xsl:text>
      <xsl:element name="editor">
        <xsl:element name="persName">
          <xsl:comment>1. Herausgeber</xsl:comment>
        </xsl:element>
      </xsl:element>
      <!-- weitere Herausgeber -->
      <xsl:element name="respStmt">
        <xsl:element name="resp">
          <xsl:text>erstellt unter Anleitung von</xsl:text>
        </xsl:element>
        <xsl:element name="persName">
          <xsl:text>Stefano Apostolo</xsl:text>
        </xsl:element>
        <xsl:element name="persName">
          <xsl:text>Ingo Börner</xsl:text>
        </xsl:element>
        <xsl:element name="persName">
          <xsl:text>Angelika Hechtl</xsl:text>
        </xsl:element>
      </xsl:element>
    </xsl:element> <!-- /titleStmt -->
    <xsl:element name="publicationStmt">
      <xsl:element name="p">
        <xsl:text>unveröffentlicht.</xsl:text>
      </xsl:element>
    </xsl:element> <!-- /publicationStmt -->
    <xsl:element name="sourceDesc">
      <xsl:element name="msDesc">
        <xsl:comment>Beschreibung des Materials, sehr ausführlich: http://www.tei-c.org/release/doc/tei-p5-doc/en/html/MS.html</xsl:comment>
        <xsl:text>&#xa;</xsl:text>
        <xsl:element name="msIdentifier"></xsl:element>
      </xsl:element>
    </xsl:element> <!-- /sourceDesc -->
    </xsl:element> <!-- /fileDesc -->
  </xsl:template>
  
  <xsl:template xmlns="http://www.tei-c.org/ns/1.0" name="encodingDesc">
    <xsl:element name="encodingDesc">
      <xsl:element name="projectDesc">
      <xsl:element name="p">
        <xsl:text>Erstellt im Rahmen des Workshops </xsl:text>
        <xsl:element name="title">TEI-Encoding von Textgenese</xsl:element>
        <xsl:text> am </xsl:text>
        <xsl:element name="date">
          <xsl:attribute name="when" select="current-date()"/>
          <xsl:text>12. Mai 2017</xsl:text>
        </xsl:element>
        <xsl:text>.</xsl:text>
      </xsl:element> <!-- /p -->
    </xsl:element> <!-- /projectDesc -->
    </xsl:element>
  </xsl:template>
  
  <xsl:template xmlns="http://www.tei-c.org/ns/1.0" name="profileDesc">
    <xsl:element name="profileDesc">
      <xsl:element name="creation">
        <xsl:comment>Informationen zur Textgenese</xsl:comment>
        <xsl:text>&#xa;</xsl:text>
        <xsl:element name="listChange">
          <xsl:comment>Textzustände/Textstufen</xsl:comment>
          <xsl:element name="change">
            <xsl:comment>Textzustand</xsl:comment>
            <xsl:text>&#xa;</xsl:text>
            <xsl:comment>xml:id vergeben, übrige Attribute beachten</xsl:comment>
            <xsl:text>&#xa;</xsl:text>
          </xsl:element>
          <xsl:comment>Weitere Textstufen</xsl:comment>
        </xsl:element> <!-- /listChange -->
      </xsl:element> <!-- /creation -->
      <xsl:element name="handNotes">
        <xsl:comment>Schreiberhände</xsl:comment>
        <xsl:element name="handNote">
          <xsl:comment>Hier die Informationen zur Schreiberhand; beschreibend</xsl:comment>
          <xsl:text>&#xa;</xsl:text>
          <xsl:comment>xml:id vergeben, übrige Attribute beachten: Schreiber, Schreibmedium, ... </xsl:comment>
        </xsl:element> <!-- /handNote -->
      </xsl:element> <!-- /handNotes -->
      <xsl:element name="particDesc">
        <xsl:comment>Kontextinformationen: z.B. an der Entstehung beteiligte und/oder im Text erwähnte Personen</xsl:comment>
        <xsl:element name="listPerson">
          <xsl:element name="person">
            <!-- Informationen zu einer Person -->
          </xsl:element> <!-- /person -->
        </xsl:element> <!-- /listPerson -->
      </xsl:element> <!-- /particDesc -->
    </xsl:element> <!-- /profileDesc -->
  </xsl:template>
  
  <xsl:template xmlns="http://www.tei-c.org/ns/1.0" name="revisionDesc">
    <xsl:element name="revisionDesc">
    <xsl:comment>Änderungen an der Datei (nicht Textgenese)</xsl:comment>
    <xsl:element name="change">
      <xsl:attribute name="when" select="current-dateTime()"/>
      <xsl:text>Transformation per XSLT transkribus-export_2_Textgenese-TEI.xsl</xsl:text>
    </xsl:element> <!-- /change Transformation -->
    <xsl:element name="change">
      <xsl:attribute name="when" select="'2017-05-12'"/>
      <xsl:text>Rohtranskription mit Transkribus</xsl:text>
    </xsl:element>
    </xsl:element>
  </xsl:template>
  
  <xsl:template xmlns="http://www.tei-c.org/ns/1.0" match="tei:text">
  <xsl:element name="sourceDoc">
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>
  
 <xsl:template match="tei:body">
   <xsl:apply-templates/>
 </xsl:template>
  
  <xsl:template  xmlns="http://www.tei-c.org/ns/1.0" match="tei:pb">
    <xsl:element name="surface">
      <xsl:attribute name="xml:id" select="concat('tr_',format-number(number(@n),'00'))"/>
      <xsl:attribute name="facs" select="@facs"/>
      <xsl:apply-templates select="./following-sibling::node()">
        <xsl:with-param name="transform" select="'true'"/>
      </xsl:apply-templates>
    </xsl:element>
  </xsl:template>
  
  <xsl:template xmlns="http://www.tei-c.org/ns/1.0" match="tei:p">
    <xsl:param name="transform"/>
    <xsl:if test="$transform='true'">
    <xsl:element xmlns="http://www.tei-c.org/ns/1.0" name="zone">
      <xsl:attribute name="facs" select="@facs"/>
      <xsl:apply-templates/>
   </xsl:element>
    </xsl:if>
  </xsl:template>
  
  <xsl:template xmlns="http://www.tei-c.org/ns/1.0" match="tei:lg">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template xmlns="http://www.tei-c.org/ns/1.0" match="tei:l">
    <xsl:element name="line">
      <xsl:attribute name="facs" select="@facs"/>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  
</xsl:stylesheet>