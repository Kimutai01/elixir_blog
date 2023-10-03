defmodule ElixirBlogWeb.ReviewLive.FormComponent do
  use ElixirBlogWeb, :live_component

  alias ElixirBlog.Reviews

  @impl true
  def update(%{review: review} = assigns, socket) do
    changeset = Reviews.change_review(review)

    {:ok,
     socket
     |> assign(assigns)

     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"review" => review_params}, socket) do
    changeset =
      socket.assigns.review
      |> Reviews.change_review(review_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"review" => review_params}, socket) do
    save_review(socket, socket.assigns.action, review_params)
  end

  defp save_review(socket, :edit_review, review_params) do
    case Reviews.update_review(socket.assigns.review, review_params) do
      {:ok, _review} ->
        {:noreply,
         socket
         |> put_flash(:info, "Review updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_review(socket, :add_reviews, review_params) do
    IO.inspect socket.assigns.changeset

    case Reviews.create_review(review_params) do
      {:ok, _review} ->
        {:noreply,
         socket
         |> put_flash(:info, "Review created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
