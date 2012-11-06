///Animate background tiles

// make sure original surface exists
if(!surface_exists(global.title_BG_surf)){ scr_create_background_surface(); }

// choose random direction
var tile_move_direction;
tile_move_direction = choose(DIR_UP, DIR_RIGHT, DIR_DOWN, DIR_LEFT);

// choose random tile
var x_random, y_random, x_pos, y_pos;
x_random = irandom(tile_BG_count_x - 1);
y_random = irandom(tile_BG_count_y - 1);
x_pos = x_random * global.tile_BG_width;
y_pos = y_random * global.tile_BG_height;

// create temp surface for tiles
var temp_surf;
// NOTE: had to create temp surface double the size of the desired tile to avoid weird artifacts bug
//temp_surf = surface_create(global.tile_BG_width*2, global.tile_BG_height*2);
temp_surf = surface_create(global.tile_BG_width, global.tile_BG_height);
surface_set_target(temp_surf);
draw_clear_alpha(c_black, 0);

// draw chosen tile from BG surface to temp surface
draw_surface_part(global.title_BG_surf, x_pos, y_pos, global.tile_BG_width, global.tile_BG_height, 0, 0);

// draw swaped tiles back onto BG surface
surface_set_target(global.title_BG_surf);

// swap tiles on surface
switch(tile_move_direction)
{
  case DIR_UP:
    if(y_random = 0)
    {
      draw_surface_part(global.title_BG_surf, x_pos, (room_height-global.tile_BG_height), 
            global.tile_BG_width, global.tile_BG_height, x_pos, y_pos);

      draw_surface(temp_surf, x_pos, (room_height-global.tile_BG_height));
    }
    else
    {
      draw_surface_part(global.title_BG_surf, x_pos, (y_pos-global.tile_BG_height), 
            global.tile_BG_width, global.tile_BG_height, x_pos, y_pos);

      draw_surface(temp_surf, x_pos, (y_pos-global.tile_BG_height));
    }
    break;
  case DIR_RIGHT:
    if(x_random = (tile_BG_count_x - 1))
    {
      draw_surface_part(global.title_BG_surf, 0, y_pos, 
          global.tile_BG_width, global.tile_BG_height, x_pos, y_pos);

      draw_surface(temp_surf, 0, y_pos);
    }
    else
    {
      draw_surface_part(global.title_BG_surf, (x_pos+global.tile_BG_width), y_pos, 
          global.tile_BG_width, global.tile_BG_height, x_pos, y_pos);

      draw_surface(temp_surf, (x_pos+global.tile_BG_width), y_pos);
    }
    break;
  case DIR_DOWN:
    if(y_random = (tile_BG_count_y - 1))
    {
      draw_surface_part(global.title_BG_surf, x_pos, 0, 
          global.tile_BG_width, global.tile_BG_height, x_pos, y_pos);

      draw_surface(temp_surf, x_pos, 0);
    }
    else
    {
      draw_surface_part(global.title_BG_surf, x_pos, (y_pos+global.tile_BG_height), 
          global.tile_BG_width, global.tile_BG_height, x_pos, y_pos);

      draw_surface(temp_surf, x_pos, (y_pos+global.tile_BG_height));
    }
    break;
  case DIR_LEFT:
    if(x_random = 0)
    {
      draw_surface_part(global.title_BG_surf, (room_width-global.tile_BG_width), y_pos, 
          global.tile_BG_width, global.tile_BG_height, x_pos, y_pos);

      draw_surface(temp_surf, (room_width-global.tile_BG_width), y_pos);
    }
    else
    {
      draw_surface_part(global.title_BG_surf, (x_pos-global.tile_BG_width), y_pos, 
          global.tile_BG_width, global.tile_BG_height, x_pos, y_pos);

      draw_surface(temp_surf, (x_pos-global.tile_BG_width), y_pos);
    }
    break;
}

surface_reset_target();

