#include <iostream>
#include <thread>
#include <chrono>
#include <string>
#include <sstream>
#include <pqxx/pqxx>

int main(int, char *argv[])
{
    // La connessione va impostata in questo modo
    /// postgresql://[user]:[password]@[ipaddress]/[databasename]
    pqxx::connection c{"postgresql://postgres:fdsa@localhost/postgres"};
    int count = 0;
    
    // in seguito questo codice protrebbe 
    // essere messo ISR relativa all'interrupt per i dati CAN
    // Senza il ciclo while(true)
    while(true){
        pqxx::work txn{c};
        std::stringstream ss{""};

        ss << "select pg_notify('can_notification', '" << count << "');";
        txn.exec1(ss.str());
        
        txn.commit();
        count++;

        std::this_thread::sleep_for(std::chrono::milliseconds(5));
    }    
}