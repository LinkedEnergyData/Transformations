<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:olduml="http://www.omg.org/spec/UML/20110701" xmlns:uml="http://www.eclipse.org/uml2/5.0.0/UML" 
		xmlns:oldrdf="http://www.sparxsystems.com/profiles/RDF/1.0" xmlns:RDF="http://EAODM/schemas/RDF/_2ARAEDQtEeixati4ZThEuA/8"
		xmlns:oldowl="http://www.sparxsystems.com/profiles/OWL/1.0" xmlns:OWL="http://EAODM/schemas/OWL/_2AXGsDQtEeixati4ZThEuA/8"
		xmlns:xmi="http://www.omg.org/spec/XMI/20131001" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
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
	<xsl:template match="*[namespace-uri()='http://www.omg.org/spec/UML/20131001/UMLDI']" />
	<xsl:template match="*[namespace-uri()='http://www.omg.org/spec/UML/20131001/UMLDC']" />
	
    <!-- Don't copy things in these ns's specific Inspire-->
	<xsl:template match="*[namespace-uri()='http://www.sparxsystems.com/profiles/GML/1.0']" />
	<xsl:template match="*[namespace-uri()='http://www.sparxsystems.com/profiles/UML_Profile_for_INSPIRE_data_specifications/3.4-2']" />
	
	   <!-- Don't copy things in these ns's that come with OAGIS-->
	<xsl:template match="*[namespace-uri()='http://www.sparxsystems.com/profiles/TerminologyProfile/1.0']" />
	<xsl:template match="*[namespace-uri()='http://www.omg.org/spec/NIEM-UML/20130801/NIEM_Common_Profile']" />
	
    <!-- Don't copy the profiles, create the Eclipse references -->
    <xsl:template match="profileApplication"/>
    
    <!-- Don't copy the EA Documentation -->
    <xsl:template match="/xmi:XMI/xmi:Documentation" />
    
	    <!-- Don't copy the EA extention -->
    <xsl:template match="/xmi:XMI/xmi:Extension" />
	
    <!-- Don't copy Instances, because Eclipse is buggy -->
    <!-- xsl:template match="packagedElement[@xmi:type='uml:InstanceSpecification']" / -->
    
    <!-- prevent the first uml:: node (which is Model) from copying the original UML ns (( NB. olduml and uml defs in the xsl:stylesheet must stay!!!! -->
	<xsl:template match="*[namespace-uri()='http://www.omg.org/spec/UML/20131001']" >
        <xsl:element name="{name()}">
           <xsl:apply-templates select="@*|node()" />
		   <xsl:call-template name="Create-My-Primitives"/>
		   <xsl:call-template name="Create-Eclipse-Profiles"/>
        </xsl:element>
    </xsl:template>  

	<xsl:template name="Create-Eclipse-Profiles">
			<xsl:element name="profileApplication">
			<xsl:attribute name="xmi:type">uml:ProfileApplication</xsl:attribute>
			<xsl:attribute name="xmi:id">GUIDForEclipseEAODMProfile</xsl:attribute>
			<xsl:element name="appliedProfile">
				<xsl:attribute name="xmi:type">uml:Profile</xsl:attribute>
				<xsl:attribute name="href">/EA-ODM-PROFILE/EA-ODM.profile.uml#_-jYAkCIZEeivx4LJk1hKFA</xsl:attribute>
			</xsl:element>
		</xsl:element>

				<xsl:element name="profileApplication">
			<xsl:attribute name="xmi:type">uml:ProfileApplication</xsl:attribute>
			<xsl:attribute name="xmi:id">GUIDForEclipseEAODMRDFrofile</xsl:attribute>
			<xsl:element name="appliedProfile">
				<xsl:attribute name="xmi:type">uml:Profile</xsl:attribute>
				<xsl:attribute name="href">/EA-ODM-PROFILE/EA-ODM.profile.uml#_8gTUwC5-EeixF6G7JvyeCA</xsl:attribute>
			</xsl:element>
		</xsl:element>
		
		<xsl:element name="profileApplication">
			<xsl:attribute name="xmi:type">uml:ProfileApplication</xsl:attribute>
			<xsl:attribute name="xmi:id">GUIDForEclipseEAODMOWLProfile</xsl:attribute>
			<xsl:element name="appliedProfile">
				<xsl:attribute name="xmi:type">uml:Profile</xsl:attribute>
				<xsl:attribute name="href">/EA-ODM-PROFILE/EA-ODM.profile.uml#__0el0C5_EeixF6G7JvyeCA</xsl:attribute>
			</xsl:element>
					</xsl:element>
	</xsl:template>
	
	<xsl:template match="/*">
        <xsl:element name="{name()}">
			<xsl:namespace name="uml" select="'http://www.eclipse.org/uml2/5.0.0/UML'"/>
			<xsl:namespace name="RDF" select="'http://EAODM/schemas/RDF/_2ARAEDQtEeixati4ZThEuA/8'"/>
			<xsl:namespace name="OWL" select="'http://EAODM/schemas/OWL/_2AXGsDQtEeixati4ZThEuA/8'"/>
			<xsl:attribute name="xsi:schemaLocation">http://EAODM/schemas/RDF/_2ARAEDQtEeixati4ZThEuA/8 /EA-ODM-PROFILE/EA-ODM.profile.uml#_2ARnIDQtEeixati4ZThEuA http://EAODM/schemas/OWL/_2AXGsDQtEeixati4ZThEuA/8 /EA-ODM-PROFILE/EA-ODM.profile.uml#_2AY74DQtEeixati4ZThEuA</xsl:attribute>
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
	
		<!-- Inspire thinks its funny to define Sequence<Character> -->
	<xsl:template match="packagedElement[@name='Sequence&lt;Character&gt;']">
        <xsl:element name="{name()}">
		<xsl:attribute name="xmi:id" select="./@xmi:id"/>
		<xsl:attribute name="name" select="'SequenceOfCharacter'"/>
		<xsl:attribute name="xmi:type">uml:Class</xsl:attribute>
        </xsl:element>
    </xsl:template>
	
<!-- create ownedcomment from the documentation in EA extention -->	
	<!-- search for Class comments : -->
	<xsl:key name="search-ClassComments" match="/xmi:XMI/xmi:Extension/elements/element[@xmi:type='uml:Class']" use="./@xmi:idref"/>

	<xsl:template match="packagedElement[@xmi:type='uml:Class' and not(@name='Sequence&lt;Character&gt;')]">
       <xsl:variable name="custclass" select="key('search-ClassComments', ./@xmi:id)"></xsl:variable>
	   <xsl:choose>
		   <xsl:when test="not($custclass)">
				<xsl:copy copy-namespaces="no">
					<xsl:apply-templates select="@*|node()" />
				</xsl:copy>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="not($custclass/properties[@documentation])">
						<xsl:copy copy-namespaces="no">
							<xsl:apply-templates select="@*|node()" />
						</xsl:copy>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="{name()}">
							<xsl:apply-templates select="@*|node()" />
							<xsl:element name="ownedComment">
								<xsl:attribute name="xmi:id" select="concat(substring(./@xmi:id,1,6), 'comment', substring(./@xmi:id,14))"/>
								<xsl:attribute name="annotatedElement" select="./@xmi:id"/>
								<xsl:element name="body">
									<!--xsl:value-of select="replace(replace(replace($custclass/properties/@documentation, '&lt;i&gt;', ''),  '&lt;/i&gt;', ''), '&#xA;', '')"/-->
									<xsl:value-of select="$custclass/properties/@documentation"/></xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>	
    </xsl:template>
	
	
<!-- create ownedcomment from the documentation in EA extention -->	
	<!-- search for Attr comments : -->
	<xsl:key name = "search-AttrComments" match = "/xmi:XMI/xmi:Extension/elements/element/attributes/attribute" use = "./@xmi:idref"/>

	<xsl:template match="ownedAttribute[@xmi:type='uml:Property']">
       <xsl:variable name="custattr" select="key('search-AttrComments', ./@xmi:id)"></xsl:variable>
	   <xsl:choose>
		   <xsl:when test="not($custattr)">
				<xsl:copy copy-namespaces="no">
					<xsl:apply-templates select="@*|node()" />
				</xsl:copy>
			</xsl:when>
			<xsl:otherwise>
			   <xsl:choose>
					<xsl:when test="not($custattr/documentation[@value])">
						<xsl:copy copy-namespaces="no">
							<xsl:apply-templates select="@*|node()" />
						</xsl:copy>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="{name()}">
							<xsl:apply-templates select="@*|node()" />
							<xsl:element name="ownedComment">
								<xsl:attribute name="xmi:id" select="concat(substring(./@xmi:id,1,6), 'comment', substring(./@xmi:id,14))"/>
								<xsl:attribute name="annotatedElement" select="./@xmi:id"/>
								<xsl:element name="body"><xsl:value-of select="$custattr/documentation/@value"/></xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
    </xsl:template>
	
	<!-- for TotalCIM : -->
	<xsl:key name = "search-InstanceSpecification" match = "packagedElement[@xmi:type='uml:InstanceSpecification']" use = "./@xmi:id"/>
	
	<!-- find all associations where ownedEnds are InstanceSpecifications -->
	<xsl:template match="packagedElement[@xmi:type='uml:Association' and key( 'search-InstanceSpecification', ./ownedEnd/type/@xmi:idref)]">
	<!-- and do NOT copy xsl:copy-of copy-namespaces="no" select="."/-->
	</xsl:template>
	
	<!-- create ownedcomment from the documentation in EA extention -->	
	<!-- search for Connector comments : -->
	<xsl:key name = "search-ConnComments" match = "/xmi:XMI/xmi:Extension/connectors/connector" use = "./@xmi:idref"/>

	<xsl:template match="packagedElement[@xmi:type='uml:Association' and not(key( 'search-InstanceSpecification', ./ownedEnd/type/@xmi:idref))]">
       <xsl:variable name="custconn" select="key('search-ConnComments', ./@xmi:id)"></xsl:variable>
	   <xsl:choose>
		   <xsl:when test="not($custconn)">
				<xsl:copy copy-namespaces="no">
					<xsl:apply-templates select="@*|node()" />
				</xsl:copy>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="not($custconn)">
						<xsl:copy copy-namespaces="no">
							<xsl:apply-templates select="@*|node()" />
						</xsl:copy>
					</xsl:when>
					<xsl:otherwise>
						<xsl:element name="{name()}">
							<xsl:apply-templates select="@*|node()" />
							<xsl:element name="ownedComment">
								<xsl:attribute name="xmi:id" select="concat(substring(./@xmi:id,1,6), 'comment', substring(./@xmi:id,14))"/>
								<xsl:attribute name="annotatedElement" select="./@xmi:id"/>
								<xsl:element name="body"><xsl:copy-of copy-namespaces="no" select="concat($custconn/source/documentation/@value,$custconn/target/documentation/@value)"/> 
								</xsl:element>
							</xsl:element>
						</xsl:element>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
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
	
	<!-- for TotalInspire leave out the non class stuff -->
	<!--xsl:template match="packagedElement[@xmi:type='uml:InformationFlow']/conveyed[not(@*)]">
	</xsl:template-->
	<xsl:template match="packagedElement[@xmi:type='uml:InformationFlow']">
	</xsl:template>
	<xsl:template match="edge[@xmi:type='uml:ControlFlow']">
	<!-- and do NOT copy xsl:copy-of copy-namespaces="no" select="."/-->
	</xsl:template>
	<xsl:template match="packagedElement[@xmi:type='uml:Activity']">
	<!-- and do NOT copy xsl:copy-of copy-namespaces="no" select="."/-->
	</xsl:template>
	<xsl:template match="packagedElement[@xmi:type='uml:Dependency']">
	<!-- and do NOT copy xsl:copy-of copy-namespaces="no" select="."/-->
	</xsl:template>
	<xsl:template match="edge[@xmi:type='uml:ObjectFlow']">
	<!-- and do NOT copy xsl:copy-of copy-namespaces="no" select="."/-->
	</xsl:template>
		<xsl:template match="containedEdge[@xmi:type='uml:ControlFlow']">
	<!-- and do NOT copy xsl:copy-of copy-namespaces="no" select="."/-->
	</xsl:template>
		<xsl:template match="ownedRule[@xmi:type='uml:Constraint']">
	<!-- and do NOT copy xsl:copy-of copy-namespaces="no" select="."/-->
	</xsl:template>
	<!--xsl:template match="packagedElement[@xmi:type='uml:Activity']">
	</xsl:template-->
	<!--xsl:template match="packagedElement[@xmi:type='uml:Artifact']">
	</xsl:template-->
		<xsl:template match="ownedLiteral[@xmi:type='uml:EnumerationLiteral']/@classifier">
	<!-- and do NOT copy xsl:copy-of copy-namespaces="no" select="."/-->
	</xsl:template>
	<!-- Copy uppervalue * to -1 -->
	<xsl:template match="lowerValue/@value[.='dimension']">
        <xsl:attribute name="value"><xsl:value-of select="0"/></xsl:attribute>
    </xsl:template>
	<xsl:template match="upperValue/@value[.='dimension']">
        <xsl:attribute name="value"><xsl:value-of select="-1"/></xsl:attribute>
    </xsl:template>
		<!-- Copy uppervalue * to -1 -->
	<xsl:template match="lowerValue/@value[.='size']">
        <xsl:attribute name="value"><xsl:value-of select="0"/></xsl:attribute>
    </xsl:template>
	<xsl:template match="upperValue/@value[.='size']">
        <xsl:attribute name="value"><xsl:value-of select="-1"/></xsl:attribute>
    </xsl:template>
	
	

<!-- Copy uppervalue * to -1 -->
	<xsl:template match="@value[.='*']">
        <xsl:attribute name="value"><xsl:value-of select="-1"/></xsl:attribute>
    </xsl:template>
	
	
	<!-- Oagis: Loose generalization of datatypes -->
	<xsl:template match="packagedElement[@xmi:type='uml:DataType']/generalization">
    </xsl:template>
    
<!-- Prevent ns copy for all OWL and RDF stereotypes -->
    <xsl:template match="*[namespace-uri()='http://www.sparxsystems.com/profiles/OWL/1.0']" >
        <xsl:element name="{name()}" >
           <xsl:apply-templates select="@*|node()" />
        </xsl:element>
    </xsl:template>

    <xsl:template match="*[namespace-uri()='http://www.sparxsystems.com/profiles/RDF/1.0']" >
        <xsl:element name="{name()}" >
           <xsl:apply-templates select="@*|node()" />
        </xsl:element>
    </xsl:template>
    
<!-- Copy all other nodes, not copying ns's -->
    <xsl:template match="node() | @*">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
	
</xsl:stylesheet>
