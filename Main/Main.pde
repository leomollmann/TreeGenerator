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
  float r = 12;
  float h = 0;
  int s = 40;
  for(int i = 0; i < 100; i++){
    rings.add(new Ring(r,h,s,0,0));
    r-=0.1;
    h+=2;
  }
  tree.add(new Base(rings.get(0)));
  for(int i = 1; i < rings.size()-1; i++){
    tree.add(new Trunk(rings.get(i),rings.get(i+1)));
  }
  new TrigonometricConstants();
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