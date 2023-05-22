public class Card{
  private int value;

  public Card(int val){
    value = val;
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
