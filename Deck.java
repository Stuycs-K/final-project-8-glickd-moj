import java.util.*;
public class Deck{
  private ArrayList<Card> deck;

  public Deck(){
    deck = new ArrayList<Card>(52);
    for (int i = 0; i < 4; i++){
      for (int j = 1; j < 13; j++){
        Card addition = new Card(j);
        deck.add(addition);
      }
    }

  }

  public int size(){
    return deck.size();
  }

  public ArrayList<Card> getDeck(){
    return deck;
  }

  public void printDeck(){
    String ans = "[";
    for (int i = 0; i < size(); i++){
      ans += deck.get(i).getValue() + " ";
    }
    System.out.println(ans + "]");
  }

  public Card deal(){
    return deck.remove(0);
  }

  public void shuffle(){
    int deckSize = size();
    ArrayList<Card> shuffled = new ArrayList<Card>(deckSize);
    for (int i = 0; i < deckSize; i++){
      int ind = (int)(Math.random()*size());
      shuffled.add(deck.remove(ind));
    }
    deck = shuffled;
  }




}
