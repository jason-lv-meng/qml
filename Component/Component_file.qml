import QtQuick 2.4

Rectangle {
    width: 320
    height: 240
    color: "#EEEEEE";

    Text{
        id:coloredText;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top
        anchors.topMargin: 4
        text: "Hello World";
        font.pixelSize: 32;
    }

    function setTextColor(clr)
    {
        coloredText.color = clr;
    }

    Row{
        anchors.left:parent.left
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        spacing: 6
        ColorPicker{
            id:redColor
            color: "red"
            focus: true

            KeyNavigation.right: blueColor
            KeyNavigation.tab: blueColor
            onColorPicked: {
                coloredText.color = clr;
            }
        }

        ColorPicker{
            id:blueColor
            color: "blue"
            KeyNavigation.left: redColor
            KeyNavigation.right: pinkColor
            KeyNavigation.tab: pinkColor
        }

        ColorPicker{
            id:pinkColor;
            color: "pink"

            KeyNavigation.left: blueColor
            KeyNavigation.right: redColor
            KeyNavigation.tab: redColor
        }
    }

    Component.onCompleted: {
        blueColor.colorPicked.connect(setTextColor)
        pinkColor.colorPicked.connect(setTextColor)
    }

}
