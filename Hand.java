import java.util.*;
public class Hand{
  private ArrayList<Card> hand = new ArrayList<Card>();
  private boolean hasMoves = true;
  public Hand(){
    hasMoves = true;
  }
  public void dealHand(Deck deck){
    Card card1 = deck.deal();
    Card card2 = deck.deal();
    hand.add(card1);
    hand.add(card2);
  }
  public void stand(){
    hasMoves = false;
  }

  public void hit(Deck deck){
    hand.add(deck.deal());
    displayCards();
  }

  public void displayCards(){
    System.out.println();
    for(int i = 0; i < hand.size(); i++){
      Card temp = hand.get(i);
      if(temp.getValue() == 1){
        System.out.print("ACE ");
      }
      else if(temp.getValue() == 11){
        System.out.print("JACK ");
      }
      else if(temp.getValue() == 12){
        System.out.print("QUEEN ");
      }
      else if(temp.getValue() == 13){
        System.out.print("KING ");
      }
      else{
        System.out.print(temp.getValue() + " ");
      }
    }
  }

  public boolean hasMoves(){
    if(getValue() >= 21){
      hasMoves = false;
    }
    return hasMoves;
  }

  public int getValue(){
    int total = 0;
    int numOfAces = 0;
    for(int i = 0; i < hand.size(); i++){
      Card temp = hand.get(i);
      if(temp.getValue() != 1){
        total+= temp.getValue();
      }
      else{
        numOfAces++;
      }
    }
    return total;
  }



}
