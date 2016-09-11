defmodule MsqhPortal.UserCvController do
  use MsqhPortal.Web, :controller

  alias MsqhPortal.UserCv

  def index(conn, _params) do
    user_cvs = Repo.all(UserCv)
    render(conn, "index.html", user_cvs: user_cvs)
  end

  def new(conn, _params) do
    changeset = UserCv.changeset(%UserCv{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user_cv" => user_cv_params}) do
    changeset = UserCv.changeset(%UserCv{}, user_cv_params)

    case Repo.insert(changeset) do
      {:ok, _user_cv} ->
        conn
        |> put_flash(:info, "User cv created successfully.")
        |> redirect(to: user_cv_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user_cv = Repo.get!(UserCv, id)
    render(conn, "show.html", user_cv: user_cv)
  end

  def edit(conn, %{"id" => id}) do
    user_cv = Repo.get!(UserCv, id)
    changeset = UserCv.changeset(user_cv)
    render(conn, "edit.html", user_cv: user_cv, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user_cv" => user_cv_params}) do
    user_cv = Repo.get!(UserCv, id)
    changeset = UserCv.changeset(user_cv, user_cv_params)

    case Repo.update(changeset) do
      {:ok, user_cv} ->
        conn
        |> put_flash(:info, "User cv updated successfully.")
        |> redirect(to: user_cv_path(conn, :show, user_cv))
      {:error, changeset} ->
        render(conn, "edit.html", user_cv: user_cv, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_cv = Repo.get!(UserCv, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user_cv)

    conn
    |> put_flash(:info, "User cv deleted successfully.")
    |> redirect(to: user_cv_path(conn, :index))
  end
end
