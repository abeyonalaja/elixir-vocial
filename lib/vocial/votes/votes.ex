defmodule Vocial.Votes do
  import Ecto.Query
  alias Vocial.Repo
  alias Vocial.Votes.Poll
  alias Vocial.Votes.Option

  def list_polls do
    Poll
    |> Repo.all()
    |> Repo.preload(:options)

  end
end
