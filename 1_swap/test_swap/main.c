#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#define EXTRA_GB 4UL

int main(int argc, char **argv) {
    /*  Size of RAM = return from "free" command:
        Mem:         8029892     1549220     6357896        4192      282844     6480672
        Where the first param is the total mem avaliable in KB, so we convert it to bytes. */
    size_t ram = 8029892 * 1024UL;
    /*  we define the total size as the RAM + EXTRA (converted from GB -> bytes) */
    size_t total_size = ram + EXTRA_GB*1024UL*1024UL*1024UL;

    /*  We allocate that memory with malloc. */
    char *mem = malloc(total_size);
    if(mem == NULL){
        perror("malloc");
        return 1;
    }

    /*  We write a value in every byte so the kernel has to use real pages,
        that will overpass the RAM and send it to the SWAP. */
    for (size_t i = 0; i < total_size; i++) {
        mem[i] = 1;
    }

    /*  We keep the memory alive to have time to check the swap with 'free'
        before the program ends and free its memory. */
    printf("Memory used. Run 'free -h' in another terminal. Waiting 60 s...\n");
    sleep(60);

    free(mem);
    return 0;
    
}


