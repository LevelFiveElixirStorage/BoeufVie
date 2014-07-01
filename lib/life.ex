defmodule Life do
  def main(args) do
    board = BoardFromFile.build("seeds/1")
    live(board)
  end

  def live(board, g\\0) do
    board = Board.update board
    IO.puts "generation #{g}"
    Print.board board
    :timer.sleep 1000
    live board, g+1
  end
end


