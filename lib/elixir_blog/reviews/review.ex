defmodule ElixirBlog.Reviews.Review do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviews" do
    field :name, :string
    field :title, :string
    belongs_to :blog, ElixirBlog.Blogs.Blog

    timestamps()
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:name, :title, :blog_id])
    |> validate_required([:name, :title, :blog_id])
  end
end
