import QtQuick

Text {
  text: "Disk: " + sys.disk + "%"
  color: theme.fg
  font.pixelSize: theme.fontSize
  font.family: theme.fontFamily
  font.bold: true
}
