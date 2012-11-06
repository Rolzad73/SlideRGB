///Move background surface
//here can change the v and h speeds to make a more changable motion type
//...


// accumulate
title_BG_surf_x_offset += title_BG_surf_vspeed;
title_BG_surf_y_offset += title_BG_surf_hspeed;

//wrap movement (may not need this, but will do it now anyways)
if(title_BG_surf_x_offset > room_width){ title_BG_surf_x_offset -= room_width; }
if(title_BG_surf_x_offset < 0){ title_BG_surf_x_offset += room_width; }
if(title_BG_surf_y_offset > room_height){ title_BG_surf_y_offset -= room_height; }
if(title_BG_surf_y_offset < 0){ title_BG_surf_y_offset += room_height; }

