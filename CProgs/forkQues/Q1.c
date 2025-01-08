/*Write a C program to create a child process using fork() system call. The child process will print the message “Child” with its process identifier and then continue in an indefinite loop. The parent process will print the message “Parent” with its process identifier and then continue in an indefinite loop.
a)	Run the program and trace the state of both processes.
b)	Terminate the child process. Then trace the state of processes.
c)	Run the program and trace the state of both processes. Terminate the parent process. Then trace the state of processes.
d)	Modify the program so that the parent process after displaying the message will wait for child process to complete its task. Again run the program and trace the state of both processes.
e)	Terminate the child process. Then trace the state of processes. */

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main() {
    pid_t pid;

    pid = fork();  // Create a child process

    if (pid == 0) {  // Child process
        while (1) {
            printf("Child process: PID = %d\n", getpid());
            sleep(1);  // Sleep for 1 second to prevent overloading the terminal
        }
    } else if (pid > 0) {  // Parent process
        while (1) {
            printf("Parent process: PID = %d\n", getpid());
            sleep(1);  // Sleep for 1 second to prevent overloading the terminal
        }
    } else {
        // Fork failed
        perror("fork failed");
        return 1;
    }

    return 0;
}

