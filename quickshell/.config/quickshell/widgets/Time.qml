import QtQuick

Text {
  text: sys.time
  color: theme.fg
  font.pixelSize: theme.fontSize
  font.family: theme.fontFamily
  font.bold: true
  anchors.centerIn: parent
}
