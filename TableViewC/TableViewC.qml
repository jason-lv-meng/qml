import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick 2.0
import QtQuick.Controls 1.2

import QtQuick 2.6


TableView{
        id: commonTable
        backgroundVisible: false
        frameVisible: false
        //全选按钮点击信号
        signal sSelClicked(bool bClicked);

        //行勾选按钮点击信号
        signal sColClicked(int iId, bool bClicked);

        signal sModClicked(
            int iId);

        signal sDelClicked(
            int iId);

        /// <双击事件>
        signal rowDbClicked(int iId);

        //对外提供修改，全选按钮设置状态的接口
        signal sChecked(bool bChecked);

        /// <三种状态: 全选、未选、部分选中>
        signal sTriChecked(int iChecked);

        //显示 修改和删除按钮的列号
        property int  iNoShowCol:-1

        property alias itemDelegateText: itemDelegateText;

        property alias itemDelegateCheck: itemDelegateCheck;

        property alias itemDelegateBtn: itemDelegateBtn;


        //是否显示全选勾选框
        property bool bShowAllSel:false;

        property var bHeadChecked: Qt.Unchecked

        //如果有筛选条件  请填写筛选条件  否则 默认为true
        property bool bShowBody:true;
        //此处是列表内容和表格左端之间的空间

        property int  iTextleftPadding: 10;
        property int  iTextpixelSize: 14;
        property var  modifyImageNone: "qrc:/ui/images/bt_bianji_none.png"


        property int  iShowModifyPic: 2 //{0:只显示 修改 1：只显示删除 2：全部显示}

        //序号role名称必须为 id 勾选列role名称必选为 ckStatus
        //TableViewColumn 描述表格的每一列
        //TableViewColumn{role: "ckStatus"; delegate: deployInfTable.itemDelegateCheck}
        //TableViewColumn{role: "id"; delegate: deployInfTable.itemDelegateText}

        //全选按钮状态
        property bool bSelChecked:false;

        property int  iVerticalPos: 0
        property int  iHorizalPos: 0

        property int __iClickCount: 0;

        function saveScrollPos()
        {
            iHorizalPos = commonTable.flickableItem.contentX;
            iVerticalPos = commonTable.flickableItem.contentY;

        }

        function setScrollPos()
        {
            commonTable.flickableItem.contentX = iHorizalPos;
            commonTable.flickableItem.contentY = iVerticalPos;

        }

        ToolTipC {
            id: toolTip
            visible: false
            //focus: commonTable.rowDeledate1
            Component.onCompleted: {
                toolTip.init(0);
            }
        }


        Component{
                    id:itemDelegateText
                    //tooltip:styleData.value

                    Text {

                        id:textComponent
                        color: styleData.selected?"#000000":"#4A4D5B"
                         elide: Text.ElideRight
                        text: styleData.value
                        font.pixelSize: (iTextpixelSize)
                        verticalAlignment: Text.AlignVCenter
                        leftPadding:  (iTextleftPadding)
                        visible:  styleData.column !== iNoShowCol

                        ToolTip {
                            id: control
                            text: styleData.value;
                            visible: ma.containsMouse && textComponent.truncated;
                            contentItem: Text {
                                text: control.text
                                font.pixelSize: 12;
                                color: "#4A4D5B"
                            }
                            background: Rectangle {
                                color: "#ffffff";
                                border.color: "#000000"
                                border.width: 1;
                            }
                        }

                        MouseArea {
                            id: ma
                            anchors.fill: parent
                            hoverEnabled: true
                            acceptedButtons: Qt.NoButton;
                        }

                    }

        }

        Component{
                    id:itemDelegateCheck

                        CheckBoxC{

                            id:ckTask
                            //text:model.No
                            textColor: styleData.pressed ? "#4184F4" : "#4A4D5B"
                            //anchors.verticalCenter: parent.verticalCenter
                            checked : (model !== null && model.ckStatus !== null) ? styleData.value : null;
                            MouseArea {
                                id:area
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: {
                                    model.ckStatus = !model.ckStatus;
                                    checked = model.ckStatus;
                                    sColClicked(model.id, model.ckStatus);
                                }
                       }
                            Connections
                            {
                                target: commonTable
                                onClearChecked:
                                {
                                   ckTask.checked = checked;
                                }
                            }

                        }



         }

        Component{
                       id:itemDelegateBtn
                       //width:60)
                       //Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft

                       Row {
                             id: layout
                             anchors.fill: parent

                             anchors.verticalCenter: parent.verticalCenter
                             anchors.left: parent.left
                             anchors.leftMargin: iTextleftPadding


                           spacing: 30
                           ImageItem{
                               anchors.verticalCenter: parent.verticalCenter
                               opacity:1
                               id:imodify
                               visible: (iShowModifyPic === 0 || iShowModifyPic === 2)

                               imageSource: modifyImageNone
                               onSCliecked: {

                                   sModClicked(model.id);
                               }
                               onSEntered: {
                                   opacity = 0.5
                                   imageSource=modifyImageNone

                               }
                               onSExited: {
                                   //imageSource= "qrc:/ui/images/bt_bianji_none.png"
                                   imageSource=modifyImageNone
                                   opacity = 1
                               }


                                       //Layout.alignment:Qt.AlignLeft
                                       //Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft

                           }

                           ImageItem{
                               id:idelete
                               anchors.verticalCenter: parent.verticalCenter
                               opacity:1
                               visible: (iShowModifyPic === 1 || iShowModifyPic === 2)
                               imageSource: "qrc:/ui/images/bt_shanchu_none.png"
                               //anchors.left: iShowModifyPic === 2 ? imodify.left : parent.left
                               //anchors.leftMargin: iShowModifyPic === 2 ? 30) : iTextleftPadding
                               //Layout.alignment:Qt.AlignLeft
                               //Layout.leftMargin: iShowModifyPic === 2 ? 30) : iTextleftPadding
                               onSCliecked: {

                                     sDelClicked(model.id);
                               }
                               onSEntered: {
                                   imageSource="qrc:/ui/images/bt_shanchu_none.png"
                                   opacity = 0.5

                               }
                               onSExited: {
                                   //imageSource= "qrc:/ui/images/bt_shanchu_none.png"
                                   imageSource="qrc:/ui/images/bt_shanchu_none.png"
                                   opacity = 1
                               }
                           }
                       }

        }



        rowDelegate : Rectangle{
                    id:rowDeledate
                    visible: bShowBody
                    height: 30;
                    property color rowColor: styleData.selected ? "#87B1F7":(styleData.alternate ? "#F8F8F8":"#ffffff")
                    color:rowColor
                    MouseArea{
                        id:ma;
                        anchors.fill: parent;
                        acceptedButtons: Qt.LeftButton;
                        onDoubleClicked: {
                            if(model){
                                rowDbClicked(model.id);
                            }
                        }
                    }
        }

        headerDelegate :Rectangle{//设置表头的样式
            id:headerDelegateName
            //implicitWidth: 10)
            implicitHeight: 30
            gradient: styleData.pressed ? commonTable.pressG :
                   (styleData.containsMouse ? commonTable.hoverG : commonTable.nomalG)

                color: "#EBEBEB";
                CheckBoxC{
                    id: checkBoxSel;
                    checkable: false
                    anchors.verticalCenter: parent.verticalCenter;
                    property bool myPressed: styleData.pressed
                    visible: styleData.column === 0 && bShowAllSel === true
                    text: styleData.value !== "" ? styleData.value : qsTr("All")
                    textColor: styleData.pressed ? "#4184F4" : "#4A4D5B"
                    font.pixelSize: 16
                    tristate: true;
                    checkState: bHeadChecked
                    opacity: model.count>0?1:0.3
                    onMyPressedChanged:
                    {
                        if(myPressed && model.count>0){
                            if(styleData.column === 0 && commonTable.__iClickCount === 0){
                                commonTable.__iClickCount = 1;
                            }
                            else{
                                commonTable.__iClickCount = 0;
                                if(checkBoxSel.tristate){
                                    if(checkBoxSel.checkState === Qt.Checked){
                                        checkBoxSel.checkState = Qt.Unchecked;
                                    }
                                    else{
                                        checkBoxSel.checkState = Qt.Checked;
                                    }

                                    bSelChecked = checkBoxSel.checkState === Qt.Checked;
                                    commonTable.sSelClicked(checkBoxSel.checkState === Qt.Checked);

                                }
                                else{
                                    checkBoxSel.checked = !checkBoxSel.checked;
                                    bSelChecked = checkBoxSel.checked;
                                    commonTable.sSelClicked(checkBoxSel.checked);
                                }
                            }
                        }
                    }

                    Connections {
                        target: commonTable !== null ? commonTable : null
                        onSChecked:
                        {
                            checkBoxSel.checked = bChecked;
                            bSelChecked = bChecked;
                            //console.log("_____onSChecked______");
                        }

                        onSTriChecked:{
                            checkBoxSel.checkState = iChecked;
                        }
                     }
                }

                Text{
                    anchors.verticalCenter: parent.verticalCenter;
                    //anchors.horizontalCenter: parent.horizontalCenter;
                    text: styleData.value
                    color: styleData.pressed ? "#4184F4" : "#4A4D5B"
                    visible: (styleData.column !== 0 || bShowAllSel !== true)
                    font.pixelSize: 16
                    leftPadding: iTextleftPadding
                    verticalAlignment: Text.AlignVCenter
                }

            }


        style: TableViewStyle {
            scrollBarBackground: Rectangle {
                implicitWidth:{
                    if (styleData.horizontal) {
                        if (styleData.pressed || styleData.hovered) {
                            return 22;
                        }else {
                            return 20;
                        }
                    }
                    else {
                        if (styleData.pressed || styleData.hovered){
                            return 10;
                        } else {
                            return 8;
                        }
                    }
                }
                implicitHeight: {
                    if (styleData.horizontal)  {
                        if (styleData.pressed || styleData.hovered) {
                            return 10;
                        }
                        else {
                            return 8;
                        }
                    }
                    else {
                        if (styleData.pressed || styleData.hovered){
                            return 22;
                        } else {
                            return 20;
                        }
                    }
                }
                 radius: 5
            }
            //TODO
            incrementControl : Rectangle {
                visible: false
            }
            decrementControl : Rectangle {
                visible: false
            }

            handle: Rectangle {
                radius: 5
                implicitWidth: {
                    if (styleData.horizontal) {
                        if (styleData.pressed || styleData.hovered) {
                            return 22;
                        } else  {
                            return 20;
                        }
                    }
                    else {
                        if (styleData.pressed || styleData.hovered) {
                            return 10;
                        } else{
                            return 8;
                        }
                    }
                }
                implicitHeight: {
                    if (styleData.horizontal)
                    {
                        if (styleData.pressed || styleData.hovered){
                            return 10;
                        } else {
                            return 8;
                        }
                    }
                    else
                    {
                        if (styleData.pressed || styleData.hovered) {
                            return 22;
                        } else {
                            return 20;
                        }
                    }
                }
                color: styleData.pressed || styleData.hovered ? "#80a3c6": "#DAE2EB"
            }

        }

        //model: lstAlarmInfBuffer;
}
