# Transformations


In order to reuse standard model work in UML, ODM is leveraged.

OMG has issued the QVT ( query View Transform ) standard and the Eclipse community is implementing.
Since this implementation is still in incubation we use the Atlas Tranformation Language. Eventually we will convert to QVT.

ODM only states the obvious tranform between UML and OWL, but also says:
  8.4.4 Mappings Are Informative, Not Normative 
which means every project will probably ask for different mappings.

With ATL this is possible.

A UML2.0 to OWL1 transform exists, but nowadays we require UML2.5 to OWL2. So we have to develop this ourselves.

Most of the transformation rules will be generic for UML2.5-to-OWL2, in due time these will be identified.

Our first two UML models are maintained in Sparx Eneterprise Architect. An EA export is not directly readable by Eclipse UML2, mainly because we have to use the Eclipse specific UML2 namespace.
Other than that there will be errors, because Sparx EA somethimes looks oke, but is not structural sound ( e.g. Primitives which are only literal strings and not actual primitives ). We use stylesheets to bridge Sparx EA - Eclipse UML2. This will probably be applicable for other uml tooling too, so we don't have to overcomplicate the ATL transformation. 

Sparx EA has an ( internal, proprietary ) UML profile for OWL and RDFS/RDF. With ATL it is possible to 'see' the profile stereotypes on the UML artefacts using the Eclipse UML2 API. 

We envision the UML model to be maintained as usual, but with OWL/RDFS/RDF stereotypes pushed on the artefacts in order to breach the Semantic gap between UML and OWL ( e.g. apply stereotype 'objectProperty' with tagged value 'isTransitive' true/false on an association )

At first we have tried this recreating the EA proprietary ODM profile in Eclipse UML ( using Papyrus ) and binding this profile to the .uml inputfile in the stylesheet preprocessing. But this profile is meant to create a nwe, greenfield ontology with UML visual diagramming. This is not what we intend, because we want to be able to produce a standalone UML model as well as an OWL model based on the same base model. For this, the use of the existing profile is too 'intrusive' on the model. (e.g. we have to ADD associations, which do not belong to the original model, thus CHANGING the model ). Since then we have discovered we can use \<META-CLASSES> as values for stereotype properties (tagged values) and have build a new profile, both in Eclipse AND in Sparx EA. 
In this way we can reproduce the original UML Model just by UNAPPLYING this profile ( which isnT that well supported by Sparx EA...., but this will be dealt with with a custom export.
These projects will be posted here in due time.

In order of complexitiy, we have created the projects:
- Quintessential
- Quintessential-stereotyped and EA-ODM-PROFILE
- TotalCim

Last remark about the method:

Actual tools are in fact not relevant and should be interchangable. It's the method for maintaining UML models in conjunction with OWL Ontologies we are trying to validate.
