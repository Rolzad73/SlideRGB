/// Display confirmation dialog and exit game on confirm

var exit_game;
exit_game = true;
// display dialog
// TODO

// exit game if confirmed
if(exit_game) { game_end(); }

/* RESTRICTIONS on game_end()
•It report an error on the Windows 8 and iOS
•It will silently fail on the HTML5
•It will only work on Windows (including Steam Workshop), Android, and Mac. 
*/
