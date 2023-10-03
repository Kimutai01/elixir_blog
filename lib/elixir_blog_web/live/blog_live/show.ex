defmodule ElixirBlogWeb.BlogLive.Show do
  use ElixirBlogWeb, :live_view

  alias ElixirBlog.Blogs

  @impl true
  def mount(params, _session, socket) do
    IO.inspect params
    {:ok, socket}
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
end
