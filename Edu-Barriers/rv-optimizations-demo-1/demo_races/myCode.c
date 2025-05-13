#include <unistd.h>
#include <sys/syscall.h>
#include <stdio.h>

#define __NR_mysyscall 467 // номер, который ты задал

int main() {
    long res = syscall(__NR_mysyscall);
    printf("Result: %ld\n", res);
    return 0;
}

