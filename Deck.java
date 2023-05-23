public class Deck{
  private Card[] deck;

  public Deck(){
    deck = new Card[52];
    for (int i = 0; i < 4; i++){
      for (int j = 1; j < 13; j++){
        Card addition = new Card(j);
        deck[(13*i)+j-1] = addition;
        addition.displayValue();
      }
    }

  }


}
