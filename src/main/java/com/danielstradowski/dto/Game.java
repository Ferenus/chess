package com.danielstradowski.dto;

public class Game {

  private String player1;
  private String player2;
  private int id;

  public Game() {

  }

  public Game(String player1, String player2, int id) {
    this.player1 = player1;
    this.player2 = player2;
    this.id = id;
  }

  public String getPlayer1() {
    return player1;
  }

  public void setPlayer1(String player1) {
    this.player1 = player1;
  }

  public String getPlayer2() {
    return player2;
  }

  public void setPlayer2(String player2) {
    this.player2 = player2;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }
}
