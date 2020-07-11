import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    id:rootItem
    width: 360;
    height: 300;
    property int count: 0;
    property Component component: null;

    Text {
        id: coloredText
        text: qsTr("Hello World")
        anchors.centerIn: parent
        font.pixelSize: 24
    }

    function changeTextColor(clr)
    {
        coloredText.color = clr;
    }

    function createColorPicker(clr)
    {
        if (rootItem.component === null)
        {

        }
    }

}
