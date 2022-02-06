#include <stdio.h> 
#include <stdlib.h> 
#include <pthread.h> 

void *print_message_function( void *ptr ); 
void *low_print_message_function( void *ptr );

int main() 
{ 
     pthread_t thread1, thread2; 
     char *message1 = "Tópico 1"; 
     char *message2 = "Tópico 2"; 
     int iret1, iret2; 

    /* Cria threads independentes, cada uma das quais executará a função */ 

     iret1 = pthread_create ( &thread1, NULL, low_print_message_function, (void*) message1); 
     iret2 = pthread_create( &thread2, NULL, print_message_function, (void*) message2); 

     /* 
       Espera até que os threads estejam completos antes de main continuar.
       o processo e todas as threads antes da conclusão das threads. 
     */ 

     pthread_join ( thread1, NULL); 
     pthread_join( thread2, NULL); 

     printf("Thread 1 retorna: %d\n",iret1); 
     printf("Thread 2 retorna: %d\n",iret2); 

     return 0;
} 

void *print_message_function( void *ptr ) 
{ 
     char *message; 
     message = (char *) ptr; 
     printf("%s\n", message); 
}

void *low_print_message_function( void *ptr ) {
    char *message;
    int number;
    scanf("%d", &number);
    printf("Termineou\n");
    message = (char *) ptr; 
}
