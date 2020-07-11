import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    width: 320
    height: 240
    color: "#EEEEEE";
    id:rootItem
    property var  colorPickerShow: false;
    
    Text {
        id: coloredText;
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top;
        anchors.topMargin: 4;
        text: qsTr("Hello World");
        font.pixelSize: 32;
    }
    
    Button{
        id:ctrlButton
        text: "Show"
        anchors.left: parent.left
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4;
        
        onClicked: {
            if (rootItem.colorPickerShow)
            {
                redLoader.sourceComponent = undefined
                blueLoader.source = ""
                rootItem.colorPickerShow = false
                ctrlButton.text = "show"
                
            }
            else
            {
                redLoader.source = "ColorPicker.qml";
                redLoader.item.colorPicked.connect(onPickedRed);
                blueLoader.source = "ColorPicker.qml";
                blueLoader.item.colorPicked.connect(onPickedBlue);
                rootItem.colorPickerShow = true
                ctrlButton.text = "hide";
            }

        }

    }
    
    Loader{
        id:redLoader
        anchors.left: ctrlButton.right
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        KeyNavigation.right: blueLoader
        KeyNavigation.tab:blueLoader

        onLoaded: {
            if (item != null)
            {
                item.color = "red";
                item.focus = true;
            }
        }

        onFocusChanged: {
            if (item != null)
            {
                item.focus = focus;
            }
        }


    }
    
    Loader{
        id:blueLoader
        anchors.left: redLoader.right
        anchors.leftMargin:4
        anchors.bottom:parent.bottom
        anchors.bottomMargin: 4
        
        KeyNavigation.left: redLoader
        KeyNavigation.tab: redLoader
        
        onLoaded: {
            if (item != null)
            {
                item.color = "blue";
            }
        }
        
        onFocusChanged: {
            if (item != null)
            {
                item.focus = focus;
            }
        }
        
    }
    
    function onPickedBlue(clr)
    {
        coloredText.color = clr;

        blueLoader.item.focus = true;
        redLoader.item.focus = false;

    }

    function onPickedRed(clr)
    {
        coloredText.color = clr;


        redLoader.item.focus = true;
        blueLoader.item.focus = false;

    }


}
