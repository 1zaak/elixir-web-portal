defmodule MsqhPortal.UserEnquiryController do
  use MsqhPortal.Web, :controller

  alias MsqhPortal.UserEnquiry

  def index(conn, _params) do
    userenquiries = Repo.all(UserEnquiry)
    render(conn, "index.html", userenquiries: userenquiries)
  end

  def new(conn, _params) do
    changeset = UserEnquiry.changeset(%UserEnquiry{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user_enquiry" => user_enquiry_params}) do
    changeset = UserEnquiry.changeset(%UserEnquiry{}, user_enquiry_params)

    case Repo.insert(changeset) do
      {:ok, _user_enquiry} ->
        conn
        |> put_flash(:info, "User enquiry created successfully.")
        |> redirect(to: user_enquiry_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user_enquiry = Repo.get!(UserEnquiry, id)
    render(conn, "show.html", user_enquiry: user_enquiry)
  end

  def edit(conn, %{"id" => id}) do
    user_enquiry = Repo.get!(UserEnquiry, id)
    changeset = UserEnquiry.changeset(user_enquiry)
    render(conn, "edit.html", user_enquiry: user_enquiry, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user_enquiry" => user_enquiry_params}) do
    user_enquiry = Repo.get!(UserEnquiry, id)
    changeset = UserEnquiry.changeset(user_enquiry, user_enquiry_params)

    case Repo.update(changeset) do
      {:ok, user_enquiry} ->
        conn
        |> put_flash(:info, "User enquiry updated successfully.")
        |> redirect(to: user_enquiry_path(conn, :show, user_enquiry))
      {:error, changeset} ->
        render(conn, "edit.html", user_enquiry: user_enquiry, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_enquiry = Repo.get!(UserEnquiry, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user_enquiry)

    conn
    |> put_flash(:info, "User enquiry deleted successfully.")
    |> redirect(to: user_enquiry_path(conn, :index))
  end
end
