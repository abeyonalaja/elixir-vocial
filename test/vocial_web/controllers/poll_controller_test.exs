defmodule VocialWeb.PollControllerTest do
  use VocialWeb.ConnCase
  alias Vocial.Votes
  alias Vocial.Repo

  test "GET /", %{conn: conn} do
    {:ok, poll} = Vocial.Votes.create_poll_with_options(%{title: "Poll 1"}, ["Choice 1", "Choice 2", "Choice 3"])
    
    conn = get conn, "/polls"
    assert html_response(conn, 200) =~ poll.title

    Enum.each(poll.options, fn option ->
      assert html_response(conn, 200) =~ "#{option.title}"
      assert html_response(conn, 200) =~ ": #{option.votes}"
    end)
    
  end

  test "create_poll_with_options/2 does not create the poll or options with ba data" do
    title = "Bad Poll"
    options = ["Choice 1", nil, "Choice 3"]
    {status, _} = Votes.create_poll_with_options(%{title: title}, options)
    assert status == :error
  end

  describe "options" do

    test "create_option/1 creates an option on a poll" do
      with {:ok, poll} = Votes.create_poll(%{title: "Sample Poll"}),
           {:ok, option} = Votes.create_option(%{title: "Sample Choice", votes: 0, poll_id:  poll.id}),
             option <- Repo.preload(option, :poll)
        do
        assert Votes.list_options() == [option]
      end
    end

  end

end
