#include <dl/dlFunction.h>
#include <stdio.h>

void dlFunction()
{
  printf("called dlFunction from dynamiclib.\n");
}

namespace dl
{
void dlFunctionInNamespace()
{
  printf("called dl::dlFunctionInNamespace from dynamiclib.\n");
}
} // namespace dl
