#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FILE_NAME "full_adder_gp_c.txt"

// using golden verification method, this model should clearly be correct and can be used
// to confirm the functionality of the verilog defined module

void full_adder_gp(int * out, int A, int B, int C0) {
    
    out[0] = A ^ B;
    out[1] = A & B;
    out[2] = A & B;
    out[3] = (A & C0) | (B & C0);
}

char bit_at_pos(int num, int pos) {
    return (num & (1 << pos)) >> pos;
}

int main()
{
    FILE* fp;

    // Opening file in reading mode
    fp = fopen(FILE_NAME, "w+");
 
    if (fp == NULL) {
        printf("file can't be opened \n");
        return 1;
    }
    
    
    char buffer[300];

    for (int i = 0; i < 8; i++) {
        memset(buffer, '\0', sizeof(buffer));
        int arr[4] = {1, 1, 1, 1};
        int A = bit_at_pos(i, 2);
        int B = bit_at_pos(i, 1);
        int C0 = bit_at_pos(i, 0);
        full_adder_gp(arr, A, B, C0);

        printf("%i, %i, %i, %i, %i, %i, %i, %i\n", i, A, B, C0, arr[0], arr[1], arr[2], arr[3]);

        sprintf(buffer, "%i, %i, %i, %i, %i, %i, %i, %i\n",
            i, A, B, C0, arr[0], arr[1], arr[2], arr[3]);

        fputs(buffer, fp);

        //printf("%hhd %hhd %hhd %hhd\n", arr[0], arr[1], arr[2], arr[3]); 
    }
    
    // Closing the file
    fclose(fp);
    return 0;
}