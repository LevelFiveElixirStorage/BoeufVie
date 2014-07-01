# First we need to create a board
defmodule Board do
  def new(size, dead_state\\:dead) do
    Build.create_new({}, 0, size, dead_state)
  end

  def populate(size, density, dead_state\\:dead, live_state\\:alive) do
    map new(size, dead_state), fn(state, _) ->
      if :random.uniform > density do
        live_state
      else
        state
      end
    end
  end

  # Returns a new board with every cell updated following the rules.
  def update(board) do
    map board, fn(state, {x, y}) ->
      Rules.new_cell_state(state, adj_cells(board, {x, y}))
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
    board = Tuple.delete_at(board, row)
    cur_col = Tuple.delete_at(cur_col, col)
    cur_col = Tuple.insert_at(cur_col, col, state)

    Tuple.insert_at(board, row, cur_col)
  end

  def map(board, f) do
    map(board, {0, 0}, f)
  end

  # When past end of rows return the board
  defp map(board, {x, _}, _) when x >= tuple_size(board) do
    board
  end

  # When past end of column go to next row
  defp map(board, {x, y}, f) when y >= tuple_size(elem(board, x)) do
    map(board, {x+1, 0}, f)
  end

  # Update the cell at this point
  defp map(board, {x, y}, f) when x < tuple_size(board) and y < tuple_size(elem(board, x)) do
    board = set_cell_state(board, {x, y}, f.(cell(board, {x, y}), {x, y}))
    map(board, {x, y+1}, f)
  end
end

defmodule Build do
  def create_new(board, size, goal_size, dead_state) when size < goal_size do
    board = Tuple.insert_at(board, 0, Tuple.duplicate(dead_state, goal_size))
    create_new(board, size+1, goal_size, dead_state)
  end

  def create_new(board, size, goal_size, _) when size >= goal_size do
    board
  end
end
