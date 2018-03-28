Recreation of the proprietary Enterprise Architect ODM profile in Eclipse.

Eclipse is not very 'profile-friendly'. In theory it is possible to import a profile, define it and use it.

The 'define' step is Eclipse specific. It enriches the profile with EMF/Ecore information.

I didn't succeed in importing, defining and using the EA ODM profile, so I re-created this in Eclipse itself.

(the profile actually does not exist by itself, it is embedded in EA. One can however take it from an model export where stereotypes from the profile is used )

Binding the profile to a model is Eclipse specific too. It is done in the stylesheet. With every change in the profile the binding has to be updated too, but eventually the profile will be complete.

( EA-ODM-PROFILE should be a project in your workspace )
