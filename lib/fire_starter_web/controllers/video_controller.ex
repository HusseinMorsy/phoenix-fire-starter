defmodule FireStarterWeb.VideoController do
  use FireStarterWeb, :controller
  alias FireStarter.{Repo, Video}

  def index(conn, _params) do
    videos = Repo.all(Video)
    render conn, "index.html", videos: videos
  end
end
