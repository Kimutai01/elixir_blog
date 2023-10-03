defmodule ElixirBlog.ReviewsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirBlog.Reviews` context.
  """

  @doc """
  Generate a review.
  """
  def review_fixture(attrs \\ %{}) do
    {:ok, review} =
      attrs
      |> Enum.into(%{
        name: "some name",
        title: "some title"
      })
      |> ElixirBlog.Reviews.create_review()

    review
  end
end
