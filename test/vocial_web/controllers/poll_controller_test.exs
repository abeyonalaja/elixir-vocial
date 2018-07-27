defmodule VocialWeb.PollControllerTest do
  use VocialWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/polls"
    assert html_response(conn, 200) =~ "Logo"
  end
end
