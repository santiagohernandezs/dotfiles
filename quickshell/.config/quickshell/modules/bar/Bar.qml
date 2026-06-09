import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

import "../../widgets/" as Widgets
import "../../components/" as Ui

PanelWindow {
  id: panelWin

  property var modelData
  screen: modelData
  visible: true

  IpcHandler {
    target: "panelWin"

    function toggleVisible(): void { panelWin.visible = !panelWin.visible }
  }

  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: theme.barHeight

  Rectangle {
    anchors.fill: parent
    color: theme.bg

    RowLayout {
      anchors.fill: parent
      spacing: 0

      Item { width: 8 }

      Widgets.Workspaces {}

      Ui.Separator {}

      Text {
        text: sys.activeWindow
        color: theme.fg
        font.pixelSize: theme.fontSize
        font.family: theme.fontFamily
        font.bold: true
        Layout.fillWidth: true
        elide: Text.ElideRight
      }

      Widgets.Time {}

      RowLayout {
        spacing: 8

        Widgets.Cpu {}

        Widgets.Memory {}

        Widgets.Disk {}
      }

      Ui.Separator {}

      Widgets.Volume {}

      Ui.Separator {}

      Widgets.Tray {}

      Item { width: 8 }
    }
  }
}
