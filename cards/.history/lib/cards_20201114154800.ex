defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suites = ["Spades", "Clubs", "Hearts", "Diamonds"]
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
end
