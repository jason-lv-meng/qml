import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Item{
    id: root
    width: 20
    height:20
    signal sCliecked;
    signal sEntered;
    signal sExited;

    property alias imageSource: iImage.source;

    Image {
        id: iImage
        width: parent.width;
        height: parent.height
        source:""
    }

    MouseArea {
      anchors.fill: parent
      hoverEnabled: true
      onClicked: {
         root.sCliecked();
      }

      onEntered:
      {
          root.sEntered();
          iImage.source=imageSource
         cursorShape = Qt.PointingHandCursor;
      }
      onExited:
      {
          root.sExited();
          iImage.source=imageSource
          cursorShape = Qt.ArrowCursor;
      }

    }

}
