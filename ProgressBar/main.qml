import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ProgressBar {
              id: progressBar
              width: 130
              height: 10
              anchors.top: parent.top
              anchors.topMargin: 47
              anchors.left: parent.left
              anchors.leftMargin: 18
              indeterminate: false
              maximumValue: 100
              minimumValue: 0
              value: 80
              orientation: Qt.Horizontal
              style: ProgressBarStyle {
                  id: progressBarStyle
                  background: Rectangle {
                      id: bg
                      border.color: "#E4E4E4"
                      border.width: 1
                      radius: 2
                      implicitWidth: 130
                      implicitHeight: 10
                  }
                  progress: Item {
                      Rectangle {
                          height: 6
                          width: progressBarStyle.currentProgress * (progressBar.width - anchors.leftMargin * 2)
                          anchors.left: parent.left
                          anchors.leftMargin: 2
                          anchors.verticalCenter: parent.verticalCenter
                          color: "#7CD123"
                      }
                  }
              }

              Text {
                  id: progressText
                  anchors.verticalCenter: parent.verticalCenter
                  anchors.left: parent.right
                  anchors.leftMargin: 6
                  color: "#74798E"
                  font.pixelSize: 12
                  text: qsTr("%1%").arg(progressBar.value)
              }
          }

}
