import QtQuick

Row {
  spacing: 4

  Text {
    text: "󰆼"
    color: theme.fg
    font.pixelSize: theme.fontSize
    font.family: theme.fontFamily
    font.bold: true
  }

  Text {
    text: sys.disk + "%"
    color: theme.fg
    font.pixelSize: theme.fontSize
    font.family: theme.fontFamily
    font.bold: true
  }
}
