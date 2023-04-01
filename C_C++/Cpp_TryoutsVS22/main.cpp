
#include <iostream>
#include <vector>
#include <chrono>
#include <map>
#include <thread>
#include <future>
using namespace std;

class A
{
public:
    A()
    {
        //outp();
    }

    virtual void outp()
    {
        cout << "in A" << endl;
    }

    virtual void f1()
    {
        cout << "A::f1" << endl;
    }

    void f2()
    {
        f1();
        cout << "A::f2" << endl;
    }
};

class B : public A
{
public:
    virtual void outp()
    {
        cout << "in B" << endl;
    }

    virtual void f1()
    {
        cout << "B::f1" << endl;
    }

    virtual void f2()
    {
        cout << "B::f2" << endl;
    }
};

void show_mem_rep(char* start, int n)
{
    int i;
    for (i = 0; i < n; i++)
        printf(" %.2x", start[i]);
    printf("\n");
}


void func()
{
    A* p = new B();
    p->f2();

}



int main()
{
    cout << "main starts" << endl;

    func();

    cout << "main finished" << endl;
    return 0;
}
