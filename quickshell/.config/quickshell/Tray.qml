import QtQuick
import Quickshell.Services.SystemTray
import QtQuick.Layouts

RowLayout {
  Layout.alignment: Qt.AlignVCenter
  spacing: 5

  Repeater {
    model: SystemTray.items

    delegate: Item {
      implicitWidth: 17
      implicitHeight: 17

      Image {
        source: modelData.icon
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
      }
    }
  }
}
