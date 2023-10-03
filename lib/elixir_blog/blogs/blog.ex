defmodule ElixirBlog.Blogs.Blog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field :name, :string
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :name, :description])
    |> validate_required([:title, :name, :description])
  end
end
