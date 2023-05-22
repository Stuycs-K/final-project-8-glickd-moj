public class Game{
  public static final int HIT = 1;
  public static final int STAND = 2;
  public boolean hasMoves = true;
  public int numOfHands = 1;
  public ArrayList<Card> hand = new ArrayList<Card>();
  public void game(){
    if(numOfHands == 1){
      startGame();
    }
    else{
      nextTurn();
    }
    dealHand();
    displayCards();
    while(hasMoves){
      move = getMove();
      if(move == HIT){
        hand.add(getCard());
        displayCards();
        checkForMoves();
      }
      if(move == STAND){
        hasMoves = false;
      }
    }
    dealerMove();
    declareWinner();
  }
  public static void startGame(){
    System.out.println("Welcome to the casino!");
    System.out.println("Today you will be playing Blackjack.");
    System.out.println("The rules of blackjack are pretty simple: ");
  }

  public void dealHand(){
    Card card1 = Deck.deal();
    Card card2 = Deck.deal();
    hand.add(card1);
    hand.add(card2);
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
}
