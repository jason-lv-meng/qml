#ifndef JSONTRANS_H
#define JSONTRANS_H
#include <QString>
#include <QJsonObject>
#include <QJsonArray>

class JsonParse
{
public:
    JsonParse();

    static QString jsonObjToStr(const QJsonObject & obj);

    static QJsonObject strToJsonObj(const QString & strJson);

    static QString getStrFromKey(QJsonObject &obj, const QString & key, bool &success);

    static double getDoubleFromKey(QJsonObject &obj,const QString & key,bool & success );
};

#endif // JSONTRANS_H
