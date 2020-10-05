# **The Noob Tetris**
## **General information**
<br>

### This is a little project made as a structured programming revision. A very minimalistic and not so optimized Tetris.
  
<br>

___

## **Gaming Instructions**
<br>

### Use the arrow keys (Left, Right and Down) to move the tetromino, and press the "R" key to rotate it.

<br>

___

## **Code General Review**
<br>

### First of all, the code is written using Processing and has around 1200 lines, that's mainly because the way tetromino rotations were implemented. The general structure is divided in three parts. 
<br>

## **Main Part**
<br>

```java
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
```
<br>

### This part stores the `setup()` and `draw()` functions, and is the main because implements and executes the rest of the code. In order to make the board of the game without struggling with sizes for each kind of screen, I decided to stablish an unique window size with the board matrix covering it all, and from here, make it minimalistic. The board is a color matrix, where initialy every block (window portion) is black, for tracking the mobile tetromino (The one the player controls) I use two integer arrays `movil_tetromine_x` and `movil_tetromine_y` to store the x and y coordinates, where the block's "Identity" is the index of both.

<br>

### The general flow of the program is:
1. ### Displays the board reading the matrix.
2. ### Checks if the tetromino has ended its movement and displays another one if yes.
3. ### Checks if is a game over.
4. ### Calls `gravity()` if the condition is done.
5. ### If it is a game over calls the `game_over()`.
6. ### Increments the tempo variable.

<br>

### The information about the functions used here is in the other parts

<br>

## **Mechanics Functions**
<br>

### `scenario_painting()`

<br>

```java
void scenario_painting(){ // Reads the matrix and paints the colors
    for(int i = 0; i < 20; ++i){
        for(int j = 0; j < 10; ++j){
            fill(scenario[i][j]);
            square(j * square_size, i * square_size, square_size);
        }
    }
}
```

<br>

### Displays the board reading the colors stored in the matrix, using the `square_size` as a constant.

<br>

### `game_over()`

<br>

```java
void game_over(){ // Function that occurs when the game is over, displaying the final score
    textSize(32);
    fill(255);
    text("SCORE", 80, 200);
    text(str(points), 80, 250);
}
```

<br>

### Displays the final score when there is a game over.

<br>

### `movement()`

<br>

```java
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
```

<br>

### Using the coordinates arrays, moves the tetromino block by block by first checking (block by block as well) if it is possible to do that move, if it moves, then updates the matrix and the arrays. This function requires the `movement_code` given by `key_Pressed()`.

<br>

### `key_Pressed()`

<br>

```java
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
```

<br>

### Depending of the key pressed, calls `movement()` with a different kind of movement. I consider remarkable saying that the tetromino movement occurs parallel with the general flow.

<br>

### `movil_tetromine_selector()`

<br>

```java
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
```

<br>

### Randomly selects a `tetromine_code` and returns it, updating the matrix with each block of the tetromino selected.

<br>

### `gravity()`

<br>

```java
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
```

<br>

### Checks block by block if the mobile tetromino can keep falling, if not, it places it in the matrix with its `tetromine_color` and returns `false` to indicate its movement has ended, if it can, moves down the tetromino block by block. An important thing in the way I implemented the mobile tetromino is that the program recognizes it by its different color (white or `255` in the code) I found this as a quick and useful solution to some problems I had while implementing it.

<br>

### `tetromine_rotation()`

<br>

```java
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
```

<br>

### Depending of the `tetromine_code` calls a specific tetromino rotation, it also decreases a bit the `tempo` to delay the tetromino falling.

<br>

### `after_line_complete()`

<br>

```java
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
```

<br>

### After the completed lines are erased this function is called. It makes that everything above the first line (from top to bottom) move down a number of  `completed_lines` lines. It requires the array `lines` and `completed_lines` given by `complete_lines()`.

<br>

### `tetromine_appear()`

<br>

```java
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
```

<br>

### Updates the coordinates arrays depending of the `tetromine_code` and updates the `tetromine_color`. Returns `true` indicating that a new tetromino has appeared.

<br>

### `complete_lines()`

<br>

```java
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
```

<br>

### Searches and erases completed lines (Turning those matrix lines black) recognizing a completed line when there isn't a single black block in it, also, stores the lines index, the total lines completed, and changes and returns `points` depending of the number of lines completed.

<br>

## **Specific Tetromino Rotations**

<br>

### The main reason for the large amount of lines for this project is because I decided to implement specific rotations to each tetromino, being this the unique solution that I saw while thinking how to do it (Considering that the program doesn't recognize the tetrominos, but its individual blocks) However, despite being long and verbose, it works well and it is easy to debug because I can know specifically which rotation isn't working well.

<br>

### As the algorithm is the same for every tetromino, I will review only one of the rotation functions and the auxiliar functions used here.

<br>

### `tetromine_update()`

<br>

```java
void tetromine_update(int[] movil_tetromine_x, int[] movil_tetromine_y){ // Erases the blocks to update them when a rotation happens
    for(int i = 0; i < 4; ++i){
        scenario[movil_tetromine_y[i]][movil_tetromine_x[i]] = 0;
    }
}
```

<br>

### Erases the mobile tetromine in the display (This allows it be updated later).

<br>

### `UP()`

<br>

```java
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
```

<br>

### This function is used to move up the blocks of the tetromino before a rotation occurs to prevent some kinds of errors.

<br>

### Now, the rotation function of the tetromino similar to a "N":

<br>

### `N_rotation()`

<br>

```java
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
```

<br>

### The algorithm is based in knowing in which state the tetromino is with `rotation`, where the `0` value is for the intial state. When a rotation occurs, depending of the `rotation`, it selects a block of the initial tetromino as a reference (Storing its coordinates) erases the initial tetromino in the matrix and hence that in the display, and then, using that reference block creates and displays a new tetromino (the initial but rotated) and updates its coordinates in the arrays, increasing `rotation` and turning it `0` when after the rotation it returns to the first tetromino appeared.

<br>

### As a last thing to bear in mind, when it updates the arrays does it from the major to the minor index (from bottom to top in `y` and from rigth to left in `x`) this because other functions like `movement()` or `gravity()` work better with this organization.
















