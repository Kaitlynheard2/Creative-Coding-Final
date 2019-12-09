//import sound library
import processing.sound.*;
//set the amplitude of each song
Amplitude amp1;
Amplitude amp2;
Amplitude amp3;
Amplitude amp4;
Amplitude amp5;

//make each sound file a variable
SoundFile file1;
SoundFile file2;
SoundFile file3;
SoundFile file4;
SoundFile file5;

//Agdal by Soyb https://soundcloud.com/soybmusic
//Creative Commons — Attribution 3.0 Unported — CC BY 3.0
//Free Download / Stream: https://bit.ly/agdal-soyb
//Music promoted by Audio Library https://youtu.be/ODRd_PrJfJU
String audioName1 = "Agdal - Soyb - Music promoted by Audio Library.mp3";
//https://soundcloud.com/c6mi/masego-unreleased
String audioName2 = "Masego.mp3";
//https://soundcloud.com/kilcool/remember-me
String audioName3 = "remember me.mp3";
//https://soundcloud.com/sugiwa/wht
String audioName4 = "whtuwannado.mp3";
//https://soundcloud.com/user-170091135/clean-chance-the-rapper-hot-shower-ft-mp3cutnet
String audioName5 = "Hot Shower.mp3";

//set the angle of rotation
float angle = 2.0;
//set the offset from the orgin
float offsetX = 0;
float offsetY = 0;
float offsetZ = 0;
//set the scale for the rotation
float scalar = 3.5;
//set the speed of the rotation
float speed = 0.01;
//set the radius of the sphere
int radius = 20;

//create a graphic to place on top of canvas
PGraphics pg;


void setup() {
  //set size of canvas
  size(800, 800, P3D);
  //set size of graphic
  pg = createGraphics(800, 800, P3D);
  //set background color
  background(0);
  //assign file variable to a sound file
  file1 = new SoundFile(this, audioName1);
  file2 = new SoundFile(this, audioName2);
  file3 = new SoundFile(this, audioName3);
  file4 = new SoundFile(this, audioName4);
  file5 = new SoundFile(this, audioName5);
  //define amplitude class
  amp1 = new Amplitude(this);
  amp2 = new Amplitude(this);
  amp3 = new Amplitude(this);
  amp4 = new Amplitude(this);
  amp5 = new Amplitude(this);
  //determines amplitude of each file
  amp1.input(file1);
  amp2.input(file2);
  amp3.input(file3);
  amp4.input(file4);
  amp5.input(file5);
  //analyzes amplitude of each file and returns a float value
  amp1.analyze();
  amp2.analyze();
  amp3.analyze();
  amp4.analyze();
  amp5.analyze();


  //file2 = new SoundFile(this, audioName2);
  //file2.loop();
}

void draw() {
  background(0);
//drawing on graphic
  pg.beginDraw();
  // zoom everything that's already on the offscreen canvas
  pg.pushMatrix();
  pg.translate(width / 2, height / 2);
  pg.scale(1.007, 1.007, 1);
  // draw the offscreen canvas to itself, accounting for moving the origin to the center
  pg.image(pg, -pg.width / 2, -pg.height / 2, pg.width, pg.height);
  pg.popMatrix();

  pg.translate(mouseX, mouseY);
  
//to switch between the color visuals use the keys 'l', 'm', 'r', 'w', and 'h'
  if (keyPressed == true) {
    if (key == 'l') {
      lofiSphere();
    }
    if (key == 'm') {
      masegoSphere();
    }
    if (key == 'r') {
      rememberSphere();
    }
    if (key == 'w') {
      wannaDoSphere();
    }
    if (key == 'h') {
      hotShowerSphere();
    }
  } 
  pg.endDraw();
  

  image(pg, 0, 0, width, height);
}

void keyPressed() {
//to switch between the songs and stop the songs use the keys
  if (key == 'l') {
    file1.loop();
  }
  if (key == 'm') {
    file2.loop();
  }
  if (key == 'r') {
    file3.loop();
  }
  if (key =='w') {
    file4.loop();
  }
  if (key == 'h') {
    file5.loop();
  }
  if (key == ' ') {
    file1.stop();
    file2.stop();
    file3.stop();
    file4.stop();
    file5.stop();
  }
  if (key == 's') {
    file1.stop();
  }
  if (key == 'e') {
    file2.stop();
  }
  if (key == 'f') {
    file3.stop();
  }
  if(key == 'd') {
    file4.stop();
  }
  if(key == 'a') {
    file5.stop();
  }
}

//function for the lofi beat song
void lofiSphere () {
  float x = offsetX + cos(angle) * scalar;
  float y = offsetY + sin(angle) * scalar;
  float z = offsetZ + sin(angle) * scalar;

  angle += speed;
  scalar += speed;
  //makes spheres look like they are in 3d space
  pg.directionalLight(126, 126, 126, 0, 0, -1);
  pg.ambientLight(102, 102, 102);

  pg.pushMatrix();
  for (int i = 0; i < 50; i++) {
    //rotates and translates the spheres
    pg.translate(x, y, z);
    pg.rotateX(angle + PI);
    pg.rotateY(angle - PI);
//makes spheres change color based off of the amplitude
    if (amp1.analyze() > 0.8) {
      pg.strokeWeight(1);
      pg.stroke(255, 255, 255);
      pg.fill(86, 229, 149);
      pg.sphere(radius + amp1.analyze());
    } else {
      pg.stroke(random(169), random(86), 229);
      pg.colorMode(RGB, 255, 255, 255);
      pg.fill(86, 229, 149);
      pg.sphere(radius + amp1.analyze());
    }

    z+=10;
  }
  pg.popMatrix();
}

//function for the song by Masego
void masegoSphere() {
  float x = offsetX + cos(angle) * scalar;
  float y = offsetY + sin(angle) * scalar;
  float z = offsetZ + sin(angle) * scalar;

  angle += speed;
  scalar += speed;
  pg.directionalLight(126, 126, 126, 0, 0, -1);
  pg.ambientLight(102, 102, 102);

  pg.pushMatrix();
  for (int i = 0; i < 50; i++) {
    pg.translate(x, y, z);
    pg.rotateX(angle - PI);
    pg.rotateY(angle + PI);

    if (amp2.analyze() > 0.8) {
      pg.noStroke();
      pg.fill(237, 100, 45);
      pg.sphere(radius + amp2.analyze());
    } else {
      pg.noStroke();
      pg.colorMode(RGB, 255, 255, 255);
      pg.fill(96, 45, 237);
      pg.sphere(radius + amp2.analyze());
    }

    z+=10;
  }
  pg.popMatrix();
}

//function for the song by kilcool called "Remember Me"
void rememberSphere() {
  float x = offsetX + cos(angle) * scalar;
  float y = offsetY + sin(angle) * scalar;
  float z = offsetZ + sin(angle) * scalar;

  angle += speed;
  scalar += speed;
  pg.directionalLight(126, 126, 126, 0, 0, -1);
  pg.ambientLight(102, 102, 102);

  pg.pushMatrix();
  for (int i = 0; i < 50; i++) {
    pg.translate(x, y, z);
    pg.rotateX(angle);
    pg.rotateY(angle);

    if (amp3.analyze() > 0.8) {
      pg.strokeWeight(1);
      pg.stroke(random(216), 122, random(146));
      //
      pg.fill(144, 29, 58);
      pg.sphere(radius + amp3.analyze());
    } else {
      pg.noStroke();
      pg.colorMode(RGB, 255, 255, 255);
      pg.fill(216, 122, 146);
      pg.sphere(radius + amp3.analyze());
    }

    z+=10;
  }
  pg.popMatrix();
}

//function for the song "whtuwannado"
void wannaDoSphere() {
  float x = offsetX + cos(angle) * scalar;
  float y = offsetY + sin(angle) * scalar;
  float z = offsetZ + sin(angle) * scalar;

  angle += speed;
  scalar += speed;
  pg.directionalLight(126, 126, 126, 0, 0, -1);
  pg.ambientLight(102, 102, 102);

  pg.pushMatrix();
  for (int i = 0; i < 50; i++) {
    pg.translate(x, y, z);
    pg.rotateX(angle * PI);
    pg.rotateY(angle * PI);

    if (amp4.analyze() > 0.8) {
      pg.strokeWeight(1);
      pg.stroke(random(69), 205, random(222));
      //
      pg.fill(95, 174, 180);
      pg.sphere(radius + amp4.analyze());
    } else {
      pg.noStroke();
      pg.colorMode(RGB, 255, 255, 255);
      pg.fill(27, 126, 134);
      pg.sphere(radius + amp4.analyze());
    }

    z+=10;
  }
  pg.popMatrix();
}

//function for "hot shower"
void hotShowerSphere() {
  float x = offsetX + cos(angle) * scalar;
  float y = offsetY + sin(angle) * scalar;
  float z = offsetZ + sin(angle) * scalar;

  angle += speed;
  scalar += speed;
  pg.directionalLight(126, 126, 126, 0, 0, -1);
  pg.ambientLight(102, 102, 102);

  pg.pushMatrix();
  for (int i = 0; i < 50; i++) {
    pg.translate(x, y, z);
    pg.rotateX(angle / PI);
    pg.rotateY(angle / PI);

    if (amp5.analyze() > 0.9) {
      pg.strokeWeight(1);
      pg.stroke(250, 5, 5);
      pg.fill(175, 32, 25);
      pg.sphere(radius + amp5.analyze());
    } else {
      pg.noStroke();
      pg.colorMode(RGB, 255, 255, 255);
      pg.fill(250, 111, 5);
      pg.sphere(radius + amp5.analyze());
    }

    z+=10;
  }
  pg.popMatrix();
}
