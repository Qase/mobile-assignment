# Infrastructure

Supporting package for Features. Containing tools and objects for general use.

Remark: Local "CoreToolkit" library had identity conflict with "CoreToolkit" in swift-core, which can be resolved 
by "moduleAlias" parameter in .product. However, there was a need the local CoreToolkit to be static library 
because dynamic "CoreToolkit" in "swift-core" has been already registered. And static "CoreToolkit" library 
had problems with the visibility of its content. Therefore the target in "swift-core" was renamed 
from "CoreToolkit" to "Utils" to solve the identity conflict and "moduleAlias" as well as the local 
CoreToolkit static type was not needed anymore.
