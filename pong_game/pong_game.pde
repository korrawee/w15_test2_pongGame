//declare object variable
Paddle paddleRight;
Ball ball;

//decleare playerPoint for keep both player point
int[] playerPoint = {0,0};
void setup(){
  size(800,600);
  textSize(30); 

  //create object
  ball = new Ball(width/2, height/2, 50);
  paddleRight = new Paddle(width-10, height/2, 10, 200);
}

void draw(){
  background(0);
  
  //draw table and scoreboard
  stroke(255);
  strokeWeight(4);
  line(width/2, height-height, width/2, height);
  text("Player1  " + str(playerPoint[0]), width/6, height/9);
  text("Player2  " + str(playerPoint[1]), width-width/3, height/9);
  
  //display ball and move the ball
  ball.display();
  ball.move();
  
  //display all paddle
  paddleRight.display();
  
  //control paddle right if mouse pointing on rightside of the screen
  if(mouseX < width){ 
    paddleRight.move(); 
  }
  
  //bouncing condition rightside
  if(ball.right() > paddleRight.left() && ball.top() > paddleRight.top() && ball.bottom() < paddleRight.bottom()){
    ball.speedX = -ball.speedX;
  }
  if(ball.top() < 0 || ball.bottom() > height){
    ball.speedY = -ball.speedY;
  }
  
  //point's counting
  if(ball.top() < paddleRight.top() && ball.right() > width || ball.bottom() > paddleRight.bottom() && ball.right() > width ){
    delay(1);
    ball.reset();
    playerPoint[0] += 1;
  }
  if(ball.top() < paddleRight.top() && ball.right() < 0 || ball.bottom() > paddleRight.bottom() && ball.right() < 0 ){
    delay(1);
    ball.reset();
    playerPoint[1] += 1;
  }
  if(playerPoint[0] == 10 || playerPoint[1] == 10){
    delay(500); 
    playerPoint[0] = 0;
    playerPoint[1] = 0;
    ball.reset();
  }
}


//==================================================================
class Ball{
  //position
  float x;
  float y;
  
  //velocity
  float speedX;
  float speedY;
  
  //size
  float diameter;
  
  Ball(int tmpX, int tmpY, int tmpDiam){
    x = tmpX;
    y = tmpY;
    diameter = tmpDiam;
    speedX = 4;
    speedY = 3;
  }
  
  void display(){
    fill(255); //set the drawing color
    ellipse(x, y, diameter, diameter); //draw a circle
  }
  
  void move(){
    x = x + speedX;
    y = y + speedY;
  }
  void reset(){
    x = width/2;
    y = height/2;
    speedY = (random(1) < .5 ? -1 : 1) * speedY;
    speedX = -speedX;
  }
  
  //edge detected
  float left(){
    return x-diameter/2;
  }
  
  float right(){
    return x+diameter/2;
  }
  
  float top(){
    return y-diameter/2;
  }
  
  float bottom(){
    return y+diameter/2;
  }
}

//==================================================================
class Paddle{
  //position
  float x;
  float y;
  
  //size
  float w;
  float h;
  
  Paddle(int tmpX, int tmpY, int tmpW, int tmpH){
    x = tmpX;
    y = tmpY;
    w = tmpW;
    h = tmpH;
    
  }
  
  void display(){
    fill(255);
    rect(x-w/2, y-h/2, w,h);
  }
  
  void move(){ //paddle follow mouse's y-axis
    y = mouseY;
  }
  
  //edge detected
  float left(){
    return x-w/2; 
  }
  float right(){
    return x+w/2;
  }
  float top(){
    return y-h/2;
  }
  float bottom(){
    return y+h/2;
  }
}
