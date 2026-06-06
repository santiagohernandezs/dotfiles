import QtQuick

Text {
  text: "Mem: " + sys.mem + "%"
  color: theme.fg
  font.pixelSize: theme.fontSize
  font.family: theme.fontFamily
  font.bold: true
}
