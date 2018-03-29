This is a transform of the complete CIM package.

Open the official IEC CIM EA file and export the complete model UML2.5.1/XMI2.5 (no further change needed, diagrams can be ommitted )

The stylesheet from Quintessential-stereaotyped is used :
Saxonica\SaxonHE9.8N\bin\Transform.exe -s:"TotalCim.xmi" -xsl:"EA_to_Eclipse UML2.5 - xsltV2 for ICA and Profiles and Comments.xslt" -o:"TotalCim-Eclipse.uml"

The UML2MMOWL transform runs smooth, the MMOWL2MMXML too, but for some unknown reason writing the mmxml file takes forever.
Luckily the ANT script will perform well, but patience is needed. It will take about 5-6 minutes.

The (updated) ATL scripts from Quintessential-stereotyped are used, the metamodels are taken from Quintessential.
