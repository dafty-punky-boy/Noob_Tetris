void tetromine_update(int[] movil_tetromine_x, int[] movil_tetromine_y){ // Erases the blocks to update when a rotation happens
    for(int i = 0; i < 4; ++i){
        scenario[movil_tetromine_y[i]][movil_tetromine_x[i]] = 0;
    }
}


int T_rotation(int rotation, int[] movil_tetromine_x, int[] movil_tetromine_y){ // Rotates T tetromine using a reference block (A static one)
    int ref_x; // Coords of the reference block
    int ref_y;

    switch(rotation){
        case 0:{
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

            if(movil_tetromine_x[0] == 9)
            {
               movement(movil_tetromine_x, movil_tetromine_y, 2); //Because is near the border, it is necessary to move it to the left 
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
            if(movil_tetromine_x[0] == 0)
            {
               movement(movil_tetromine_x, movil_tetromine_y, 1); //Because is near the border, it is necessary to move it to the left 
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


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void setup(){

    size(256, 512);
    surface.setTitle("100% REAL NO FAKE TETRIS");

}

float square_size = 25.6;
boolean end = false; // Indicates if the tetromine movement has end


color tetromine_color;
int tetromine_code; // Tetromine identificator

int tempo; // Temporizer variable

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

    if(end == false){
        complete_lines();
        tetromine_code = movil_tetromine_selector(); 
        end = tetromine_appear(tetromine_code);
    }
    
    if(tempo / 30 == 1){
        end = gravity(movil_tetromine_x, movil_tetromine_y, tetromine_color);
        tempo = 0;
    }
    ++tempo;
    
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




void movement(int[] movil_tetromine_x, int[] movil_tetromine_y, int movement_code){
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

void keyPressed() {
    if(key == 'r'){
        tetromine_rotation(tetromine_code);
        //print(rotation);
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
//    int code = int(random(1, 8.1));
    int code = 1;
    switch(code){
        case 1: {
            scenario[0][4] = 255;
            scenario[1][3] = 255;
            scenario[1][4] = 255;
            scenario[1][5] = 255;
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

void tetromine_rotation(int tetromine_code){
    tempo -= 1;

    switch(tetromine_code){
        case 1: {
            rotation = T_rotation(rotation, movil_tetromine_x, movil_tetromine_y);
        }
    }
}


boolean tetromine_appear(int tetromine_code){ // Paints the movil tetromine and stores its initial positions in the arrays

    switch(movil_tetromine_selector()){ 
        case 1: {
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
    }

    return true;
}

void complete_lines(){ //Searches and erases lines  NO CUENTA LAS LINEAS COMPLETAS
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
                if(block_color != scenario[i][j])
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
            scenario[auxiliar_index][j] = 0;
        }

        ++auxiliar_index;        
    }

    print("lines completed: ");
    print(completed_lines);
    print("\n\n");    

}