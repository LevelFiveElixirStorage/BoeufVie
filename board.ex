# First we need to create a board
defmodule Board do
  def new(size) do
    Build.create_new({}, 0, size)
  end

  # Returns the value of the passed cell.
  def cell(board, {x, y}) do
    elem(elem(board, x), y)
  end

  # Returns list of the values of surounding cells.
  def adj_cells(board, {x, y}) do
    x_dim = tuple_size(board)
    y_dim = tuple_size(elem(board, 1))

    for x_p <- (x-1)..(x+1),       # Three rows around this cell.
        y_p <- (y-1)..(y+1),       # Three columns around this cell.
        x_p != x || y_p != y,      # Not the passed cell.
        x_p >= 0 && x_p < x_dim,   # X bounds check.
        y_p >= 0 && y_p < y_dim do # Y bounds check.
          cell(board, {x_p, y_p})
        end
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
