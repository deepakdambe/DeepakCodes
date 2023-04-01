

#include <iostream>
#include <vector>
#include <algorithm>
#include <map>
using namespace std;

struct switchPair
{
    int n1;
    int n2;

    switchPair() : n1(0), n2(0) {}
    switchPair(int a, int b) : n1(a), n2(b) {}

    bool operator==(switchPair sw)
    {
        return n1 == sw.n1 && n2 == sw.n2;
    }
};

int solution(vector<int>& A)
{
    const int iArrSize = A.size();
    switchPair sw;
    switchPair lastPair{ 0,0 };

    int cnt = 0;
    int maxSize = 0;
    for (size_t i = 0; i < iArrSize; i++)
    {
        if ((i + 2) < iArrSize && A[i] == A[i + 2])
        {
            // it's can be switching pair.
            sw.n1 = A[i];
            sw.n2 = A[i + 1];
            i++;
        }
        else
        {
            if (A[i] == lastPair.n1)
                cnt++;
            if (maxSize < cnt)
            {
                maxSize = cnt;
            }
        }

        if (lastPair == switchPair(0, 0))   // first iteration
        {
            lastPair = sw;
            cnt = maxSize = 2;
        }
        else
        {
            if (lastPair == sw)
            {
                cnt += 2;

                if (maxSize < cnt)
                {
                    maxSize = cnt;
                }
            }
            else
            {
                cnt = 0;
            }
        }

    }


    return maxSize;
}


// Driver Code
int main()
{
    //vector<int> arr = { 6, 3, 4, 2, 1 };
    //vector<int> arr = { 2, 4, 1, 6, 5, 9, 7 };
    vector<int> arr = { 3,2,3,2,3 };
    int N = sizeof(arr) / sizeof(arr[0]);
    cout << solution(arr);

    return 0;
}

