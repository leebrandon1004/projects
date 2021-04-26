#include <iostream>
#include <string>
#include <cassert>
using namespace std;

struct TextBasedInterface
{
    string first_name;
    string last_name;
    string puid;
    int age;

    TextBasedInterface(string first_name = "", string last_name = "", string puid = "", int age = -1)
        : first_name(first_name), last_name(last_name), puid(puid), age(age)
    {

    }
};

struct Node
{
    TextBasedInterface data;
    Node *next;
    Node *previous;
};

class LinkedList
{
    Node *head;
    Node *tail;
    int size;

protected:
    LinkedList()
    {
        head = nullptr, tail = nullptr, size = 0;
    }

    void add_to_tail(TextBasedInterface data)
    {
        Node *node = new Node;
        node->data = data;
        node->next = nullptr;
        node->previous = nullptr;

        if (head == nullptr && tail == nullptr)
        {
            head = tail = node;
            size = 1;
        }
        else
        {
            node->previous = tail;
            tail->next = node;
            tail = node;
            size++;
        }
    }

    void add_to_head(TextBasedInterface data)
    {
        Node *node = new Node;
        node->data = data;
        node->next = nullptr;

        if (head == nullptr && tail == nullptr)
        {
            head = tail = node;
            size = 1;
        }
        else
        {
            head->previous = node;
            node->next = head;
            head = node;
            size++;
        }
    }

    void remove_from_head()
    {
        if (head != nullptr)
        {
            Node *temp = head->next;
            delete head;
            head = temp;
            if (head != nullptr)
                head->previous = nullptr;

            size--;
            if (size == 0)
            {
                head = nullptr;
                tail = nullptr;
            }
        }
    }

    void remove_from_tail()
    {
        if (tail != nullptr)
        {
            Node *temp = tail->previous;
            delete tail;
            tail = temp;

            if (tail != nullptr)
                tail->next = nullptr;

            size--;
            if (size == 0)
            {
                head = nullptr;
                tail = nullptr;
            }
        }
    }

    int get_size()
    {
        return size;
    }

    Node *get_head()
    {
        return head;
    }

    Node *get_tail()
    {
        return tail;
    }

    void empty_list()
    {
        Node *pointer = head;
        while (pointer)
        {
            Node *temp = pointer->next;
            delete pointer;
            pointer = temp;
        }

        head = nullptr;
        tail = nullptr;
        size = 0;
    }

    ~LinkedList()
    {
        empty_list();
    }
};

class StackAndQueue: public LinkedList
{
public:
    StackAndQueue()
        : LinkedList()
    {

    }

    void Push(TextBasedInterface data)
    {
        add_to_tail(data);
    }

    TextBasedInterface Pop()
    {
        assert(get_size() > 0);
        TextBasedInterface result = get_tail()->data;
        remove_from_tail();

        return result;
    }

    void Enqueue(TextBasedInterface data)
    {
        add_to_tail(data);
    }

    TextBasedInterface Dequeue()
    {
        assert(get_size() > 0);
        TextBasedInterface result = get_head()->data;
        remove_from_head();

        return result;
    }

    int Size()
    {
        return get_size();
    }

    bool Empty()
    {
        return get_size() == 0;
    }

    void print_stack()
    {
        Node *pointer = get_tail();

        cout << "format: { First Name, Last Name, PUID, Age }\n";
        cout << "[";
        while (pointer)
        {
            cout << "{\"" << pointer->data.first_name << "\", \"" << pointer->data.last_name << "\", \"" << 
                pointer->data.puid << "\", " << pointer->data.age << "}";

            if (pointer->previous) 
            {
                cout << ",\n";
            }
            pointer = pointer->previous;
        }
        cout << "]\n";
    }

    void print_queue()
    {
        Node *pointer = get_head();

        cout << "format: { First Name, Last Name, PUID, Age }\n";
        cout << "[";
        while (pointer)
        {
            cout << "{\"" << pointer->data.first_name << "\", \"" << pointer->data.last_name << "\", \"" << 
                pointer->data.puid << "\", " << pointer->data.age << "}";

            if (pointer->next) 
            {
                cout << ",\n";
            }
            pointer = pointer->next;
        }
        cout << "]\n";
    }

    void Clear()
    {
        empty_list();
    }
};

int main()
{
    StackAndQueue stk_que;
    while (true)
    {
        cout << "Select an option: \n";
        cout << "\ta) Pop\n";
        cout << "\tb) Push\n";
        cout << "\tc) Enqueue\n";
        cout << "\td) Dequeue\n";
        cout << "\te) Empty Queue\n";
        cout << "\tf) Empty Stack\n";
        cout << "\tg) Print Queue\n";
        cout << "\th) Print Stack\n";
        cout << "\ti) Exit\n";
        cout << "\n";
        cout << "Option: ";
        string line;
        getline(cin, line);
        if (line.empty()) continue;

        char first = line[0];
        if (toupper(first) == 'I') break;
        else if (toupper(first) == 'A')
        {
            if (stk_que.Empty() == false)
            {
                TextBasedInterface data = stk_que.Pop();
                cout << "{\"" << data.first_name << "\", \"" << data.last_name << "\", \"" << 
                    data.puid << "\", " << data.age << "}\n";
            }
        }
        else if (toupper(first) == 'D')
        {
            if (stk_que.Empty() == false)
            {
                TextBasedInterface data = stk_que.Dequeue();
                cout << "{\"" << data.first_name << "\", \"" << data.last_name << "\", \"" << 
                    data.puid << "\", " << data.age << "}\n";
            }
        }
        else if (toupper(first) == 'E')
        {
            stk_que.Clear();
        }
        else if (toupper(first) == 'F')
        {
            stk_que.Clear();
        }
        else if (toupper(first) == 'G')
        {
            stk_que.print_queue();
        }
        else if (toupper(first) == 'H')
        {
            stk_que.print_stack();
        }
        else if (toupper(first) == 'B' || toupper(first) == 'C')
        {
            TextBasedInterface data;
            cout << "First Name: ";
            getline(cin, data.first_name);
            cout << "Last Name: ";
            getline(cin, data.last_name);
            cout << "PUID: ";
            getline(cin, data.puid);
            cout << "Age: ";
            cin >> data.age;
            cin.get();

            if (toupper(first) == 'B')
                stk_que.Push(data);
            else
                stk_que.Enqueue(data);
        }

        cout << "\n";
    }
    return 0;
}