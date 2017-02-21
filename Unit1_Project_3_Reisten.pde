//This is a code made by Julius. It is a bunch of balls bouncing around the screen.
//If you press your mouse some balls around your mouse change their course. 



int Ballcount = (int)random(10,50);
float[] Xs = new float[Ballcount];
float[] Ys = new float[Ballcount];
float[] BounceX = new float[Ballcount];
float[] BounceY = new float[Ballcount];
float[] Color = new float[Ballcount];
float dirX= 1;
float dirY= 1;
float y= height/2;
float x= random(width);
float speedX= 3;//random(10);
float speedY= 3;//random(10);
float circlesize= 25;

void setup()
{
  fullScreen();
  colorMode(HSB);
   background(0,0,0);
  for(int i=0; i<Ballcount; i++)
  {
     Color[i] = random(255);
    Xs[i] = random(25,width-25);
    Ys[i] = random(25,height-25);
    BounceX[i] = random(-1,1);
    BounceY[i] = random(-1,1);
  }
}

void draw()
{
  
  fill(0,0,0,0);
  ellipse(mouseX,mouseY,250,250);
  fill(0,0,0,30);
  rect(0,0,width,height);
  for(int i=0; i<Ballcount; i++)
  {
   fill(Color[i],255,255,230);
   noStroke();
   ellipse(Xs[i],Ys[i],circlesize,circlesize);
  Xs[i]=Xs[i]+5*BounceX[i];
  Ys[i]=Ys[i]+5*BounceY[i];
  Color[i]=Color[i]+1;
  if(Color[i]>255)
  {
    Color[i]=0;
  }
 
  if(Xs[i]>width-circlesize/2)
  {
    BounceX[i]=-BounceX[i];
  }
  if(Xs[i]<circlesize/2)
  {
    BounceX[i]= -BounceX[i];
  }
  if(Ys[i]>height-circlesize/2)
  {
    BounceY[i]= -BounceY[i];
  }
  if(Ys[i]<circlesize/2)
   {
    BounceY[i]= -BounceY[i];
  }

  for(int j=0; i<Ballcount*2; j++)
    {
      if( i == j)
      {
        break;
      }
      if(dist(Xs[i],Ys[i],Xs[j],Ys[j])<=circlesize)
      {
        BounceX[i]= -BounceX[i];
        BounceY[i]= -BounceY[i];
        BounceX[j]= -BounceX[j];
        BounceY[j]= -BounceY[j];
      }
    }
  }


}
void keyPressed()
{
   if(key == 'x')
  {
    circlesize=circlesize+5;
  }
  if(key == 'z')
  {
    circlesize=circlesize-5;
  }
}

void mouseClicked()
{
 for(int i=0; i<Ballcount; i++)
 {
   if(dist(Xs[i],Ys[i],mouseX,mouseY)<circlesize/2+250)
      {
        BounceX[i]= -BounceX[i];
        BounceY[i]= -BounceY[i];
      }
 }
}