defmodule MsqhPortal.UserEnquiryAttachmentController do
  use MsqhPortal.Web, :controller

  alias MsqhPortal.UserEnquiryAttachment

  def index(conn, _params) do
    userenquiryattachments = Repo.all(UserEnquiryAttachment)
    render(conn, "index.html", userenquiryattachments: userenquiryattachments)
  end

  def new(conn, _params) do
    changeset = UserEnquiryAttachment.changeset(%UserEnquiryAttachment{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user_enquiry_attachment" => user_enquiry_attachment_params}) do
    changeset = UserEnquiryAttachment.changeset(%UserEnquiryAttachment{}, user_enquiry_attachment_params)

    case Repo.insert(changeset) do
      {:ok, _user_enquiry_attachment} ->
        conn
        |> put_flash(:info, "User enquiry attachment created successfully.")
        |> redirect(to: user_enquiry_attachment_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user_enquiry_attachment = Repo.get!(UserEnquiryAttachment, id)
    render(conn, "show.html", user_enquiry_attachment: user_enquiry_attachment)
  end

  def edit(conn, %{"id" => id}) do
    user_enquiry_attachment = Repo.get!(UserEnquiryAttachment, id)
    changeset = UserEnquiryAttachment.changeset(user_enquiry_attachment)
    render(conn, "edit.html", user_enquiry_attachment: user_enquiry_attachment, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user_enquiry_attachment" => user_enquiry_attachment_params}) do
    user_enquiry_attachment = Repo.get!(UserEnquiryAttachment, id)
    changeset = UserEnquiryAttachment.changeset(user_enquiry_attachment, user_enquiry_attachment_params)

    case Repo.update(changeset) do
      {:ok, user_enquiry_attachment} ->
        conn
        |> put_flash(:info, "User enquiry attachment updated successfully.")
        |> redirect(to: user_enquiry_attachment_path(conn, :show, user_enquiry_attachment))
      {:error, changeset} ->
        render(conn, "edit.html", user_enquiry_attachment: user_enquiry_attachment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_enquiry_attachment = Repo.get!(UserEnquiryAttachment, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user_enquiry_attachment)

    conn
    |> put_flash(:info, "User enquiry attachment deleted successfully.")
    |> redirect(to: user_enquiry_attachment_path(conn, :index))
  end
end
