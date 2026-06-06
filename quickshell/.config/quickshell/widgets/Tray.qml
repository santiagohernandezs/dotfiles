import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import Quickshell

RowLayout {
  Layout.alignment: Qt.AlignVCenter
  spacing: 6

  Repeater {
    model: SystemTray.items

    delegate: Item {
      id: trayIconContainer
      implicitWidth: 18
      implicitHeight: 18

      QsMenuAnchor {
        id: menuAnchor
        menu: modelData.menu
        anchor.item: trayIconContainer
      }

      IconImage {
        source: modelData.icon
        anchors.fill: parent
      }

      MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton

        onClicked: (mouse) => {
          if (mouse.button === Qt.RightButton) {
            if (modelData.hasMenu) {
              menuAnchor.open()
            }
          } else if (mouse.button === Qt.LeftButton) {
            modelData.activate()
          }
        }
      }
    }
  }
}
