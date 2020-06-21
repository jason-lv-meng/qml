import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window {
    id:"mainWindow"
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    Loader
    {
        id:pageLoader
    }
    Button{

        onClicked:
        {
            pageLoader.source = ""; // 先賦值空
            pageLoader.source = "Page1.qml"
            pageLoader.visible = true;
            console.log("onClicked")
        }
    }



}
