package be.g00glen00b.dto;

public class Move {

  private String chessPiece;
  private String start;
  private String end;
  private int id;

  public Move() {

  }

  public Move(String chessPiece, String end, String start, int id) {
    this.chessPiece = chessPiece;
    this.end = end;
    this.start = start;
    this.id = id;
  }

  public String getChessPiece() {
    return chessPiece;
  }

  public void setChessPiece(String chessPiece) {
    this.chessPiece = chessPiece;
  }

  public String getStart() {
    return start;
  }

  public void setStart(String start) {
    this.start = start;
  }

  public String getEnd() {
    return end;
  }

  public void setEnd(String end) {
    this.end = end;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }
}
