///Create background from tiles

global.title_bg_surf = surface_create(room_width, room_height);
surface_set_target(global.title_bg_surf);
draw_clear_alpha(c_black, 1);

// draw random tiles onto surface
var i,j;
for (i=0; i<global.tile_BG_count_y; i+=1){
  for (j=0; j<global.tile_BG_count_x; j+=1){
    draw_background_part(
      bg_title_redtiles, 
      (irandom(7)*global.tile_BG_width), 0,
      global.tile_BG_width, global.tile_BG_height,
      (j*global.tile_BG_width), (i*global.tile_BG_height));
  }
}

//get the newly created background from the surface
global.title_bg = background_create_from_surface(global.title_bg_surf, 0, 0, room_width, room_height, false, false);
surface_reset_target();
//surface_free(global.title_bg_surf);

// setup moving background
background_vtiled[0] = true;
background_htiled[0] = true;
background_vspeed[0] = 1;
background_hspeed[0] = 1;


// set the background to the room
background_index[0] = global.title_bg;

