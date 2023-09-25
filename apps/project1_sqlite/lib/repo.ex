defmodule Project1Sqlite.Repo do
  use Ecto.Repo,
    otp_app: :project1_sqlite,
    adapter: Ecto.Adapters.SQLite3
    #Project1Sqlite.Repo.all(Project1Sqlite.Furniture)
end
