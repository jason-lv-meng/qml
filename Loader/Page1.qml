import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Window 2.12

Window {

    x:0
    y:0
    width: mainWindow.width
    height: mainWindow.height
    visible: true;
//       flags: Qt.Window|Qt.FramelessWindowHint;

       maximumWidth: Screen.desktopAvailableWidth
       minimumWidth: {
           if (Screen.desktopAvailableWidth < 1360) {
               return Screen.desktopAvailableWidth;
           } else {
               return 640;
           }
       }
       maximumHeight: Screen.desktopAvailableHeight
       minimumHeight: {
           if (Screen.desktopAvailableHeight < 800) {
               return Screen.desktopAvailableHeight;
           } else {
               return 480;
           }
       }
    Text {

        text: qsTr("我是page1")
    }
}
