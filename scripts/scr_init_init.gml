///Application initialization

// TODO : maybe just make a version for android because apparently it scales properly
//  but of course will have to consider resolution for every device, but can
//  build rooms manually, so that should not be an issue, just work.

//create global variables
globalvar game_width, game_height;
var aspect;
aspect = display_get_width() / display_get_height();

// determine running platform
switch(os_type)
{
  case os_windows:
  case os_linux:
    // regular size
    //game_width = 800;
    //game_height = 480;
    // test small size (4:3 aspect)
    //game_width = 320;
    //game_height = 240;
    // test small size (16:10 aspect with width larger)
    //game_width = 384;
    //game_height = 240;
    // test small size (16:10 aspect with height smaller )
    game_width = 320;
    game_height = 200;
    break;
  case os_android:

  
  
    game_width = display_get_width();
    game_height = display_get_height();
    break;
}

show_debug_message("~rpw GameStats w/h: " + string(game_width) + " / " + string(game_height));

/*
xlarge screens are at least 960dp x 720dp
large screens are at least 640dp x 480dp
normal screens are at least 470dp x 320dp
small screens are at least 426dp x 320dp
*/

// set all room views here
// try setting views instead
//room_set_view_enabled(rm_03_puzzleSmall, true);
/*
room_set_view(
  rm_03_puzzleSmall, 0, true,
  0, 0, game_width, game_height,
  0, 0, game_width, game_height,
  0, 0, -1, -1, -1);
  */

// try adding some padding if needed

room_set_view(rm_03_puzzleSmall, 0, true,
  (320 - game_width) div 2, (240 - game_height) div 2, game_width, game_height,
  0, 0, game_width, game_height,
  0, 0, -1, -1, -1);

// goto next room
room_goto(rm_03_puzzleSmall);



/////////////////////////////////////////////////////////////////////
//from guide

/*
{
// Determine the size of the view
var aspect;
aspect = display_get_width() / display_get_height();

globalvar VIEW_WIDTH, VIEW_HEIGHT;

  if (os_type = os_ios && os_device == device_ios_ipad)
    { VIEW_WIDTH = 768; VIEW_HEIGHT = 1024; }
  else if (os_type == os_windows || os_type == os_macosx || os_browser != browser_not_a_browser)
   { VIEW_WIDTH = 640; VIEW_HEIGHT = 960; }  
  else if (aspect < 640 / 960)
    { VIEW_WIDTH = 640; VIEW_HEIGHT = 640/aspect; }
  else
    { VIEW_WIDTH = 960*aspect; VIEW_HEIGHT = 960; }  
  // Set the views in the rooms
room_set_view_enabled(room_title,true);
  room_set_view(room_title,0,true,(768 - VIEW_WIDTH) div 2,
           (1024 - VIEW_HEIGHT) div 2, VIEW_WIDTH, VIEW_HEIGHT,
           0,0, VIEW_WIDTH, VIEW_HEIGHT,0,0,-1,-1,-1);
  // Add views for the other rooms here  
  
// Now go to the title menu room
room_goto(room_title);
}
*/

