defmodule MsqhPortal.PaymentAttachmentController do
  use MsqhPortal.Web, :controller

  alias MsqhPortal.PaymentAttachment

  def index(conn, _params) do
    paymentattachments = Repo.all(PaymentAttachment)
    render(conn, "index.html", paymentattachments: paymentattachments)
  end

  def new(conn, _params) do
    changeset = PaymentAttachment.changeset(%PaymentAttachment{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"payment_attachment" => payment_attachment_params}) do
    changeset = PaymentAttachment.changeset(%PaymentAttachment{}, payment_attachment_params)

    case Repo.insert(changeset) do
      {:ok, _payment_attachment} ->
        conn
        |> put_flash(:info, "Payment attachment created successfully.")
        |> redirect(to: payment_attachment_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    payment_attachment = Repo.get!(PaymentAttachment, id)
    render(conn, "show.html", payment_attachment: payment_attachment)
  end

  def edit(conn, %{"id" => id}) do
    payment_attachment = Repo.get!(PaymentAttachment, id)
    changeset = PaymentAttachment.changeset(payment_attachment)
    render(conn, "edit.html", payment_attachment: payment_attachment, changeset: changeset)
  end

  def update(conn, %{"id" => id, "payment_attachment" => payment_attachment_params}) do
    payment_attachment = Repo.get!(PaymentAttachment, id)
    changeset = PaymentAttachment.changeset(payment_attachment, payment_attachment_params)

    case Repo.update(changeset) do
      {:ok, payment_attachment} ->
        conn
        |> put_flash(:info, "Payment attachment updated successfully.")
        |> redirect(to: payment_attachment_path(conn, :show, payment_attachment))
      {:error, changeset} ->
        render(conn, "edit.html", payment_attachment: payment_attachment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    payment_attachment = Repo.get!(PaymentAttachment, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(payment_attachment)

    conn
    |> put_flash(:info, "Payment attachment deleted successfully.")
    |> redirect(to: payment_attachment_path(conn, :index))
  end
end
