#include <stddef.h>
#include "ll_cycle.h"




int ll_has_cycle(node* head) {
    /* your code here */
    node* tortoise, *hare;
    tortoise = head;
    hare = head;
    int count = 0;
    int flag = 0;
    while (hare && hare->next)
    {
        hare = hare->next;
        hare = hare->next;
        tortoise = tortoise->next;
        if (hare == tortoise)
        {
            flag = 1;
            break;
        }
        count++;
        // printf("c = %d\n", count);
    }
    return flag;
}
