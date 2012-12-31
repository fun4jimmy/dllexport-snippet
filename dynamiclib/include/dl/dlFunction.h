#pragma once
#include <dl/dlExport.h>

// extern "C" prevents name mangling
//
extern "C"
{
DL_API void dlFunction();
};

namespace dl
{
DL_API void dlFunctionInNamespace();
} // namespace sl
