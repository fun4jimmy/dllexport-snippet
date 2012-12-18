#pragma once

#if defined(_MSC_VER)
# if defined(DYNAMICLIB_EXPORTS)
// if DL_EXPORTS is defined then we are building dynamiclib and all classes and functions should be exported
//
#  define DL_EXTERN
#  define DL_API __declspec(dllexport)
# else
// if DL_EXPORTS is not defined then we are using dynamiclib and all classes and functions should be imported
//
#  define DL_EXTERN extern
#  define DL_API __declspec(dllimport)
# endif
#else
// other platforms don't have dlls so don't worry about them
//
# define DL_EXTERN
# define DL_API
#endif
