defmodule FireStarterWeb.VideoView do
  use FireStarterWeb, :view

  def display_duration(duration) do
    "#{duration} minutes"
  end
end
