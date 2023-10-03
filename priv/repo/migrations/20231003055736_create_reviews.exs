defmodule ElixirBlog.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews) do
      add :name, :string
      add :title, :string
      add :blog_id , references(:blogs, on_delete: :delete_all)
      timestamps()
    end
  end
end
