/*--------------------------------------------------------------------------------------
* Author: Carlos Carbajal
*
* Class: Circle
* 
* Descripition: Object used to create a circle that holds a given value and color.
*
*--------------------------------------------------------------------------------------*/

class Circle{
    private float xCoord;
    private float yCoord;
    private int value;
    private int colour;
    private int orange = #FFA500;
    private int blue = #4682B4;
    private int white = #FFFFFF;
    
    /*
    * Constructor
    * Parameters: x - x-coordinate for center of circle
    *             y - y-coordinate for center of circle
    *             val - value to be displayed in circle
    */
    Circle(float x, float y, int val){
      xCoord = x;
      yCoord = y;
      value = val;
      colour = white;
    }//END Circle Constructor
    
    /****** Start of getters and setters *******/
    float getX(){
      return xCoord;
    }
    
    float getY(){
      return yCoord;
    }
    int getValue(){
      return value;
    }
    void setX(float x){
      xCoord = x;
    }
    
    void setY(float y){
      yCoord = y;
    }
    
    void setValue(int val){
      value = val;
    }
    
    void setColor(int val){
      if(val == 1){
        colour = blue;
      }
      else if(val == 2){
        colour = orange;
      }
      else{
        colour = white;
      }
    }
    /****** End of getters and setters *******/
  
    /***********************************************************************************
    * drawPoint
    * 
    * Desciption: method draws the circles on the window. Shows the value given to it 
    *             and the color depending if it is the current value that needs to be
    *             sorted.
    ************************************************************************************/ 
    void drawPoint(){
     
      fill(colour);
      ellipse(xCoord, yCoord, 25, 25);
      textAlign(CENTER,CENTER);
      fill(0);
      text(value, xCoord, yCoord);
    }//END drawPoint
    
    
}//END Point Class