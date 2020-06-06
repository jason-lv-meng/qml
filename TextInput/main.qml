import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Column
    {
        Label{
            text:"我是一个测试输入文本框"
        }
        TextInput{
            text: "这里是输入框"

        }
        Label{
            text:"我是一个密码输入文本框"
        }
        TextInput{

               text: "这里是输入框"
        }
        Label{
            text:"我是一个数字限制输入文本框"
        }

        Rectangle {
            property alias text: input.text
            property alias echoMode: input.echoMode
            property alias validator: input.validator
            property alias inputMask: input.inputMask
            signal editingFinished();
            width: input.contentWidth<100 ? 100 : input.contentWidth + 10
            height: input.contentHeight + 5
            border.color: "grey"

            TextInput {
                id: input
                anchors.fill: parent
                anchors.margins: 2
                font.pointSize: 15
                focus: true
                onEditingFinished: {
                    focus = false
                    text2.text = text
                }

            }
        }
//            TextInputC
//            {
////            inputMask: ">AA_9_a"
//                onEditingFinished: {
//                    text2.text = text
//                }
//           }
            Text{
                id:text2
            }


    }
}
