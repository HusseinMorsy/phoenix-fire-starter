defmodule FireStarterWeb.VideoController do
  use FireStarterWeb, :controller

  def index(conn, _params) do
    videos = FireStarter.Repo.all(FireStarter.Video)
    render conn, "index.html", videos: videos
  end
end
