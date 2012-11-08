///Application initialization

// to accomplish the dynamic sizeablity, cloud set constant 1,2,3,4 depending on device size
// then could access an array of w/h values for calcualtions in the puzzle and button placement
// the array would be accessed using the constant value

//array:
/*
        [w] [h]
size  1 [ ] [ ]
      2 [ ]
      3
      4
      5
      */
      
      // AND progromatically create rooms !!!!!!!!!!!!!!!!!!!!!!
      
      
// TODO : maybe just make a version for android because apparently it scales properly
//  but of course will have to consider resolution for every device, but can
//  build rooms manually, so that should not be an issue, just work.

//create screen density grid size
globalvar screendensity;
screendensity[DENSITY_LOW][16];
screendensity[DENSITY_MED][16];   // 32?
screendensity[DENSITY_HIGH][16];  // 48?
screendensity[DENSITY_XHIGH][16]; // 64?

// some sample resolutions
/* PHONES */
// QVGA =  320 x 240 (Xperia Mini)    aspect = 4:3
// HVGA =  480 x 320 (HTC Magic)      aspect = 4:3   - common
// WVGA =  800 x 480 (Nexus One)      aspect = 5:3   - common
// QHD  =  960 x 540 (Asus Padphone)  aspect = 16:9  - common
// HD     1280 x 720 (Asus Padphone2) aspect = 16:9  - common

/* TABLETS */
// WXGA = 1280 x 800 (Nexus 7)        aspect = 16:10 - common
// game listed as w/h: 800 / 1205 when checking, but showed this when actually drawing:
//( 3845): onSurfaceChanged :: width=1280 height=736
// so this shows that in landscape, bar takes up 75px and in portrait, 64px

// WUXGA = 1920 x 1200 (Asus Transformer) aspect = 16:10
// WQXGA = 2560 x 1600 (Nexus 10)         aspect = 16:10 - uncommon

// will have to consider the action bar AND have to consider device may not be oriented correctly
// when game starts.

//create global variables
globalvar display_width, display_height; // device actual display size
globalvar view_width, view_height; // actual size of game when displayed
globalvar chosen_room_width, chosen_room_height; // size of actual room  used
globalvar game_size; // game_size is set to a constant to acces array w/h values

// get stats from device display
display_width = display_get_width();
display_height = display_get_height();
//display_aspect = display_width / display_height;

// determine running platform
switch(os_type)
{
  case os_windows:
  case os_linux:

    // hese all work    
    // largest room size (2:1 ratio)
    //chosen_room_width = 1600;
    //chosen_room_height = 800;
    
    // smallest room size (2:1 ratio)
    chosen_room_width = 480;
    chosen_room_height = 240;
    
    // smallest2 room size (4:3 ratio)
    //chosen_room_width = 320;
    //chosen_room_height = 240;
    
    // match view dimensions to init room dimensions (aka the window size)
    view_width = room_width;
    view_height = room_height;
    break;
  case os_android:
    //...
    //game_width = 1600;
    //game_height = 800;
    
    // smallest room size (2:1 ratio)
    //chosen_room_width = 480;
    //chosen_room_height = 240;
    
    // smallest2 room size (4:3 ratio)
    chosen_room_width = 320;
    chosen_room_height = 240;
    
    // match view dimensions to device dimensions
    view_width = display_width;
    view_height = display_height;
    //view_aspect = view_width / view_height;
    break;
}

if(view_height <= 240)
{
  // use smallest room
  game_size = SMALLEST;

}


//show_debug_message("~rpw Display W x H : A -- " + string(display_width) + " x " + string(display_height) + " : " + string(display_aspect) );
/* RESULTS
Windows
~rpw Display W x H : A -- 1280 x 800 : 1.60

Nexus 7
onSurfaceChanged :: width=1280 height=736
~rpw Display W x H : A -- 1280 x 736 : 1.74

Nexus One
onSurfaceChanged :: width=800 height=480
~rpw Display W x H : A -- 800 x 480 : 1.67
*/

/*
xlarge screens are at least 960dp x 720dp
large screens are at least 640dp x 480dp
normal screens are at least 470dp x 320dp
small screens are at least 426dp x 320dp
*/

// set all room views here
/*
room_set_view(
  rm_largest, 0, true,
  0, 0, game_width, game_height,
  0, 0, game_width, game_height,
  0, 0, -1, -1, -1);
  */
  
//view_width = round(display_aspect * game_height);
//room_set_view(rmTest, 0, 1, rwidth / 2 - vwidth / 2, 0, vwidth, rheight, 0, 0, dwidth, dheight, 0, 0, 0, 0, -1);
// Sets the view's size/aspect ratio to match that of the device, the view is centered in the room

//just scales it
/*
room_set_view(rm_largest, 0, true,
  (game_width / 2) - (view_width / 2), 0, view_width, game_height,
  0, 0, display_width, display_height,
  0, 0, -1, -1, -1);
  */

  
// this does work when room is smaller than display, but does not work when room is larger than display
// NOTE: cant set a view larger than room ()ie showing blank stuff outside of room)

// now try to match aspect of device (cut off sides)

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

// try aspect

room_set_view(
  rm_smallest, 0, true,
  xtrim, ytrim, chosen_room_width - (xtrim * 2), chosen_room_height - (ytrim * 2),
  0, 0, view_width, view_height,
  0, 0, -1, -1, -1);

// go to the first game room  
room_goto(rm_smallest);



// try adding some padding if needed

/*
room_set_view(rm_03_puzzleSmall, 0, true,
  (320 - game_width) div 2, (240 - game_height) div 2, game_width, game_height,
  0, 0, game_width, game_height,
  0, 0, -1, -1, -1);
  */

// goto next room




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


//from forum suggestion (but still stretches)
/*
///Sets views of other screens
var dwidth, dheight, aratio, rheight, vwidth, rwidth;
// Get the usable resolution of the device
dwidth = display_get_width();
dheight = display_get_height();
// Calculate the aspect ratio
aratio = dwidth / dheight;

// Width and height values of rooms you will apply to
rwidth = 1600;
rheight = 800;

// Set the width for the view by multiplying the aspect ratio times the room's height
vwidth = round(aratio * rheight);

// Sets the view's size/aspect ratio to match that of the device, the view is centered in the room
room_set_view(rmTest, 0, 1, rwidth / 2 - vwidth / 2, 0, vwidth, rheight, 0, 0, dwidth, dheight, 0, 0, 0, 0, -1);


// Set any other rooms you need to here with the same code as above
// Go to the title screen!
room_goto(rmTest);
*/

