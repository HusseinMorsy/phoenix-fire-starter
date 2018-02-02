# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
alias FireStarter.{Repo, Video}

Repo.delete_all(Video)

videos = [
  %Video{title: "Ruby on Rails", duration: 200},
  %Video{title: "Phoenix intro", duration: 150},
  %Video{title: "NodeJS Advanced", duration: 432}
]

Enum.each(videos, &Repo.insert(&1))
