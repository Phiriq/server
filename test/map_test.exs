defmodule Phiriq.MapTest do
  use ExUnit.Case

  alias Phiriq.Map, as: GMap
  # TODO: Use setup here and maybe use ets

  test "build/1 can build maps of different sizes" do
    data = [{10, 10}, {50, 400}, {1000, 1000}]
    # TODO: We don't have sufficient performance to work on very large sizes
    # yet, maybe implement some of those with Rust NIFs
    # GMap.build({15000, 30000})

    assert Enum.all?(data, fn coords ->
             GMap.build(coords)
             |> build_correctly?(coords)
           end)
  end

  test "game maps are tuples" do
    assert is_tuple(GMap.build({10, 10}))
  end

  test "at/2 can access specific map coordinate" do
    value = 321
    coord = {3, 2}
    map = GMap.build({5, 5}) |> GMap.update(coord, value)

    assert GMap.at(map, coord) == value
  end

  test "update/3 can update value at coordinate" do
    new_value = 472
    coord = {5, 8}
    map = GMap.build({10, 10}) |> GMap.update(coord, new_value)

    assert GMap.at(map, coord) == new_value
  end

  defp build_correctly?(map, {x, y}) do
    assert tuple_size(map) == y

    assert map
           |> Tuple.to_list()
           |> Enum.all?(fn axis -> tuple_size(axis) == x end)
  end
end
