/// Build puzzle room

// create basic room
global.room_puzzle = room_add();
room_set_width(global.room_puzzle, global.view_width);
room_set_height(global.room_puzzle, global.view_height);
room_set_persistent(global.room_puzzle, false);

// add control object
// will have to rework that object's scripts for scaling
//room_instance_add(global.room_puzzle, 0, 0, obj_control_puzzle);

// add parent one for now just in case quiting is difficult (TODO : change to proper obj_control_puzzle)
room_instance_add(global.room_puzzle, 0, 0, obj_control_parent);

// add background (just 16 grid for now)
room_set_background(global.room_puzzle, 0, true, false, bg_grid16, 0, 0, true, true, 0, 0, 1);

// for now (to test scaling) build a simple 4x4 grid in the middle
// try adding 16 tiles of the correct size
var scaledtile;
var puzzleBorder;
switch(global.game_size)
{
  case SCREEN_SMALL:
    scaledtile = bg_tile48;
    puzzleBorder = bg_puzzle_S;
    break;
  case SCREEN_MEDIUM:
    scaledtile = bg_tile64;
    puzzleBorder = bg_puzzle_M;
    break;
  case SCREEN_LARGE:
    scaledtile = bg_tile96;
    puzzleBorder = bg_puzzle_L;
    break;
  case SCREEN_EXTRALARGE:
    scaledtile = bg_tile128;
    puzzleBorder = bg_puzzle_XL;
    break;
  case SCREEN_SUPEREXTRALARGE:
    scaledtile = bg_tile256;
    puzzleBorder = bg_puzzle_SXL;
    break;
}

// add puzzle border background
room_tile_add(global.room_puzzle, puzzleBorder,
  0, 0, background_get_width(puzzleBorder), background_get_height(puzzleBorder),
  global.view_width_mid - (background_get_width(puzzleBorder) / 2), global.view_height_mid - (background_get_height(puzzleBorder) / 2),
  DEPTH_PUZZLE_BORDER);


  
// add test tiles
var startX, startY;

startX = global.view_width_mid - (screendensity[global.game_size] * 2);
startY = global.view_height_mid - (screendensity[global.game_size] * 2);

var i,j;
for (i=0; i<4; i+=1){
  for (j=0; j<4; j+=1){
    room_tile_add(
      global.room_puzzle, scaledtile,
      0, 0, screendensity[global.game_size], screendensity[global.game_size],
      (j * screendensity[global.game_size]) + startX, (i * screendensity[global.game_size]) + startY,
      DEPTH_PUZZLE_TILE);
  }  
}



