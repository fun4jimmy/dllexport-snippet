#pragma once

#ifndef SL_API
# define SL_API
#endif

// extern "C" prevents name mangling
//
extern "C"
{
SL_API void slFunction();
};

namespace sl
{
SL_API void slFunctionInNamespace();
} // namespace sl
