defmodule Findit.ObjectTest do
  use Findit.ModelCase

  alias Findit.Object

  @valid_attrs %{description: 42, name: "some content", status: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Object.changeset(%Object{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Object.changeset(%Object{}, @invalid_attrs)
    refute changeset.valid?
  end
end
