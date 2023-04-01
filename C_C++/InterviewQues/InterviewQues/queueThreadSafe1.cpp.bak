
#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <fstream>
#include <cstdlib>


#define NUM_FIELDS 3
struct SplitLine {
    std::string fields[NUM_FIELDS];
};

/* If you wish you can include any more files here.
   (from standard libraries only) */

int processData(std::vector<struct SplitLine> data) {
    /*
     * Modify this function to process `data` as indicated
     * in the question. At the end, return the appropriate
     * value.
     *
     * Please create appropriate classes, and use appropriate
     * data structures as necessary.
     *
     * Do not print anything in this function.
     *
     * Note: the existing program is not intended to be an example
     * of good programming practice. (For example, struct
     * SplitLine is not a very good way to hold the data for this
     * problem.)  However, the code that *you* write will be
     * evaluated on the basis of the quality of the code, use of
     * appropriate classes/data-structures, comments, and
     * efficiency of the algorithm used.
     *
     * Submit this entire program (not just this function)
     * as your answer
     */

    // check if vector is empty.
    if (0 == data.size())
        return 0;

    // find student with lowest ID.
    int lowest_id = stoi(data[0].fields[0]);
    for (const auto& val : data)
    {
        int currId = stoi(val.fields[0]);
        if (lowest_id > currId)
            lowest_id = currId;
    }

    // get sum of all subject of lowest id student and calculate the average.
    int lowestIdSum = 0;
    int subCount = 0;
    for (const auto& val : data)
    {
        int currId = stoi(val.fields[0]);
        if (lowest_id == currId)
        {
            lowestIdSum += stoi(val.fields[2]);
            subCount++;
        }
    }

    return lowestIdSum / subCount;
}

int main(void) {
    std::ifstream in("input.txt");
    std::vector<struct SplitLine> input_data;
    while (in) {
        struct SplitLine line;
        for (int i = 0; i < NUM_FIELDS; i++) {
            if (i == NUM_FIELDS - 1)
                std::getline(in, line.fields[i]);
            else
                std::getline(in, line.fields[i], ',');
        }
        if (line.fields[0] != "")
            input_data.push_back(line);
    }
    std::ofstream out("output.txt");
    out << processData(input_data) << std::endl;
    return 0;
}


