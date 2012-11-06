///Move tile toward empty location
var swap_direction;
swap_direction = DIR_NOWHERE;
global.current_slide_speed = global.user_slide_speed;
//show_debug_message("x,y | index: " + string(tile_x_pos) + "," + string(tile_y_pos) + " | " + string(tile_index));

if(tile_x_pos=global.empty_x)
{
  // test for up and down moves
  if((tile_y_pos-1)=global.empty_y){ swap_direction = DIR_UP; }
  else if((tile_y_pos+1)=global.empty_y){ swap_direction = DIR_DOWN; }
}
else if(tile_y_pos=global.empty_y)
{
  // test for left and right moves
  if((tile_x_pos-1)=global.empty_x){ swap_direction = DIR_LEFT; }
  else if((tile_x_pos+1)=global.empty_x){ swap_direction = DIR_RIGHT; }
}

if(swap_direction != DIR_NOWHERE){ scr_swap_tile(swap_direction); }

