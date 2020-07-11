import QtQuick 2.2

Rectangle {
    width: 360
    height: 360
    focus: true
    Rectangle{
        width: 100
        height: 100
        color: "blue"
        id:transformRect;
        anchors.centerIn: parent;
    }

    PinchArea{
        anchors.fill: parent
        pinch.maximumScale:20
        pinch.minimumScale: 0.2
        pinch.maximumRotation: 90
        pinch.minimumRotation: 0
        pinch.target: transformRect
    }




}
