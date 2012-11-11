/// Load image from external resource

var file, spr_loaded, spr_part, spr_puzzle, spr_tile_mask;
var xscale, yscale;
// NOTE: this way only works in windows build, will have to make generic file search and choose menu
// NOTE: also can't use hardcoded filename in places other than game temp directory
//       this is known functionality and NOT a bug
//file = get_open_filename("Supported image files|*.bmp;*.png;*.gif;*.jpg", "");
//show_debug_message("file: " + file);

// NOTE: 8 bit pngs are not liked, make sure its 24 bit
// NOTE: odd fade animation occurs with alpha component

file = working_directory + argument[0];
//show_debug_message("file: " + file);

if (file_exists(file))
{
  spr_loaded = sprite_add(file, 1, false, false, 0, 0);
  //show_debug_message("get sprite w/h = " + string(sprite_get_width(spr_loaded)) + "/" + string(sprite_get_height(spr_loaded)));
  
  // create new part sprites for the tiles;
  var surf, inst_tile;
  surf = surface_create(global.puzzle_width, global.puzzle_height);
  surface_set_target(surf);
  draw_clear_alpha(c_black, 0);

  // try stretching sprite only at end (pt. 2) need some temp vars
  var spr_tile_width, spr_tile_height;
  spr_tile_width = sprite_get_width(spr_loaded) / global.tile_count_x;
  spr_tile_height = sprite_get_height(spr_loaded) / global.tile_count_y;
  xscale = global.tile_width / spr_tile_width;
  yscale = global.tile_height / spr_tile_height;

  // draw loaded image scaled onto surface (loses the bottom 1 pixel only on 481 - 547 room height)
  // my solution? mask the image into rounded tiles anywyas, so this may not be noticable...
  //draw_sprite_stretched(spr_loaded, 1, 0, 0, global.puzzle_width, global.puzzle_height);
  draw_sprite_ext(spr_loaded, 0, 0, 0, xscale, yscale, 0, c_white, 1);

  // reset tile positions
  scr_reset_tile_positions();
  
  // clear tile sprites (if applicable)
  scr_delete_tile_sprites();
  
  //select appropriate tile masking sprite
  switch(global.game_size)
  {
    case SCREEN_SMALL:
      spr_tile_mask = spr_tileShape_S;
      break;
    case SCREEN_MEDIUM:
      spr_tile_mask = spr_tileShape_M;
      break;
    case SCREEN_LARGE:
      spr_tile_mask = spr_tileShape_L;
      break;
    case SCREEN_EXTRALARGE:
      spr_tile_mask = spr_tileShape_XL;
      break;
    case SCREEN_SUPEREXTRALARGE:
      spr_tile_mask = spr_tileShape_SXL;
      break;
  }
  
  var inst_tile, i, j;
  // create the tile sprites and assign them (maybe set the empty one as blank)
  for (i=0; i<tile_count_y; i+=1){
    for (j=0; j<tile_count_x; j+=1){
      inst_tile = instance_find(obj_tile,((i * global.tile_count_x) + j));
      spr_part = sprite_create_from_surface(
                surf,
                (inst_tile.tile_x_pos * global.tile_width), (inst_tile.tile_y_pos * global.tile_height),
                global.tile_width, global.tile_height,
                false, false,
                0, 0);

      // if this is the empty tile, set its alpha to 0 until puzzle is solved
      if(inst_tile.tile_index = EMPTY_TILE_VALUE) { inst_tile.alpha = 0; }
      inst_tile.sprite_index = spr_part;

      // set sprite alpha with tile shape
      // although doesn't work right now (yoyo bug)
      sprite_set_alpha_from_sprite(inst_tile.sprite_index, spr_tile_mask);
    }
  }
  
  /* WILL USE THIS LATER
  // set puzzle object sprite with this image
  global.puzzle_image_inst = instance_find(obj_puzzle_image, 0);
  spr_puzzle = sprite_create_from_surface(
                  surf, 
                  0, 0,
                  global.puzzle_width, global.puzzle_height,
                  false, false,
                  0, 0);
  global.puzzle_image_inst.sprite_index = spr_puzzle;
  */

  // cleanup
  surface_reset_target();
  surface_free(surf);

  // turn on visibility of tiles (if not previously turned on)
  if(!global.tiles_visible){scr_set_tile_visibilty(true);}
}
else
{
  show_debug_message("file \'" + file + "\' does NOT exist");
}

