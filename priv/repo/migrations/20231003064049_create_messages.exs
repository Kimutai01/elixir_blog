defmodule ElixirBlog.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :content, :string
      add :blog_id , references(:blogs, on_delete: :delete_all)

      timestamps()
    end
  end
end
