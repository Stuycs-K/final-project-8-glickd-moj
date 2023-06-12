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
    bust = false;
    chips = chip;
    playerNum = "" + i;
    if(i == 0){
      playerNum = "dealer";
    }
  }
  void displayDealerHand(boolean over){
    if(!over){
      for(int i = 0; i < hand.size(); i++){
        showDealerEnd(i,hand.get(i).getImage());
      }
    }
    else{
      for(int i = 0; i < hand.size(); i++){
        showDealer(i,hand.get(i).getImage());
      }
    }
  }
  ArrayList<Card> getHand() {
    return hand;
  }
  boolean isBusted(){
    return bust;
  }
  boolean hasMoves(){
    return hasMoves;
  }
  int getChips(){
    return chips;
  }
  boolean playing(){
    return hasMoves && !bust;
  }
  public int getBet(){
   return bet;
  }
  void dealerMove(Deck deck){
    if(getValue() > 16){
      hasMoves = false;
    }
    else{
      hit(deck);
    }
  }
  public void setBet(int x){
    bet = x;
  }

  public void setBust(boolean x){
    bust = x;
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
  public void hit(Deck deck){
      hand.add(deck.deal());
      if(getValue()>21){
        bust = true;
      }
  }

  public int getValue(){
    int total = 0;
    int numOfAces = 0;
    for(int i = 0; i < hand.size(); i++){
      Card temp = hand.get(i);
      temp.displayValue();
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
    //for(int i = 0; i < numOfAces-1; i++){
    //  total++;
    //}
    if(numOfAces > 0){
      if(total+11 <= 21){
        total+= 11;
      }
      else{
        total++;
      }
    }
    System.out.println(total);
    return total;
  }
  
  void reset(){
    hand = new ArrayList<Card>(0);
    bust = false;
    hasMoves = true;
  }
  void bet(int n){
    if(n > chips){
      displayText("You bet more than you had, get out of here...");
    }
    else{
      bet = n;
    }
    clearTable();
    displayText(" ");
    displayText2(" ");

  }
   void displayCards(int pos){
    for(int i = 0; i < hand.size(); i++){
      showCard(pos, i, hand.get(i).getImage());
    }
   }
}
  
