import QtQuick

Row {
  id: level
  spacing: 4

  Text {
    text: sys.vol === 0 ? "" : (sys.vol < 50 ? "" : "")
    color: theme.fg
    font.pixelSize: theme.fontSize
    font.family: theme.fontFamily
    font.bold: true
  }

  Text {
    text: sys.vol + "%"
    color: theme.fg
    font.pixelSize: theme.fontSize
    font.family: theme.fontFamily
    font.bold: true
  }
}
