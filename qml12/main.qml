import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property bool dragEnabled: true
    Item {
        width: 600;
        height: 150;
        DropArea{
            x:175;
            y:75;
            width: 50;
            height: 50;
            Rectangle{
                id:area;
                anchors.fill: parent;
                border.color: "black"
            }
            onEntered: {
                area.color = drag.source.color;
            }
        }
    }

    Button{
        onClicked: {
            dragEnabled = !dragEnabled;
        }
    }
    MyRect{color: "blue";x:110}
    MyRect{color: "red";x:140}
    MyRect{color: "yellow";x:170}
    MyRect{color: "black";x:200}
    MyRect{color: "steelblue";x:230}
    MyRect{color: "green";x:260}
}
