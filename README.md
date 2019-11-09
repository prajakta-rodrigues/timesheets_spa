# TimesheetsSpa

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


## Design Choices
1. A user can edit their tasks till the request is approved.
2. A user can delete or add tasks till the request is approved.
3. A user can delete or edit request till the request is approved.
4. Every user has a role either of worker or manager.
5. Manager cannot raise requests only workers can.
6. Managers can only approve requests of workers who are assigned to them.

## Attribution
  * https://github.com/NatTuck/lens
