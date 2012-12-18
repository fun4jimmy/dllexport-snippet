#include <sl/slFunction.h>
#include <stdio.h>

void slFunction()
{
  printf("called slFunction from staticlib.\n");
}

namespace sl
{
void slFunctionInNamespace()
{
  printf("called sl::slFunctionInNamespace from staticlib.\n");
}
} // namespace sl