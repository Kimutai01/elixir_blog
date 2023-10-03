defmodule ElixirBlog.MessagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirBlog.Messages` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> ElixirBlog.Messages.create_message()

    message
  end
end
