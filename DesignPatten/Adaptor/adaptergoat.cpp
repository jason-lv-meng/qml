#include "adaptergoat.h"

AdapterGoat::AdapterGoat(Wolf * wolf) : m_wolf(wolf)
{

}

void AdapterGoat::miemie()
{
    m_wolf->howl();
}
