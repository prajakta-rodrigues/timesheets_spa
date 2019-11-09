# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TimesheetsSpa.Repo.insert!(%TimesheetsSpa.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias TimesheetsSpa.Repo
alias TimesheetsSpa.Users.User

pw = Argon2.hash_pwd_salt("test")

Repo.insert!(%User{id: 1, name: "Alice", email: "alice@example.com", password_hash: pw, role: "Manager"})
Repo.insert!(%User{id: 2, name: "Bob", email: "bob@example.com", password_hash: pw, role: "Worker", manager_id: 1})
