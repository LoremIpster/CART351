import ddf.minim.*;

Minim minim;
AudioPlayer song;
AudioPlayer[] songs = new AudioPlayer[10];

float color1 = 35;
float color2 = 45;
float color3 = 65;
float color4 = 75;

int r1 = 200;
int r2 = 100;
int sWidth = 1;

float xoff = 0.0;

void setup() {
  

  
  size(1024, 768);
  //colorMode(HSB,100,100,100,100);

  minim = new Minim(this);
  song = minim.loadFile("test.mp3", 1024);
  
  songs[0] = minim.loadFile("song0.mp3", 1024);
  songs[1] = minim.loadFile("song1.mp3", 1024);
  songs[2] = minim.loadFile("song2.mp3", 1024);

  song.play();

  smooth();
  
}


void draw() {

  if (!song.isPlaying()) {
    println("yaaaaay");
  }

  background(255);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(frameCount % 360 * 2));

  // exterieur
  for (int j = 0; j < 360; j++) {      // a chaque degre, il y a une ligne.

    if (song.mix.get(j)*200 > 50) {
      strokeWeight(sWidth);
      stroke(100);
    } else {
      strokeWeight(sWidth);
      stroke(0);
    }
    int jj = (int)random(-50, 50) + j;
    line(cos(jj)*r1, sin(jj)*r1, cos(jj)*abs(song.left.get(j))*200 + cos(jj)*r1, sin(j)*abs(song.right.get(j))*200 + sin(jj)*r1);
  }

  // interieur 1
  for (int k = 360; k > 0; k--) {


    if (song.mix.get(k)*200 > 25) {
      stroke(color3, 100, 100);
    } else {
      stroke(color4, 100, 100);
    }

    //int rr = (int)random(45, 50);
    int kk = (int)random(-20, 20) + k;

    xoff = xoff + .02;
    float rr = noise(xoff) * r1;

    line(cos(kk)*rr, sin(kk)*rr, cos(kk)*abs(song.right.get(k))*200 + cos(kk)*rr, sin(kk)*abs(song.left.get(k))*200 + sin(kk)*rr);
  }

  // interieur 2
  for (int k = 360; k > 0; k--) {


    if (song.mix.get(k)*200 > 25) {
      stroke(color1, 100, 100);
    } else {
      stroke(100, (int)random(0, 255), 100);
    }

    //int rr = (int)random(45, 50);
    int kk = (int)random(-10, 10) + k;

    xoff = xoff + .02;
    float rr = noise(xoff) * r1;

    line(cos(kk)*rr, sin(kk)*rr, cos(kk)*abs(song.right.get(k))*200 + cos(kk)*rr, sin(kk)*abs(song.left.get(k))*200 + sin(kk)*rr);
  }

  // interieur 3
  for (int k = 360; k > 0; k--) {


    if (song.mix.get(k)*200 > 25) {
      stroke(color3, 100, 100);
    } else {
      stroke(100, 100, (int)random(0, 255));
    }

    //int rr = (int)random(45, 50);
    int kk = (int)random(-30, 30) + k;

    xoff = xoff + .02;
    float rr = noise(xoff) * r1;

    line(cos(kk)*rr, sin(kk)*rr, cos(kk)*abs(song.right.get(k))*200 + cos(kk)*rr, sin(kk)*abs(song.left.get(k))*200 + sin(kk)*rr);
  }

  popMatrix();
}

void keyPressed() {

  if (key == 'r') {
    color1 = 0;
    color2 = 5;
    color3 = 90;
    color4 = 95;
  }

  if (key == 'g') {
    color1 = 35;
    color2 = 45;
    color3 = 65;
    color4 = 75;
  }
}

void stop() {

  song.close();
  minim.stop();
  super.stop();
}