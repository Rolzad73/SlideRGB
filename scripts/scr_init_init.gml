///Application initialization

//create global variables
globalvar game_width, game_height;
globalvar platform_config;

// determine running platform
switch(os_type)
{
  case os_windows:
  case os_linux:
    platform_config = PLAT_PC;
  break;
  case os_android:
    platform_config = PLAT_DROID;
  break;
}

// invalid platform, end game
game_end();

// determine screeen resolution
switch(platform_config)
{
  case PLAT_PC:
    game_width = 800; 
    game_height = 480; 
  break;
  case PLAT_DROID:
    // have to make sure the values are not reversed if phone orientation changes
    game_width = display_get_width(); 
    game_height = display_get_height(); 
  break;
}

// set all room dimensions
room_set_width(rm_01_title, game_width);
room_set_height(rm_01_title, game_height);
room_set_width(rm_02_options, game_width);
room_set_height(rm_02_options, game_height);
room_set_width(rm_03_puzzle, game_width);
room_set_height(rm_03_puzzle, game_height);

//set window dimensions
// there is a bug with this function call, wait until they fix it
//window_set_size(game_width, game_height);

// goto next room
room_goto(rm_03_puzzle);

