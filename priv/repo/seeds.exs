# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Findit.Repo.insert!(%Findit.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Findit.Repo.delete_all Findit.User

Findit.User.changeset(%Findit.User{}, %{name: "Administrator", email: "admin@example.org", password: "password", password_confirmation: "password", admin: true})
|> Findit.Repo.insert!

Findit.User.changeset(%Findit.User{}, %{name: "Guest", email: "guest@example.org", password: "password", password_confirmation: "password", admin: false})
|> Findit.Repo.insert!
