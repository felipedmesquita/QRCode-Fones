import processing.pdf.*;

int colunas = 10;

PImage[] qr = new PImage[131];
void setup() {
  size(595, 842, PDF, "Line.pdf");
  textMode(SHAPE);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  for (int i=0; i<131; i++)
    qr[i] = loadImage(i+".png");
}

void draw() {
  background(255);
  float d = 20/colunas, textOffset = 0.9, verticalSpace = 2.2;
  for (int i=0; i<colunas; i++) {
    for (int l=0; l<13; l++) {
      image(qr[i+10*l], c(1.5+i*d), c(1.5 + verticalSpace*l), c(1.5), c(1.5));
      fill(0);
      text(i+10*l, c(1.5+i*d), c(1.5+textOffset+ verticalSpace*l));
    }
  }
  exit();
}

float c(float cm) {
  return map(cm, 0, 21, 0, 595);
}

void lineCm(float cmx1, float cmy1, float cmx2, float cmy2) {
  line(map(cmx1, 0, 21, 0, 595), 
    map(cmy1, 0, 21, 0, 595), 
    map(cmx2, 0, 21, 0, 595), 
    map(cmy2, 0, 21, 0, 595));
}

void margens() {

  lineCm(.5, .5, 20.5, .5);
  lineCm(.5, .5, .5, 29.2);
  lineCm(.5, 29.2, 20.5, 29.2);
  lineCm(20.5, .5, 20.5, 29.2);
}
