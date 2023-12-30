#include <iostream>
#include <future>
#include <cpprest/http_client.h>
#include <cpprest/filestream.h>
#include "./../includes/Fact.h"


int main()
{
    auto futureData = Fact::fetchFact();
    std::shared_ptr<FactData> result = futureData.get();
    std::cout << "Fact: " << result->fact << std::endl;
    return 0;
}