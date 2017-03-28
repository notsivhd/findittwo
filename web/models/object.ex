defmodule Findit.Object do
  use Findit.Web, :model
  use Arc.Ecto.Schema

  # The object model for the database
  schema "objects" do
    field :name, :string
    field :description, :string
    field :status, :boolean, default: false
    field :image, Findit.ImageUploader.Type

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :status, :image])
    |> validate_required([:name, :description, :status, :image])
  end
end
