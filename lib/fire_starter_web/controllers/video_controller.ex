defmodule FireStarterWeb.VideoController do
  use FireStarterWeb, :controller
  alias FireStarter.{Repo, Video}

  def index(conn, _params) do
    videos = Repo.all(Video)
    render(conn, "index.html", videos: videos)
  end

  def new(conn, _params) do
    changeset = Video.changeset(%Video{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"video" => video_params}) do
    changeset = Video.changeset(%Video{}, video_params)

    case Repo.insert(changeset) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Video created")
        |> redirect(to: video_path(conn, :index))

      {:error, changeset} ->
        conn
        |> put_flash(:error, "Form Errors")
        |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => video_id}) do
    Repo.get(Video, video_id) |> Repo.delete
    conn 
    |> put_flash(:info, "Deleted video #{video_id}")
    |> redirect(to: video_path(conn, :index))
  end
end
