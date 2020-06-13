import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.5


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    GroupBox
    {
        id:groupBox
        title:"请选择你最喜欢的爱情电影"

        anchors.top: parent.top;
        anchors.topMargin: 8;
        anchors.left: parent.left;
        anchors.leftMargin: 20;

        Column
        {
            id:movies
            anchors.top: parent.top
            anchors.topMargin: 8
            spacing: 8
            CheckBox
            {
                text:"廊桥遗梦"
                font.pixelSize:16
            }

            CheckBox
            {
                text: "人鬼情未了"

            }
            CheckBox
            {
                text: "触不到的恋人"

            }
            CheckBox
            {
                text: "西雅图不眠夜"

            }
            CheckBox
            {
                text: "战狼二"

            }
        }
    }
}
