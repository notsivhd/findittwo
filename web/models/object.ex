defmodule Findit.Object do
  use Findit.Web, :model

  schema "objects" do
    field :name, :string
    field :description, :string
    field :status, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :status])
    |> validate_required([:name, :description, :status])
  end
end
