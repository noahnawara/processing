float hierbinich=0;
float farbe =0;
float loading_v =0;
void setup()
{
  size(500,280);
  background(44,62,80);
  }
void draw() {
    if (hierbinich<width){
    hierbinich=hierbinich+1;
    farbe= farbe+0.5;}
    if (loading_v>0);{
      loading_v=loading_v+0.2;
    if (loading_v>=100)
    loading_v=100;
  }
  textSize(35);
  fill(255,255,255);
  background(44,62,80);
  text(loading_v+"%",180,250);
  noStroke();
  fill(1-farbe,farbe+20,farbe+40);
  rect(1,40,hierbinich,150);
  frameRate(60);
    }