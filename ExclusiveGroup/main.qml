import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ExclusiveGroup
    {
        id:btnExclusiveGroup
    }


    Button {
        id:btn3
        tooltip:qsTr("btn1")
        z:2
        opacity: 1
        width: text3.width
        height: img3.height
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
            id: img3
            source:{
                btn1.checked == true ? "qrc:/ui/images/bt_sxt-dianj.png" : "qrc:/ui/images/bt_sxt-zc.png";
            }
        }
        Text {
            id: text3
            z:100
            anchors.left: parent.left
            width: appUtils.autoW(22)
            anchors.top: parent.top
            color: "#FFFFFF"
            height: 23
            font.pixelSize: 10
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignRight
            text: qsTr("3")
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
                if(!cameraBtnOpen3.checked)
                    cameraBtnOpen3.checked = !cameraBtnOpen3.checked;
            }
        }
    }
    //球机2切换按钮
    Button {
        id:cameraBtnOpen2
        tooltip:qsTr("Ball Cameras(Middle)") + cruzrTranslator.emptyString
        visible: channel == 1
        z:2
        opacity: 1
        width: text2.width
        height: img2.height
        checkable: true
        exclusiveGroup: btnExclusiveGroup
        checked: false
        anchors.right: cameraBtnOpen3.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: appUtils.autoW(10)
        style: ButtonStyle{
            background: Rectangle{
                implicitHeight: cameraBtnOpen2.height
                implicitWidth:  cameraBtnOpen2.width
                color: "transparent"
            }
        }
        Image {
            id: img2
            source:{
                cameraBtnOpen2.checked == true ? "qrc:/ui/images/bt_sxt-dianj.png" : "qrc:/ui/images/bt_sxt-zc.png";
            }
        }
        Text {
            id: text2
            z:100
            anchors.left: parent.left
            width: appUtils.autoW(22)
            anchors.top: parent.top
            color: "#FFFFFF"
            height: appUtils.autoH(23)
            font.pixelSize: 10)
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignRight
            text: qsTr("2")
        }
        onCheckedChanged: {
            if(checked){
                console.log("cameraBtnOpen2 check");
                hikCamera.currentIndex = 3;
                cameraID = 2;
                cameraOpen();
            } else {
                console.log("cameraBtnOpen2 no check");
            }
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(!cameraBtnOpen2.checked)
                    cameraBtnOpen2.checked = !cameraBtnOpen2.checked;
            }
        }
    }
    //球机1切换按钮
    Button {
        id:cameraBtnOpen1
        tooltip:qsTr("Ball Cameras(upper)") + cruzrTranslator.emptyString
        visible: channel == 1
        z:2
        opacity: 1
        width: text1.width
        height: img1.height
        checkable: true
        exclusiveGroup: btnExclusiveGroup
        checked: false
        anchors.right: cameraBtnOpen2.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: appUtils.autoW(10)
        style: ButtonStyle{
            background: Rectangle{
                implicitHeight: cameraBtnOpen1.height
                implicitWidth:  cameraBtnOpen1.width
                color: "transparent"
            }
        }
        Image {
            id: img1
            source:{
                cameraBtnOpen1.checked == true ? "qrc:/ui/images/bt_sxt-dianj.png" : "qrc:/ui/images/bt_sxt-zc.png";
            }
        }
        Text {
            id: text1
            z:100
            anchors.left: parent.left
            width: appUtils.autoW(22)
            anchors.top: parent.top
            color: "#FFFFFF"
            height: appUtils.autoH(23)
            font.pixelSize: 10)
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignRight
            text: qsTr("1")
        }
        onCheckedChanged: {
            if(checked){
                console.log("cameraBtnOpen1 check");
                hikCamera.currentIndex = 2;
                cameraID = 1;
                cameraOpen();
            } else {
                console.log("cameraBtnOpen1 no check");
            }
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(!cameraBtnOpen1.checked)
                    cameraBtnOpen1.checked = !cameraBtnOpen1.checked;
            }
        }
    }

}
