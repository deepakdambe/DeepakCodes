
#include <iostream>
#include <thread>
#include <deque>
#include <mutex>
using namespace std;

deque<int> buff;
const int buffMaxSize = 55;

mutex mu;
condition_variable cond;

void producer(int id, int start, int end)
{
    for (int i = start; i < end; ++i)
    {
        unique_lock<mutex> lock(mu);
        cond.wait(lock, [] { return buff.size() < buffMaxSize; });
        cout << "pushing ( " << id << " ) : " << i << endl;
        buff.push_back(i);

        lock.unlock();
        cond.notify_one();
        //this_thread::sleep_for(chrono::milliseconds(100));
    }
}

void consumer()
{
    while (1)
    {
        unique_lock<mutex> lock(mu);
        cond.wait(lock, [] { return buff.size() > 0; });
            int val = buff.front();
            buff.pop_front();
            cout << " ***** poping : " << val << endl;
        lock.unlock();
        cond.notify_all();
        //this_thread::sleep_for(chrono::milliseconds(100));
    }
}


int main()
{
    thread t1(producer, 1, 1, 22);
    thread t2(producer, 2, 22, 44);
    thread t3(producer, 3, 44, 66);
    thread t5(consumer);

    t1.join();
    t2.join();
    t3.join();
    t5.join();

}


