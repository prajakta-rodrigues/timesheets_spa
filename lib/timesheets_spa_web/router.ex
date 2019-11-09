defmodule TimesheetsSpaWeb.Router do
  use TimesheetsSpaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TimesheetsSpaWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/*path", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TimesheetsSpaWeb do
  #   pipe_through :api
  # end
  scope "/api", TimesheetsSpaWeb do
     pipe_through :api
     resources "/token", SessionController, only: [:create], singleton: true
     resources "/users", UserController, except: [:new, :edit]
     resources "/requests", RequestController, except: [:new, :edit]
     resources "/jobs", JobController, except: [:new, :edit]
     resources "/tasks", TaskController, except: [:new, :edit]
   end



end
