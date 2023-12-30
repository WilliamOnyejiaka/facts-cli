#include <iostream>
#include <future>
#include <cpprest/http_client.h>
#include <cpprest/filestream.h>
#include "./../includes/Fact.h"

std::future<std::shared_ptr<FactData>> Fact::fetchFact()
{
    return std::async(std::launch::async, []() -> std::shared_ptr<FactData>
                      {
        std::shared_ptr<FactData> factData;

        try
        {
            web::http::client::http_client client(U("http://127.0.0.1:5000/fact"));
            pplx::task<web::http::http_response> response = client.request(web::http::methods::GET, U(""));

            response.then([&](web::http::http_response response)
            {
                              if (response.status_code() == web::http::status_codes::OK)
                              {
                                  web::json::value json = response.extract_json().get();

                                  factData = std::make_shared<FactData>();
                                  factData->fact = json["fact"].as_string();
                              }
                              else
                              {
                                  std::cout << "Request failed with status code: " << response.status_code() << std::endl;
                              }
            })
                .wait();
        }
        catch (const std::exception& e)
        {
            std::cerr << "Exception: " << e.what() << std::endl;
        }

        return factData; });
}