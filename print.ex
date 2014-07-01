#print.ex
defmodule Print do
  def board(board) do
    printBoard(board, tuple_size(board))
  end

  def printBoard(board, n) when n <= 1 do
    row = elem(board, n - 1)
    printRow(row, tuple_size(row))
  end

  def printBoard(board, n) do
    row = elem(board, n - 1)
    printRow(row, tuple_size(row))
    IO.write "\n"
    printBoard(board, n - 1)
  end

  def printRow(row, n) when n <= 1  do
    IO.write elem(row, n - 1)
  end

  def printRow(row, n) do
    IO.write elem(row, n - 1)
    IO.write " "
    printRow row, n - 1
  end
end
