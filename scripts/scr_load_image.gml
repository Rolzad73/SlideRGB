///Load image from external resource

var file, spr_loaded, spr_part, spr_puzzle, spr_puzzleBG;
// NOTE: this way only works in windows build, will have to make generic file search and choose menu
// NOTE: also can't use hardcoded filename in places other than game temp directory
//       this is known functionality and NOT a bug
//file = get_open_filename("Supported image files|*.bmp;*.png;*.gif;*.jpg", "");
//show_debug_message("file: " + file);

// NOTE: 8 bit pngs are not liked, make sure its 24 bit
// NOTE: odd fade animation occurs with alpha component

//try a local version
file = "tiles15.png";

if (file != "")
{
  spr_loaded = sprite_add(file, 1, false, false, 0, 0);
  
  // create new part sprites for the tiles;
  var surf, inst_tile;
  surf = surface_create((global.tile_count_x*global.tile_width), (global.tile_count_y*global.tile_height));
  surface_set_target(surf);

  // clear surface
  draw_clear_alpha(c_black, 1);
  //set puzzle backgournd from cleared surface
  global.obj_puzzleBG_image = instance_find(obj_puzzle_BG, 0);
  spr_puzzleBG = sprite_create_from_surface(
                  surf, 
                  0, 0,
                  global.puzzle_width, global.puzzle_height,
                  false, false,
                  0, 0);
  global.obj_puzzleBG_image.sprite_index = spr_puzzleBG;
  // draw loaded image scaled onto surface
  draw_sprite_stretched(spr_loaded, 0, 0, 0, global.puzzle_width, global.puzzle_height);

  // reset tile positions
  // NOTE: may not need this now
  scr_reset_tile_positions();
  
  // clear tile sprites (if applicable)
  scr_delete_tile_sprites();
  
  var inst_tile, i, j;
  //create the tile sprites and assign them (maybe set the empty one as blank)
  for (i=0; i<tile_count_y; i+=1){
    for (j=0; j<tile_count_x; j+=1){
      inst_tile = instance_find(obj_tile,((i*global.tile_count_x)+j));
      if(inst_tile.tile_index = 0)
      {
        spr_part = spr_blanktile;
        inst_tile.depth = 1;
      }
      else
      {
        spr_part = sprite_create_from_surface(
                  surf, 
                  (inst_tile.tile_x_pos*global.tile_width), (inst_tile.tile_y_pos*global.tile_height),
                  global.tile_width, global.tile_height,
                  false, false,
                  0, 0);
      }
      inst_tile.sprite_index = spr_part;
    }
  }
  
  // set puzzle object sprite with this image
  global.puzzle_image_inst = instance_find(obj_puzzle_image, 0);
  spr_puzzle = sprite_create_from_surface(
                  surf, 
                  0, 0,
                  global.puzzle_width, global.puzzle_height,
                  false, false,
                  0, 0);
  global.puzzle_image_inst.sprite_index = spr_puzzle;

  // cleanup
  surface_reset_target();
  surface_free(surf);

  // turn on visibility of tiles (if not previously turned on)
  if(!global.tiles_visible){scr_set_tile_visibilty(true);}
}
else
{
  //show_debug_message("no file chosen");
}

