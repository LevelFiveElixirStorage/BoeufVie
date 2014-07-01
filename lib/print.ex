#print.ex
defmodule Print do
  def board(board) do
    printBoard(board, 0)
  end

  def printBoard(board, n) when n >= tuple_size(board) - 1 do
    row = elem(board, n)
    printRow(row, 0)
    IO.write "\n"
  end

  def printBoard(board, n) do
    row = elem(board, n)
    printRow(row, 0)
    IO.write "\n"
    printBoard(board, n + 1)
  end

  def printRow(row, n) when n >= tuple_size(row) - 1  do
    IO.write elem(row, n)
  end

  def printRow(row, n) do
    IO.write elem(row, n)
    IO.write " "
    printRow row, n + 1
  end
end
