#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//output: S, C, G, P

void full_adder_gp(int * out, int A, int B, int C0) {
    
    out[0] = A ^ B;
    out[1] = A & B;
    out[2] = A & B;
    out[3] = (A & C0) | (B & C0);
}

// Driver code
int main()
{
    // first, write high-level code that should do exactly what full adder gp does.
    for (int i = 0; i < 8; i++) {
        int arr[4] = {1, 1, 1, 1};
        full_adder_gp(arr, (i & ( 1 << 0 )) >> 0, (i & ( 1 << 1 )) >> 1, (i & ( 1 << 2 )) >> 2);
        printf("%i %i %i %i\n", arr[0], arr[1], arr[2], arr[3]); 
    }


//     FILE* ptr;
//     char ch;
 
//     // Opening file in reading mode
//     ptr = fopen("test.txt", "r");
 
//     if (NULL == ptr) {
//         printf("file can't be opened \n");
//     }
 
//     printf("content of this file are \n");
 
//     // Printing what is written in file
//     // character by character using loop.
//     do {
//         ch = fgetc(ptr);
//         printf("%c", ch);
 
//         // Checking if character is not EOF.
//         // If it is EOF stop eading.
//     } while (ch != EOF);
 
//     // Closing the file
//     fclose(ptr);
//     return 0;
}