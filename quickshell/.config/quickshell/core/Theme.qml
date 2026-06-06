import QtQuick
import Quickshell
import Quickshell.Io

Item {
  id: theme

  property var colors: {
    "surface": "#121318",
    "on_surface": "#e3e2e9",
    "on_surface_variant": "#8f909a",
    "primary": "#b2c5ff",
    "primary_container": "#2c3f75",
    "surface_container_high": "#22232a",
    "outline": "#45464f"
  }

  property color bg: colors.surface
  property color bgAlt: colors.surface_container_high
  property color fg: colors.on_surface
  property color muted: colors.on_surface_variant
  property color accent: colors.primary
  property color accentDim: colors.primary_container
  property color border: colors.outline

  property color success: "#a6e3a1"
  property color warning: "#f9e2af"
  property color error: "#f38ba8"

  property string fontFamily: "GeistMono Nerd Font"
  property int fontSize: 11
  property int fontSizeSmall: 9
  property int fontSizeLarge: 14

  property int barHeight: 30
  property int radiusSmall: 4
  property int radiusMedium: 10
  property int radiusRound: 99
  property int spacingSmall: 4
  property int spacingMedium: 8

  IpcHandler {
    target: "theme"
    function reloadColors() {
      matugenColorsFile.reload();
    }
  }

  FileView {
    id: matugenColorsFile
    path: "/home/tao/.local/state/quickshell/user/generated/colors.json"
    blockLoading: true
    onTextChanged: {
      try {
        theme.colors = JSON.parse(text());
      } catch(e) {}
    }
  }

  Component.onCompleted: {
    try {
      theme.colors = JSON.parse(matugenColorsFile.text());
    } catch(e) {}
  }
}


