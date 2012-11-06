///Create randomly placed tiles

var i,j;

for (i=0; i<global.tile_BG_count_y; i+=1){
  for (j=0; j<global.tile_BG_count_x; j+=1){
    global.tile_temp = tile_add(
      bg_title_redtiles, 
      (irandom(7)*global.tile_BG_width), 0,
      global.tile_BG_width, global.tile_BG_height,
      (j*global.tile_BG_width), (i*global.tile_BG_height),
      global.tile_BG_depth);
    //tile_set_alpha(tile_temp, 0.5);
  }
}

