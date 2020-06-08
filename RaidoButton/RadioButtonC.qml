import QtQuick 2.6
import QtQuick.Controls 2.0

RadioButton {
    id: control
    text: qsTr("RadioButton")
    checked: false
    autoExclusive:false
    font.pixelSize: 13;
    indicator: Rectangle{
        id: rect;
        implicitWidth: 13
        implicitHeight: implicitWidth;
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 2
        border.color: control.down ? "#EBEBEB" : "#EBEBEB"
        color: checked ? "#219bff" : "white";
        Canvas{
            visible: checked;
            width: 13
            height: width;
            x: 0
            y: 0
            onPaint: {
                var ctx = getContext( "2d" );
                ctx.save();
                ctx.clearRect( 0, 0, width, height );
                ctx.lineWidth = 1
                ctx.strokeStyle = "white";
                ctx.beginPath();
                ctx.moveTo(2, height / 2);
                ctx.lineTo(width / 2.0 - 1, height * 4.0 / 5);
                ctx.lineTo(width * 4.0 / 5.0, height / 10.0);

                ctx.stroke();
                ctx.restore();
            }
        }
    }
    contentItem: Text {
        text: control.text
        font: control.font
        opacity: 1.0
        color: enabled  ? "#4A4D5B" : "#9B9B9B"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
