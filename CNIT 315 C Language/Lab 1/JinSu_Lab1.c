 #include <stdio.h>
/* Project Title: Lab1-CNIT315 Pool/HotTub
   Description: The user inputs their desired dimensions of the pool and the hot tub within the given range and the code outputs the pool volume, hot tub volume, and total gallons and costs for both. 
   Name: Brandon (Jin Su) Lee
   Email: lee3118@purdue.edu
   Lab Time: Thursday 3:30PM - 5:20PM 
*/

int main() {
  /* For while looping the whole code for user input redo */
 int keepgoing = 0;

while(keepgoing == 0){

  /* Initializing variables to -1  */
  double input_value = -1;

  double d_shallow_end = -1;
  double d_deep_end = -1;
  double w_pool = -1;
  double l_pool = -1;
  double l_walk_in = -1;
  double l_shallow_end = -1;
  double l_deep_end = -1;
  double w_hot_tub = -1;
  double d_hot_tub = -1;
  char choice = ' ';
  
  /* While loop for Depth of shallow end  */
  while (input_value < 0.0 || input_value > 5.0) {
    printf("Please enter the depth of the shallow end (0.000000 feet - 5.000000 feet): ");
    scanf("%lf", &input_value);
    /* Assign to d_shallow_end */
    d_shallow_end = input_value;
    if (input_value < 0.0 || input_value > 5.0) {
      printf("THAT IS AN INCORRECT ENTRY, PLEASE ENTER A VALUE BETWEEN 0 AND 5 FEET!!!!\n");
    }
  }

  /*  While loop for depth of deep end  */
  while (input_value < 6.0 || input_value > 15.0) {
    printf("Please enter the depth of the deep end (6.000000 feet - 15.000000 feet): ");
    scanf("%lf", &input_value);
    /* Assign to d_deep_end */
    d_deep_end = input_value;

    if (input_value < 6.0 || input_value > 15.0) {
      printf("THAT IS AN INCORRECT ENTRY, PLEASE ENTER A VALUE BETWEEN 6 AND 15 FEET!!!!\n");
    }
  } 

  /*  While loop for width of pool */
  while (input_value < 15.0 || input_value > 30.0) {
    printf("Please enter the width of the pool (15.000000 feet - 30.000000 feet): ");
    scanf("%lf", &input_value);
    /* Assign to w_pool */
    w_pool = input_value;  
    if (input_value < 15.0 || input_value > 30.0) {
      printf("THAT IS AN INCORRECT ENTRY, PLEASE ENTER A VALUE BETWEEN 15 AND 30 FEET!!!!\n");
    }
  }

  /*  While loop for length of pool */
  while (input_value < 35.0 || input_value > 70.0) {
    printf("Please enter the length of the pool (35.000000 feet - 70.000000 feet): ");
    scanf("%lf", &input_value);
    /* Assign to l_pool */
    l_pool = input_value;
    if (input_value < 35.0 || input_value > 70.0) {
      printf("THAT IS AN INCORRECT ENTRY, PLEASE ENTER A VALUE BETWEEN 35 AND 70 FEET!!!!\n");
    }
  }

  /* Initialize input values after every input */
  input_value = 0;
 
  /*  While loop for length of the walk in */
  while (input_value < 5.0 || input_value > ((l_pool / 3.0) + 0.000001)) {
    printf("Please enter the length of the walk in (5.000000 - %.6lf): ", (l_pool / 3.0));
    scanf("%lf", &input_value);
    /* Assign to l_walk_in */
    l_walk_in = input_value;
    if (input_value < 5.0 || input_value > ((l_pool / 3.0) + 0.000001)) {
      printf("THAT IS AN INCORRECT ENTRY, PLEASE ENTER A VALUE BETWEEN 5 AND 1/3 pool length!!!!\n");
    }
  }

  /* initialize input values after every input */
  input_value = 0;

  /*  While loop for length of the shallow end */
  while (input_value < 10.0 || input_value > ((l_pool / 2.0) + 0.000001)) {
    printf("Please enter the length of the shallow end (10.000000 feet - 1/2 of pool length): ");
    scanf("%lf", &input_value);
    /* Assign to l_shallow_end */
    l_shallow_end = input_value;
    if (input_value < 10.0 || input_value > ((l_pool / 2.0) + 0.000001)) {
      printf("THAT IS AN INCORRECT ENTRY, PLEASE ENTER A VALUE BETWEEN 10 AND 1/2 pool length!!!!\n");
    }
  }

  /* initialize input values after every input */
  input_value = 0;

  /*  While loop for length of the deep end */
  while (input_value < 12.0 || input_value > ((l_pool / 2.0) + 0.000001)) {
    printf("Please enter the length of the deep end (12.000000 feet - 1/2 of pool length): ");
    scanf("%lf", &input_value);
    /* Assign to l_deep_end */
    l_deep_end = input_value;
    if (input_value < 12.0 || input_value > ((l_pool / 2.0) + 0.000001)) {
      printf("THAT IS AN INCORRECT ENTRY, PLEASE ENTER A VALUE BETWEEN 12 AND 1/2 pool length!!!!\n");
    }
  }

  /* initialize input values after every input */
  input_value = 0;

  /*  While loop for width of the hot tub */
  while (input_value < 8.0 || input_value > 14.0) {
    printf("Please enter the width of the hot tub (8.000000 feet - 14.000000 feet): ");
    scanf("%lf", &input_value);
    /* Assign to w_hot_tub */
    w_hot_tub = input_value;
    if (input_value < 8.0 || input_value > 14.0) {
      printf("THAT IS AN INCORRECT ENTRY, PLEASE ENTER A VALUE BETWEEN 8 AND 14 FEET!!!!\n");
    }
  }

  /* initialize input values after every input */
  input_value = 0;

  /*  While loop for depth of the hot tub */
  while (input_value < 3.0 || input_value > 5.0) {
    printf("Please enter the depth of the hot tub (3.000000 feet - 5.000000 feet): ");
    scanf("%lf", &input_value);
    /* Assign to d_hot_tub */
    d_hot_tub = input_value;
    if (input_value < 3.0 || input_value > 5.0) {
      printf("THAT IS AN INCORRECT ENTRY, PLEASE ENTER A VALUE BETWEEN 3 AND 5 FEET!!!!\n");
    }
  }

  /*  Calculations for output  */
  double pool_volume = ((d_deep_end-0.5)*l_deep_end+(l_pool-l_deep_end-l_shallow_end-l_walk_in)*(d_shallow_end+d_deep_end-1)/2+l_shallow_end*(d_shallow_end-0.5)+(d_shallow_end-0.5)*(l_walk_in/d_shallow_end)*(d_shallow_end-0.5)/2)*w_pool;
  double pool_water = pool_volume * 7.481;
  double hot_tub_volume = 3.14*(w_hot_tub/2)*(w_hot_tub/2)*(d_hot_tub-0.5);
  double hot_tub_water = hot_tub_volume * 7.481;
  double total_gallon = hot_tub_water+pool_water;
  double total_cost = ((hot_tub_water*4*7)/100)+((pool_water*4*7)/100);

  /*  Printing output to users */
  printf("Pool Volume\n");
  printf("Total volume of pool: %.1f\n", pool_volume);
  printf("Gallons of water to fill : %.1f\n", pool_water);
  printf("Hot Tub Volume\n");
  printf("Total volume of hot tub : %.1f\n", hot_tub_volume);
  printf("Gallons of water to fill : %.1f\n", hot_tub_water);
  printf("Total gallons for both: %.1f\n", total_gallon);
  printf("Total cost for both: $%.2f\n", total_cost);

  /* End of user input question, while loop */
  printf("Do you want to calculate another pool and hot tub configuration? (Y/N) : ");
  scanf(" %c", &choice);
  if(choice == 'Y'){
    keepgoing = 0;
  } else if(choice == 'N'){
    keepgoing = -1;
  } else {
    return 0;
  }

}
  /*  Return nothing after loop finishes  */
  return 0;
}


