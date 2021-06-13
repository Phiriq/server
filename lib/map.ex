defmodule Phiriq.Map do
  @moduledoc """
  This module works with the game map.
  """

  @typedoc """
  A value used by the game map to distinguish tiles.
  """
  @type tile :: %Phiriq.Tile{}

  @typedoc """
  Represents a {x, y} integer coordinate.
  """
  @type coordinate :: {integer(), integer()}

  @typedoc """
  Represents the game map.
  """
  @type gmap :: %{coordinate() => tile()}

  @doc """
  Builds an empty X per Y map filled of zeros.
  """
  @spec build(coordinate()) :: gmap()
  def build({x_size, y_size}) do
    # TODO: Figure out how to implement this efficiently,
    # TODO: Chunking
    for y <- 0..(y_size - 1),
        x <- 0..(x_size - 1),
        into: %{},
        do: {{x, y}, %Phiriq.Tile{id: 0}}
  end

  @doc """
  Gets an element at a specific x,y coordinate.
  """
  @spec at(gmap(), coordinate()) :: tile()
  def at(map, coords) do
    Map.get(map, coords)
  end

  @doc """
  Updates a given a point on the map
  """
  @spec update(gmap(), coordinate(), tile()) :: gmap()
  def update(map, coord, value) do
    Map.put(map, coord, value)
  end
end
