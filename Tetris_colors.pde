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
        tetromine_code = movil_tetromine_selector(); 
        end = tetromine_appear(tetromine_code);
    }
    
    if(tempo / 30 == 1){
        end = gravity(movil_tetromine_x, movil_tetromine_y, tetromine_color);
        tempo = 0;
    }
    ++tempo;
}

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
        rotation = tetromine_rotation(tetromine_code, rotation, movil_tetromine_x, movil_tetromine_y);
        print(rotation);
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

        print(y);
        print(' ');
        print(x);
        print("\n");
    }

    print('\n');
    return true; 
}

int tetromine_rotation(int tetromine_code, int rotation, int[] movil_tetromine_x, int[] movil_tetromine_y){
    tempo = 0;

    int x; // Auxiliar variables
    int y;
    
    switch(tetromine_code){
        case 1:{
            switch(rotation){
                case 0:{
                   y = movil_tetromine_y[0];
                   x = movil_tetromine_x[0];
                   
                   movil_tetromine_y[0] += 1;
                   movil_tetromine_x[0] -= 1;

                   scenario[y][x] = 0;
                   scenario[y + 1][x - 1] = 255;

                   ++rotation;
                }
                break;

                case 1:{
                    y = movil_tetromine_y[3];
                    x = movil_tetromine_x[3];

                    movil_tetromine_y[3] += 1;
                    movil_tetromine_x[3] += 1;

                    scenario[y][x] = 0;
                    scenario[y + 1][x + 1] = 255;

                    ++rotation;
                }
                break;

                /*case 2:{
                    y = movil_tetromine_y[2];   La pieza explota subita y misteriosamente
                    x = movil_tetromine_x[2];

                    movil_tetromine_y[3] -= 1;
                    movil_tetromine_x[3] += 1;

                    scenario[y][x] = 0;
                    scenario[y - 1][x + 1] = 255;

                    ++rotation;
                }
                break; */

                case 2:{
                    y = movil_tetromine_y[0];
                    x = movil_tetromine_x[0];

                    movil_tetromine_y[0] -= 1;
                    movil_tetromine_x[0] -= 1;

                    scenario[y][x] = 0;
                    scenario[y - 1][x - 1] = 255;

                    rotation = 0;
                }
            }
        }
    }

    return rotation;
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
