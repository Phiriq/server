defmodule Phiriq.MapTest do
  use ExUnit.Case

  alias Phiriq.Map, as: GMap
  # TODO: Use setup here and maybe use ets

  setup_all do
    map = GMap.build({5, 5})
    {:ok, map}
  end

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

  test "game map is a map", map do
    assert is_map(map)
  end

  test "map values are tiles", map do
    %Phiriq.Tile{} = map[{0, 0}]
  end

  test "at/2 can access specific map coordinate", map do
    value = 321
    coord = {3, 2}
    res = map |> GMap.update(coord, value)

    assert GMap.at(res, coord) == value
  end

  test "update/3 can update value at coordinate", map do
    new_value = 472
    coord = {5, 4}
    res = map |> GMap.update(coord, new_value)

    assert GMap.at(res, coord) == new_value
  end

  @spec build_correctly?(GMap.gmap(), GMap.coordinate()) :: boolean()
  defp build_correctly?(map, {x, y}) do
    assert map_size(map) == x * y
  end
end
