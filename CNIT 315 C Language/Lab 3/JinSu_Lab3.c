/*Name: Brandon Lee
Email: lee3118@purdue.edu
Lab Time: Online
Comments: PUID, Name with instructed functions and the use of struct to create the node.*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Node
{
  char fname[50];
  char lname[50];
  char puid[50];
  int age;
  struct Node* next;
}Node;

struct Node* CreateListNoNodes()
{
  struct Node* start = NULL;
  return start;
}

/* A helper function to print a node */
void printNode(struct Node* n)
{
  printf("\nPUID: %s\tName: %s %s\tAge: %d",n->puid,n->fname, n->lname,n->age);
}

struct Node* CreateListNode(char fname[], char lname[], char puid[], int age)
{
  struct Node* newNode = (Node*)(malloc(sizeof(Node)));
  strcpy(newNode->fname,fname);
  strcpy(newNode->lname,lname);
  strcpy(newNode->puid,puid);
  newNode->age = age;
  return newNode;
}

void InsertFront(struct Node** head, struct Node* newNode)
{
  if(*head==NULL)
    *head = newNode;
  else
  {
    newNode->next = *head;
    *head = newNode;
  }
}

void DeleteMiddle(struct Node** head, char key[50])
{
  if(*head==NULL)
    return;

  if(strcmp((*head)->puid,key)==0)
  {
    *head = (*head)->next;
    return;
  }
  
  struct Node* it = *head;
  struct Node* prev = *head;

  while(it!=NULL)
  {
    if(strcmp(it->puid,key)==0)
    {
      prev->next = it->next;
      return;
    }
    prev = it;
    it=it->next;
  }
}

void InsertMiddle(struct Node** head, struct Node* newNode)
{
  if(*head==NULL)
  {
    *head = newNode;
    return;
  }

  struct Node* it = *head;
  struct Node* prev = *head;

  while(it!=NULL)
  {
    if(strcmp(it->puid,newNode->puid)>0)
    {
      /* Do the insertion*/
      prev->next = newNode;
      newNode->next = it;
      return;
    }
    prev = it;
    it=it->next;
  }
}

void InsertEnd(struct Node** head, struct Node* newNode)
{
  struct Node* it = *head;
  struct Node* prev = *head;

  if(*head==NULL)
  {
    *head = newNode;
    return;
  }

  for(prev = it;it!=NULL;it=it->next)
    prev = it;
  prev->next = newNode;
}

void DeleteFront(struct Node** head)
{
  if(*head==NULL) /* Nothing to delete*/
    return;
  
  struct Node* temp = *head;
  *head = (*head)->next;
  free(temp);
}

void DeleteEnd(struct Node** head)
{
  if(*head==NULL) /* Nothing to delete*/
    return;
  
  if((*head)->next==NULL)
  { *head = NULL;
    return;
  }

  struct Node* prev = *head;
  struct Node* p_prev = *head;

  for(;prev->next!=NULL;prev=prev->next)
    p_prev = prev;

  p_prev->next = NULL;
  free(prev);
}

void Traverse(struct Node* start)
{
  printf("\n\nLinked list\n--------------------\n");
  struct Node* it = start;
  while(it!=NULL)
  {
    printNode(it);
    it=it->next;
  }
}

int LookUpByIndex(struct Node** head, int index)
{
  int i;

  if(*head==NULL)
    return -1;
  
  struct Node* it = *head;
  for(i=0;((it!=NULL) && (i<index));++i)
    it = it->next;
  
  if(it==NULL)
    return -1;
  
  printNode(it);
  return 1;
}

int main(void)
{
  struct Node* head = CreateListNoNodes();
  
  struct Node* node1 = CreateListNode("Brandon", "Lee", "0030749420", 19);
  InsertFront(&head,node1);
  printf("%s",head->fname);
  Traverse(head);

  node1 = CreateListNode("Isaac", "Newton", "453", 75);
  InsertFront(&head,node1);
  Traverse(head);

  node1 = CreateListNode("Alan", "Turing", "376", 65);
  InsertFront(&head,node1);
  Traverse(head);

  node1 = CreateListNode("Charles", "Gauss", "396", 47);
  InsertMiddle(&head,node1);
  Traverse(head);

  node1 = CreateListNode("Marie", "Curie", "386", 62);
  InsertEnd(&head,node1);
  Traverse(head);

  DeleteEnd(&head);
  Traverse(head);

  DeleteFront(&head);
  Traverse(head);

  DeleteMiddle(&head, "453");
  Traverse(head);

  printf("\nis the element at index 1: %d",LookUpByIndex(&head,1));

  return 0;
}
