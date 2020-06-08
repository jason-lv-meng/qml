/*
 一个列表文本框 name value
*/
import QtQuick 2.0
import QtQuick.Controls 1.4


Label {
    property alias nameText:  name.text
    property alias valueText: value.text // 文本的text

    width: lname.width + value.width + 10
    height: lname.height + value.height
    Row{
         anchors.fill: parent
     Label {
         id: lname
         width:100
         height: 20;
         Text{
             id:name
             font.pixelSize: 16
             color:"#4A4758"//UI
         }
     }
     Text{
         id:value
         width:100
         height: 20;
         font.pixelSize: 13
         elide: Text.ElideRight
         color:"#4A4758"//UI
         ToolTipC{
             id:valueTooltips
             toolTipText: value.text
             visible: false
             x:value.x-valueTooltips.width/2
             y:value.y-valueTooltips.height/2
         }
         MouseArea {
             id: ma
             anchors.fill: parent
             hoverEnabled: true
             acceptedButtons: Qt.NoButton;
             onEntered: {
                 if(ma.containsMouse&&value.truncated){
                     valueTooltips.visible=true
                 }
             }
             onExited: {
                  valueTooltips.visible=false
             }
         }


     }
     }


}
