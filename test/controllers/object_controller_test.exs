defmodule Findit.ObjectControllerTest do
  use Findit.ConnCase

  alias Findit.Object
  @valid_attrs %{description: 42, name: "some content", status: true}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, object_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing objects"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, object_path(conn, :new)
    assert html_response(conn, 200) =~ "New object"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, object_path(conn, :create), object: @valid_attrs
    assert redirected_to(conn) == object_path(conn, :index)
    assert Repo.get_by(Object, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, object_path(conn, :create), object: @invalid_attrs
    assert html_response(conn, 200) =~ "New object"
  end

  test "shows chosen resource", %{conn: conn} do
    object = Repo.insert! %Object{}
    conn = get conn, object_path(conn, :show, object)
    assert html_response(conn, 200) =~ "Show object"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, object_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    object = Repo.insert! %Object{}
    conn = get conn, object_path(conn, :edit, object)
    assert html_response(conn, 200) =~ "Edit object"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    object = Repo.insert! %Object{}
    conn = put conn, object_path(conn, :update, object), object: @valid_attrs
    assert redirected_to(conn) == object_path(conn, :show, object)
    assert Repo.get_by(Object, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    object = Repo.insert! %Object{}
    conn = put conn, object_path(conn, :update, object), object: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit object"
  end

  test "deletes chosen resource", %{conn: conn} do
    object = Repo.insert! %Object{}
    conn = delete conn, object_path(conn, :delete, object)
    assert redirected_to(conn) == object_path(conn, :index)
    refute Repo.get(Object, object.id)
  end
end
