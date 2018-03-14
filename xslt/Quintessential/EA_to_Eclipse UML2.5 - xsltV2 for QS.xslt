<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:olduml="http://www.omg.org/spec/UML/20110701" xmlns:uml="http://www.eclipse.org/uml2/5.0.0/UML"   xmlns:xmi="http://www.omg.org/spec/XMI/20131001" >
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:strip-space elements="*"/>
	
	<!-- Don't copy things in these ns's -->
    <xsl:template match="*[namespace-uri()='http://www.sparxsystems.com/profiles/thecustomprofile/1.0']" />
    <xsl:template match="*[namespace-uri()='http://www.sparxsystems.com/profiles/EAUML/1.0']" />
    <xsl:template match="*[namespace-uri()='http://www.sparxsystems.com/profiles/UML_Profile_for_XSD_Schema/1']" />
    
    <!-- Don't copy the profiles -->
    <xsl:template match="profileApplication" />
    
    <!-- Don't copy the EA Documentation -->
    <xsl:template match="xmi:Documentation" />

    <!-- prevent the first uml:: node (which is Model) from copying the original UML ns (( NB. olduml and uml defs in the xsl:stylesheet must stay!!!! -->
	<xsl:template match="*[namespace-uri()='http://www.omg.org/spec/UML/20131001']" >
        <xsl:element name="{name()}">
           <xsl:apply-templates select="@*|node()" />
        </xsl:element>
    </xsl:template>   
    
    <!-- Write the document root node with ns's xmi and Eclipse style uml -->
	<xsl:template match="/*">
        <xsl:element name="{name()}">
			<xsl:namespace name="uml" select="'http://www.eclipse.org/uml2/5.0.0/UML'"/>
            <xsl:apply-templates select="@*|node()" />
        </xsl:element>
    </xsl:template>

<!-- fucked-up primitive references in the model -->	
	<xsl:template match="type[@xmi:idref='EAJava_String']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref">xsd:string</xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="type[@xmi:idref='EAJava_Integer']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref">xsd:integer</xsl:attribute>
        </xsl:element>
    </xsl:template>
	  
    <xsl:template match="type[@xmi:idref='EAJava_DateTime']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref">xsd:dateTime</xsl:attribute>
        </xsl:element>
    </xsl:template>
    
	   <xsl:template match="type[@xmi:idref='EAnone_DateTime']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref">xsd:dateTime</xsl:attribute>
        </xsl:element>
    </xsl:template>
	
    <xsl:template match="type[@xmi:idref='EAJava_URI']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref">xsd:anyURI</xsl:attribute>
        </xsl:element>
    </xsl:template>
	
	    <xsl:template match="type[@xmi:idref='EAnone_URI']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref">xsd:anyURI</xsl:attribute>
        </xsl:element>
    </xsl:template>

<!-- Copy uppervalue * to -1 -->
	<xsl:template match="@value[.='*']">      
        <xsl:attribute name="value"><xsl:value-of select="-1"/></xsl:attribute>
    </xsl:template>
    
<!-- Copy all other nodes, not copying ns's -->
    <xsl:template match="node() | @*">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
	
</xsl:stylesheet>
