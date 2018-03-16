This is the stylesheet for the InspireCimAlignment model. It is based on the stylesheet for Quintessential.

Backword compatability with the sheet for Quintessential has been checked. 

Some mishaps in the Inspire Model are dealt with.


Primitives in the Inspire model are not dealt with in the same manner as in the IEC57 CIM package.
On top of that Inspire imports lots of other standards ( like ISO ) who also use different methods for Primitives.
In order to re-use the Quintessential ATL Transformation as much as possible we have chosen to deal with these differences in the stylesheet.

The patter is as follows:

All 'Primitives' in the input models are actually UML!Classes with appropriate names ( e.g. String, Integer ).
In the UML2OWL transform these are replaced by referensec to xsd primitives ( as the specification states ).

The stylesheet translates all primitive references to this pattern.

For instance:

<!--Source: type xmi:type="uml:PrimitiveType"  
    href="http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi#String"/-->
    
    <xsl:template match="type[@xmi:type='uml:PrimitiveType' and @href='http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi#String']"> 
       <xsl:element name="{name()}">
          <xsl:attribute name="xmi:idref"><xsl:value-of select="$MyPrimitiveStringNonEmpty"/></xsl:attribute>
       </xsl:element>
    </xsl:template>

The primitive classes are generated if not available and references mutated ( $MyPrimitiveStringNonEmpty ) 

