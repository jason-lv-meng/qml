#ifndef ADAPTERGOAT_H
#define ADAPTERGOAT_H
#include "goat.h"
#include "wolf.h"

class AdapterGoat : public Goat
{
public:
    AdapterGoat(Wolf * wolf);
    virtual void miemie();

private:
    Wolf * m_wolf;
};

#endif // ADAPTERGOAT_H
