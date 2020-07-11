import QtQuick 2.4


Rectangle{
    id:colorPicker
    width: 50;
    height: 30;
    border.width: focus?4:0
    border.color: focus?"#90D750":"#808080"
    signal colorPicked(color clr);
    MouseArea{
        anchors.fill: parent
        onClicked: {
            colorPicker.colorPicked(colorPicker.color);
            colorPicker.focus = true
        }

    }
}

