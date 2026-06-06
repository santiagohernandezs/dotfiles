import QtQuick
import Quickshell.Io
import Quickshell.Hyprland

Item {
  id: sys

  property string kernel: "Linux"
  property int cpu: 0
  property int mem: 0
  property int disk: 0
  property int vol: 0
  property string activeWindow: "Window"
  property string currentLayout: "Tile"

  property var _lastCpuIdle: 0
  property var _lastCpuTotal: 0

  Process {
    id: kernelProc
    command: ["uname", "-r"]
    stdout: SplitParser { onRead: data => { if (data) sys.kernel = data.trim() } }
    Component.onCompleted: running = true
  }

  Process {
    id: cpuProc
    command: ["sh", "-c", "head -1 /proc/stat"]
    stdout: SplitParser {
      onRead: data => {
        if (!data) return
        let parts = data.trim().split(/\s+/)
        let total = parts.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
        let idle = parseInt(parts[4]) + parseInt(parts[5])
        if (_lastCpuTotal > 0) {
          let totalDiff = total - _lastCpuTotal
          let idleDiff = idle - _lastCpuIdle
          if (totalDiff > 0) sys.cpu = Math.round(100 * (totalDiff - idleDiff) / totalDiff)
        }
        _lastCpuTotal = total; _lastCpuIdle = idle
      }
    }
  }

  Process {
    id: memProc
    command: ["sh", "-c", "free | grep Mem"]
    stdout: SplitParser {
      onRead: data => {
        let parts = data.trim().split(/\s+/); if (parts.length < 3) return
        sys.mem = Math.round(100 * parseInt(parts[2]) / parseInt(parts[1]))
      }
    }
  }

  Process {
    id: diskProc
    command: ["sh", "-c", "df / | tail -1"]
    stdout: SplitParser {
      onRead: data => {
        let parts = data.trim().split(/\s+/); if (parts.length < 5) return
        sys.disk = parseInt(parts[4].replace('%', ''))
      }
    }
  }

  Process {
    id: volProc
    command: ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"]
    stdout: SplitParser {
      onRead: data => {
        let match = data.match(/Volume:\s*([\d.]+)/)
        if (match) sys.vol = Math.round(parseFloat(match[1]) * 100)
      }
    }
  }

  Process {
    id: windowProc
    command: ["sh", "-c", "hyprctl activewindow -j | jq -r '.title // empty'"]
    stdout: SplitParser { onRead: data => { if (data && data.trim()) sys.activeWindow = data.trim() } }
  }

  Process {
    id: layoutProc
    command: ["sh", "-c", "hyprctl activewindow -j | jq -r 'if .floating then \"Floating\" elif .fullscreen == 1 then \"Fullscreen\" else \"Tiled\" end'"]
    stdout: SplitParser { onRead: data => { if (data && data.trim()) sys.currentLayout = data.trim() } }
  }

  // Timers
  Timer {
    interval: 2000; running: true; repeat: true
    onTriggered: { cpuProc.running = true; memProc.running = true; diskProc.running = true; volProc.running = true }
  }

  Timer {
    interval: 500; running: true; repeat: true
    onTriggered: { windowProc.running = true; layoutProc.running = true }
  }

  Connections {
    target: Hyprland
    function onRawEvent(event) { windowProc.running = true; layoutProc.running = true }
  }
}
