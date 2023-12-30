#ifndef FACT_H
#define FACT_H

#include <iostream>
#include <future>
#include <cpprest/http_client.h>
#include <cpprest/filestream.h>

struct FactData
{
    bool error;
    std::string fact;
};

class Fact
{
    public:
    static std::future<std::shared_ptr<FactData>> fetchFact();
};

#endif