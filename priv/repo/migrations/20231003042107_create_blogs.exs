defmodule ElixirBlog.Repo.Migrations.CreateBlogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add :title, :string
      add :name, :string
      add :description, :string

      timestamps()
    end
  end
end
