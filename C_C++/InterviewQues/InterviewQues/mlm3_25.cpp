
#include <iostream>
#include <queue>
#include <stdlib.h>

using namespace std;

// parent is zero when client approch without any ref.
// parent is zero when 12 month is over.
// root node will have parent as -1.

struct Node
{
    int iId;
    int iParentId;
    int iLevel;
    int iTotalComm;
    int iBalanceAmount;
    int iWathdrawAmount;

    Node* left;
    Node* middle;
    Node* right;

    Node(int id = 0, int parent = 0)
    {
        iId = id;
        iParentId = parent;
        left = right = middle = nullptr;
        iLevel = iTotalComm = iBalanceAmount = iWathdrawAmount = 0;
    }
};

Node data[] = {
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8},
    {9},
    {10},
    {11},
};

Node* createTree(int arr[], int size)
{
    static int index = -1;
    index++;

    if (arr[index] == -1 || index >= size)
        return nullptr;

    Node* newNode = new Node(arr[index]);

    newNode->left = createTree(arr, size);
    newNode->right = createTree(arr, size);

    return newNode;
}

void levelOrder(Node* root)
{
    queue<Node*> qLevel;

    // insert into queue
    qLevel.push(root);
    qLevel.push(nullptr);

    while (!qLevel.empty())
    {
        // get front Node.
        Node* temp = qLevel.front();

        if (nullptr == temp)
        {
            cout << endl;
            qLevel.pop();

            if (!qLevel.empty())
                qLevel.push(nullptr);
        }
        else
        {
            // print & fill it's child nodes in queue.
            cout << temp->data << "  ";

            if (temp->left) qLevel.push(temp->left);
            if (temp->right) qLevel.push(temp->right);
            qLevel.pop();
        }
    }
}


int countOfNodes(Node* root)
{
    if (nullptr == root)
        return 0;

    int leftCount = 0;
    int rightCount = 0;
    if (root->left) leftCount = countOfNodes(root->left);
    if (root->right) rightCount = countOfNodes(root->right);

    return leftCount + rightCount + 1;
}

int sumOfNodes(Node* root)
{
    if (nullptr == root)
        return 0;

    int leftSum = sumOfNodes(root->left);
    int rightSum = sumOfNodes(root->right);
    return leftSum + rightSum + root->data;
}

int hightOfTree(Node* root)
{
    if (nullptr == root)
        return 0;

    int leftHight = hightOfTree(root->left);
    int rightHight = hightOfTree(root->right);

    return leftHight > rightHight ? leftHight + 1 : rightHight + 1;
}

int main()
{
    Node* root = nullptr;
    int arr[] = { 1,2,4,-1,-1,5,-1,-1,3,-1,6,-1 };

    root = createTree(arr, 12);
    cout << "Tree created" << endl;

    cout << "Printing Level Order" << endl;
    levelOrder(root);
    cout << endl;

    cout << "Count of Nodes => " << countOfNodes(root) << endl;

    cout << "Sum of Nodes => " << sumOfNodes(root) << endl;

    cout << "Sum of Nodes => " << hightOfTree(root) << endl;

    return 0;
}

