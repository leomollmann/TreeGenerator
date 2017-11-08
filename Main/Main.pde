import peasy.*;

PeasyCam cam;

float verticalConsistance = 0.001;
float deformation = 4;
public static final float woodDensity = 400;

public TrigonometricConstants c = new TrigonometricConstants();
ArrayList<Ring> rings = new ArrayList<Ring>();
ArrayList<TreeComponents> tree = new ArrayList<TreeComponents>();

void setup() {
  size(600,600,P3D);
  noiseDetail(1);
  //noiseSeed(100);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void draw(){
  
  background(50);
  lights();
  stroke(255,0,0);
  
  line(0,0,-100,0,0,100);
  stroke(0,255,0);
  line(-100,0,0,100,0,0);
  stroke(0,0,255);
  line(0,-100,0,0,100,0);
  
  for(TreeComponents t: tree){
    t.render();
    translate(0,t.getHeight(),0);
    rotateX(radians(t.getXRotation()));
    rotateZ(radians(t.getZRotation()));
  }
}