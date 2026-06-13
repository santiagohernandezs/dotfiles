import Quickshell.Services.Mpris
import QtQuick

Text {
    text: displayPlayers(Mpris.players.values)
    color: theme.fg
    font.pixelSize: theme.fontSize
    font.family: theme.fontFamily
    font.bold: true

    function displayPlayers(players) {
        const playingSource = players.find(player => player.isPlaying);
        console.log(playingSource.trackTitle);

        return playingSource.trackTitle;
    }
}
