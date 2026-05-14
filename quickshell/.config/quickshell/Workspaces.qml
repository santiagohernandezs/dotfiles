import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
  spacing: 0

  // Props
  property color activeColor: "white"
  property color inactiveColor: "gray"
  property color bgColor: "black"
  property int fontSize: 12
  property string fontFamily: "sans"

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
        color: parent.isActive ? activeColor : (parent.hasWindows ? activeColor : inactiveColor)
        font.pixelSize: fontSize
        font.family: fontFamily
        font.bold: true
        anchors.centerIn: parent
      }

      Rectangle {
        width: 16
        height: 2
        color: parent.isActive ? activeColor : "transparent"
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
