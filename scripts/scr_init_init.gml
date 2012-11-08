///Application initialization

//create screen density grid size
globalvar screendensity;
screendensity[SCREEN_SMALL] = 48;
screendensity[SCREEN_MEDIUM] = 64;
screendensity[SCREEN_LARGE] = 96;
screendensity[SCREEN_EXTRALARGE] = 128;
screendensity[SCREEN_SUPEREXTRALARGE] = 256;

// some sample resolutions
/* PHONES */
// QVGA =  320 x 240 (Xperia Mini)    aspect = 4:3   -uncommon** ldpi ~ should use SCREEN_SMALL sized tiles for 4x4
// HVGA =  480 x 320 (HTC Magic)      aspect = 4:3   - common ** mdpi ~ should use SCREEN_MEDIUM sized tiles for 4x4
// WVGA =  800 x 480 (Nexus One)      aspect = 5:3   - common ** hdpi ~ should use SCREEN_LARGE sized tiles for 4x4
// QHD  =  960 x 540 (Asus Padphone)  aspect = 16:9  - common         ~ SCREEN_EXTRALARGE
// HD     1280 x 720 (Galaxy Nexus)   aspect = 16:9  - common ** xhdpi ~ should use SCREEN_EXTRALARGE sized tiles for 4x4

/* TABLETS */
// WXGA = 1280 x 800 (Nexus 7)        aspect = 16:10 - common ** tvdpi ~ SCREEN_EXTRALARGE
// WUXGA = 1920 x 1200 (Transformer)  aspect = 16:10             ~ should use SCREEN_SUPEREXTRALARGE sized tiles for 4x4
// WQXGA = 2560 x 1600 (Nexus 10)     aspect = 16:10 - uncommon ** xhdpi ~ SCREEN_SUPEREXTRALARGE

//create global variables
var display_width, display_height; // device actual display size
globalvar view_width, view_height; // actual size of game when displayed
globalvar view_width_mid, view_height_mid; // middle points of the game
//globalvar chosen_room_width, chosen_room_height; // size of actual room  used
globalvar game_size; // game_size is set to a constant to acces array w/h values
globalvar room_title, room_options, room_puzzle;

// get stats from device display
display_width = display_get_width();
display_height = display_get_height();

// determine game view dimensions
switch(os_type)
{
  case os_windows:
  case os_linux:
    view_width = room_width;
    view_height = room_height;
    break;
  case os_android:
    view_width = display_width;
    view_height = display_height;
    break;
}

// calculate midpoints
view_width_mid = view_width / 2;
view_height_mid = view_height / 2;

// use screen height to set screen scaling
if(view_height <= 240) { game_size = SCREEN_SMALL; }
else if(view_height > 240 && view_height <= 320) { game_size = SCREEN_MEDIUM; }
else if(view_height > 320 && view_height <= 480) { game_size = SCREEN_LARGE; }
else if(view_height > 480 && view_height < 1200) { game_size = SCREEN_EXTRALARGE; }
else { game_size = SCREEN_SUPEREXTRALARGE; }

// could now show first room (RolTekk Logo) while bulding the rest of the rooms if it takes a while to do it manually

// build rooms manually
scr_build_titleroom();
scr_build_optionsroom();
scr_build_puzzleroom();

room_goto(room_puzzle);









// this does work when room is smaller than display, but does not work when room is larger than display
// NOTE: cant set a view larger than room ()ie showing blank stuff outside of room)


// THIS SCALING PART WORKS WITH BREBUILT ROOMS
// now try to match aspect of device (cut off sides)

/*
//calculate the scales between room and view
var scalex, scaley;
scalex = view_width / chosen_room_width;
scaley = view_height / chosen_room_height;
show_debug_message("~rpw scales x,y -- " + string(scalex) + " , " + string(scaley));

var xtrim, ytrim;
xtrim = 0;
ytrim = 0;

if(scalex > scaley)
{
  // match widths
  ytrim = (((chosen_room_height * scalex) - view_height) / 2) / scalex;
}
else
{
  // match heights
  xtrim = (((chosen_room_width * scaley) - view_width) / 2) / scaley;
}

show_debug_message("~rpw xT,yT -- " + string(xtrim) + " , " + string(ytrim));

room_set_view(
  rm_smallest, 0, true,
  xtrim, ytrim, chosen_room_width - (xtrim * 2), chosen_room_height - (ytrim * 2),
  0, 0, view_width, view_height,
  0, 0, -1, -1, -1);

// go to the first game room
room_goto(rm_smallest);
*/

