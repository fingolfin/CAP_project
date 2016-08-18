############################################################################
##
##                                ActionsForCAP package
##
##  Copyright 2016, Sebastian Gutsche, TU Kaiserslautern
##                  Sebastian Posur,   RWTH Aachen
##
#! @Chapter Semisimple Categories
##
#############################################################################

####################################
##
## Installation method
##
####################################

InstallGlobalFunction( CAP_INTERNAL_INSTALL_OPERATIONS_FOR_SEMISIMPLE_CATEGORY,
  function( semisimple_category )

end );



####################################
##
## Constructors
##
####################################

InstallMethod( SemisimpleCategory,
               [ IsCapCategory, IsFunction, IsFunction ],
               
  function( underlying_category, membership_function, lower_equal_function )
    local name;
    
    name := NameFunction( membership_function );
    
    return SemisimpleCategory( 
             underlying_category, membership_function, lower_equal_function, Concatenation( "membership function ", name ) );
    
end );

InstallMethod( SemisimpleCategory,
               [ IsCapCategory, IsFunction, IsFunction, IsString ],
               
  function( underlying_category, membership_function, lower_equal_function, membership_function_name )
    local name, semisimple_category;
    
    if not HasIsFinalized( underlying_category ) or not IsFinalized( underlying_category ) then
        
        Error( "the underlying category must be finalized" );
        return;
        
    fi;
    
    if not HasIsAdditiveCategory( underlying_category ) or not IsAdditiveCategory( underlying_category ) then
        
        Error( "the underlying category must be additive" );
        return;
        
    fi;
    
    name := Name( underlying_category );
    
    name := Concatenation( "The semisimple category with irreducibles given by ", membership_function_name, 
                           ", with underlying category: ", name );
    
    semisimple_category := CreateCapCategory( name );
    
    SetUnderlyingCategoryForSemisimpleCategory( semisimple_category, underlying_category );
    
    SetMembershipFunctionForSemisimpleCategory( semisimple_category, membership_function );
    
    SetLowerEqualFunctionForSemisimpleCategory( semisimple_category, lower_equal_function );
    
    CAP_INTERNAL_INSTALL_OPERATIONS_FOR_SEMISIMPLE_CATEGORY( semisimple_category );
    
    Finalize( semisimple_category );
    
    return semisimple_category;
    
end );

