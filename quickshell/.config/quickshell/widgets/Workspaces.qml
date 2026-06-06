import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
  spacing: 0

  Repeater {
    model: 9
    Rectangle {
      Layout.preferredWidth: 24
      Layout.preferredHeight: 30
      color: "transparent"

      property var workspace: Hyprland.workspaces.values.find(ws => ws.id === index + 1) ?? null
      property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
      property bool hasWindows: workspace !== null

      Text {
        text: index + 1
        color: parent.isActive ? theme.accent : (parent.hasWindows ? theme.fg : theme.muted)
        font.pixelSize: theme.fontSize
        font.family: theme.fontFamily
        font.bold: true
        anchors.centerIn: parent
      }

      Rectangle {
        width: 16
        height: 2
        color: parent.isActive ? theme.accent : "transparent"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
      }

      MouseArea {
        anchors.fill: parent
        onClicked: Hyprland.dispatch("workspace " + (index + 1))
      }
    }
  }
}
