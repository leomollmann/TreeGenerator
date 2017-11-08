class Ring{
  private final float radi, ringHeight;
  private final int sides;
  private final PVector[] vertex;
  
  private PVector[] rotOffset;
  private float Xrot, Zrot;
  
  public Ring(float radi, float ringHeight, float Xrot, float Zrot){
    this.radi = radi;
    this.ringHeight = ringHeight;
    this.sides = round(radi/10)*3;
    this.Xrot = Xrot;
    this.Zrot = Zrot;
    
    vertex = new PVector[sides+1];
    rotOffset = new PVector[sides+1];
    generate();
  }
  
  private void generate(){
    //Index in Trigonometric constants
    int cIndex = c.getRingIndex(sides);
    
    for(int i = 0; i <= sides; i++){
      
      //Calculate ring vertexes
      float x = c.getRingCos(cIndex)[i] * radi;
      float y = 0;
      float z = c.getRingSin(cIndex)[i] * radi;
      
      //Adding noise
      float noise = 0;
      x += sin(noise * deformation);
      z += cos(noise * deformation);
      
      //Saving vertex into array
      vertex[i] = new PVector(x,y,z);
    }
  }
  
  public void rotate(float Xrot, float Zrot){
    //Add rotation to current rotation
    this.Xrot += Xrot;
    this.Zrot += Zrot;
    
    //Index in Trigonometric constants
    int xIndex = c.getRotIndex(Xrot);
    int zIndex = c.getRotIndex(Zrot);
    
    //Calculate offset values
    for(int i = 0; i < sides; i++){
      float rx = (vertex[i].x * c.getRotCos(zIndex)) - (vertex[i].y * c.getRotSin(zIndex));
      float ry = (vertex[i].x * c.getRotSin(zIndex)) + (vertex[i].y * c.getRotCos(zIndex))
               + (vertex[i].y * c.getRotCos(xIndex)) - (vertex[i].z * c.getRotSin(xIndex));
      float rz = (vertex[i].y * c.getRotSin(xIndex)) + (vertex[i].z * c.getRotCos(xIndex)); 
    }
  }
  
  public PVector[] getVertex(){return vertex;}
  public PVector[] getRotOffset(){return rotOffset;}
  public int getSides(){return sides;}
  public float getHeigth(){return ringHeight;}
  public float getXRotation(){return Xrot;}
  public float getZRotation(){return Zrot;}
}