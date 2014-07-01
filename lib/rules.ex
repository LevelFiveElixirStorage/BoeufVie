# Determines the state of the cell in the next iteration
defmodule Rules do
  def new_cell_state(state, adj_cells) when state == :alive do
    num_alive = num_cells_alive(adj_cells)
    if num_alive < 2 || num_alive > 3, do: :dead, else: :alive
  end

  def new_cell_state(state, adj_cells) when state == :dead do
    num_alive = num_cells_alive(adj_cells)
    if num_alive == 3, do: :alive, else: :dead
  end

  def num_cells_alive(cells) do
    length(Enum.filter(cells, fn(cell) -> cell == :alive end))
  end
end
