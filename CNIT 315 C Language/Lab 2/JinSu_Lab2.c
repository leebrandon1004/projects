#include <stdio.h>

/* Name: Brandon (Jin Su) Lee
   Email: lee3118@purdue.edu
   Lab time: Thursday 3:30 - 5:20PM

	Project Title: Robot MAze
	Description: Robot is made to find itself out of the maze by using mutal recursion and testin each posisiton of the robot.*/

	/*char maze[6][6] = {
		{'S', '#', '#', '#', '#', '#'},
		{'.', '.', '.', '.', '.', '#'},
		{'#', '.', '#', '#', '#', '#'},
		{'#', '.', '#', '#', '#', '#'},
		{'.', '.', '.', '#', '.', 'G'},
		{'#', '#', '.', '.', '.', '#'},
	};*/
	
	/* Maze matrix */
	int maze[6][6] = {
	    {0, 1, 1, 1, 1, 1},
	    {0, 0, 0, 0, 0, 1},
	    {1, 0, 1, 1, 1, 1},
	    {1, 0, 1, 1, 1, 1},
	    {0, 0, 0, 1, 0, 0},
	    {1, 1, 0, 0, 0, 1},
	};


	/*const char avail = '.'; */
	/*const char wall = '#'; */
	/*const char notAvail =  'x';*/
	/*const char path = '+';*/
	
	/* Value assignment */
	const int avail = 0;
	const int wall = 1;
	const int notAvail =  2;
	const int path = 3;

	/* Navigation function*/

	int mazeGo(int x, int y) {
		if(x < 0 || y < 0 || x > 5 || y > 5) {
			return 0;

    	} else if(maze[x][y] != avail){
			return 0;

		} else if(x == 5 && y == 5) {
    		maze[x][y] = path;
    		return 1;
    		
    	} else {
    		maze[x][y] = path;
	/* Mutal recursion */
    		if(mazeGo(x-1, y) || mazeGo(x, y + 1)|| mazeGo(x + 1, y) || mazeGo(x, y - 1)) {
        		return 1;
            }
            maze[x][y] = path;
    		return 0;
    	}

	}


	/* Main function */
	int main() {
	    int i = 0;
	    for (i = 0; i < 6; i++) {
		int j = 0;		    
		for (j = 0; j < 6; j++) {
    		    printf("%d ", maze[i][j]);
		    }
		    printf("\n");
		} 
		

		printf("Passing through the maze¡Š\n");
		if(mazeGo(0,0)){
			printf("Yes\n");
		} else {
			printf("No\n");
		}

		
	

		for (i = 0; i < 6; i++) {
		    int j = 0;
		    for (j = 0; j < 6; j++) {
    		    	printf("%d ", maze[i][j]);
		    }
		    printf("\n");
		} 
		
		return 0;
		
	}
