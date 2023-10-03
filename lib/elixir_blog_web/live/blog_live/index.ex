defmodule ElixirBlogWeb.BlogLive.Index do
  use ElixirBlogWeb, :live_view

  alias ElixirBlog.Blogs
  alias ElixirBlog.Blogs.Blog

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :blogs, list_blogs())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    IO.inspect(Blogs.get_blog!(id))
    socket
    |> assign(:page_title, "Edit Blog")
    |> assign(:kim , "Kim")
    |> assign(:blog, Blogs.get_blog!(id))
  end

  defp apply_action(socket, :new, _params) do

    socket
    |> assign(:page_title, "New Blog")
    |> assign(:kim , "Kim")
    |> assign(:blog, %Blog{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Blogs")
    |> assign(:blog, nil)
  end

  @impl true
  @spec handle_event(<<_::48>>, map, map) :: {:noreply, map}
  def handle_event("delete", params, socket) do
    IO.inspect(params["name"])
    blog = Blogs.get_blog_by_name(params["name"])
    {:ok, _} = Blogs.delete_blog(blog)

    {:noreply, assign(socket, :blogs, list_blogs())}
  end

  defp list_blogs do
    Blogs.list_blogs()
  end
end
