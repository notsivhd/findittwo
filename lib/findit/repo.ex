defmodule Findit.Repo do
  use Ecto.Repo, otp_app: :findit
  use Scrivener, page_size: 10
end
