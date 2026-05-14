import QtQuick
import QtQuick.Layouts

RowLayout {
  id: info
  spacing: 0

  // Props
  property string kernel: ""
  property int cpu: 0
  property int mem: 0
  property int disk: 0
  property int vol: 0
  
  // Theme Props
  property color color: "white"
  property color separatorColor: "gray"
  property int fontSize: 12
  property string fontFamily: "sans"

  Text {
    text: kernel
    color: info.color
    font.pixelSize: info.fontSize
    font.family: info.fontFamily
    font.bold: true
  }

  Rectangle {
    Layout.preferredWidth: 1; Layout.preferredHeight: 16
    Layout.alignment: Qt.AlignVCenter
    Layout.leftMargin: 8; Layout.rightMargin: 8
    color: info.separatorColor
  }

  Text {
    text: "CPU: " + cpu + "%"
    color: info.color
    font.pixelSize: info.fontSize
    font.family: info.fontFamily
    font.bold: true
  }

  Rectangle {
    Layout.preferredWidth: 1; Layout.preferredHeight: 16
    Layout.alignment: Qt.AlignVCenter
    Layout.leftMargin: 8; Layout.rightMargin: 8
    color: info.separatorColor
  }

  Text {
    text: "Mem: " + mem + "%"
    color: info.color
    font.pixelSize: info.fontSize
    font.family: info.fontFamily
    font.bold: true
  }

  Rectangle {
    Layout.preferredWidth: 1; Layout.preferredHeight: 16
    Layout.alignment: Qt.AlignVCenter
    Layout.leftMargin: 8; Layout.rightMargin: 8
    color: info.separatorColor
  }

  Text {
    text: "Disk: " + disk + "%"
    color: info.color
    font.pixelSize: info.fontSize
    font.family: info.fontFamily
    font.bold: true
  }

  Rectangle {
    Layout.preferredWidth: 1; Layout.preferredHeight: 16
    Layout.alignment: Qt.AlignVCenter
    Layout.leftMargin: 8; Layout.rightMargin: 8
    color: info.separatorColor
  }

  Text {
    text: "Vol: " + vol + "%"
    color: info.color
    font.pixelSize: info.fontSize
    font.family: info.fontFamily
    font.bold: true
  }
}
