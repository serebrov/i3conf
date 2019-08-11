// Checks
// o vs O vs 0
// ; vs :
// g vs q
// C vs G
// () vs [] vs {}
// ~ vs -
// i vs l vs 1 vs I vs L vs |
// Type some code ->
//
// Fonts:
// fira code - good font with ligatures (=> displayed as 1 symbol)
//             note: ligatures don't work in gnome terminal, work in konsole
//
// mensh - https://robey.lag.net/2010/06/21/mensch-font.html
//      similar to fira code, larger punctuation chars - ~, >
//
// source code pro, office code pro
//      https://github.com/adobe-fonts/source-code-pro
//      https://github.com/nathco/Office-Code-Pro
//
// hasklig - also based on source code pro, 
//           comparing to fira code - smaller letter height, bigger spacing
//
// To install font:
//   sudo apt install fonts-fontname
//
// if font is not present in repos - download (or git clone) to ~/.fonts and run `fc-cache -f -v`

console.log "oO08 iIlL1 g9qCGQ ~-+=>";

function updateGutters(cm) {
    var gutters = cm.display.gutters,
          specs = cm.options.gutters;

    removeChildren(gutters);

    for (var i = 0; i < specs.length; ++i) {
        var gutterClass = specs[i];
        var gElt = gutters.appendChild(
            elt(
                "div",
                null,
                "CodeMirror-gutter " + gutterClass
            )
        );
        if (gutterClass == "CodeMirror-linenumbers") {
            cm.display.lineGutter = gElt;
            gElt.style.width = (cm.display.lineNumWidth || 1) + "px";
        }
    }
    gutters.style.display = i ? "" : "none";
    updateGutterSpace(cm);

    return false;
}
