
#include <iostream>
#include <queue>
#include <stdlib.h>

using namespace std;

// Pre-Order Tree Create.

struct Node
{
    int data;
    Node* left;
    Node* right;

    Node(int val = 0)
    {
        data = val;
        left = right = nullptr;
    }
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

void preOrder(Node* root)
{
    if (nullptr == root)
        return;

    cout << root->data << "  ";

    preOrder(root->left);
    preOrder(root->right);
}

void inOrder(Node* root)
{
    if (nullptr == root)
        return;

    inOrder(root->left);
    cout << root->data << "  ";
    inOrder(root->right);
}

void PostOrder(Node* root)
{
    if (nullptr == root)
        return;

    PostOrder(root->left);
    PostOrder(root->right);
    cout << root->data << "  ";
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

int countOfNodes(Node *root)
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

int diameterOfTree1(Node* root)
{
    if (root == nullptr)
        return 0;

    int diam1 = diameterOfTree1(root->left);
    int diam2 = diameterOfTree1(root->right);
    int diam3 = hightOfTree(root);

    //int newDiam = max()
}

int main()
{
    Node* root = nullptr;
    int arr[] = { 1,2,4,-1,-1,5,-1,-1,3,-1,6,-1 };

    root = createTree(arr, 12);
    cout << "Tree created" << endl;

    cout << "Printing PreOrder" << endl;
    preOrder(root);
    cout << endl;

    cout << "Printing InOrder" << endl;
    inOrder(root);
    cout << endl;

    cout << "Printing PostOrder" << endl;
    PostOrder(root);
    cout << endl;

    cout << "Printing Level Order" << endl;
    levelOrder(root);
    cout << endl;

    cout << "Count of Nodes => " << countOfNodes(root) << endl;

    cout << "Sum of Nodes => " << sumOfNodes(root) << endl;

    cout << "Sum of Nodes => " << hightOfTree(root) << endl;

    return 0;
}



