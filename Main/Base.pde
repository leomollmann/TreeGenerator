public class Base implements TreeComponents{
  private final PVector[] inVertex;
  private final int sides;
  private PShape shape;
  
  public Base(Ring in){
    inVertex = in.getVertex();
    sides = in.getSides();
    
    compute();
  }
  
  public void compute(){
    shape = createShape();
    shape.beginShape(TRIANGLE_STRIP);
    for(int i = 0; i < sides; i++){
      vertex(0,0,0);
      vertex(inVertex[i].x,inVertex[i].y,inVertex[i].z);
    }
    shape.noStroke();
    shape.fill(80);
    shape.endShape(CLOSE);
  }
  
  public void render(){
    shape(shape);
  }
  
  public float getXRotation(){return 0;}
  public float getZRotation(){return 0;}
  public float getHeight(){return 0;}
}