public class Card{
  private int value;
  private PImage image;

  public Card(int val, PImage img){
    value = val;
    image = img;
  }
  
  public PImage getImage(){
    return image;
  }
  
  public void seeImage(int x, int y){
    image(image, x, y, 40, 60);
  }

  public void displayValue(){
    System.out.println(value);
  }

  public int getValue(){
    return value;
  }

  public void assignValue(int newVal){
    value = newVal;
  }

}
