import QtQuick 2.6
import QtQuick.Controls 2.0


ComboBox {
    id: control
    property color contentColor: "#4A4758"
    property color focusColor: "#4184F3"
    property color   placeholderColor: "#A3ACC1"
    property color emptyColor: "#E6E6E6"
    property int  icomType: 1 //{1:普通的 2:带key value 列表的}
    property int  iBackGHeigth: 40
    property int  iFontSize: 14
    property color  bkgPressedColor: "#FFFFFF"
    property color borderColor: "#E4E4E4"
    property bool highlight: false

    property alias bkground: bkground;

    property int iItemSum :6 //弹框显示的子项目的个数

    property int iRadius:2    //分为圆角和普通的 圆角设置为 97 普通的设置为 2
    property bool bMiddle:true  //文字是否居中 true 为居中 false 为左对齐
    property int lstIndex;
    property var lstText:""
    property bool displayVisible: true
    property bool  bEmpty: false     //表示没有数据，一般用于动态数据，默认为false  表示有数据
    property string placeholderText: ""

    signal  sig_close();     ///弹窗关闭后的信号
    signal sig_aboutToShow();   ///弹窗即将展开的信号
    width: 120;
    height: 30
    spacing: 10;
    delegate: ItemDelegate {
        id:itemId
        width: control.width
        height: control.height

        MouseArea{
            id: ma;
            anchors.fill: parent
            hoverEnabled: true;
            onEntered: {
                if(ma.containsMouse&&comText.truncated){
                    itemTooltips.visible=true
                }
            }
            onExited: {
                itemTooltips.visible=false
            }
            onClicked: {
                if(!bEmpty){
                    currentIndex=index
                    // displayText=currentText
                    emit: control.popup.close()
                }

            }

        }

        ToolTipC{
            id:itemTooltips
            toolTipText: comText.text
            visible: false
            x:itemId.x +itemId.width/2-itemTooltips.width/2
            y:comText.y+itemId.height/2
        }

        contentItem: Text {
            id:comText
            text: icomType === 1 ? modelData : model.key
            color:
            {
                if(index === control.currentIndex)
                {
                    "#FFFFFF"
                }else
                {
                    if(bEmpty){
                        emptyColor
                    }else{
                        contentColor
                    }


                }



            }
            elide: Text.ElideRight
            font.pixelSize: iFontSize
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: bMiddle ? Text.AlignHCenter : Text.AlignLeft;



        }
        background: Rectangle {
            implicitWidth: control.width
            implicitHeight: control.height
            //opacity: enabled ? 1 : 0.3

            opacity: itemId.down ? 0.5 : 1

            color:
            {
                if(index === control.currentIndex || itemId.down)
                {
                    "#438AFF"
                }else
                {
                    "#FFFFFF"
                }

            }
            /*
                  Rectangle {
                                width: parent.width
                                height: 1
                                color: control.down ? "#438AFF" : "#E4E4E4"
                                anchors.bottom: parent.bottom
                            }
                            */


        }

        highlighted: control.highlightedIndex == index
    }

    indicator: Canvas {
        id: canvas
        anchors.verticalCenter: control.verticalCenter;
        anchors.right: control.right;
        anchors.rightMargin: 10;
        width: 12
        height: 5
        contextType: "2d"

        Connections {
            target: control
            onPressedChanged: {
                canvas.requestPaint()
            }

        }

        onPaint: {
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = "#4184F3";
            context.fill();
        }
    }

    contentItem:Text {
        id:contentText
        leftPadding: 6;
        rightPadding: control.indicator.width + control.spacing
        text: displayVisible? control.displayText :control.placeholderText
        font.pixelSize: iFontSize
        elide: Text.ElideRight
        clip: true
        color:
        {
            if(control.focus === true)
            {
                focusColor
            }else if(control.enabled=== false){
                "#4A4758"
            }else  if(!displayVisible)
            {
               placeholderColor
            }else{
                 contentColor
            }

        }
        opacity:
        {
            if(control.enabled === false)
            {
                0.3
            }else
            {
                1
            }
        }
        MouseArea{
            id: contentMa;
            anchors.fill: parent
            hoverEnabled: true;
            onEntered: {
                if(contentMa.containsMouse&&contentText.truncated){
                    contentTooltips.visible=true
                }
            }
            onExited: {
                contentTooltips.visible=false
            }
            onClicked: {
                canvas.requestPaint()
                if(control.popup.opened){
                    emit: control.popup.close()
                }
                else{
                    emit: control.popup.open()
                }
            }

        }

        ToolTipC{
            id:contentTooltips
            toolTipText: contentText.text
            visible: false
            x:contentText.x+contentText.width/2-contentText.text.length*4
            y:contentText.y+contentText.height
        }


        horizontalAlignment:
        {
            if(bMiddle)
            {
                Text.AlignHCenter
            }else
            {
                Text.AlignLeft
            }
        }

        verticalAlignment: Text.AlignVCenter
        //anchors.horizontalCenter: parent.horizontalCenter
    }




    background: Rectangle {
        id: bkground;
        implicitWidth: (control.width);
        implicitHeight: control.height
        //border.color: control.pressed ? bkgPressedColor : borderColor
        border.width: /*control.visualFocus ? 2) :*/ 1
        radius: iRadius
        anchors.left: parent.left
        anchors.leftMargin: 0
        border.color:
        {
            if(highlight){
                "red"
            }else

                if(control.enabled === false)
                {
                    "#EBEBEB"
                }else if(control.focus === true)
                {
                    "#3879F2"
                }else
                {
                    "#EBEBEB"
                }
        }
        color:
        {
            if(control.enabled === false)
            {
                "#F2F6FF"
            }else
            {
                if(control.focus === true)
                {
                    "#F2F6FF"
                }else
                {
                    "#FFFFFF"
                }
            }

        }

        opacity:
        {
            if(control.enabled === false)
            {
                0.3
            }else
            {
                1
            }
        }

        //background: #FFFFFF;
        //border: 1px solid #3879F2;

    }

    popup: Popup {
        y: control.height + 1
        width: (control.width)
        implicitHeight:  Math.min(listview.contentHeight, control.height * iItemSum)
       // closePolicy: Popup.CloseOnPressOutside
        padding: 1
        onClosed:{
            sig_close();
            control.focus=false

        }
        onAboutToShow:{
            sig_aboutToShow();
             control.focus=true
        }

        contentItem: ListView {
            id: listview
            clip: true
            model: control.popup.visible ? control.delegateModel : null


            currentIndex: control.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator {
                implicitWidth: 10
                implicitHeight: 80
            }



        }




        background: Rectangle {
            border.color: borderColor
            radius: 2
        }
    }


    Keys.enabled: true
    Keys.onPressed: {
        switch(event.key) {
        case Qt.Key_Return:
        case Qt.Key_Enter:
        {
            control.focus = false;
            console.log("_____Qt.Key_Enter______")
            break;
        }

        default:
            return;
        }
        event.accepted = true;
    }

}

