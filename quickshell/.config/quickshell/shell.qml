//@ pragma UseQApplication
import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import Quickshell.Io

import "./modules/bar/"
import "./core"

ShellRoot {
  id: root

  Theme { id: theme }

  SysInfo { id: sys }

  Variants {
    model: Quickshell.screens

    delegate: Bar {}
  }
}
