import java.util.*;
public class Hand{
  private ArrayList<Card> hand = new ArrayList<Card>();
  private boolean hasMoves = true;
  private boolean bust = false;
  private int chips = 0;
  private int bet;
  private String playerNum;
  public Hand(int i, int chip){
    hasMoves = true;
    chips = chip;
    playerNum = "" + i;
    if(i == 0){
      playerNum = "dealer";
    }
  }
  public void removeCards(){
    hand.clear();
  }

  public void setBet(int x){
    bet = x;
  }

  public int getBet(){
    return bet;
  }

  public void setBust(boolean x){
    bust = x;
  }
  public int getChips(){
    return chips;
  }
  public void setMoves(boolean x){
    hasMoves =x;
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
  public boolean isBust(){
    return bust;
  }
  public void hit(Deck deck){
    hand.add(deck.deal());
    if(getValue() > 21){
      bust = true;
    }
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
    System.out.println();
    if(getValue() <= 21){
      System.out.println("The total value of player " + playerNum + "'s hand is " + getValue());
      System.out.println();
    }
    else{
      System.out.println("Whoops, the hand is a bust.");
      System.out.println();
      bust = true;
    }
  }

  public boolean hasMoves(){
    if(getValue() >= 21){
      hasMoves = false;
      bust = true;
    }
    return hasMoves;
  }

  public int numOfCards(){
    return hand.size();
  }

  public int getValue(){
    int total = 0;
    int numOfAces = 0;
    for(int i = 0; i < hand.size(); i++){
      Card temp = hand.get(i);
      int value = temp.getValue();
      if(value > 10){
        value = 10;
      }
      if(value != 1){
        total+= value;
      }
      else{
        numOfAces++;
      }
    }
    for(int i = 0; i < numOfAces-1; i++){
      total++;
    }
    if(numOfAces > 0){
      if(total+11 <= 21){
        total+= 11;
      }
      else{
        total++;
      }
    }
    return total;
  }
}
