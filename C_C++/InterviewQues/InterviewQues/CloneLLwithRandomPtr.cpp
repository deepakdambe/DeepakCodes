
// { Driver Code Starts
#include <iostream>
#include <map>
using namespace std;

/* Link list Node */
struct Node {
    int data;
    Node* next;
    Node* arb;

    Node(int x) {
        data = x;
        next = NULL;
        arb = NULL;
    }
};



// } Driver Code Ends
class Solution
{
public:
    Node* copyList(Node* head)
    {
        Node* orgHead = head;

        // copy list and set next ptr to org list next
        while (orgHead != NULL)
        {
            Node* newNode = new Node(orgHead->data);
            newNode->next = orgHead->next;
            orgHead->next = newNode;

            orgHead = newNode->next;
        }

        // set arb pointer with the help of org list.
        orgHead = head;
        while (orgHead != NULL)
        {
            orgHead->next->arb = orgHead->arb ? orgHead->arb->next : NULL;

            orgHead = orgHead->next->next;
        }

        // set nest pointer of org list and new list.
        Node* newHead = head->next;
        Node* newNode, *tempNode;
        orgHead = head;
        while (orgHead != NULL)
        {
            newNode = orgHead->next;
            tempNode = newNode->next;

            orgHead->next = newNode->next;
            newNode->next = tempNode ? tempNode->next : NULL;

            orgHead = orgHead->next;
        }

        return newHead;
    }

};

// { Driver Code Starts.


void print(Node* root) {
    Node* temp = root;
    while (temp != NULL) {
        int k;
        if (temp->arb == NULL)
            k = -1;
        else
            k = temp->arb->data;
        cout << temp->data << " " << k << " -> ";
        temp = temp->next;
    }
    cout << endl;
}


void append(Node** head_ref, Node** tail_ref, int new_data) {

    Node* new_node = new Node(new_data);
    if (*head_ref == NULL) {
        *head_ref = new_node;
    }
    else
        (*tail_ref)->next = new_node;
    *tail_ref = new_node;
}

bool validation(Node* head, Node* res) {


    Node* temp1 = head;
    Node* temp2 = res;

    int len1 = 0, len2 = 0;
    while (temp1 != NULL) {
        len1++;
        temp1 = temp1->next;
    }
    while (temp2 != NULL) {
        len2++;
        temp2 = temp2->next;
    }

    /*if lengths not equal */

    if (len1 != len2) return false;

    temp1 = head;
    temp2 = res;
    map<Node*, Node*> a;
    while (temp1 != NULL) {

        if (temp1 == temp2)
            return false;

        if (temp1->data != temp2->data) return false;
        if (temp1->arb != NULL and temp2->arb != NULL) {
            if (temp1->arb->data != temp2->arb->data)
                return false;
        }
        else if (temp1->arb != NULL and temp2->arb == NULL)
            return false;
        else if (temp1->arb == NULL and temp2->arb != NULL)
            return false;
        a[temp1] = temp2;
        temp1 = temp1->next;
        temp2 = temp2->next;
    }


    temp1 = head;
    temp2 = res;
    while (temp1 != NULL) {

        if (temp1->arb != NULL and temp2->arb != NULL) {
            if (a[temp1->arb] != temp2->arb) return false;
        }
        temp1 = temp1->next;
        temp2 = temp2->next;
    }
    return true;
}



int main() {

    int T = 1, i, n = 4, l, k = 2;
    Node* generated_addr = NULL;
    /*reading input stuff*/
    //cin >> T;
    while (T--) {
        generated_addr = NULL;
        struct Node* head = NULL, * tail = NULL;
        struct Node* head2 = NULL, * tail2 = NULL;
        //cin >> n >> k;
        for (i = 1; i <= n; i++) {
            //cin >> l;
            l = i;
            append(&head, &tail, l);
            append(&head2, &tail2, l);
        }
        for (int i = 0; i < k; i++) {
            int a, b;
            if (0 == i)
            {
                a = 1;  b = 2;
            }
            else
            {
                a = 2;  b = 4;
            }
            //cin >> a >> b;

            Node* tempA = head;
            Node* temp2A = head2;
            int count = -1;

            while (tempA != NULL) {
                count++;
                if (count == a - 1) break;
                tempA = tempA->next;
                temp2A = temp2A->next;
            }
            Node* tempB = head;
            Node* temp2B = head2;
            count = -1;

            while (tempB != NULL) {
                count++;
                if (count == b - 1) break;
                tempB = tempB->next;
                temp2B = temp2B->next;
            }

            // when both a is greater than N
            if (a <= n) {
                tempA->arb = tempB;
                temp2A->arb = temp2B;
            }
        }
        /*read finished*/
        //break;
        generated_addr = head;
        Solution ob;
        print(head);
        struct Node* res = ob.copyList(head);
        print(head);
        print(head2);
        print(res);
        if (validation(head2, res) && validation(head, res))
            cout << validation(head2, res) << endl;
        else
            cout << 0 << endl;
    }
    return 0;
}  // } Driver Code Ends

