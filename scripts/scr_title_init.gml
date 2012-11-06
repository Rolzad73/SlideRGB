///Init global variables
globalvar tile_BG_width, tile_BG_height;
globalvar tile_BG_count_x, tile_BG_count_y;

tile_BG_width = 32;
tile_BG_height = 32;
tile_BG_count_x = room_width / tile_BG_width;
tile_BG_count_y = room_height / tile_BG_height;

globalvar title_BG_surf;
globalvar title_BG_surf_hspeed, title_BG_surf_vspeed; // pixels per step
globalvar title_BG_surf_x_offset, title_BG_surf_y_offset;
title_BG_surf_hspeed = 0;
title_BG_surf_vspeed = 0;
title_BG_surf_x_offset = 0;
title_BG_surf_y_offset = 0;

