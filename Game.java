import java.util.*;

public class Game{
  public int numOfHands = 1;
  public ArrayList<Hand> hands = new ArrayList<Hand>();
  public ArrayList<Card> dealerHand = new ArrayList<Card>();
  public Scanner in = new Scanner(System.in);
  public Deck deck = new Deck();
  public Hand dealer = new Hand(0,1);
  public boolean dealerNeeds= false;
  public int dealersNum;
  public void game(){
    showPrompts();
    deck.shuffle();
    for(int i = 0; i < hands.size(); i++){
      Hand hand  = hands.get(i);
      playerMove(hand);
    }
    determineWinner();
  }

  public void determineWinner(){
    declareBust();
    if(dealerNeeds){
      dealerMove();
    }
    declareWinner();
    }
  public void declareBust(){
    for(int i = 0; i < hands.size(); i++){
      Hand hand = hands.get(i);
      if(hand.getValue() > 21){
        System.out.println("Oh well.. Player " + (i+1) + " busted.");
      }
      else{
        dealerNeeds= true;
      }
    }
  }
  public void declareWinner(){
    for(int i = 0; i < hands.size(); i++){
      Hand hand = hands.get(i);
      if(hand.getValue()==21 && hand.numOfCards() == 2){
        System.out.println("Well done! Player " + (i+1) + " wins!! Blackjack!");
      }
      else if(hand.isBust()){

      }
      else if(hand.getValue() > dealersNum || dealer.isBust()){
        System.out.println("Well done! Player " + (i+1) + " wins. BOOM");
      }
      else if(hand.getValue() == dealer.getValue()){
        System.out.println("Not bad! Player " + (i+1) + " pushes.");
      }
      else{
        System.out.println("Oh well... Player " + (i+1) + " lost.");
      }
    }
  }
  public void playerMove(Hand hand){
    hand.dealHand(deck);
    hand.displayCards();
    while(hand.hasMoves()){
      String move = getMove();
      if(move.equals("hit")){
        hand.hit(deck);
      }
      if(move.equals("stand")){
        hand.stand();
      }
    }
  }

  public void showPrompts(){
    if(numOfHands == 1){
      startGame();
    }
    else{
      nextTurn();
    }
  }
  // public void declareWinnerAllBust(){
  //   System.out.println("Oh well, everyone busted. The dealer wins.");
  //   numOfHands++;
  // }
  //
  // public void declareWinnerOneBust(){
  //   System.out.println("Oh well, you busted. The dealer wins.");
  //   numOfHands++;
  //
  // }
  //
  // public void declareWinner(){
  //   int dealerValue = dealer.getValue();
  //   int maxHandValue = 0;
  //   int maxHandHolder = 0;
  //   for(int i = 0; i < hands.size(); i++){
  //     Hand temp = hands.get(i);
  //     int value = temp.getValue();
  //     if (value > maxHandValue){
  //       maxHandValue = value;
  //       maxHandHolder= i+1;
  //     }
  //   }
  //   if(maxHandValue < dealerValue){
  //     System.out.println("Oh well, the dealer wins.");
  //   }
  //   idealHandf(maxHandValue == dealerValue){
  //     System.out.println("Not bad, you pushed.");
  //   }
  //   if(maxHandValue > dealerValue){
  //     System.out.println("Great job, player "+ maxHandHolder + " won.");
  //   }
  //   numOfHands++;
  // }
  public void dealerMove(){
    dealer.dealHand(deck);
    dealer.displayCards();
    while(dealer.hasMoves()){
      if(dealer.getValue() <= 16){
        dealer.hit(deck);
      }
      else{
        dealer.stand();
      }
    }
    dealersNum = dealer.getValue();
  }
  public void nextTurn(){
    System.out.println("Alright. Ready to play again?");
    System.out.println("Let's go!");
  }
  public String getMove(){
    System.out.println("Please enter your move. Either hit or stand: ");
    String s = in.nextLine();
    return s;
  }
  public void startGame(){
    System.out.println("Welcome to the casino!");
    System.out.println("Today you will be playing Blackjack.");
    System.out.println("The rules of blackjack are pretty simple: ");
    System.out.println("How many players would you like in the game?  ");
    String s = in.nextLine();
    int j = Integer.parseInt(s);
    numOfHands = j;
    System.out.println("How many chips does each player have? ");
    String next = in.nextLine();
    int buyIn = Integer.parseInt(next);
    for(int i = 0; i < numOfHands; i++){
      hands.add(new Hand(i+1,buyIn));
    }
  }
}
