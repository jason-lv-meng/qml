#include "rectsort.h"
#include "jsonparse.h"
#include <QJsonObject>

RectSort::RectSort()
{

}

void RectSort::sort()
{
    // 将原始数据转义成QJsonObject数据
    m_rectObjList.clear();
    for (QString rect: m_rectList)
    {
       QJsonObject rectObj = JsonParse::strToJsonObj(rect);
       m_rectObjList.append(rectObj);
    }


   // 遍历y 找出每一排包含的元素 存入 m_maplist
   for (int i = 0; i < m_rectObjList.count(); ++i)
   {
        double y0 = m_rectObjList[i]["y"].toDouble();
        sortY(m_rectObjList,y0,m_dy);
   }

   // 将每一行按x从小到大的顺序排列  最后的值放入 m_sortMapList 中
   for (int j = 0; j < m_maplist.count(); ++j) // 行数
   {
       QList<QJsonObject> list;
       for (int k = 1; k < m_maplist[j].count(); ++k) // 每一行的个数
       {
           list.append(m_rectObjList[m_maplist[j][k]]);

       }
        sortList(list);
        m_sortMapList[j] = list;

   }

}

// 将rectObjList 中找出和y0在一排的数据，误差 dy 放入m_maplist中
void RectSort::sortY( QList<QJsonObject> rectObjList, double y0,double dy)
{

    QList<int> indexList;

    for (int i = 0; i < rectObjList.count(); ++i)
    {
        if ((rectObjList.at(i)["y"].toDouble() > y0-dy) && (rectObjList.at(i)["y"].toDouble() < y0+dy) )
        {

            indexList.append(i);

        }

    }
    m_maplist [y0] = indexList;

}

// 将list中的元素按x从小到大的顺序排列
void RectSort::sortList( QList<QJsonObject>& list)
{
    QJsonObject obj;
    for (int i = 0; i < list.count(); ++i)
    {
        for (int j = i+1; j < list.count(); ++j)
        {
            if (list[i]["x"].toDouble() > list[j]["x"].toDouble())
            {
                obj = list[i];
                list[i] = list[j];
                list[j] = obj;
            }

        }

    }


}
