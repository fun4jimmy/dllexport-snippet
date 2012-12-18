#include <dl/dlPragmaExport.h>

// this is only relevant in the with-pragma configuration
//
#if defined(WITH_PRAGMA)

# if defined(_MSC_VER)
// for a simple c function the pragma is easy as there is no name mangling
//
#  pragma comment(linker, "/export:_slFunction")

// for a c++ function there will be name mangling so it's a bit harder to work out the name
//
#  if (_MSC_VER == 1700) // different visual studio versions have different name mangling
#   if _DEBUG // different compile options also have different name mangling
#    pragma comment(linker, "/export:?slFunctionInNamespace@sl@@YAXXZ")
#   else
#    error "the pragma export for this configuration of MSVC 2012 has not been defined."
#   endif
#  else
#    error "the pragma exports for this version of MSVC have not been defined."
#  endif

# endif

#endif // defined(WITH_PRAGMA)
