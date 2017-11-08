class TrigonometricConstants{
  /*
    Object jobs:
      * Calculate all sines and cosines in regular polygons from ringStep * (1 to ringMax);
      * Calculate all sines and cosines in angles from rotStep * (1 to rotMax);
  */
  
  private final int ringMax = 14, rotMax = 15, ringStep = 3, precision = 10000000;
  private final float rotStep = 0.2;
  
  private ArrayList<float[]> ringSine = new ArrayList<float[]>();
  private ArrayList<float[]> ringCosine = new ArrayList<float[]>();
  private float[] rotSine = new float[rotMax];
  private float[] rotCosine = new float[rotMax];
  
  TrigonometricConstants(){
    for(int i = 1; i <= ringMax; i++){
      int sides = i * 3;
      float step = (float)360/sides;
      float[] sine = new float[sides];
      float[] cosine = new float[sides];
      sine[0] = 0;
      cosine[0] = 1;
      for(int j = 1; j < sides; j++){
         sine[j] = round(sin(j * step) * precision);
         cosine[j] = round(cos(j * step) * precision);
         sine[j] /= precision;
         cosine[j] /= precision;
      }
    }
    
    for(int i = 1; i < rotMax; i++){
      rotSine[i] = round(sin(i * rotStep) * precision);
      rotCosine[i] = round(cos(i * rotStep) * precision);
      rotSine[i] /= precision;
      rotCosine[i] /= precision;
    }
  }
  
  public int getRingIndex(int sides){
    return sides/3;
  }
  public int getRotIndex(float angle){
    return (int)(angle / rotStep);
  }
  
  public float[] getRingSin(int index){return ringSine.get(index);}
  public float[] getRingCos(int index){return ringCosine.get(index);}
  public float getRotSin(int index){return rotSine[index];}
  public float getRotCos(int index){return rotSine[index];}
}