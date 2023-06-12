import java.util.*;

public class Game{
  private Hand dealer;
  private Hand player;
  private Deck deck;
  private boolean started;
  private boolean dealerWon;
  private boolean playerWon;
  private boolean playing;
  
  public Game(){
    dealer = new Hand(0, 100);
    player = new Hand(4, 100);
    deck = new Deck();
    deck.shuffle();
    started = false;
    playing = true;
  }
  
  void dealerTurn(){
    dealer.dealerMove(deck);
  }
  boolean playing(){
    return playing;
  }
  void dealerWin(){
    player.setChips(player.getChips()-player.getBet());
    displayText2("Now you are down to " + player.getChips() + "chips.");
    reset();
  }
  
  void playerWin(){
    player.setChips(player.getChips()+player.getBet());
    displayText2("Now you are up to " + player.getChips() + "chips.");
    reset();
  }
  
  boolean started(){
    return started;
  }
  void startGame(){
    started = true;
    dealer.dealHand(deck);
    player.dealHand(deck);
  }
  void displayCards(int pos){
      player.displayCards(pos);
  }
  void displayDealerHand(){
    dealer.displayDealerHand(player.playing());
  }
  void stand(){
    player.stand();
    playing = false;
  }
  void hit(){
    player.hit(deck);
    if(player.isBusted()){
      playing = false;
    }
  }
  void playing(boolean x){
    playing = x;
  }
  void bet(int n){
    player.bet(n);
  }
      
  boolean playerWon(){
    return playerWon;
  }
  
  boolean isDealerTurn(){
    return !player.playing();  
  }
  

    
  int getWinner(){
    if(player.isBusted()){
      return -1;
    }
    else if(dealer.isBusted()){
      return 1;
    }
    else if(player.getValue() == 21 || player.getValue() > dealer.getValue()){
      return 1;
    }
    else if(player.getValue() == dealer.getValue()){
      return 0;
    }
    else{
      return -1;
    }
  }
  
  void reset(){
    dealer.reset();
    player.reset();
    deck.shuffle();
    started = false;
    playing = true;
    
  }
}
  
      
  
