# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     WordTracker.Repo.insert!(%WordTracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

WordTracker.Repo.insert!(%WordTracker.Game.Team{name: "Dude, Where's my CHAR?"})
