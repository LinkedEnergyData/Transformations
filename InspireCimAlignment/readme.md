This is the transform for the Electricity Network submodel taken from the Inspire UML model
It is created like the Quintessential submodel.

There are several mishaps in the 'official' Inspire Sparx EA model. Some of them are corrected in the model itself ( e.g. where types are scrumbled, only are literalstrings )
Others are rectified in the stylesheet transform ( see ../xslt/InspireCimAlignement )

As already predicted the venom of this method is in the Primitives. 
To accomodate a uniform solution in ATL we transform all Primitives to one pattern in the stylesheet.

Purpose of this model is ontology alignment with IEC57 CIM


The project uses the OWL2.ecore and XML.Ecore from the Quintessential project. If this is unwanted, import these and change the run configurations and ant build
