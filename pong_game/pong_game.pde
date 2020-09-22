void setup(){
  
  
}

void draw(){
  
  
}

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
    
  }
  
  void move(){
    
  }
}

class Paddle{
  //position
  float x;
  float y;
  
  //size
  float w;
  float h;
  
  //velocity
  float speedY;
  float speedX;
  
  Paddle(int tmpX, int tmpY, int tmpW, int tmpH){
    x = tmpX;
    y = tmpY;
    w = tmpW;
    h = tmpH;
    
  }
  
  void display(){
    
  }
  
  void move(){
    
    
  }
}
