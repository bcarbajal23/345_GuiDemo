/*-------------------------------------------------------------------------------------------------------------
 * Author: Carlos Carbajal
 *
 * Description: This is the main part of the program. It sets up the window and necessary components.
 *              The program shows a step through the Insertion Sort algorithm at a step by step basis. 
 *              The user will click a button to show each step of the algorithm.
 *-------------------------------------------------------------------------------------------------------------*/

import java.io.*;
/*************Global Variables**********************/
Button button;
Circle[] circles = new Circle[10];
int clicks = 0;

/*
* Set up the main window
*/
void setup() {
  size(800, 420);
  smooth();
  rect(0, 0, 799, 350); //Sets up the white canvas on which to draw the circles

  
  button = new Button("Click Here", 10, 360, 115, 35); // Create clickable button
  String str= null;
  BufferedReader read;
  int i = 0, val;
  // Open and read numbers from a file
  try{
   read = createReader("values.txt");    //Open file
   // Read numbers from files
   while((str = read.readLine()) != null){
    val = Integer.parseInt(str);
    circles[i] = new Circle(100 + (i*50), 125, val); //Create new point with a value read from file
    circles[i].setColor(1); //Set color to blue
    circles[i].drawPoint();
    i++;
   }
  }catch(IOException e)
  {
    e.printStackTrace();
  }
}//END setup

void draw() {
  button.buttonDraw();
}//END draw

/**************************************************************************************************
 * mousePressed()
 *
 * Description: Check to see if the button has been pressed. You can click on the botton as 
 *              many times as you like, but the GUI is only updated as many times as the number
 *              of elements that are in circles[].
 ***************************************************************************************************/
void mousePressed() {
  if (button.mouseOver()) {

    clicks++;
    if (clicks < circles.length) {

      insertionSort();
    } else {
      clicks = circles.length;
      //Change color to last point to white
      circles[clicks-1].setColor(0);
      circles[clicks-1].drawPoint();
      text("Done Sorting!   \\_(ʘ_ʘ)_/", 130, 200);
    }
  }
}//END mousePressed

/************************************************************************************************
 * insertionSort()
 *
 * Description: This is one iteration of the outer loop in the normal inserstion sort algorithm.
 *              The colors of the cirles will change color as they get sorted.
 *************************************************************************************************/
void insertionSort() {

  int i = clicks;

  int currPtVal = circles[i].getValue(); //Get current position value
  //println("Current value: " + currPtVal);
  int j = i - 1;

  //Set color to circle in sorted part of the array to white
  circles[i-1].setColor(0);
  circles[i-1].drawPoint();

  //Set color to current circle to orange.
  circles[i].setColor(2);
  circles[i].drawPoint();

  /* 
   * The loop will move the elements from circles[0 to i-1] that are 
   * larger than currPtVal one position over from the current position.
   */
  while (j >= 0 && circles[j].getValue() > currPtVal) {

    circles[j+1].drawPoint();
    //Swap the value
    circles[j+1].setValue(circles[j].getValue());
    circles[j+1].drawPoint();    // Redraw circle with new value
    j--;
  }
  //Update the current position to the current value
  circles[j+1].setValue(currPtVal);
  circles[j+1].drawPoint(); //Redraw the circle with new value
 
}//END insertionSort