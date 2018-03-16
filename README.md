# Transformations


In order to reuse standard model work in UML, ODM is leveraged.

OMG has issued the QVT ( query View Transform ) standard and the Eclipse community is implementing.
Since this implementation is still in incubation we use the Atlas Tranformation Language. Eventually we will convert to QVT.

ODM only states the obvious tranform between UML and OWL, but also says:
  8.4.4 Mappings Are Informative, Not Normative 
which means every project will probably ask for different mappings.

With ATL this is possible.

A UML2.0 to OWL1 transform exists, but in the meantime we require UML2.5 to OWL2. So we have to develop this ourselves.

Most of the transformation rules will be generic for UML2.5-to-OWL2, in due time these will be identified.

Our first two UML models are maintained in Sparx Eneterprise Architect. An AE export is not directly readable by Eclipse UML2, mainly because we have to use the Eclipse specific UML2 namespace.
Other than that there will be errors, because Sparx EA somethimes looks oke, but is not structural sound ( e.g. Primitives that are only literal strings and not actual primitives ). We use stylesheets to bridge Sparx EA - Eclipse UML2. This will probably be applicable for other uml tooling to, so we don't have to overcomplicate the ATL transformation. 

Sparx EA has an ( internal, proprietary ) UML profile for OWL and RDFS/RDF. With ATL it is possible to 'see' the profile stereotypes on the UML artefacts. This will be investigated in near future.
We envision the UML model to be maintained as usual, but with OWL/RDFS/RDF stereotypes puched on the artefacts in order to breach the Semantic gap between UML and OWL ( e.g. apply stereotype 'objectProperty' met tagged value 'isTransitive' true/false op een associatie )

Actual tools are in fact not relevant and should be insterchangable. It's the method for maintaining UML models inconjunction with OWL Ontologies we are trying to validate.
