import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick 2.12

TextField {
    id :field
    color: "#38435E"
    selectionColor: "#438AFF"
    selectByMouse:true

    background:Rectangle
    {
        radius:2
        implicitWidth:100
        implicitHeight:24

        opacity:{
            if (field.enabled === false)
            {
                0.3
            }
            else
            {
                1
            }
        }

        color:{
            if (field.enabled === false)
            {
                "#F2F6FF"
            }
            else
            {
                if (Control.focus === true)
                {
                    "#F2F6FF"
                }
                else
                {
                    "#FFFFFF"
                }
            }
        }

        border.color:
        {
           if (field.focus === true)
            {
                "#4184F3"
            }
            else
            {
                "#EBEBEB"
            }
        }


    }

    Keys.enabled: true
    Keys.onEscapePressed:  {
        field.focus = false;
    }
   Keys.onPressed: {
    switch(event.key)
    {
    case Qt.Key_Return:
    case Qt.Key_Enter:{
        field.focus =false;
        break;
    }
    default:
        return;
    }
    event.accepted = true;
   }

}
