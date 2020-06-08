import QtQuick 2.7
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0

// 不带上三角、下三角的tip框
ToolTip {
    id: tooltip
    property int toolTipOffset: 3
    property int toolTipDir: 0
    property string toolTipText: "";
    property int iTextWith: 200 //tip宽度限制
    property bool bSetWidth: false //是否设置tip宽度限制
    closePolicy: Popup.CloseOnPressOutside

    width: {
        if(bSetWidth){
            if(tooltipText.implicitWidth < iTextWith){
                return tooltipText.implicitWidth + 2
            }
            return iTextWith + 2
        }
        return (tooltipText.implicitWidth + 2)
    }
    height: tooltipText.implicitHeight+2

    background: Rectangle {
        id: toolTipBg
        radius: 4;
        color: "#EDEDED"
        Image {
            id: toolTipdirection
            anchors.topMargin: -1
            anchors.horizontalCenter: parent.horizontalCenter
        }
        function init(toolTipDir) {
        }
    }

    Rectangle {
        id:container
        radius: 4
        anchors.centerIn: parent
        width: {
            if(bSetWidth){
                if(tooltipText.implicitWidth < iTextWith){
                    return tooltipText.implicitWidth
                }
                return iTextWith;
            }
            return tooltipText.implicitWidth;
        }
        height: tooltipText.implicitHeight
        Text {
            id: tooltipText
            font.pixelSize: appUtils.autoF(14)
            color: "#4A4D5B"
            bottomPadding: 2
            topPadding: 2
            leftPadding: 12
            rightPadding: 12
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignHCenter
            anchors.fill: parent
            text: toolTipText;
            Component.onCompleted: {
                if(bSetWidth){
                    if(tooltipText.implicitWidth < iTextWith){
                        wrapMode = Text.NoWrap
                    }else{
                        wrapMode = Text.Wrap
                    }
                }else{
                    wrapMode = Text.NoWrap
                }
            }
        }
    }

    DropShadow {
        anchors.fill: container
        cached: true
        radius: 15
        samples: 31
        color: "#50000000"
        smooth: true
        source: container
    }

    function init(toolTipDir) {
        toolTipBg.init(toolTipDir);
    }
}
