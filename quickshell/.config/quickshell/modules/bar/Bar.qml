import Quickshell
import Quickshell.Io
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

        function toggleVisible(): void {
            panelWin.visible = !panelWin.visible;
        }
    }

    margins {
        top: 5
        right: 5
        left: 5
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

        GridLayout {
            anchors.fill: parent
            columns: 3
            columnSpacing: 0
            rowSpacing: 0

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                RowLayout {
                    anchors.fill: parent
                    spacing: 4

                    Widgets.Workspaces {}

                    Ui.Separator {}

                    Widgets.ActiveWindow {}
                }
            }

            Item {
                Layout.preferredWidth: clockWidget.implicitWidth
                Layout.fillHeight: true

                Widgets.Time {
                    id: clockWidget
                    anchors.centerIn: parent
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                RowLayout {
                    anchors.fill: parent
                    spacing: 4

                    Item {
                        Layout.fillWidth: true
                    }

                    RowLayout {
                        spacing: 8

                        Widgets.Cpu {}
                        Widgets.Memory {}
                        Widgets.Disk {}
                    }

                    Ui.Separator {}

                    Widgets.Volume {}

                    Ui.Separator {}

                    Widgets.Network {}

                    Ui.Separator {}

                    Widgets.Tray {}

                    Item {
                        width: 2
                    }
                }
            }
        }
    }
}
