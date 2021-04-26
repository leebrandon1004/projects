/* Name: Brandon Lee
   PUID: 0030749420 
   Lab: Online
   CNIT 315
*/

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <string.h>

#define MAX_STRING_SIZE 512

/* Struct commands */

struct TextBasedInterface
{
  char first_name[MAX_STRING_SIZE];
  char last_name[MAX_STRING_SIZE];
  char puid[MAX_STRING_SIZE];
  int age;
};

struct Node
{
  struct TextBasedInterface data;
  struct Node *next;
  struct Node *previous;
};

struct LinkedList
{
  struct Node *head;
  struct Node *tail;
  int size;
};

/*Void commands */

void add_to_tail(struct LinkedList *list, struct TextBasedInterface data)
{
  struct Node *node = (struct Node *)malloc(sizeof(struct Node));
  if (node == NULL) return;

  node->data = data;
  node->next = NULL;
  node->previous = NULL;

  if (list->head == NULL && list->tail == NULL)
  {
    list->head = list->tail = node;
    list->size = 1;
  }
  else
  {
    node->previous = list->tail;
    list->tail->next = node;
    list->tail = node;
    list->size++;
  }
}

void add_to_head(struct LinkedList *list, struct TextBasedInterface data)
{
  struct Node *node = (struct Node *)malloc(sizeof(struct Node));
  if (node == NULL) return;

  node->data = data;
  node->next = NULL;

  if (list->head == NULL && list->tail == NULL)
  {
    list->head = list->tail = node;
    list->size = 1;
  }
  else
  {
    list->head->previous = node;
    node->next = list->head;
    list->head = node;
    list->size++;
  }
}

void remove_from_head(struct LinkedList *list)
{
  if (list->head != NULL)
  {
    struct Node *temp = list->head->next;
    free(list->head);

    list->head = temp;
    if (list->head != NULL)
      list->head->previous = NULL;

    list->size--;
    if (list->size == 0)
    {
      list->head = NULL;
      list->tail = NULL;
    }
  }
}

void remove_from_tail(struct LinkedList *list)
{
  if (list->tail != NULL)
  {
    struct Node *temp = list->tail->previous;
    free(list->tail);

    list->tail = temp;

    if (list->tail != NULL)
      list->tail->next = NULL;

    list->size--;
    if (list->size == 0)
    {
      list->head = NULL;
      list->tail = NULL;
    }
  }
}

void empty_list(struct LinkedList *list)
{
  struct Node *pointer = list->head;
  while (pointer)
  {
    struct Node *temp = pointer->next;
    free(pointer);

    pointer = temp;
  }

  list->head = NULL;
  list->tail = NULL;
  list->size = 0;
}

void Push(struct LinkedList *stk_que, struct TextBasedInterface data)
{
  add_to_tail(stk_que, data);
}

struct TextBasedInterface Pop(struct LinkedList *stk_que)
{
  struct TextBasedInterface result = stk_que->tail->data;
  remove_from_tail(stk_que);

  return result;
}

void Enqueue(struct LinkedList *stk_que, struct TextBasedInterface data)
{
  add_to_tail(stk_que, data);
}

struct TextBasedInterface Dequeue(struct LinkedList *stk_que)
{
  struct TextBasedInterface result = stk_que->head->data;
  remove_from_head(stk_que);

  return result;
}

/* Number regulations */

int Size(struct LinkedList *stk_que)
{
  return stk_que->size;
}

int Empty(struct LinkedList *stk_que)
{
  return Size(stk_que) == 0 ? 1 : 0;
}

/* Void output */

void print_stack(struct LinkedList *stk_que)
{
  struct Node *pointer = stk_que->tail;

  printf("format: { First Name, Last Name, PUID, Age }\n[");
  while (pointer)
  {
    printf("{\"%s\", \"%s\", \"%s\", %d}", pointer->data.first_name, pointer->data.last_name, 
      pointer->data.puid, pointer->data.age);

    if (pointer->previous) 
    {
      printf(", \n");
    }
    pointer = pointer->previous;
  }
  printf("]\n");
}

void print_queue(struct LinkedList *stk_que)
{
  struct Node *pointer = stk_que->head;

  printf("format: { First Name, Last Name, PUID, Age }\n[");
  while (pointer)
  {
    printf("{\"%s\", \"%s\", \"%s\", %d}", pointer->data.first_name, pointer->data.last_name, 
      pointer->data.puid, pointer->data.age);

    if (pointer->next) 
    {
      printf(", \n");
    }
    pointer = pointer->next;
  }
  printf("]\n");
}

void Clear(struct LinkedList *stk_que)
{
  empty_list(stk_que);
}

/* Main command */

int main(void)
{
  struct LinkedList list;
  char line[MAX_STRING_SIZE];
  char first;
  struct TextBasedInterface data;

  list.head = NULL;
  list.tail = NULL;
  list.size = 0;

  while (1)
  {
    printf("Select an option: \n\ta) Pop\n\tb) Push\n\tc) Enqueue\n\td) Dequeue\n\te) Empty Queue\n\tf) Empty Stack\n\tg) Print Queue\n\th) Print Stack\n\ti) Exit\n\nOption: ");
    
    memset(line, 0, MAX_STRING_SIZE);
    fgets(line, MAX_STRING_SIZE - 1, stdin);
    line[strlen(line) - 1] = '\0';
    if (strlen(line) == 0) continue;

    first = line[0];
    if (toupper(first) == 'I') break;
    else if (toupper(first) == 'A')
    {
      if (Empty(&list) == 0)
      {
        data = Pop(&list);
        printf("{\"%s\", \"%s\", \"%s\", %d}", data.first_name, data.last_name, 
          data.puid, data.age);
      }
    }
    else if (toupper(first) == 'D')
    {
      if (Empty(&list) == 0)
      {
        data = Dequeue(&list);
        printf("{\"%s\", \"%s\", \"%s\", %d}", data.first_name, data.last_name, 
          data.puid, data.age);
      }
    }
    else if (toupper(first) == 'E')
    {
      Clear(&list);
    }
    else if (toupper(first) == 'F')
    {
      Clear(&list);
    }
    else if (toupper(first) == 'G')
    {
      print_queue(&list);
    }
    else if (toupper(first) == 'H')
    {
      print_stack(&list);
    }
    else if (toupper(first) == 'B' || toupper(first) == 'C')
    {
      memset(&data, 0, sizeof(data));
      printf("First Name: ");
      fgets(data.first_name, MAX_STRING_SIZE - 1, stdin);
      data.first_name[strlen(data.first_name) - 1] = '\0';

      printf("Last Name: ");
      fgets(data.last_name, MAX_STRING_SIZE - 1, stdin);
      data.last_name[strlen(data.last_name) - 1] = '\0';

      printf("PUID: ");
      fgets(data.puid, MAX_STRING_SIZE - 1, stdin);
      data.puid[strlen(data.puid) - 1] = '\0';

      printf("Age: ");
      fscanf(stdin, "%d", &data.age);
      fgetc(stdin);

      if (toupper(first) == 'B')
        Push(&list, data);
      else
        Enqueue(&list, data);
    }

    printf("\n");
  }
  return 0;
}
