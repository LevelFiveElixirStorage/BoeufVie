defmodule BoardFromFile do
  def build(file_name) do
    file = File.read(file_name)
    string = elem(file, 1)
    build_board_from_string(string)
  end

  defp build_board_from_string(string) do
    board = {{}}
    build_board_from_string board, string, String.length(string), 0
  end

  defp build_board_from_string(board, string, string_length, n) when n >= string_length - 1 do
    append_board(board, string, n)
    clean_board(board)
  end

  defp build_board_from_string(board, string, string_length, n) do
    board = append_board(board, string, n)
    build_board_from_string board, string, string_length, n + 1
  end

  defp append_board(board, string, n) do
    state = state_from_val(String.at(string, n))
    if state == :new_line do
      insert_new_row board
    else
      insert_new_cell(board, state)
    end
  end

  defp insert_new_row(board) do
    row = {}
    Tuple.insert_at board, tuple_size(board), row
  end

  defp insert_new_cell(board, cell) do
    row = elem(board, tuple_size(board) - 1)
    row = Tuple.insert_at row, tuple_size(row), cell
    board = Tuple.delete_at board, tuple_size(board) - 1
    Tuple.insert_at board, tuple_size(board), row
  end

  defp state_from_val(val) do
    cond do
      val == "0" -> :dead
      val == "1" -> :alive
      val == "\n" -> :new_line
    end
  end

  defp clean_board(board) do
    last_row = elem(board, tuple_size(board) - 1)
    if tuple_size(last_row) == 0 do
      board = Tuple.delete_at board, tuple_size(board) - 1
    end
    board
  end
end
