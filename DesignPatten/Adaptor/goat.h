#ifndef GOAT_H
#define GOAT_H
#include <iostream>

using namespace std;

class Goat
{
public:
    Goat();
    virtual ~Goat(){}
    virtual void miemie() = 0;
};

#endif // GOAT_H
