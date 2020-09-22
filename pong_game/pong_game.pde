Paddle paddleLeft;
Paddle paddleRight;

Ball ball;
void setup(){
  size(800,600);
  ball = new Ball(width/2, height/2, 50);
  paddleLeft = new Paddle(15, height/2, 30,200);
  paddleRight = new Paddle(width-15, height/2, 30, 200);
}

void draw(){
  background(0);
  ball.display();
  
  paddleLeft.display();
  paddleLeft.move();
  
  paddleRight.display();
  paddleRight.move();
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
  }
  
  void display(){
    fill(255); //set the drawing color
    ellipse(x,y,diameter,diameter); //draw a circle
  }
  
  void move(){
    
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
    rect(x-w/2,y-h/2,w,h);
  }
  
  void move(){
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
