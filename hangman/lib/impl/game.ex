defmodule Hangman.Impl.Game do
  alias Hangman.Type

  @type t :: %__MODULE__{
          turns_left: integer,
          game_state: Type.state(),
          letters: list(String.t()),
          used: MapSet.t(String.t())
        }
  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters: [],
    used: MapSet.new()
  )

  @spec new_game() :: Type.game()
  def new_game do
    new_game(Dictionary.random_word())
  end

  @spec new_game(String.t()) :: Type.game()
  def new_game(word) do
    %__MODULE__{
      letters: word |> String.downcase() |> String.codepoints()
    }
  end
end
