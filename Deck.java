import java.util.*;
public class Deck{
  private ArrayList<Card> deck;

  public Deck(){
    deck = new ArrayList<Card>(52);
    for (int i = 0; i < 4; i++){
      for (int j = 1; j < 13; j++){
        Card addition = new Card(j);
        deck.add(addition);
        addition.displayValue();
      }
    }

  }

  public ArrayList<Card> getCards(){
    return deck;
  }




}
