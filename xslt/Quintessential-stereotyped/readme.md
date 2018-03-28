This stylesheet builds on top of the earlier stylesheets.
The EA export should include 'EA Extensions', because all comments ( 'notes' ) are written to this extension (!!!why!!!)
This stylesheet attaches them as UML!Comment's to the appropriate UML!Elements.

It also binds the model to the /EA-ODM-PROFILE/EA-ODM.profile.uml Eclipse uml profile
(see ../Transformations/EA-ODM-PROFILE )


Command ( something like....) :
".......\Saxonica\SaxonHE9.8N\bin\Transform.exe" -s:"Quintessential-Profiled-full.xmi" -xsl:"EA_to_Eclipse UML2.5 - xsltV2 for ICA and Profiles and Comments.xslt" -o:"Quintessential-Profiled-full-Eclipse.uml"
