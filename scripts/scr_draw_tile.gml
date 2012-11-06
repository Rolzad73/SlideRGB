///Drawing code for sliding animation

draw_self();
// if starting to slide, start the path movement
if(start_sliding)
{
  path_start(global.slide_path, global.slide_speed, 0, false);
  start_sliding = false;
}

