#include "JsonParse.h"
#include <QJsonDocument>
#include <QObject>

JsonParse::JsonParse()
{

}

QString JsonParse::jsonObjToStr(const QJsonObject & obj)
{
    QJsonDocument doc(obj);

    return QObject::tr(doc.toJson(QJsonDocument::Indented));

}

QJsonObject JsonParse::strToJsonObj(const QString & strJson)
{
    QJsonObject obj ;
    QJsonDocument doc =  QJsonDocument::fromJson(strJson.toUtf8());

    if (doc.isObject())
    {
        obj = doc.object();
    }
    else
    {

    }

    return obj;
}

QString JsonParse::getStrFromKey(QJsonObject &obj,const QString & key,bool & success )
{
    if (obj[key].isString())
    {
        return obj[key].toString();
    }
    else
    {

        return "";
    }

}

double JsonParse::getDoubleFromKey(QJsonObject &obj,const QString & key,bool & success )
{
    if (obj[key].isDouble())
    {
        success = true;
        return obj[key].toDouble();
    }
    else
    {

        success = false;
        return 0;
    }

}
