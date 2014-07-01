defmodule Boeufvie do
  def run(board) do
    Board.update(board) |> Print.board
    run(board)
  end

  def main(args) do
    BoardFromFile.build("seeds/1") |> run
  end
end
