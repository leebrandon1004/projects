
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

//defining the node
struct node{
  char city[30];
  char primaryData[20];
  char secondaryData[20];
  struct node *next;
};

//create start and current pointers
struct node *start = NULL;
struct node *current = NULL;


//function for creating a node, takes in city, primarydata, secondarydata
struct node * CreateListNode(char city[], char primaryData[], char secondaryData[]){
  struct node *newNode = (struct node*) malloc (sizeof(struct node));
  //set input to data in node
  strcpy(newNode->city, city);
  strcpy(newNode->primaryData, primaryData);
  strcpy(newNode->secondaryData, secondaryData);
  //set next pointer to null
  newNode->next = NULL;
  //return the new node
  return(newNode);
}


//print function to print queue
void Print(){
  //set current to start
  current = start;
  //loop through the list
  while(current != NULL){
    //print the data of current
    printf("%s: %s, %s", current->city,current->primaryData,current->secondaryData);
    //if there is a node after print the newline
    if(current->next != NULL){
      printf("\n");
    }
    //set current to next node in list
    current = current->next;
  }
  printf("\n\n");
}

//insert end, takes in new node
void Enqueue(struct node *newNode){
  //if the queue is empty
  if(start == NULL){
    //set new node as start
    start = newNode;
  }else{
    //set current to start of list
    current = start;
    //loop through list to last node
    while(current->next != NULL){
      current = current->next;
    }
    //set next of last node to point to the new node
    current->next = newNode;
  }
}

//delete front
void Dequeue(){
  //create a pointer
  struct node *temp;
  //set temp to start
  temp = start;
  //change start to the second node in list
  start = start->next;
  //delete temp
  temp = NULL;
}

//emptying queue
void EmptyQueue(){
  //while the queue is not empty
  while(isEmpty() == 0){
    //call dequeue to delete node
    Dequeue();
  }
}

//find the size or number of nodes in a list
int Size(){
  //create a counter
  int counter = 0;
  //set current to start
  current = start;
  //if list is empty, return 0
  if(current == NULL){
    return counter;
  }else{
    //loop through the list, increment the counter
    while(current->next != NULL){
      counter ++;
      current = current->next;
    }
    //add one to compensate for index 0
    counter++;
  }
  //return number of nodes counted
  return counter;
}

//check if stack or queue is empty
int isEmpty(){
  //if size of queue is 0 then return true
  if(Size() == 0){
    return 1;
  }
  //else return false
  return 0;
}

//function for displaying the menu
void displayMenu(){
  //prints the menu
  printf("------------------------------Menu------------------------------\n");
  printf("1. Look up weather information by city name.\n");
  printf("2. Loop up COVID-19 information by city name.\n");
  printf("3. Display search history.\n");
  printf("4. Clear search history.\n");
  printf("5. Exit the program.\n");
}

//runs functions above base on user input, takes in option number
void runFunc(int option){
  //variables for node data
  char city[20];
  char primaryData[20];
  char secondaryData[20];
  int index;
  
  //switch to choose function depend on option number
  switch(option){
  //option 1
  case 1:
    while (getchar()!='\n');
    printf("Please enter a city name to search by:\n");
    gets(city);
    printf("The temperature for %s is 75 degrees fahrenheit. The weather is sunny.\n\n", city);
    Enqueue(CreateListNode(city,"75", "Sunny"));
    break;
    //option 2
  case 2:
      //clear new line characters
      while (getchar()!='\n');
      //takes in user data
      printf("Please enter a city name to search by:\n");
      gets(city);
      printf("The city of %s has 10000 reported cases and 500 confirmed deaths.\n\n", city);
      Enqueue(CreateListNode(city,"10000", "500"));
    break;
    //option 3
  case 3:
    if(isEmpty()==0){
      //if it is not empty, call the print function to print queue
      Print();
    }else{
      //if it is empty, display error message
      printf("The search history is empty.\n\n");
    }
    break;
    //option 4
  case 4:
    //check if queue is empty
    if(isEmpty()){
      //if it is, print error message
      printf("Warning! The search history is empty.\n\n");
    }else{
      //if not, call emptyqueue function
      EmptyQueue();
      //print success message after queue is emptied
      printf("Success! Now the search history is empty.\n\n");
    }
    break;
    //option 5
  case 5:
    //exit program
    exit(0);
    break;
  }
}

void displayMain(){
  
}
//main function
int main()
{
  //create variable for option value
  int option = 0;
  //loop menu
  do{
    displayMenu();
    //ask for option
    printf("\nPlease choose an option from 1 to 4.\n");
    scanf("%d", &option);
    //run function based on option
    runFunc(option);
  }
  while(1);
  
  return 0;
}

