defmodule Phiriq.TileTest do
  use ExUnit.Case

  setup_all do
    tile = %Phiriq.Tile{id: 1}

    {:ok, %{tile: tile}}
  end

  test "a tile can have only one entity above it", %{tile: tile} do
    refute is_list(tile.entity)
    refute is_tuple(tile.entity)
  end

  test "a item have a item list", %{tile: tile} do
    assert is_list(tile.items)
  end
end
