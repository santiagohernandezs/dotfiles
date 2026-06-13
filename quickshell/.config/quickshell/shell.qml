//@ pragma UseQApplication
import Quickshell
import QtQuick

import "./modules/bar/"
import "./core"

ShellRoot {
    id: root

    Theme {
        id: theme
    }

    SysInfo {
        id: sys
    }

    Variants {
        model: Quickshell.screens

        delegate: Bar {}
    }
}
