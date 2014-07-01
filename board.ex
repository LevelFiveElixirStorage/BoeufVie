# First we need to create a board
defmodule Board do
  def new(size) do
    Build.create_new({}, 0, size)
  end
end

defmodule Build do
  def create_new(board, size, goalSize) when size <= goalSize do
    board = Tuple.insert_at(board, 0, Tuple.duplicate(:dead, goalSize))
    size = size + 1
    create_new(board, size, goalSize)
  end

  def create_new(board, size, goalSize) when size > goalSize do
    board
  end
end
