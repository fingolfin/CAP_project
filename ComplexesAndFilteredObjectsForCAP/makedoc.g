if fail = LoadPackage("AutoDoc", ">= 2014.03.27") then
    Error("AutoDoc version 2014.03.27 is required.");
fi;

AutoDoc( "ComplexesAndFilteredObjectsForCAP" : scaffold := true, autodoc := true );

QUIT;
