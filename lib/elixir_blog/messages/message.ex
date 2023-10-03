defmodule ElixirBlog.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :content, :string
    belongs_to :blog, ElixirBlog.Blogs.Blog


    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :blog_id])
    |> validate_required([:content, :blog_id])
  end
end
