defmodule Findit.User do
  use Findit.Web, :model
  use Coherence.Schema

  # The actual user model for the data base
  schema "users" do
    field :name, :string
    field :email, :string
    field :admin, :boolean
    coherence_schema

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email, :admin] ++ coherence_fields)
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_coherence(params)
  end
end
