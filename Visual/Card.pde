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
  
  public void seeImage(){
    image(image, 0, 0);
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
