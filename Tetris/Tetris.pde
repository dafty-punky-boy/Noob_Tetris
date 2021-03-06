void tetromine_update(int[] movil_tetromine_x, int[] movil_tetromine_y){ // Erases the blocks to update them when a rotation happens
    for(int i = 0; i < 4; ++i){
        scenario[movil_tetromine_y[i]][movil_tetromine_x[i]] = 0;
    }
}

void UP(int[] movil_tetromine_x, int[] movil_tetromine_y){ //Moves up the tetromine
    int y; // Auxiliar variables
    int x;
    
    for(int i = 3; i >= 0; --i){
       y = movil_tetromine_y[i];
       x = movil_tetromine_x[i];

       scenario[y][x] = 0;
       scenario[y - 1][x] = 255;
       movil_tetromine_y[i] -= 1; 
    }
}

int R_N_rotation(int rotation, int[] movil_tetromine_x, int[] movil_tetromine_y){
    int ref_x;
    int ref_y;

    switch(rotation){
        case 0:{

            if(movil_tetromine_x[0] == 9 || scenario[movil_tetromine_y[0]][movil_tetromine_x[0] + 1] != 255)
            {
               for(int i = 0; i < 2; ++i){
                   movement(movil_tetromine_x, movil_tetromine_y, 2);
               }
                
            }

            ref_y = movil_tetromine_y[0];
            ref_x = movil_tetromine_x[0];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;
            scenario[ref_y][ref_x + 1] = 255;
            scenario[ref_y - 1][ref_x + 1] = 255;
            scenario[ref_y - 1][ref_x + 2] = 255;
            
            movil_tetromine_y[0] = ref_y;
            movil_tetromine_x[0] = ref_x + 1;
            
            movil_tetromine_y[1] = ref_y;
            movil_tetromine_x[1] = ref_x;

            movil_tetromine_y[2] = ref_y - 1;
            movil_tetromine_x[2] = ref_x + 2;

            movil_tetromine_y[3] = ref_y - 1;
            movil_tetromine_x[3] = ref_x + 1;

            ++rotation;
        }
        break;

        case 1:{

            if(movil_tetromine_x[1] == 0 || scenario[movil_tetromine_y[0]][movil_tetromine_x[0] - 1] != 255)
            {
                movement(movil_tetromine_x, movil_tetromine_y, 1);
            }

            if((movil_tetromine_y[0] == 19 || scenario[movil_tetromine_y[0] + 1][movil_tetromine_x[0]] != 255) && movil_tetromine_y[2] != 0)
            {
                UP(movil_tetromine_x, movil_tetromine_y);
            }

            ref_y = movil_tetromine_y[1];
            ref_x = movil_tetromine_x[1];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;
            scenario[ref_y - 1][ref_x] = 255;
            scenario[ref_y - 1][ref_x - 1] = 255;
            scenario[ref_y - 2][ref_x - 1] = 255;
            
            movil_tetromine_y[0] = ref_y;
            movil_tetromine_x[0] = ref_x;

            movil_tetromine_y[1] = ref_y - 1;
            movil_tetromine_x[1] = ref_x;

            movil_tetromine_y[2] = ref_y - 1;
            movil_tetromine_x[2] = ref_x - 1;

            movil_tetromine_y[3] = ref_y - 2;
            movil_tetromine_x[3] = ref_x - 1;

            rotation = 0; 
        }
        break;

    }

    return rotation;
}

int N_rotation(int rotation, int[] movil_tetromine_x, int[] movil_tetromine_y){
    int ref_x;
    int ref_y;

    switch(rotation){
        case 0:{

            if(movil_tetromine_x[0] == 0 || scenario[movil_tetromine_y[0]][movil_tetromine_x[0] - 1] != 255)
            {
               for(int i = 0; i < 2; ++i){
                   movement(movil_tetromine_x, movil_tetromine_y, 1); 
               }
                
            }

            ref_y = movil_tetromine_y[0];
            ref_x = movil_tetromine_x[0];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;
            scenario[ref_y][ref_x - 1] = 255;
            scenario[ref_y - 1][ref_x - 1] = 255;
            scenario[ref_y - 1][ref_x - 2] = 255;
            
            movil_tetromine_y[1] = ref_y;
            movil_tetromine_x[1] = ref_x - 1;

            movil_tetromine_y[2] = ref_y - 1;
            movil_tetromine_x[2] = ref_x - 1;

            movil_tetromine_y[3] = ref_y - 1;
            movil_tetromine_x[3] = ref_x - 2;

            ++rotation;
        }
        break;

        case 1:{

            if(movil_tetromine_x[0] == 9 || scenario[movil_tetromine_y[0]][movil_tetromine_x[0] + 1] != 255)
            {
                movement(movil_tetromine_x, movil_tetromine_y, 2);
            }

            if((movil_tetromine_y[0] == 19 || scenario[movil_tetromine_y[0] + 1][movil_tetromine_x[0]] != 255) && movil_tetromine_y[2] != 0)
            {
                UP(movil_tetromine_x, movil_tetromine_y);
            }

            ref_y = movil_tetromine_y[0];
            ref_x = movil_tetromine_x[0];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;
            scenario[ref_y - 1][ref_x] = 255;
            scenario[ref_y - 1][ref_x + 1] = 255;
            scenario[ref_y - 2][ref_x + 1] = 255;
            
            movil_tetromine_y[1] = ref_y - 1;
            movil_tetromine_x[1] = ref_x + 1;

            movil_tetromine_y[2] = ref_y - 1;
            movil_tetromine_x[2] = ref_x;

            movil_tetromine_y[3] = ref_y - 2;
            movil_tetromine_x[3] = ref_x + 1;

            rotation = 0; 
        }
        break;

    }

    return rotation;
}

int R_L_rotation(int rotation, int[] movil_tetromine_x, int[] movil_tetromine_y){
    int ref_x;
    int ref_y;

    switch(rotation){
        case 0:{

            if(movil_tetromine_x[2] == 9 || scenario[movil_tetromine_y[2]][movil_tetromine_x[2] + 1] != 255)
            {
                movement(movil_tetromine_x, movil_tetromine_y, 2);
            }

            if((movil_tetromine_y[0] == 19 || scenario[movil_tetromine_y[0] + 1][movil_tetromine_x[0]] != 255) && movil_tetromine_y[2] != 0)
            {
                UP(movil_tetromine_x, movil_tetromine_y);
            }


            ref_y = movil_tetromine_y[0];
            ref_x = movil_tetromine_x[0];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;
            scenario[ref_y][ref_x + 1] = 255;
            scenario[ref_y][ref_x + 2] = 255;
            scenario[ref_y + 1][ref_x + 2] = 255;

            movil_tetromine_y[0] = ref_y + 1;
            movil_tetromine_x[0] = ref_x + 2;
            
            movil_tetromine_y[1] = ref_y;
            movil_tetromine_x[1] = ref_x + 2;

            movil_tetromine_y[2] = ref_y;
            movil_tetromine_x[2] = ref_x + 1;

            movil_tetromine_y[3] = ref_y;
            movil_tetromine_x[3] = ref_x;

            ++rotation;
        }
        break;

        case 1:{

            if(movil_tetromine_x[3] == 0 || scenario[movil_tetromine_y[3]][movil_tetromine_x[3] - 1] != 255)
            {
                movement(movil_tetromine_x, movil_tetromine_y, 1);
            }

            if((movil_tetromine_y[0] == 19 || scenario[movil_tetromine_y[0] + 1][movil_tetromine_x[0]] != 255) && movil_tetromine_y[2] != 0)
            {
                UP(movil_tetromine_x, movil_tetromine_y);
            }

            ref_y = movil_tetromine_y[3];
            ref_x = movil_tetromine_x[3];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;
            scenario[ref_y + 1][ref_x] = 255;
            scenario[ref_y + 2][ref_x] = 255;
            scenario[ref_y + 2][ref_x - 1] = 255;

            movil_tetromine_y[0] = ref_y + 2;
            movil_tetromine_x[0] = ref_x;
            
            movil_tetromine_y[1] = ref_y + 2;
            movil_tetromine_x[1] = ref_x - 1;

            movil_tetromine_y[2] = ref_y + 1;
            movil_tetromine_x[2] = ref_x;

            movil_tetromine_y[3] = ref_y;
            movil_tetromine_x[3] = ref_x;

            ++rotation; 
        }
        break;

        case 2:{

            if(movil_tetromine_x[1] == 0 || scenario[movil_tetromine_y[1]][movil_tetromine_x[1] - 1] != 255)
            {
                movement(movil_tetromine_x, movil_tetromine_y, 1);
            }

            ref_y = movil_tetromine_y[0];
            ref_x = movil_tetromine_x[0];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;
            scenario[ref_y][ref_x - 1] = 255;
            scenario[ref_y][ref_x - 2] = 255;
            scenario[ref_y - 1][ref_x - 2] = 255;

            movil_tetromine_y[0] = ref_y;
            movil_tetromine_x[0] = ref_x;
            
            movil_tetromine_y[1] = ref_y;
            movil_tetromine_x[1] = ref_x - 1;

            movil_tetromine_y[2] = ref_y;
            movil_tetromine_x[2] = ref_x - 2;

            movil_tetromine_y[3] = ref_y - 1;
            movil_tetromine_x[3] = ref_x - 2;

            ++rotation; 
        }
        break;

        case 3:{

            if(movil_tetromine_x[0] == 9 || scenario[movil_tetromine_y[0]][movil_tetromine_x[0] + 1] != 255)
            {
                movement(movil_tetromine_x, movil_tetromine_y, 2);
            }

            ref_y = movil_tetromine_y[0];
            ref_x = movil_tetromine_x[0];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;
            scenario[ref_y - 1][ref_x] = 255;
            scenario[ref_y - 2][ref_x] = 255;
            scenario[ref_y - 2][ref_x + 1] = 255;

            movil_tetromine_y[0] = ref_y;
            movil_tetromine_x[0] = ref_x;
            
            movil_tetromine_y[1] = ref_y - 1;
            movil_tetromine_x[1] = ref_x;

            movil_tetromine_y[2] = ref_y - 2;
            movil_tetromine_x[2] = ref_x + 1;

            movil_tetromine_y[3] = ref_y - 2;
            movil_tetromine_x[3] = ref_x;

            rotation = 0; 
        }
        break;
    }

    return rotation;
}


int I_rotation(int rotation, int[] movil_tetromine_x, int[] movil_tetromine_y){
    int ref_x;
    int ref_y;

    switch(rotation){
        case 0:{
            
            if((movil_tetromine_x[0] <= 9 && movil_tetromine_x[0] >= 6) || scenario[movil_tetromine_y[0]][movil_tetromine_x[0] + 1] != 255){
                for(int i = 0; i < 3; ++i){
                    movement(movil_tetromine_x, movil_tetromine_y, 2);
                }
            }

            ref_y = movil_tetromine_y[0];
            ref_x = movil_tetromine_x[0];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;
            scenario[ref_y][ref_x + 1] = 255;
            scenario[ref_y][ref_x + 2] = 255;
            scenario[ref_y][ref_x + 3] = 255;

            movil_tetromine_y[0] = ref_y;
            movil_tetromine_x[0] = ref_x + 3;
            
            movil_tetromine_y[1] = ref_y;
            movil_tetromine_x[1] = ref_x + 2;

            movil_tetromine_y[2] = ref_y;
            movil_tetromine_x[2] = ref_x + 1;

            movil_tetromine_y[3] = ref_y;
            movil_tetromine_x[3] = ref_x;

            ++rotation;
        }
        break;

        case 1:{

           if(movil_tetromine_y[3] == 19 || scenario[movil_tetromine_y[3] + 1][movil_tetromine_x[3]] != 255){
                for(int i = 0; i < 3; ++i){
                    UP(movil_tetromine_x, movil_tetromine_y);
                }
            }

            ref_y = movil_tetromine_y[3];
            ref_x = movil_tetromine_x[3];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;
            scenario[ref_y + 1][ref_x] = 255;
            scenario[ref_y + 2][ref_x] = 255;
            scenario[ref_y + 3][ref_x] = 255;

            movil_tetromine_y[0] = ref_y + 3;
            movil_tetromine_x[0] = ref_x;
            
            movil_tetromine_y[1] = ref_y + 2;
            movil_tetromine_x[1] = ref_x;

            movil_tetromine_y[2] = ref_y + 1;
            movil_tetromine_x[2] = ref_x;

            movil_tetromine_y[3] = ref_y;
            movil_tetromine_x[3] = ref_x;

            rotation = 0; 
        }
        break;
    }

    return rotation;
}

int L_rotation(int rotation, int[] movil_tetromine_x, int[] movil_tetromine_y){
    int ref_x;
    int ref_y;

    switch(rotation){
        case 0:{

            if(movil_tetromine_x[3] == 0 || scenario[movil_tetromine_y[3]][movil_tetromine_x[3] - 1] != 255)
            {
                movement(movil_tetromine_x, movil_tetromine_y, 1);
            }

            if((movil_tetromine_y[0] == 19 || scenario[movil_tetromine_y[0] + 1][movil_tetromine_x[0]] != 255) && movil_tetromine_y[2] != 0)
            {
                UP(movil_tetromine_x, movil_tetromine_y);
            }

            ref_y = movil_tetromine_y[0];
            ref_x = movil_tetromine_x[0];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;
            scenario[ref_y][ref_x - 1] = 255;
            scenario[ref_y][ref_x - 2] = 255;
            scenario[ref_y + 1][ref_x - 2] = 255;

            movil_tetromine_y[0] = ref_y + 1;
            movil_tetromine_x[0] = ref_x - 2;
            
            movil_tetromine_y[1] = ref_y;
            movil_tetromine_x[1] = ref_x;

            movil_tetromine_y[2] = ref_y;
            movil_tetromine_x[2] = ref_x - 1;

            movil_tetromine_y[3] = ref_y;
            movil_tetromine_x[3] = ref_x - 2;

            ++rotation;
        }
        break;

        case 1:{

            if(movil_tetromine_x[1] == 9 || scenario[movil_tetromine_y[1]][movil_tetromine_x[1] + 1] != 255)
            {
                movement(movil_tetromine_x, movil_tetromine_y, 2);
            }

            if(movil_tetromine_y[0] == 19 || scenario[movil_tetromine_y[0] + 1][movil_tetromine_x[0]] != 255)
            {
                UP(movil_tetromine_x, movil_tetromine_y);
            }

            ref_y = movil_tetromine_y[1];
            ref_x = movil_tetromine_x[1];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;
            scenario[ref_y + 1][ref_x] = 255;
            scenario[ref_y + 2][ref_x] = 255;
            scenario[ref_y + 2][ref_x + 1] = 255;

            movil_tetromine_y[0] = ref_y + 2;
            movil_tetromine_x[0] = ref_x + 1;
            
            movil_tetromine_y[1] = ref_y + 2;
            movil_tetromine_x[1] = ref_x;

            movil_tetromine_y[2] = ref_y + 1;
            movil_tetromine_x[2] = ref_x;

            movil_tetromine_y[3] = ref_y;
            movil_tetromine_x[3] = ref_x;

            ++rotation;
        }
        break;

        case 2:{

            if(movil_tetromine_x[0] == 9 || scenario[movil_tetromine_y[0]][movil_tetromine_x[0] + 1] != 255)
            {
                movement(movil_tetromine_x, movil_tetromine_y, 2);
            }

            ref_y = movil_tetromine_y[3];
            ref_x = movil_tetromine_x[3];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;
            scenario[ref_y][ref_x + 1] = 255;
            scenario[ref_y][ref_x + 2] = 255;
            scenario[ref_y - 1 ][ref_x + 2] = 255;

            movil_tetromine_y[0] = ref_y;
            movil_tetromine_x[0] = ref_x + 2;
            
            movil_tetromine_y[1] = ref_y;
            movil_tetromine_x[1] = ref_x + 1;

            movil_tetromine_y[2] = ref_y;
            movil_tetromine_x[2] = ref_x;

            movil_tetromine_y[3] = ref_y - 1;
            movil_tetromine_x[3] = ref_x + 2;

            ++rotation;
        }
        break;

        case 3:{

            if(movil_tetromine_x[2] == 0 || scenario[movil_tetromine_y[2]][movil_tetromine_x[2] - 1] != 255)
            {
                movement(movil_tetromine_x, movil_tetromine_y, 1);
            }

            ref_y = movil_tetromine_y[2];
            ref_x = movil_tetromine_x[2];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;
            scenario[ref_y - 1][ref_x] = 255;
            scenario[ref_y - 2][ref_x] = 255;
            scenario[ref_y - 2][ref_x - 1] = 255;

            movil_tetromine_y[0] = ref_y;
            movil_tetromine_x[0] = ref_x;
            
            movil_tetromine_y[1] = ref_y - 1;
            movil_tetromine_x[1] = ref_x;

            movil_tetromine_y[2] = ref_y - 2;
            movil_tetromine_x[2] = ref_x;

            movil_tetromine_y[3] = ref_y - 2;
            movil_tetromine_x[3] = ref_x - 1;

            rotation = 0;
        }
    }

    return rotation;
}


int T_rotation(int rotation, int[] movil_tetromine_x, int[] movil_tetromine_y){ // Rotates T tetromine using a reference block (A static one) (Same with the other tetrominos)
    int ref_x; // Coords of the reference block
    int ref_y;

    switch(rotation){
        case 0:{

            if((movil_tetromine_y[0] == 19 || scenario[movil_tetromine_y[0] + 1][movil_tetromine_x[0]] != 255) && movil_tetromine_y[3] != 0)
            {
                UP(movil_tetromine_x, movil_tetromine_y);
            }

            ref_y = movil_tetromine_y[3];
            ref_x = movil_tetromine_x[3];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;      
            scenario[ref_y + 1][ref_x - 1] = 255;
            scenario[ref_y + 1][ref_x] = 255;
            scenario[ref_y + 2][ref_x]  = 255;

            movil_tetromine_y[0] = ref_y + 2;
            movil_tetromine_x[0] = ref_x;

            movil_tetromine_y[1] = ref_y + 1;
            movil_tetromine_x[1] = ref_x;

            movil_tetromine_y[2] = ref_y + 1;
            movil_tetromine_x[2] = ref_x - 1;

            ++rotation;            
        }
        break;

        case 1:{

            if(movil_tetromine_x[0] == 9 || scenario[movil_tetromine_y[0]][movil_tetromine_x[0] + 1] != 255)
            {
               movement(movil_tetromine_x, movil_tetromine_y, 2);  
            }

            ref_y = movil_tetromine_y[2];
            ref_x = movil_tetromine_x[2];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;      
            scenario[ref_y][ref_x + 1] = 255;
            scenario[ref_y][ref_x + 2] = 255;
            scenario[ref_y + 1][ref_x + 1]  = 255;

            movil_tetromine_y[0] = ref_y + 1;
            movil_tetromine_x[0] = ref_x + 1;

            movil_tetromine_y[1] = ref_y;
            movil_tetromine_x[1] = ref_x + 2;

            movil_tetromine_y[2] = ref_y;
            movil_tetromine_x[2] = ref_x + 1;

            movil_tetromine_y[3] = ref_y;
            movil_tetromine_x[3] = ref_x;

            ++rotation;  
        }
        break;

        case 2:{
            ref_y = movil_tetromine_y[0];
            ref_x = movil_tetromine_x[0];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;      
            scenario[ref_y - 1][ref_x] = 255;
            scenario[ref_y - 1][ref_x + 1] = 255;
            scenario[ref_y - 2][ref_x]  = 255;

            movil_tetromine_y[1] = ref_y - 1;
            movil_tetromine_x[1] = ref_x + 1;

            movil_tetromine_y[2] = ref_y - 1;
            movil_tetromine_x[2] = ref_x;

            movil_tetromine_y[3] = ref_y - 2;
            movil_tetromine_x[3] = ref_x;

            ++rotation; 
        }
        break;

        case 3:{
            if(movil_tetromine_x[0] == 0 || scenario[movil_tetromine_y[0]][movil_tetromine_x[0] - 1] != 255)
            {
               movement(movil_tetromine_x, movil_tetromine_y, 1);  
            }

            ref_y = movil_tetromine_y[3];
            ref_x = movil_tetromine_x[3];

            tetromine_update(movil_tetromine_x, movil_tetromine_y);

            scenario[ref_y][ref_x] = 255;      
            scenario[ref_y + 1][ref_x - 1] = 255;
            scenario[ref_y + 1][ref_x] = 255;
            scenario[ref_y + 1][ref_x + 1]  = 255;

            movil_tetromine_y[0] = ref_y + 1;
            movil_tetromine_x[0] = ref_x + 1;

            movil_tetromine_y[1] = ref_y + 1;
            movil_tetromine_x[1] = ref_x;

            movil_tetromine_y[2] = ref_y + 1;
            movil_tetromine_x[2] = ref_x - 1;

            rotation = 0;
        }
    }

    return rotation;
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// (UP) Specific Tetromino rotations


void setup(){

    size(256, 512);
    surface.setTitle("NOOB TETRIS");

}

float square_size = 25.6;
boolean end = false; // Indicates if the tetromine movement has ended (false if yes for a little mistake in implementation)

int points = 0;

color tetromine_color;
int tetromine_code; // Tetromine identificator

boolean game_over = false;

int tempo; // Temporizer variable, Says how fast the tetrominos fall

int rotation = 0; // Variable that indicates the roation number, 0 is the initial

int[] movil_tetromine_x = new int[4]; // Arrays that store the movil tetromine blocks positions
int[] movil_tetromine_y = new int[4];

color[][] scenario = 
{
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
};

void draw(){
    scenario_painting();

    if(end == false && game_over == false){
        points = complete_lines(points);
        tetromine_code = movil_tetromine_selector(); 
        end = tetromine_appear(tetromine_code);
    }
    
    if((scenario[movil_tetromine_y[0] + 1][movil_tetromine_x[0]] != 255 && scenario[movil_tetromine_y[0] + 1][movil_tetromine_x[0]] != 0) && movil_tetromine_y[3] == 0){ // Conditions for calling a game over
        game_over = true;

        for(int i = 0; i < 20; ++i){
            for(int j = 0; j < 10; ++j){
             scenario[i][j] = 0;
           }
        }
    }

    if(tempo / 30 == 1 && game_over == false){
        end = gravity(movil_tetromine_x, movil_tetromine_y, tetromine_color);
        tempo = 0;
    }

    if(game_over)
    {
        game_over();   
    }
    ++tempo;
   
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Mechanics functions

void game_over(){ // Function that occurs when the game is over, displaying the final score
    textSize(32);
    fill(255);
    text("SCORE", 80, 200);
    text(str(points), 80, 250);
}


void movement(int[] movil_tetromine_x, int[] movil_tetromine_y, int movement_code){ // Stores the multiple movements of the mobile tetromino
    boolean possible = true;
    
    int y; // Auxiliar variables
    int x;

    switch(movement_code){
        case 1:{ // RIGHT
            for(int i = 0; i < 4; ++i){
               y = movil_tetromine_y[i];
               x = movil_tetromine_x[i];

               if( x == 9 || (scenario[y][x + 1] != 0 && scenario[y][x + 1] != 255)){
                   possible = false;
                   break;
                    
                }
            }

            if(possible){
                for(int i = 0; i < 4; ++i){
                    x = movil_tetromine_x[i];
                    y = movil_tetromine_y[i];

                    scenario[y][x] = 0;
                    scenario[y][x + 1] = 255;

                    movil_tetromine_x[i] += 1;

                }
            }
        }
        break;

        case 2:{ // LEFT
            for(int i = 0; i < 4; ++i){
               y = movil_tetromine_y[i];
               x = movil_tetromine_x[i];

               if( x == 0 || (scenario[y][x - 1] != 0 && scenario[y][x - 1] != 255)){
                   possible = false;
                   break;
                    
                }
            }

            if(possible){
                for(int i = 3; i >= 0; --i){
                    x = movil_tetromine_x[i];
                    y = movil_tetromine_y[i];

                    scenario[y][x - 1] = 255;
                    scenario[y][x] = 0;

                    movil_tetromine_x[i] -= 1;

                }
            }
        }
        break;

        case 3:{ // Fall faster
            tempo += 20;
        }
    }
    
}

void keyPressed() { // Controls the key inputs
    if(key == 'r'){
        tetromine_rotation(tetromine_code);
    }
    if(key == CODED){
        if(keyCode == RIGHT){
            movement(movil_tetromine_x, movil_tetromine_y, 1);
        }

        else if(keyCode == LEFT){
            movement(movil_tetromine_x, movil_tetromine_y, 2);
        }

        else if(keyCode == DOWN){
            movement(movil_tetromine_x, movil_tetromine_y, 3);
        }
    }
}

void scenario_painting(){ // Reads the matrix and paints the colors
    for(int i = 0; i < 20; ++i){
        for(int j = 0; j < 10; ++j){
            fill(scenario[i][j]);
            square(j * square_size, i * square_size, square_size);
        }
    }
}

int movil_tetromine_selector(){ // Selects the next tetromine and returns its code
    int code = int(random(1.0, 8.0));

    switch(code){
        case 1:{ // T
            scenario[0][4] = 255;
            scenario[1][3] = 255;
            scenario[1][4] = 255;
            scenario[1][5] = 255;
        }
        break;

        case 2:{ // L
            scenario[0][4] = 255;
            scenario[0][5] = 255;
            scenario[1][5] = 255;
            scenario[2][5] = 255;
        }
        break;

        case 3:{ // Square
            scenario[0][4] = 255;
            scenario[0][5] = 255;
            scenario[1][4] = 255;
            scenario[1][5] = 255;
        }
        break;

        case 4:{ // Stick
            scenario[0][4] = 255;
            scenario[1][4] = 255;
            scenario[2][4] = 255;
            scenario[3][4] = 255;
        }
        break;

        case 5:{ //Reversed L
            scenario[0][4] = 255;
            scenario[0][5] = 255;
            scenario[1][4] = 255;
            scenario[2][4] = 255;
        }
        break;

        case 6:{ // N
            scenario[0][4] = 255;
            scenario[1][4] = 255;
            scenario[1][3] = 255;
            scenario[2][3] = 255;
        }
        break;

        case 7:{
            scenario[0][4] = 255;
            scenario[1][4] = 255;
            scenario[1][5] = 255;
            scenario[2][5] = 255; 
        }
        break;

    }

    return code;
}

boolean gravity(int[] movil_tetromine_x, int[] movil_tetromine_y, color tetromine_color){ //Function that applies the gravity mechanics
     
    
    int y; // Auxiliar variables that stores the x and y position of the blocks
    int x;


    for(int i = 0; i < 4; ++i){ //Checks if any block cant keep falling
        y = movil_tetromine_y[i];
        x = movil_tetromine_x[i];
        
        if(y == 19 || (scenario[y + 1][x] != 0 && scenario[y + 1][x] != 255)){
            for(int j = 0; j < 4; ++j){
                y = movil_tetromine_y[j];
                x = movil_tetromine_x[j];

                scenario[y][x] = tetromine_color; // If not, returns false indicating it has end and changes the blocks color
            }
            rotation = 0;
            return false;
        }
    }
    
    for(int i = 0; i < 4; ++i){ // Falls and returns true
        y = movil_tetromine_y[i];
        x = movil_tetromine_x[i];

        scenario[y][x] = 0;

        movil_tetromine_y[i] += 1;
        y = movil_tetromine_y[i];
            
        scenario[y][x] = 255;
    }

    return true; 
}

void tetromine_rotation(int tetromine_code){ // Calls a rotation function with the tetromine code
    tempo -= 1;

    switch(tetromine_code){
        case 1: {
            rotation = T_rotation(rotation, movil_tetromine_x, movil_tetromine_y);
        }
        break;

        case 2:{
            rotation = L_rotation(rotation, movil_tetromine_x, movil_tetromine_y);
        }
        break;

        case 4:{
            rotation = I_rotation(rotation, movil_tetromine_x, movil_tetromine_y);
        }
        break;

        case 5:{
            rotation = R_L_rotation(rotation, movil_tetromine_x, movil_tetromine_y);
        }
        break;

        case 6:{
            rotation = N_rotation(rotation, movil_tetromine_x, movil_tetromine_y);
        }
        break;

        case 7:{
            rotation = R_N_rotation(rotation, movil_tetromine_x, movil_tetromine_y);
        }
        break;
    }
}

void after_line_complete(int[] lines, int completed_lines){ // Makes that everything falls again after a line or lines disappear
    int first_line = lines[0];

    for(int i = 1; i < completed_lines; ++i){
        if(lines[i] < first_line){
            first_line = lines[i];
        }
    }

    for(int i = first_line - 1; i >= 0; --i){
        for(int j = 0; j < 10; ++j){
            scenario[i + completed_lines][j] = scenario[i][j];
            scenario[i][j] = 0;
        }
    }

}


boolean tetromine_appear(int tetromine_code){ // Paints the movil tetromine and stores its initial positions in the arrays

    switch(tetromine_code){ 
        case 1:{
            movil_tetromine_x[0] = 5; // Sorted form the bottom to the top
            movil_tetromine_y[0] = 1;

            movil_tetromine_x[1] = 4;
            movil_tetromine_y[1] = 1;

            movil_tetromine_x[2] = 3;
            movil_tetromine_y[2] = 1;

            movil_tetromine_x[3] = 4;
            movil_tetromine_y[3] = 0; 
            

            tetromine_color = #00FFFF;
        }
        break;

        case 2:{
            movil_tetromine_x[0] = 5;
            movil_tetromine_y[0] = 2;

            movil_tetromine_x[1] = 5;
            movil_tetromine_y[1] = 1;

            movil_tetromine_x[2] = 5;
            movil_tetromine_y[2] = 0;

            movil_tetromine_x[3] = 4;
            movil_tetromine_y[3] = 0;

            tetromine_color = #0000CD;
        }
        break;

        case 3:{
            movil_tetromine_x[0] = 5;
            movil_tetromine_y[0] = 1;

            movil_tetromine_x[1] = 4;
            movil_tetromine_y[1] = 1;
            
            movil_tetromine_x[2] = 5;
            movil_tetromine_y[2] = 0;

            movil_tetromine_x[3] = 4;
            movil_tetromine_y[3] = 0;

            tetromine_color = #FFFF00;
        }
        break;

        case 4:{
            movil_tetromine_x[0] = 4;
            movil_tetromine_y[0] = 3;

            movil_tetromine_x[1] = 4;
            movil_tetromine_y[1] = 2;
            
            movil_tetromine_x[2] = 4;
            movil_tetromine_y[2] = 1;

            movil_tetromine_x[3] = 4;
            movil_tetromine_y[3] = 0;

            tetromine_color = #9400D3;
        }
        break;

        case 5:{
            movil_tetromine_x[0] = 4;
            movil_tetromine_y[0] = 2;

            movil_tetromine_x[1] = 4;
            movil_tetromine_y[1] = 1;
            
            movil_tetromine_x[2] = 5;
            movil_tetromine_y[2] = 0;

            movil_tetromine_x[3] = 4;
            movil_tetromine_y[3] = 0;

            tetromine_color = #FF4500;
        }
        break;

        case 6:{
            movil_tetromine_x[0] = 3;
            movil_tetromine_y[0] = 2;

            movil_tetromine_x[1] = 4;
            movil_tetromine_y[1] = 1;
            
            movil_tetromine_x[2] = 3;
            movil_tetromine_y[2] = 1;

            movil_tetromine_x[3] = 4;
            movil_tetromine_y[3] = 0;

            tetromine_color = #FF0000; 
        }
        break;

        case 7:{
            movil_tetromine_x[0] = 5;
            movil_tetromine_y[0] = 2;

            movil_tetromine_x[1] = 5;
            movil_tetromine_y[1] = 1;
            
            movil_tetromine_x[2] = 4;
            movil_tetromine_y[2] = 1;

            movil_tetromine_x[3] = 4;
            movil_tetromine_y[3] = 0;

            tetromine_color = #00FF00;
        }
    }

    return true;
}

int complete_lines(int points){ //Searches and erases lines and updates the points 
    color block_color; // Variable that stores the color of the initial block of a line
    int completed_lines = 0;
    boolean completed_line = true;

    int[] lines = new int[20]; // Array that stores the completed lines
    int auxiliar_index = 0;

    for(int i = 0; i < 20; ++i){
        block_color = scenario[i][0];

        if(block_color != 0)
        {
            for(int j = 1; j < 10; ++j){
                if(scenario[i][j] == 0)
                {
                    completed_line = false;
                    break;
                }
            }
        
            if(completed_line){
                lines[auxiliar_index] = i;
                ++completed_lines;
                ++auxiliar_index; 
            }
        }

        completed_line = true;
        
    }

    auxiliar_index = 0;

    for(int i = 0; i < completed_lines; ++i){
        for(int j = 0; j < 10; ++j){
            scenario[lines[i]][j] = 0;
        }
    }

    points += 100 * completed_lines;
    after_line_complete(lines, completed_lines); 

    return points;   

}