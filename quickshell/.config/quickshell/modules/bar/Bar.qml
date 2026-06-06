import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

import "../../widgets/" as Widgets
import "../../components/" as Ui

PanelWindow {
  id: panelWin

  property var modelData
  screen: modelData

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

      Ui.Separator { color: theme.muted }

      Text {
        text: sys.activeWindow
        color: theme.fg
        font.pixelSize: theme.fontSize
        font.family: theme.fontFamily
        font.bold: true
        Layout.fillWidth: true
        elide: Text.ElideRight
      }

      Widgets.Kernel {}

      Ui.Separator { color: theme.muted }

      Widgets.Cpu {}

      Ui.Separator { color: theme.muted }

      Widgets.Memory {}

      Ui.Separator { color: theme.muted }

      Widgets.Disk {}

      Ui.Separator { color: theme.muted }

      Widgets.Volume {}

      Ui.Separator { color: theme.muted }

      Widgets.Tray {}

      Item { width: 8 }
    }
  }
}
