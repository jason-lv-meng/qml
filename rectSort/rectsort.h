#ifndef RECTSORT_H
#define RECTSORT_H
#include <QList>
#include <QJsonObject>
#include <QMap>

class RectSort
{
public:
    RectSort();

    void sort();

    void sortY( QList<QJsonObject> rectObjList, double y0,double dy);


   void sortList( QList<QJsonObject>& list);
private:
    QList<QString> m_rectList; // 矩形列表  原始数据
    QList<QJsonObject> m_rectObjList;

    QMap<double,QList<int>> m_maplist; // <y坐标，在该范围的下标列表>

    QMap<int ,QList<QJsonObject>>m_sortMapList; // <行标，每一行的数据>

    double m_dy = 0.02;

    double m_dx = 0.02;
};

#endif // RECTSORT_H
