class Ring{
  private final float radi, ringHeight, Xrot,  Zrot;
  private final int sides;
  private PVector[] vertex;
  private PVector[] invertedVertex;
  
  public Ring(float radi, float ringHeight, int sides, float Xrot, float Zrot){
    this.radi = radi;
    this.ringHeight = ringHeight;
    this.sides = sides;
    this.Xrot = Xrot;
    this.Zrot = Zrot;
    
    vertex = new PVector[sides+1];
    invertedVertex = new PVector[sides+1];
    generate();
  }
  
  private void generate(){
    float angle = 360/sides;
    for(int i = 0; i <= sides; i++){
      
      float x = cos(radians(i * angle)) * radi;
      float y = 0;
      float z = sin(radians(i * angle)) * radi;
      float iy = 0;
      float noise = noise(x,ringHeight*verticalConsistance,z);
      
      x += sin(noise * deformation);
      z += cos(noise * deformation);
      
      y -= (sin(radians(Xrot))*z) - (sin(radians(Zrot))*x);
      iy += (sin(radians(Xrot))*z) - (sin(radians(Zrot))*x);
      
      vertex[i] = new PVector(x,y,z);
      invertedVertex[i] = new PVector(x,iy,z);
    }
  }
  
  public PVector[] getVertex(){return vertex;}
  public PVector[] getInvertedVertex(){return invertedVertex;}
  public int getSides(){return sides;}
  public float getHeigth(){return ringHeight;}
  public float getXRotation(){return Xrot;}
  public float getZRotation(){return Zrot;}
}