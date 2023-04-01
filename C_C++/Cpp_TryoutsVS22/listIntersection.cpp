
#include <string.h>

#include <iostream>
#include <string>
#include <vector>
#include <list>
#include <map>
using namespace std;

map<string, list<string>> listMap;

bool DoLinkedListsIntersect(vector<string> list)
{
    return true;
}
Time is not sufficient to finish the code challenge.I would like to suggest providing an assignment explanation video link before the timer starts.it takes save around 10 mins.Otherwise, the overall experience is good.Thanks.
void makeList(string list)
{


    list<int> tokenList;
    char* token = strtok(&list[0], "->");
    if (token != NULL)
        tokenList.push_back(token);

    while (token != NULL)
    {
        token = strtok(NULL, "->");
        if (token != NULL)
            tokenList.push_back(token);
    }

    listMap.insert(tokenList.front(), tokenList);

    cout << "makeList" << endl;
    for (int i = 0; i < tokenList.size(); i++)
        cout << tokenList[i] << '\n';
}

int main() {
    string line;
    while (getline(cin, line)) {
        if (line.find("->") != string::npos)
            makeList(line);

        cout << line << endl;
    }
}
