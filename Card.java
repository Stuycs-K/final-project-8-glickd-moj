public class Card{
  private int value;

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
