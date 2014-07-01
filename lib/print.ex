#print.ex
defmodule Print do
  def board(board) do
    print_board(board, 0)
  end

  defp print_board(board, n) when n >= tuple_size(board) - 1 do
    row = elem(board, n)
    print_row(row, 0)
  end

  defp print_board(board, n) do
    row = elem(board, n)
    print_row(row, 0)
    print_board(board, n + 1)
  end

  defp print_row(row, n) when n >= tuple_size(row) - 1  do
    print_cell(row, n)
    IO.write "\n"
  end

  defp print_row(row, n) do
    print_cell(row, n)
    print_row row, n + 1
  end

  defp print_cell(row, n) do
    state = elem(row, n)
    cond do
      state == :dead  -> IO.write "."
      state == :alive -> IO.write "0"
    end
    IO.write " "
  end
end
