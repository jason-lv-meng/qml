import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ExclusiveGroup
    {
        id:btnExclusiveGroup
    }

    Row
    {
        Button {
            id:btn3
            tooltip:qsTr("btn3")
            z:2
            opacity: 1
            visible: true
            width: img3.width
            height: img3.height
            checkable: true
            exclusiveGroup: btnExclusiveGroup
            checked: true
            style: ButtonStyle{
                background: Rectangle{
                    implicitHeight: parent.height
                    implicitWidth:  parent.width
                    color: "transparent"
                }
            }

            Image {
                id: img3
                width: 40
                height: 40
                source:{
                    btn3.checked == true ? "qrc:/images/1.png" : "qrc:/images/2.png";
                }
            }

            onCheckedChanged: {
                if(checked){
                    console.log("btn3 check");

                } else {
                    console.log("btn3 no check");
                }
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if (!btn3.checked)
                    {
                        btn3.checked = !btn3.checked;
                        console.log(" btn3.checked" +  btn3.checked)
                    }

                }
            }
        }

        Button {
            id:btn2
            tooltip:qsTr("btn3")
            z:2
            opacity: 1
            visible: true
            width: img2.width
            height: img2.height
            checkable: true
            exclusiveGroup: btnExclusiveGroup
            checked: false
            style: ButtonStyle{
                background: Rectangle{
                    implicitHeight: parent.height
                    implicitWidth:  parent.width
                    color: "transparent"
                }
            }

            Image {
                id: img2
                width: 40
                height: 40
                source:{
                    btn2.checked == true ? "qrc:/images/1.png" : "qrc:/images/2.png";
                }
            }

            onCheckedChanged: {
                if(checked){
                    console.log("btn2 check");

                } else {
                    console.log("btn2 no check");
                }
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if (!btn2.checked)
                    {
                        btn2.checked = !btn2.checked;
                        console.log(" btn2.checked" +  btn2.checked)
                    }
                }
            }
        }
    }
}
