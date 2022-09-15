defmodule HelloDeployWeb.PageControllerTest do
  use HelloDeployWeb.ConnCase

  test "GET /", %{conn: conn} do
    login_path = Routes.user_session_path(conn, :new)

    conn = get(conn, "/")
    assert login_path == redirected_to(conn)

    conn = get(recycle(conn), login_path)
    assert html_response(conn, 200) =~ "Log in"
  end
end
