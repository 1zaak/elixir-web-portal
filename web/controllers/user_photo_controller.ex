defmodule MsqhPortal.UserPhotoController do
  use MsqhPortal.Web, :controller

  alias MsqhPortal.UserPhoto

  def index(conn, _params) do
    user_photos = Repo.all(UserPhoto)
    render(conn, "index.html", user_photos: user_photos)
  end

  def new(conn, _params) do
    changeset = UserPhoto.changeset(%UserPhoto{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user_photo" => user_photo_params}) do
    changeset = UserPhoto.changeset(%UserPhoto{}, user_photo_params)

    case Repo.insert(changeset) do
      {:ok, _user_photo} ->
        conn
        |> put_flash(:info, "User photo created successfully.")
        |> redirect(to: user_photo_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user_photo = Repo.get!(UserPhoto, id)
    render(conn, "show.html", user_photo: user_photo)
  end

  def edit(conn, %{"id" => id}) do
    user_photo = Repo.get!(UserPhoto, id)
    changeset = UserPhoto.changeset(user_photo)
    render(conn, "edit.html", user_photo: user_photo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user_photo" => user_photo_params}) do
    user_photo = Repo.get!(UserPhoto, id)
    changeset = UserPhoto.changeset(user_photo, user_photo_params)

    case Repo.update(changeset) do
      {:ok, user_photo} ->
        conn
        |> put_flash(:info, "User photo updated successfully.")
        |> redirect(to: user_photo_path(conn, :show, user_photo))
      {:error, changeset} ->
        render(conn, "edit.html", user_photo: user_photo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_photo = Repo.get!(UserPhoto, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user_photo)

    conn
    |> put_flash(:info, "User photo deleted successfully.")
    |> redirect(to: user_photo_path(conn, :index))
  end
end
