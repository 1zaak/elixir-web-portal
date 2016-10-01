defmodule MsqhPortal.Router do
  use MsqhPortal.Web, :router
  use ExAdmin.Router

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

  scope "/", MsqhPortal do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/users", UserController
    resources "/user_photos", UserPhotoController
    resources "/user_enquiries", UserEnquiryController
    resources "/user_enquiry_attachments", UserEnquiryAttachmentController
    resources "/user_cvs", UserCvController
    resources "/payments", PaymentController
    resources "/payment_attachments", PaymentAttachmentController
    resources "/memberships", MembershipController
    resources "/facilities", FacilityController
    resources "/calendars", CalendarController
    resources "/events", EventController
  end

  scope "/admin", ExAdmin do
    pipe_through :browser
    admin_routes
  end

  # Other scopes may use custom stacks.
  # scope "/api", MsqhPortal do
  #   pipe_through :api
  # end
end
