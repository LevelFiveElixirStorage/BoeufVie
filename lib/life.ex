defmodule Life do
  def main(args) do
    board = BoardFromFile.build("seeds/1")
    Print.board board
    live(board)
  end

  def live(board) do
    board = Board.update board
    Print.board board
    :timer.sleep 1000
    live board
  end
end


