/// Build puzzle room

// create basic room
global.room_puzzle = room_add();
room_set_width(global.room_puzzle, global.view_width);
room_set_height(global.room_puzzle, global.view_height);
room_set_persistent(global.room_puzzle, false);

// add control object
// will have to rework that object's scripts for scaling
//room_instance_add(global.room_puzzle, 0, 0, obj_control_puzzle);

//add parent one for now just incase quiting is difficult
room_instance_add(global.room_puzzle, 0, 0, obj_control_parent);

// for now (to test scaling) build a simple 4x4 grid in the middle
// try adding 16 tiles of the correct size
var scaledtile;
switch(global.game_size)
{
  case SCREEN_SMALL:
    scaledtile = bg_tile48;
    break;
  case SCREEN_MEDIUM:
    scaledtile = bg_tile64;
    break;
  case SCREEN_LARGE:
    scaledtile = bg_tile96;
    break;
  case SCREEN_EXTRALARGE:
    scaledtile = bg_tile128;
    break;
  case SCREEN_SUPEREXTRALARGE:
    scaledtile = bg_tile256;
    break;
}

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
      1000000);
  }  
}


