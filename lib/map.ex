defmodule Phiriq.Map do
  @moduledoc """
  This modules works on the Phiriq maps.  It uses tuples for performance
  reasons, since acessing specific positions on Elixir lists have a O(n)
  complexity.

  TODO: Maybe use :ets with (x, y) pairs on the future if needed.
  """

  @typedoc """
  A value used by the game map to distinguish tiles.
  """
  @type value :: integer()

  @typedoc """
  Represents a {x, y} integer coordinate.
  """
  @type coordinate :: {integer(), integer()}

  @typedoc """
  Represents the game map.
  """
  @type gmap :: {{value()}}

  @doc """
  Builds an empty X per Y map filled of zeros.
  """
  @spec build(coordinate()) :: gmap()
  def build({x, y}) do
    Enum.map(1..y, fn _ ->
      Enum.reduce(1..x, {}, fn _, acc ->
        Tuple.append(acc, 0)
      end)
    end)
    |> List.to_tuple()
  end

  @doc """
  Gets an element at a specific x,y coordinate.
  """
  @spec at(gmap(), coordinate()) :: value()
  def at(map, {x, y}) do
    map |> elem(y) |> elem(x)
  end

  @spec update(gmap(), coordinate(), value()) :: gmap()
  def update(map, {x, y}, value) do
    updated = map |> elem(y) |> put_elem(x, value)

    Tuple.delete_at(map, y)
    |> Tuple.insert_at(y, updated)
  end
end
