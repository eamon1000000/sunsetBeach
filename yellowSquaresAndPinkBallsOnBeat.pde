import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float[bands];
PImage img[];

void setup() {
  size(512, 360);
  fullScreen();
  //background(255);
    
  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  
  // patch the AudioIn
  fft.input(in);
  

}      

void draw() { 
  
  fft.analyze(spectrum);
  

  for(int i = 0; i < bands; i++){
      float scale = spectrum[i]*100;

  // The result of the FFT is normalized
  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  drawPetals(width/2, height/2, 30, 10, 5, spectrum[i]*100);
  drawRectangles(4,spectrum[i]*100);
  } 
}
void drawRectangles(int numImages,float scale){
   for (int i = 0; i < numImages; i++) {
    fill((100 + scale*150), (100 + scale*100), (scale*100));
    noStroke();
    rect(random(0,width), random(0,height),scale*20,scale*scale*13);
  }
}
void drawPetals(float x, float y, float radius, int numPetals, float petalLength, float scale) {
  
  for (int i = 0; i < numPetals; i++) {
    
    
    float angle = map(i, 0, numPetals, 0, TWO_PI);
    float petalX = (x + scale + cos(angle) * 6*radius);
    float petalY = (y + scale + sin(angle) * 4*radius);
    
    // Draw petal
    noStroke();
    tint(255, 27);
    
    fill((100+ scale*200), (50+scale*10), (100+scale*120));
    ellipse(petalX, petalY, petalLength * 8 * scale, petalLength * 12 * scale);
    ellipse(petalX, petalY, petalLength * 8 * scale, petalLength * 12 * scale);
    ellipse(petalX, petalY, petalLength * 8 * scale, petalLength * 12 * scale);
    ellipse(petalX, petalY, petalLength * scale, petalLength * 3 * scale);
    ellipse(petalX, petalY, petalLength * 8 * scale, petalLength * 12 * scale);

  }
  
    
}
 
 
 
