#meh.ex
defmodule Meh do
  def shrug do
    IO.puts 'meh'
  end

  def medium_shrug do
    IO.puts '...meh'
  end

  def big_shrug do
    IO.puts '........meh'
  end

  def all_the_shrugs(n) do
    start = 0
    for start <- 0..n do
      shrug
      medium_shrug
      big_shrug
      start = start + 1
    end
  end

  def shrugagedon(n) when n < 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999 do
    all_the_shrugs(1)
    shrugagedon(n + 1)
  end

  def shrugagedon(n) do
    all_the_shrugs(1)
  end
end
