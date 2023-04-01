
#include <iostream>
#include <thread>
#include <vector>
#include <deque>
#include <functional>
#include <mutex>

using namespace std;

class cJoiner
{
    vector<thread>& vecThreadsRef;

public:
    cJoiner(vector<thread>& vec) : vecThreadsRef(vec){}
    ~cJoiner()
    {
            cout << "Joining on threads" << endl;
        for (size_t i = 0; i < vecThreadsRef.size(); i++)
        {
            if (vecThreadsRef[i].joinable())
                vecThreadsRef[i].join();
        }
            cout << "Out of Joining threads" << endl;
    }
};

class cThreadPool
{
    atomic_bool done;
    vector<thread> threadList;
    //cJoiner tJoin;
    deque<std::function<void()>> taskList;
    mutex mu;
    condition_variable cond;

    void workerThread()
    {
        while (!done)
        {
            // get the task.
            // execute the task
            // if task not found then yeild
            unique_lock<mutex> ulock(mu);
            cond.wait(ulock, [&] { return !taskList.empty() || done; });
            if (done)
                break;
            function<void()> task = taskList.front();
            taskList.pop_front();
            ulock.unlock();
            cond.notify_all();
            if (task)
            {
                task();
            }
        }
    }
public:
    cThreadPool() : done(false)
    {
        int cnt = thread::hardware_concurrency();
        try
        {
            for (size_t i = 0; i < cnt; i++)
            {
                threadList.push_back(thread(&cThreadPool::workerThread, this));
            }
        }
        catch (...)
        {
            done = true;
        }
    }

    ~cThreadPool()
    {
        done = true;
    }

    void Submit(function<void()> f)
    {
        // insert task into queue
        mu.lock();
        taskList.push_back(f);
        mu.unlock();
        cond.notify_all();
    }

    void join()
    {
        done = true;
        cond.notify_all();
        cout << "joining threads starts" << endl;
        for (auto& val : threadList)
        {
            cout << "joining thread - " << val.get_id() << endl;
            if (val.joinable())
                val.join();
        }
        cout << "joining threads end" << endl;
    }
};


int main()
{
    cThreadPool tpool;
    for (size_t i = 0; i < 10; i++)
    {
        tpool.Submit([=] {
            cout << "Printing " << i << " from thread " << this_thread::get_id() << endl;
            });
    }

    this_thread::sleep_for(chrono::seconds(4));
    tpool.join();
    cout << "main finished" << endl;
}

