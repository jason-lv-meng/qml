#include <QCoreApplication>
#include "nomalgoat.h"
#include "wolf.h"
#include "adaptergoat.h"
int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    NomalGoat ng;
    ng.miemie();

    Wolf wf;
    AdapterGoat ag(&wf);
    ag.miemie();

    return a.exec();
}
