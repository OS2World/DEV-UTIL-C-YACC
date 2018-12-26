#include <stdio.h>

main()
{
    char buffer[128], *ep;

    while (gets(buffer))
        {
        for (ep = buffer + 3; *ep != '.'; ep ++);
        *ep ++ = '\0';
        printf("%s.obj: %s.%cc y%c.h\n\n", buffer + 3, buffer + 3, *ep, *ep);
        }
}
