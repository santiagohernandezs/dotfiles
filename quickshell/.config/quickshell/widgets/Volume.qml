import QtQuick

Text {
  text: "Vol: " + sys.vol + "%"
  color: theme.fg
  font.pixelSize: theme.fontSize
  font.family: theme.fontFamily
  font.bold: true
}

