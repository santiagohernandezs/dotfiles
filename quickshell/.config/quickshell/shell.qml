import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import Quickshell.Io

ShellRoot {
  id: root

  IpcHandler {
    target: "theme"
    function reloadColors() {
      matugenColorsFile.reload();
    }
  }

  FileView {
    id: matugenColorsFile
    path: "/home/tao/.local/state/quickshell/user/generated/colors.json"
    blockLoading: true
    onTextChanged: {
      try {
        root.colors = JSON.parse(text());
      } catch(e) {}
    }
  }

  property var colors: {
    "surface": "#121318",
    "on_surface": "#e3e2e9",
    "on_surface_variant": "#8f909a",
    "primary": "#b2c5ff"
  }

  Component.onCompleted: {
    try {
      root.colors = JSON.parse(matugenColorsFile.text());
    } catch(e) {}
  }

  property color colBg: colors.surface
  property color colFg: colors.on_surface
  property color colMuted: colors.on_surface_variant
  property color colAccent: colors.primary

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
            activeColor: root.colAccent
            windowColor: root.colFg
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
