#pragma once
#include <dl/dlExport.h>

#include <dl/dlPragmaExport.h>
#include <sl/slFunction.h>

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
