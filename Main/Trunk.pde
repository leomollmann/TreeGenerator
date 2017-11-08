public class Trunk implements TreeComponents{
  private final Ring in, out;
  private PShape shape;
  private final float coneHeight;
  
  public Trunk(Ring in, Ring out){
    this.in = in;
    this.out = out;
    this.coneHeight = (out.getHeigth()-in.getHeigth());
    
    compute();
  }
  
  public void compute(){
    PVector[] inVertex = in.getInvertedVertex();
    PVector[] outVertex = out.getVertex();
    shape = createShape();
    shape.beginShape(QUAD_STRIP);
    shape.noStroke();
    shape.fill(80);
    for(int i = 0; i < in.getSides()+1; i++){
      shape.vertex(   inVertex[i].x,   inVertex[i].y,   inVertex[i].z);
      shape.vertex(  outVertex[i].x,  outVertex[i].y+coneHeight,  outVertex[i].z);
    }
    shape.endShape(CLOSE);
  }

  
  public void render(){
    shape(shape);
  }
  
  public float getXRotation(){return in.getXRotation()+out.getXRotation();}
  public float getZRotation(){return in.getZRotation()+out.getZRotation();}
  public float getHeight(){return coneHeight;}
}