# First we need to create a board
defmodule Board do
  board = {}

  def new(size) do
    Build.createNew(board, 0, goalSize)
  end
end

defmodule Build do
  def create_new(board, size, goalSize) when size <= goalSize do
    board = Tuple.insert_at(board, 0, Tupple.duplicate(:dead, goalSize))
  end
end
