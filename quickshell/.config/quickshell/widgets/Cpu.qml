import QtQuick

Text {
  text: "CPU: " + sys.cpu + "%"
  color: theme.fg
  font.pixelSize: theme.fontSize
  font.family: theme.fontFamily
  font.bold: true
}
