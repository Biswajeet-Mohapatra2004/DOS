/*Write a C program that will create a child process to generate a Fibonacci series of specified length and store it in an array. The parent process will wait for the child to complete its task
and then display the Fibonacci series and then display the prime Fibonacci number in the series along with its position with appropriate message.

*/
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdbool.h>

// Function to check if a number is prime
bool is_prime(int num) {
    if (num <= 1) return false;
    for (int i = 2; i * i <= num; i++) {
        if (num % i == 0) return false;
    }
    return true;
}

// Function to generate Fibonacci series
void generate_fibonacci(int *fib, int length) {
    if (length >= 1) fib[0] = 0;
    if (length >= 2) fib[1] = 1;
    for (int i = 2; i < length; i++) {
        fib[i] = fib[i - 1] + fib[i - 2];
    }
}

int main() {
    int n;

    printf("Enter the length of the Fibonacci series: ");
    scanf("%d", &n);

    if (n <= 0) {
        printf("Invalid length. Please enter a positive integer.\n");
        return EXIT_FAILURE;
    }

    int fib[n];
    pid_t pid = fork();

    if (pid < 0) {
        perror("Fork failed");
        return EXIT_FAILURE;
    }

    if (pid == 0) {
        // Child process: Generate Fibonacci series
        printf("Child process (PID: %d): Generating Fibonacci series...\n", getpid());
        generate_fibonacci(fib, n);

        // Write the Fibonacci series to a pipe
        int pipefd[2];
        pipe(pipefd);

        close(pipefd[0]); // Close read end of the pipe
        write(pipefd[1], fib, sizeof(fib));
        close(pipefd[1]); // Close write end of the pipe

        printf("Child process: Fibonacci series generated and sent to parent.\n");
        exit(0);
    } else {
        // Parent process: Wait for child to complete
        wait(NULL);

        printf("Parent process (PID: %d): Receiving Fibonacci series from child...\n", getpid());

        // Read the Fibonacci series from the pipe
        int pipefd[2];
        pipe(pipefd);

        close(pipefd[1]); // Close write end of the pipe
        read(pipefd[0], fib, sizeof(fib));
        close(pipefd[0]); // Close read end of the pipe

        printf("Fibonacci series: ");
        for (int i = 0; i < n; i++) {
            printf("%d ", fib[i]);
        }
        printf("\n");

        // Identify and display prime Fibonacci numbers with their positions
        printf("Prime Fibonacci numbers:\n");
        for (int i = 0; i < n; i++) {
            if (is_prime(fib[i])) {
                printf("Position %d: %d\n", i + 1, fib[i]);
            }
        }

        printf("Parent process: Task completed.\n");
    }

    return 0;
}

