import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
Window {
    id : frame
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    TextEdit {
                  id: textEdit
                  text: "sdfsfsf"
                  font.pointSize: 14
                  height: contentHeight
                  width: frame.width - vbar.width
                  y: -vbar.position * textEdit.height
                  wrapMode: TextEdit.Wrap
                  selectByKeyboard: true
                  selectByMouse: true

                  MouseArea{
                      anchors.fill: parent
                      onWheel: {
                          if (wheel.angleDelta.y > 0) {
                              vbar.decrease();
                          }
                          else {
                              vbar.increase();
                          }
                      }
                      onClicked: {
                          textEdit.forceActiveFocus();
                      }
                  }
              }

              ScrollBar {
                  id: vbar
                  hoverEnabled: true
                  active: hovered || pressed
                  orientation: Qt.Vertical
                  size: frame.height / textEdit.height
                  width: 10
                  anchors.top: parent.top
                  anchors.right: parent.right
                  anchors.bottom: parent.bottom
              }
}
