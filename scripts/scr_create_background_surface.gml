///Create background surface from tiles

global.title_BG_surf = surface_create(room_width, room_height);
//global.title_BG_surf = surface_create(1024, 1024);
surface_set_target(global.title_BG_surf);
draw_clear_alpha(c_black, 0);

// draw random tiles onto surface
var i,j;
for (i=0; i<global.tile_BG_count_y; i+=1){
  for (j=0; j<global.tile_BG_count_x; j+=1){
    draw_background_part(
      bg_title_tiles_rgb, 
      (irandom(2)*global.tile_BG_width), 0,
      global.tile_BG_width, global.tile_BG_height,
      (j*global.tile_BG_width), (i*global.tile_BG_height));
  }
}

surface_reset_target();

