///Init global variables
globalvar tile_BG_width, tile_BG_height;
globalvar tile_BG_count_x, tile_BG_count_y, tile_BG_count_total;
globalvar tile_BG_depth;
globalvar valid_moves;

tile_BG_width = 16;
tile_BG_height = 16;
tile_BG_count_x = room_width / tile_BG_width;
tile_BG_count_y = room_height / tile_BG_height;
tile_BG_count_total = tile_BG_count_x * tile_BG_count_y;
tile_BG_depth = 1000000;

