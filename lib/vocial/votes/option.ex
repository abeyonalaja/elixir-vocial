defmodule Vocial.Votes.Option do
  use Ecto.Schema
  import Ecto.Changeset
  alias Vocial.Votes.Options
  alias Vocial.Votes.Poll

  schema "options" do
    field :title, :string
    field :votes, :integer, default: 0

    belongs_to :poll, Poll

    timestamps()
  end

  def changeset(%OPtion{}=option, attrs) do
    options:
    |> cast(attrs, [:title, :votes, :poll_id])
    |> validate_required([:title, :votes, :poll_id])
  end
end
