import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

ShellRoot {
  id: root

  property color colBg: "#111111"
  property color colFg: "#fafafa"
  property color colMuted: "#3c3c3c"

  property string fontFamily: "GeistMono Nerd Font"
  property int fontSize: 12

  SysInfo { id: sys }

  Variants {
    model: Quickshell.screens

    PanelWindow {
      property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30
      color: root.colBg

      Rectangle {
        anchors.fill: parent
        color: root.colBg

        RowLayout {
          anchors.fill: parent
          spacing: 0

          Item { width: 8 }

          Workspaces {
            activeColor: root.colFg
            inactiveColor: root.colMuted
            bgColor: root.colBg
            fontSize: root.fontSize
            fontFamily: root.fontFamily
          }

          Rectangle {
            Layout.preferredWidth: 1; Layout.preferredHeight: 16
            Layout.alignment: Qt.AlignVCenter
            Layout.leftMargin: 8; Layout.rightMargin: 12
            color: root.colMuted
          }

          Text {
            text: sys.activeWindow
            color: root.colFg
            font.pixelSize: root.fontSize
            font.family: root.fontFamily
            font.bold: true
            Layout.fillWidth: true
            elide: Text.ElideRight
          }

          Info {
            kernel: sys.kernel
            cpu: sys.cpu
            mem: sys.mem
            disk: sys.disk
            vol: sys.vol
            color: root.colFg
            separatorColor: root.colMuted
            fontSize: root.fontSize
            fontFamily: root.fontFamily
          }

          Item { width: 8 }
        }
      }
    }
  }
}
