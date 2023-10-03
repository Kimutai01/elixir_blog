defmodule ElixirBlog.BlogsTest do
  use ElixirBlog.DataCase

  alias ElixirBlog.Blogs

  describe "blogs" do
    alias ElixirBlog.Blogs.Blog

    import ElixirBlog.BlogsFixtures

    @invalid_attrs %{name: nil, description: nil, title: nil}

    test "list_blogs/0 returns all blogs" do
      blog = blog_fixture()
      assert Blogs.list_blogs() == [blog]
    end

    test "get_blog!/1 returns the blog with given id" do
      blog = blog_fixture()
      assert Blogs.get_blog!(blog.id) == blog
    end

    test "create_blog/1 with valid data creates a blog" do
      valid_attrs = %{name: "some name", description: "some description", title: "some title"}

      assert {:ok, %Blog{} = blog} = Blogs.create_blog(valid_attrs)
      assert blog.name == "some name"
      assert blog.description == "some description"
      assert blog.title == "some title"
    end

    test "create_blog/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blogs.create_blog(@invalid_attrs)
    end

    test "update_blog/2 with valid data updates the blog" do
      blog = blog_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", title: "some updated title"}

      assert {:ok, %Blog{} = blog} = Blogs.update_blog(blog, update_attrs)
      assert blog.name == "some updated name"
      assert blog.description == "some updated description"
      assert blog.title == "some updated title"
    end

    test "update_blog/2 with invalid data returns error changeset" do
      blog = blog_fixture()
      assert {:error, %Ecto.Changeset{}} = Blogs.update_blog(blog, @invalid_attrs)
      assert blog == Blogs.get_blog!(blog.id)
    end

    test "delete_blog/1 deletes the blog" do
      blog = blog_fixture()
      assert {:ok, %Blog{}} = Blogs.delete_blog(blog)
      assert_raise Ecto.NoResultsError, fn -> Blogs.get_blog!(blog.id) end
    end

    test "change_blog/1 returns a blog changeset" do
      blog = blog_fixture()
      assert %Ecto.Changeset{} = Blogs.change_blog(blog)
    end
  end
end
