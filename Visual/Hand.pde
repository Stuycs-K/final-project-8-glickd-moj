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
  public String getPlayer(){
    return playerNum;
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

  public void setChips(int x){
    chips = x;
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
  public void hit(Deck deck, int i){
    hand.add(deck.deal());
    if(getValue() > 21){
      bust = true;
    }
    displayCards(i);
  }

  public void displayCards(int j){
    for(int i = 0; i < hand.size(); i++){
      showCard(j,i,hand.get(i).getImage());
    }
    if(getValue() <= 21){
      displayText("The total value of player " + playerNum + "'s hand is " + getValue());
      displayText("\n");
    }
    else{
      displayText("Whoops, the hand is a bust.");
      displayText("\n");
      bust = true;
    }
  }

  public boolean hasMoves(){
    if(getValue() > 21){
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
