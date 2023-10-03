defmodule ElixirBlog.BlogsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirBlog.Blogs` context.
  """

  @doc """
  Generate a blog.
  """
  def blog_fixture(attrs \\ %{}) do
    {:ok, blog} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        title: "some title"
      })
      |> ElixirBlog.Blogs.create_blog()

    blog
  end
end
