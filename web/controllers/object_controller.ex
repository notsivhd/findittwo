defmodule Findit.ObjectController do
  use Findit.Web, :controller

  alias Findit.Object

  # Index for getting all the objects
  def index(conn, _params) do
    objects = Repo.all(Object)
    render(conn, "index.html", objects: objects)
  end

  # Link for creating
  def new(conn, _params) do
    changeset = Object.changeset(%Object{})
    render(conn, "new.html", changeset: changeset)
  end

  # The actual creation method
  def create(conn, %{"object" => object_params}) do
    changeset = Object.changeset(%Object{}, object_params)

    case Repo.insert(changeset) do
      {:ok, _object} ->
        conn
        |> put_flash(:info, "Object created successfully.")
        |> redirect(to: object_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  # Display a Single element
  def show(conn, %{"id" => id}) do
    object = Repo.get!(Object, id)
    render(conn, "show.html", object: object)
  end

  # Trigger the edit function
  def edit(conn, %{"id" => id}) do
    object = Repo.get!(Object, id)
    changeset = Object.changeset(object)
    render(conn, "edit.html", object: object, changeset: changeset)
  end

  # The actual update method
  def update(conn, %{"id" => id, "object" => object_params}) do
    object = Repo.get!(Object, id)
    changeset = Object.changeset(object, object_params)

    case Repo.update(changeset) do
      {:ok, object} ->
        conn
        |> put_flash(:info, "Object updated successfully.")
        |> redirect(to: object_path(conn, :show, object))
      {:error, changeset} ->
        render(conn, "edit.html", object: object, changeset: changeset)
    end
  end

  # Delete the selecte item
  def delete(conn, %{"id" => id}) do
    object = Repo.get!(Object, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(object)

    conn
    |> put_flash(:info, "Object deleted successfully.")
    |> redirect(to: object_path(conn, :index))
  end
end
