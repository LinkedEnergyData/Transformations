Stylesheet to transform Sparx EA output to a Eclipse UML2 readable uml file.


Because we must change the namespaces, we use Saxon ( http://saxon.sourceforge.net/ )

On my machine the command would be: 

"D:\Program Files\Saxonica\SaxonHE9.8N\bin\Transform.exe" -s:"Quintessential-SC1.xmi"-xsl:"EA_to_Eclipse UML2.5 - xsltV2 for QS.xslt" -o:"Quintessential-SC1-Eclipse.uml"
this, being in the directory where the input file is and the sheet.

This is basic, without using a profile. That is work in progress
