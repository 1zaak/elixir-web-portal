defmodule MsqhPortal.CalendarController do
  use MsqhPortal.Web, :controller

  alias MsqhPortal.Calendar

  def index(conn, _params) do
    calendars = Repo.all(Calendar)
    render(conn, "index.html", calendars: calendars)
  end

  def new(conn, _params) do
    changeset = Calendar.changeset(%Calendar{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"calendar" => calendar_params}) do
    changeset = Calendar.changeset(%Calendar{}, calendar_params)

    case Repo.insert(changeset) do
      {:ok, _calendar} ->
        conn
        |> put_flash(:info, "Calendar created successfully.")
        |> redirect(to: calendar_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    calendar = Repo.get!(Calendar, id)
    render(conn, "show.html", calendar: calendar)
  end

  def edit(conn, %{"id" => id}) do
    calendar = Repo.get!(Calendar, id)
    changeset = Calendar.changeset(calendar)
    render(conn, "edit.html", calendar: calendar, changeset: changeset)
  end

  def update(conn, %{"id" => id, "calendar" => calendar_params}) do
    calendar = Repo.get!(Calendar, id)
    changeset = Calendar.changeset(calendar, calendar_params)

    case Repo.update(changeset) do
      {:ok, calendar} ->
        conn
        |> put_flash(:info, "Calendar updated successfully.")
        |> redirect(to: calendar_path(conn, :show, calendar))
      {:error, changeset} ->
        render(conn, "edit.html", calendar: calendar, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    calendar = Repo.get!(Calendar, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(calendar)

    conn
    |> put_flash(:info, "Calendar deleted successfully.")
    |> redirect(to: calendar_path(conn, :index))
  end
end
