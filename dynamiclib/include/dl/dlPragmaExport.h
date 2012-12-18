#pragma once

// this is only relevant in the with-pragma configuration
//
#if defined(WITH_PRAGMA)

# if defined(_MSC_VER)
#  if defined(DYNAMICLIB_EXPORTS)
// if DL_EXPORTS is defined then we are building dynamiclib and all classes and functions should be exported
//
#   define SL_API __declspec(dllexport)
#  else
// if DL_EXPORTS is not defined then we are using dynamiclib and all classes and functions should be imported
//
#   define SL_API __declspec(dllimport)
#  endif
# else
// other platforms don't have dlls so don't worry about them
//
#  define SL_API
# endif

#endif // defined(WITH_PRAGMA)
