
import QtQuick 2.6
import QtQuick.Controls 2.0

CheckBox {
    id: control
    //text: qsTr("CheckBox")
    checked: false
    property alias textColor: textCtrl.color;
    property color borderColor: "#EBEBEB"
    indicator: Rectangle {
        implicitWidth: 17
        implicitHeight: 17
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 2
        border.color: checked === true ? "#FFFFFF" : borderColor // #EBEBEB
        //border.width: 1
        /*
        Rectangle {
            width: 8
            height: 8
            x: 4
            y: 4
            radius: 4
            color: "#219BFF"
            visible: control.checked
        }*/

        Item{
            id: itImage

            width: parent.width
            height:parent.height


            Image {
                id: iImage
                width: parent.width;
                height: parent.height
                source:
                {
                    if(control.tristate){
                        if(checkState === Qt.Checked){
                            "qrc:/ui/images/bt_fuxuank_yixuan.png"
                        }
                        else if(checkState === Qt.PartiallyChecked){
                            "qrc:/ui/images/bt_fuxuank_2.png"
                        }
                        else{
                            "qrc:/ui/images/bt_fuxuank_weixuan.png"
                        }
                    }
                    else{
                        if(checked)
                        {
                            "qrc:/ui/images/bt_fuxuank_yixuan.png"
                        }
                        else
                        {
                            "qrc:/ui/images/bt_fuxuank_weixuan.png"
                        }
                    }
                }
            }
        }

    }

    contentItem: Text {
        id: textCtrl;
        text: control.text
        font: control.font
        //opacity: enabled ? 1.0 : 0.3
        //color: control.down ? "#17a81a" : "#21be2b"
        color: textColor;
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
       leftPadding: control.indicator.width + control.spacing
    }
}

