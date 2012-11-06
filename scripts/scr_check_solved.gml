///Check if the tile array and the solved array match
var solved_state, solved_count;
var i,j;
solved_count = 0;

for (i=0; i<global.tile_count_y; i+=1){
  for (j=0; j<global.tile_count_x; j+=1){
    if(global.solvedPositions[i,j] = global.tilePositions[i,j]){solved_count+=1;}
  }
}

if(solved_count=(global.tile_count_x*global.tile_count_y)){solved_state=true;}
else{solved_state=false;}

return solved_state;

