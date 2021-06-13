defmodule Phiriq.Tile do
  @moduledoc """
  This module represents a tile of the game map.

  A tile struct must have an ID, which is a specific tile (grass, stone, etc...)
  A tile struct can have:
    :entity   - The entity above the tile.
    :items    - Items dropped above the tile.
    :walkable - If an entity can walk above the tile.
  """

  # TODO: type entity and items here
  @type t :: %Phiriq.Tile{
          id: integer(),
          entity: any(),
          items: list(any()),
          walkable: boolean()
        }

  @enforce_keys [:id]
  defstruct [:id, :entity, items: [], walkable: true]
end
