# First we need to create a board
defmodule Board do
  def new(size) do
    Build.create_new({}, 0, size)
  end

  # Returns a new board with every cell updated following the rules.
  def update(board) do
    for {row, x} <- Enum.zip(board, 0..(tuple_size(board)-1)) do
      for {_, y} <- Enum.zip(row, 0..(tuple_size(row)-1)) do
        Rules.new_cell_state(cell(board, {x, y}), adj_cells(board, {x, y}))
      end
    end
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

  def set_cell_state(board, {row, col}, state) do
    cur_col = elem(board, row)
    Tuple.delete_at(board, row)
    cur_col = Tuple.delete_at(cur_col, col)
    cur_col = Tuple.insert_at(cur_col, col, state)
    board = Tuple.insert_at(board, row, cur_col)
  end
end

defmodule Build do
  def create_new(board, size, goalSize) when size < goalSize do
    board = Tuple.insert_at(board, 0, Tuple.duplicate(:dead, goalSize))
    create_new(board, size+1, goalSize)
  end

  def create_new(board, size, goalSize) when size >= goalSize do
    board
  end
end
