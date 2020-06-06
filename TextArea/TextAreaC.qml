import QtQuick.Controls 1.4
import QtQuick 2.12

TextArea {
        id: textArea
        width: parent.width - 14 * 2
        height: parent.height - 20;

        font.pixelSize: 16
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 14
        textColor: "#3B3E50"
        wrapMode: TextEdit.Wrap
        selectByMouse: true
        visible: true

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton|Qt.RightButton|Qt.MidButton
            propagateComposedEvents: true

            onClicked: {
                mouse.accepted = false;
            }

            onDoubleClicked: {
                mouse.accepted = false;
            }

            onPressed: {
                mouse.accepted = false;
            }

            onReleased: {
                mouse.accepted = false;
            }

            onWheel: {

                if (textArea.contentHeight < textArea.viewport.height) {
                    wheel.accepted = true;
                } else {
                    wheel.accepted = false;
                }
            }
        }


        Text {
            id: placeholderText
            color: "#C4C7D3"
            text: qsTr("请输入...")
            font.pixelSize:16
            anchors.left: parent.left
            anchors.leftMargin: 7
            anchors.top: parent.top
            anchors.topMargin: 4
            visible:(textArea.length > 0 || textArea.focus)?false:true

    }
}
