import QtQuick
import Quickshell
import Quickshell.Networking

Text {
  id: net
  text: displayConectivity(Networking.devices.values)
  color: theme.fg
  font.pixelSize: theme.fontSize
  font.family: theme.fontFamily
  font.bold: true

  function displayConectivity(devices) {
    let connectedDevice = devices.find(dev => dev.connected)
    if (!connectedDevice) return "Disconnected"

    let {state, type, name, address} = connectedDevice
    let iconType = type === DeviceType.Wifi ? "󰖩" : "󰈀"

    return `${name} ${iconType}`
  }
}
