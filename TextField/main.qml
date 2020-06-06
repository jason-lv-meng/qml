import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Column{
        TextFieldC
        {
            placeholderText: "请输入你要的文字"

        }
        TextFieldC
        {
            placeholderText: "请输入你要的文字11"

        }
    }
}
