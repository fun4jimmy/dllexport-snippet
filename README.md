dllexport-snippet
=================

A snippet to show the different ways of exporting functions from dlls. Also demonstrates how to re-export functions defined static library from a dynamic library that links it.

staticlib:
 - Contains two functions slFunction and sl::slFunctionInNamespace
 
dynamiclib:
 - Contains two functions dlFunction and dl::dlFunctionInNamespace
 - Contains a header for dll exporting functions with dynamiclib
 - Contains a header and cpp for dll exporting staticlib functions using pragmas
 - Contains a .def file for exporting staticlib functions
 
application:
 - Includes dynamiclib headers
 - Includes staticlib headers via dynamiclib
 - Contains a main function that calls slFunction, sl::slFunctionInNamespace, dlFunction and dl::dlFunctionInNamespace
 
The projects have 3 configurations:
 - with-linking: application links staticlib and dynamiclib
 - with-def: application links only dynamiclib, dynamiclib exports staticlib functions using a .def file
 - with-pragmas: application links only dynamiclib, dynamiclib exports staticlib functions using pragmas