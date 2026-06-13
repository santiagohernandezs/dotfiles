import QtQuick
import QtQuick.Layouts

Text {
  text: sys.activeWindow
  color: theme.fg
  font.pixelSize: theme.fontSize
  font.family: theme.fontFamily
  font.bold: true
  Layout.fillWidth: true
  elide: Text.ElideRight
}
