<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:olduml="http://www.omg.org/spec/UML/20110701" xmlns:uml="http://www.eclipse.org/uml2/5.0.0/UML"   xmlns:xmi="http://www.omg.org/spec/XMI/20131001" >
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:strip-space elements="*"/>
	
	<!-- try to find a single way to handle fucked up primitives. Look for basic classes. If not there, create them (template name="Create-My-Primitives")-->
	<xsl:variable name="MyPrimitiveString" select="//packagedElement[@xmi:type='uml:Class'][@name='String']/@xmi:id"/>
	<xsl:variable name="MyPrimitiveCharacterString" select="//packagedElement[@xmi:type='uml:Class'][@name='CharacterString']/@xmi:id"/>
	<xsl:variable name="MyPrimitiveBoolean" select="//packagedElement[@xmi:type='uml:Class'][@name='Boolean']/@xmi:id"/>
	<xsl:variable name="MyPrimitiveInteger" select="//packagedElement[@xmi:type='uml:Class'][@name='Integer']/@xmi:id"/>
	<xsl:variable name="MyPrimitiveDateTime" select="//packagedElement[@xmi:type='uml:Class'][@name='DateTime']/@xmi:id"/>
	<xsl:variable name="MyPrimitiveURI" select="//packagedElement[@xmi:type='uml:Class'][@name='URI']/@xmi:id"/>
	<!-- Don't copy things in these ns's generic EA-->
    <xsl:template match="*[namespace-uri()='http://www.sparxsystems.com/profiles/thecustomprofile/1.0']" />
    <xsl:template match="*[namespace-uri()='http://www.sparxsystems.com/profiles/EAUML/1.0']" />
    <xsl:template match="*[namespace-uri()='http://www.sparxsystems.com/profiles/UML_Profile_for_XSD_Schema/1']" />
	
    <!-- Don't copy things in these ns's specific Inspire-->
	<xsl:template match="*[namespace-uri()='http://www.sparxsystems.com/profiles/GML/1.0']" />
	<xsl:template match="*[namespace-uri()='http://www.sparxsystems.com/profiles/UML_Profile_for_INSPIRE_data_specifications/3.4-2']" />
	
    <!-- Don't copy the profiles -->
    <xsl:template match="profileApplication" />
    
    <!-- Don't copy the EA Documentation -->
    <xsl:template match="xmi:Documentation" />
    
    <!-- Don't copy Instances, because Eclipse is buggy -->
    <!-- xsl:template match="packagedElement[@xmi:type='uml:InstanceSpecification']" / -->
    
    <!-- prevent the first uml:: node (which is Model) from copying the original UML ns (( NB. olduml and uml defs in the xsl:stylesheet must stay!!!! -->
	<xsl:template match="*[namespace-uri()='http://www.omg.org/spec/UML/20131001']" >
        <xsl:element name="{name()}">
           <xsl:apply-templates select="@*|node()" />
		   <xsl:call-template name="Create-My-Primitives"/>
        </xsl:element>
    </xsl:template>   
    
    <!-- Write the document root node with ns's xmi and Eclipse style uml -->
	<xsl:template match="/*">
        <xsl:element name="{name()}">
			<xsl:namespace name="uml" select="'http://www.eclipse.org/uml2/5.0.0/UML'"/>
			<xsl:namespace name="OWL" select="'http://www.sparxsystems.com/profiles/OWL/1.0'"/>
			<xsl:namespace name="RDF" select="'http://www.sparxsystems.com/profiles/RDF/1.0'"/>
            <xsl:apply-templates select="@*|node()" />
        </xsl:element>
    </xsl:template>
	
	
	
	<xsl:template name="Create-My-Primitives">
	<!-- Create an package with a dummy primitive -->
		<xsl:element name="packagedElement">
			<xsl:attribute name="xmi:type">uml:Package</xsl:attribute>
			<xsl:attribute name="name">PackageForMyPrimitives</xsl:attribute>
			<xsl:attribute name="xmi:idref">GUIDForPackageForMyPrimitiveString</xsl:attribute>
			<xsl:element name="packagedElement">
						<xsl:attribute name="xmi:type">uml:Class</xsl:attribute>
						<xsl:attribute name="name">DummyPrimitive</xsl:attribute>
						<xsl:attribute name="xmi:id">GUIDForMyDummyPrimitive</xsl:attribute>
					</xsl:element>
			<xsl:choose>
				<xsl:when test="not($MyPrimitiveString)"> <!-- parameter has not been supplied -->
					<xsl:element name="packagedElement">
						<xsl:attribute name="xmi:type">uml:Class</xsl:attribute>
						<xsl:attribute name="name">String</xsl:attribute>
						<xsl:attribute name="xmi:id">GUIDForMyPrimitiveString</xsl:attribute>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise> <!--parameter has been supplied --> </xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="not($MyPrimitiveCharacterString)"> <!-- parameter has not been supplied -->
					<xsl:element name="packagedElement">
						<xsl:attribute name="xmi:type">uml:Class</xsl:attribute>
						<xsl:attribute name="name">CharacterString</xsl:attribute>
						<xsl:attribute name="xmi:id">GUIDForMyPrimitiveCharacterString</xsl:attribute>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise> <!--xsl:message><xsl:value-of select="$MyPrimitiveCharacterString"></xsl:value-of></xsl:message--><!--parameter has been supplied --> </xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="not($MyPrimitiveBoolean)"> <!-- parameter has not been supplied -->
					<xsl:element name="packagedElement">
						<xsl:attribute name="xmi:type">uml:Class</xsl:attribute>
						<xsl:attribute name="name">Boolean</xsl:attribute>
						<xsl:attribute name="xmi:id">GUIDForMyPrimitiveBoolean</xsl:attribute>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise> <!--parameter has been supplied --> </xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="not($MyPrimitiveInteger)"> <!-- parameter has not been supplied -->
					<xsl:element name="packagedElement">
						<xsl:attribute name="xmi:type">uml:Class</xsl:attribute>
						<xsl:attribute name="name">Integer</xsl:attribute>
						<xsl:attribute name="xmi:id">GUIDForMyPrimitiveInteger</xsl:attribute>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise> <!--parameter has been supplied --> </xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="not($MyPrimitiveDateTime)"> <!-- parameter has not been supplied -->
					<xsl:element name="packagedElement">
						<xsl:attribute name="xmi:type">uml:Class</xsl:attribute>
						<xsl:attribute name="name">DateTime</xsl:attribute>
						<xsl:attribute name="xmi:id">GUIDForMyPrimitiveDateTime</xsl:attribute>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise> <!--parameter has been supplied --> </xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="not($MyPrimitiveURI)"> <!-- parameter has not been supplied -->
					<xsl:element name="packagedElement">
						<xsl:attribute name="xmi:type">uml:Class</xsl:attribute>
						<xsl:attribute name="name">URI</xsl:attribute>
						<xsl:attribute name="xmi:id">GUIDForMyPrimitiveURI</xsl:attribute>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise> <!--parameter has been supplied --> </xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>	

	<xsl:variable name="MyPrimitiveStringNonEmpty">
		<xsl:choose>
			<xsl:when test="not($MyPrimitiveString)">
				<xsl:value-of>GUIDForMyPrimitiveString</xsl:value-of>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$MyPrimitiveString"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<xsl:variable name="MyPrimitiveCharacterStringNonEmpty">
		<xsl:choose>
			<xsl:when test="not($MyPrimitiveCharacterString)">
				<xsl:value-of>GUIDForMyPrimitiveCharacterString</xsl:value-of>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$MyPrimitiveCharacterString"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<xsl:variable name="MyPrimitiveBooleanNonEmpty">
		<xsl:choose>
			<xsl:when test="not($MyPrimitiveBoolean)">
				<xsl:value-of>GUIDForMyPrimitiveBoolean</xsl:value-of>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$MyPrimitiveBoolean"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<xsl:variable name="MyPrimitiveIntegerNonEmpty">
		<xsl:choose>
			<xsl:when test="not($MyPrimitiveInteger)">
				<xsl:value-of>GUIDForMyPrimitiveInteger</xsl:value-of>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$MyPrimitiveInteger"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<xsl:variable name="MyPrimitiveDateTimeNonEmpty">
		<xsl:choose><xsl:when test="not($MyPrimitiveDateTime)"><xsl:value-of>GUIDForMyPrimitiveDateTime</xsl:value-of></xsl:when>
			<xsl:otherwise><xsl:value-of select="$MyPrimitiveDateTime"/></xsl:otherwise></xsl:choose>
	</xsl:variable>
	<xsl:variable name="MyPrimitiveURINonEmpty">
		<xsl:choose><xsl:when test="not($MyPrimitiveURI)"><xsl:value-of>GUIDForMyPrimitiveURI</xsl:value-of></xsl:when>
			<xsl:otherwise><xsl:value-of select="$MyPrimitiveURI"/></xsl:otherwise></xsl:choose>
	</xsl:variable>
	
<!-- fucked-up primitive references in the model -->	   
    <xsl:template match="type[@xmi:idref='EAJava_String']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref"><xsl:value-of select="$MyPrimitiveStringNonEmpty"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
	
	<xsl:template match="type[@xmi:idref='EAJava_string']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref"><xsl:value-of select="$MyPrimitiveStringNonEmpty"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="type[@xmi:idref='EAJava_Integer']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref"><xsl:value-of select="$MyPrimitiveIntegerNonEmpty"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
	  
    <xsl:template match="type[@xmi:idref='EAJava_DateTime']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref"><xsl:value-of select="$MyPrimitiveDateTimeNonEmpty"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
    
	   <xsl:template match="type[@xmi:idref='EAnone_DateTime']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref"><xsl:value-of select="$MyPrimitiveDateTimeNonEmpty"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
	
    <xsl:template match="type[@xmi:idref='EAJava_URI']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref"><xsl:value-of select="$MyPrimitiveURINonEmpty"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
	
	    <xsl:template match="type[@xmi:idref='EAnone_URI']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref"><xsl:value-of select="$MyPrimitiveURINonEmpty"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
    
		<!-- for InspireCIM -->
	
	<!--xsl:variable name="GM_Object" select="//packagedElement[@xmi:type='uml:Class'][@name='GM_Object']/@xmi:id"/>

	<xsl:template match="type[@xmi:idref='EAnone_GM_Object']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref"><xsl:value-of select="$GM_Object"/></xsl:attribute>
        </xsl:element>
    </xsl:template-->
	
	<xsl:template match="type[@xmi:idref='EAnone_CharacterString']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref"><xsl:value-of select="$MyPrimitiveCharacterStringNonEmpty"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
	
		<xsl:template match="type[@xmi:idref='EAJava_CharacterString']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref"><xsl:value-of select="$MyPrimitiveCharacterStringNonEmpty"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
	
			<xsl:template match="type[@xmi:idref='EAnone_Sequence_Number_']">
        <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref"><xsl:value-of select="$MyPrimitiveIntegerNonEmpty"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
	
	<xsl:template match="type[@xmi:idref='EAnone__undefined_']">
        <!-- dont copy, Inspire uses this for class enumerations     xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref"><xsl:value-of select="$MyPrimitiveStringNonEmpty"/></xsl:attribute>
        </xsl:element-->
    </xsl:template>
            <!--ownedLiteral xmi:type="uml:EnumerationLiteral"
                          xmi:id="EAID_3F4448E0_F50F_4c20_B7B1_34D26ABAE7B4"
                          name="Negative"
                          classifier="EAnone__undefined_"-->
	<xsl:template match="ownedLiteral[@classifier='EAnone__undefined_']">
        <xsl:element name="{name()}">
		<xsl:attribute name="xmi:id" select="./@xmi:id"/>
		<xsl:attribute name="name" select="./@name"/>
		<xsl:attribute name="classifier"><xsl:value-of select="$MyPrimitiveStringNonEmpty"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
	
	             <!--type xmi:type="uml:PrimitiveType"
                     href="http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi#String"/-->
	<xsl:template match="type[@xmi:type='uml:PrimitiveType' and @href='http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi#String']">
        <xsl:element name="{name()}">
			<xsl:attribute name="xmi:idref"><xsl:value-of select="$MyPrimitiveStringNonEmpty"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
	
	<!-- Inspire thinks its funny to define Boolean as (empty) Enumeration -->
	<!--packagedElement xmi:type="uml:Enumeration" xmi:id="EAID_05F86B65_1168_47fd_9038_055082C9D637" name="Boolean"/-->
		<xsl:template match="packagedElement[@name='Boolean' and @xmi:type='uml:Enumeration']">
        <xsl:element name="{name()}">
		<xsl:attribute name="xmi:id" select="./@xmi:id"/>
		<xsl:attribute name="name" select="./@name"/>
		<xsl:attribute name="xmi:type">uml:Class</xsl:attribute>
        </xsl:element>
    </xsl:template>
	
<!-- for TotalCIM : -->
	<xsl:key name = "search-InstanceSpecification" match = "packagedElement[@xmi:type='uml:InstanceSpecification']" use = "./@xmi:id"/>
	
	<!-- find all associations where ownedEnds are InstanceSpecifications -->
	<xsl:template match="packagedElement[@xmi:type='uml:Association' and key( 'search-InstanceSpecification', ./ownedEnd/type/@xmi:idref)]">
	<!-- and do NOT copy xsl:copy-of copy-namespaces="no" select="."/-->
	</xsl:template>

	<!-- find all ownedrules where constrainedElements are InstanceSpecifications -->
	<xsl:template match="ownedRule[@xmi:type='uml:Constraint' and key( 'search-InstanceSpecification', ./constrainedElement/@xmi:idref)]">
	<!-- and do NOT copy xsl:copy-of copy-namespaces="no" select="."/-->
	</xsl:template>
	
	
	<!-- find all ownedComments where annotatedElements are InstanceSpecifications -->
	<xsl:template match="ownedComment[@xmi:type='uml:Comment' and key( 'search-InstanceSpecification', ./annotatedElement/@xmi:idref)]">
	<!-- and do NOT copy xsl:copy-of copy-namespaces="no" select="."/-->
	</xsl:template>
	
	 <!-- find all  InstanceSpecifications -->
    <xsl:template match="packagedElement[@xmi:type='uml:InstanceSpecification']">
 <!-- and do NOT copy xsl:copy-of copy-namespaces="no" select="."/-->
    </xsl:template>
	<!-- for TotalCIM End -->
	

<!-- Copy uppervalue * to -1 -->
	<xsl:template match="@value[.='*']">
        <xsl:attribute name="value"><xsl:value-of select="-1"/></xsl:attribute>
    </xsl:template>
    
<!-- Copy all OWL and RDF stereotypes -->
    <xsl:template match="*[namespace-uri()='http://www.sparxsystems.com/profiles/OWL/1.0']" >
		<xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
        <xsl:template match="*[namespace-uri()='http://www.sparxsystems.com/profiles/RDF/1.0']" >
		<xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
    
<!-- Copy all other nodes, not copying ns's -->
    <xsl:template match="node() | @*">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
	
</xsl:stylesheet>
