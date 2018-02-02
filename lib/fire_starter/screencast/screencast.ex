defmodule FireStarter.Screencast do
  alias FireStarter.{Repo, Video}

  def list_videos do
    Repo.all(Video)
  end

  def create_video(params) do
    changeset = Video.changeset(%Video{}, params)
    Repo.insert(changeset)
  end

  def delete_video(id) do
    Video
    |> Repo.get(id) 
    |> Repo.delete
  end


  def change_video do
    Video.changeset(%Video{}, %{})
  end
end
