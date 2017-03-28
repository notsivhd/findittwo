defmodule Findit.Repo.Migrations.CreateObject do
  use Ecto.Migration

  def change do
    create table(:objects) do
      add :name, :string
      add :description, :string
      add :status, :boolean, default: false, null: false
      add :image, :string

      timestamps()
    end

  end
end
