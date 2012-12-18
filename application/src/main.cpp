#include <dl/dlFunction.h>

int main(int, char **)
{
  slFunction();
  sl::slFunctionInNamespace();

  dlFunction();
  dl::dlFunctionInNamespace();

  return 0;
}
