defmodule ElixirBlogWeb.BlogLive.Show do
  use ElixirBlogWeb, :live_view

  alias ElixirBlog.Blogs

  alias ElixirBlog.Messages.Message

  alias ElixirBlog.Reviews.Review

  @impl true
  def mount(params, _session, socket) do
    IO.inspect params
    {:ok, socket
    |> assign(:review, %Review{})
    |> assign(:message, %Message{})
  }
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    IO.inspect(Blogs.get_blog!(id))
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:blog, Blogs.get_blog!(id))}
  end

  defp page_title(:show), do: "Show Blog"
  defp page_title(:edit), do: "Edit Blog"
  defp page_title(:add_reviews), do: "Add Review"
  defp page_title(:messages), do: "Messages"
end
