defmodule FireStarterWeb.VideoController do
  use FireStarterWeb, :controller
  alias FireStarter.Screencast

  def index(conn, _params) do
    videos = Screencast.list_videos
    render(conn, "index.html", videos: videos)
  end

  def new(conn, _params) do
    changeset = Screencast.change_video
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"video" => video_params}) do
    case Screencast.create_video(video_params) do
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
    Screencast.delete_video(video_id) 
    conn 
    |> put_flash(:info, "Deleted video #{video_id}")
    |> redirect(to: video_path(conn, :index))
  end
end
