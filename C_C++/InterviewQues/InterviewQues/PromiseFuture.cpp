
#include <iostream>
#include <thread>
#include <deque>
#include <mutex>
#include <future>
using namespace std;

using ull = unsigned long long;

void getSum(promise<ull>&& prom, int start, int end)
{
    ull sum = 0;
    for (size_t i = start; i < end; i++)
    {
        if (i % 2 == 1)
            sum += i;
    }

    prom.set_value(sum);
}

ull returnSum(int start, int end)
{
    ull sum = 0;
    for (size_t i = start; i < end; i++)
    {
        if (i % 2 == 1)
            sum += i;
    }

    return sum;
}

int main()
{
    int start = 0, end = 1900000000;
    promise<ull> prom;
    future<ull> fu = prom.get_future();

    //thread t1(getSum, std::move(prom), start, end);
    future<ull> oddSum = async(returnSum, start, end);

    cout << "Thread created, wating for result" << endl;

    //cout << "Sum - " << fu.get() << endl;
    cout << "Sum - " << oddSum.get() << endl;

    //t1.join();

}
