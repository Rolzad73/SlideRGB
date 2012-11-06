///Swap tile in the direction supplied from global empty_x, empty_y tile
// NOTE : works great for sinlge movement, not so great for shuffleing

// only swap if not currently sliding
if(!global.sliding)
{
  var inst_tile;
  global.sliding = true;
  
  // move tile into empty spot, then set previous location to empty
  switch(argument[0])
  {
    case DIR_UP:
      //show_debug_message("swap DIR_UP");
      // start moving tile instance
      inst_tile = instance_find(obj_tile, global.tilePositions[global.empty_y + 1, global.empty_x]);
      path_change_point(global.slide_path, 1, 0, -global.tile_height, global.current_slide_speed);
      with(inst_tile){
        path_start(global.slide_path, global.current_slide_speed, 0, false);
        tile_y_pos -= 1;
      }
      
      // move values in tilePositions array
      global.tilePositions[global.empty_y, global.empty_x] = global.tilePositions[global.empty_y + 1, global.empty_x];
      global.tilePositions[global.empty_y + 1, global.empty_x] = EMPTY_TILE_VALUE;
      global.empty_y += 1;
      break;
    case DIR_RIGHT:
      //show_debug_message("swap DIR_RIGHT");
      // start moving tile instance
      inst_tile = instance_find(obj_tile, global.tilePositions[global.empty_y, global.empty_x - 1]);
      path_change_point(global.slide_path, 1, global.tile_width, 0, global.current_slide_speed);
      with(inst_tile){
        path_start(global.slide_path, global.current_slide_speed, 0, false);
        tile_x_pos += 1;
      }
      
      // move values in tilePositions array
      global.tilePositions[global.empty_y, global.empty_x] = global.tilePositions[global.empty_y, global.empty_x - 1];
      global.tilePositions[global.empty_y, global.empty_x - 1] = EMPTY_TILE_VALUE;
      global.empty_x -= 1;
      break;
    case DIR_DOWN:
      //show_debug_message("swap DIR_DOWN");
      // start moving tile instance
      inst_tile = instance_find(obj_tile, global.tilePositions[global.empty_y - 1, global.empty_x]);
      path_change_point(global.slide_path, 1, 0, global.tile_height, global.current_slide_speed);
      with(inst_tile){
        path_start(global.slide_path, global.current_slide_speed, 0, false);
        tile_y_pos += 1;
      }
      
      // move values in tilePositions array
      global.tilePositions[global.empty_y, global.empty_x] = global.tilePositions[global.empty_y - 1, global.empty_x];
      global.tilePositions[global.empty_y - 1, global.empty_x] = EMPTY_TILE_VALUE;
      global.empty_y -= 1;
      break;
    case DIR_LEFT:
      //show_debug_message("swap DIR_LEFT");
      // start moving tile instance
      inst_tile = instance_find(obj_tile, global.tilePositions[global.empty_y, global.empty_x + 1]);
      path_change_point(global.slide_path, 1, -global.tile_width, 0, global.current_slide_speed);
      with(inst_tile){
        path_start(global.slide_path, global.current_slide_speed, 0, false);
        tile_x_pos -= 1;
      }
      
      // move values in tilePositions array
      global.tilePositions[global.empty_y, global.empty_x] = global.tilePositions[global.empty_y, global.empty_x + 1];
      global.tilePositions[global.empty_y, global.empty_x + 1] = EMPTY_TILE_VALUE;
      global.empty_x += 1;
      break;
    // catch for illeagal calls
    case DIR_EVERYWHERE:
      //show_debug_message("ILLEGAL swap DIR_EVERYWHERE");
      break;
    case DIR_NOWHERE:
      //show_debug_message("ILLEGAL swap DIR_NOWHERE");
      break;
  }
  
  //test here for now for solved
  //if(scr_check_solved()){show_message("Good for you!");}
}

