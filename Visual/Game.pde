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
    for(int i = 0; i < hands.size(); i++){
      Hand hand  = hands.get(i);
      displayText("Ok player " + hand.getPlayer() + ". How much would you like to bet?");
      playerBet(hand);
    }
    displayText("Alright. Enough betting. Time to play.");
    for(int i = 0; i < hands.size(); i++){
      Hand hand  = hands.get(i);
      playerMove(hand,i);
    }
    determineWinner();
    reset();
  }

  public void playerBet(Hand hand){
    String next = in.nextLine();
    int bet = Integer.parseInt(next);
    if(bet > hand.getChips()){
      displayText("You don't have that much money... You only have " + hand.getChips() + " chips.");
      displayText("Please try again.");
      playerBet(hand);
    }
    else{
      hand.setBet(bet);
      displayText("Alright, you bet " + hand.getBet() + " chips. Good luck.");
    }
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
        displayText("Oh well.. Player " + hand.getPlayer() + " busted.");
        int chips = hand.getChips();
        hand.setChips(chips-hand.getBet());
        displayText("They lost " + hand.getBet() + " chips and now have " + hand.getChips() + " chips.");
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
        displayText("Well done! Player " + hand.getPlayer() + " wins!! Blackjack!");
        int chips = hand.getChips();
        hand.setChips(chips+hand.getBet());
        displayText("They won " + hand.getBet() + " chips and now have " + hand.getChips() + " chips.");
      }
      else if(hand.isBust()){

      }
      else if(hand.getValue() > dealersNum || dealer.isBust()){
        displayText("Well done! Player " + hand.getPlayer() + " wins. BOOM");
        int chips = hand.getChips();
        hand.setChips(chips+hand.getBet());
        displayText("They won " + hand.getBet() + " chips and now have " + hand.getChips() + " chips.");
      }
      else if(hand.getValue() == dealer.getValue()){
        displayText("Not bad! Player " + hand.getPlayer() + " pushes.");
      }
      else{
        displayText("Oh well... Player " + hand.getPlayer() + " lost.");
        int chips = hand.getChips();
        hand.setChips(chips-hand.getBet());
        displayText("They lost " + hand.getBet() + " chips and now have " + hand.getChips() +  " chips.");
      }
    }
  }
  public void playerMove(Hand hand, int integer){
    hand.dealHand(deck);
    hand.displayCards(integer);
    while(hand.hasMoves()){
      String move = getMove();
      if(move.equals("hit")){
        hand.hit(deck, integer);
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
  }
  public void dealerMove(){
    dealer.dealHand(deck);
    dealer.displayCards(0);
    while(dealer.hasMoves()){
      if(dealer.getValue() <= 16){
        dealer.hit(deck,0);
      }
      else{
        dealer.stand();
      }
    }
    dealersNum = dealer.getValue();
  }
  public String getMove(){
    displayText("Please enter your move. Either hit or stand: ");
    String s = in.nextLine();
    return s;
  }
  public void startGame(){
    deck.shuffle();
    displayText("Welcome to the casino!");
    displayText("Today you will be playing Blackjack.");
    displayText("The rules of blackjack are pretty simple: ");
    displayText("How many players would you like in the game?  ");
    String s = in.nextLine();
    int j = Integer.parseInt(s);
    numOfHands = j;
    displayText("How many chips does each player have? ");
    String next = in.nextLine();
    int buyIn = Integer.parseInt(next);
    for(int i = 0; i < numOfHands; i++){
      hands.add(new Hand(i+1,buyIn));
    }
  }
  public void reset(){
    deck.shuffle();
    dealer.removeCards();
    dealer.setBust(false);
    dealer.setMoves(true);
    displayText("Would you like to play again?");
    String s = in.nextLine();
    if(s.equals("yes")){
      for(int i = 0; i < hands.size(); i++){
        Hand hand = hands.get(i);
        if(hand.getChips() <= 0){
          displayText("Oh well, player " + hand.getPlayer() + " is bankrupt. They have to leave the table");
          hands.remove(hand);
          i--;
        }
        else{
          hand.removeCards();
          hand.setBust(false);
          hand.setMoves(true);
        }
      }
      numOfHands++;
      game();
    }
    else{
      displayText("Thanks for playing!");
    }
  }
}
