defmodule MsqhPortal.Router do
  use MsqhPortal.Web, :router

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
    resources "/userphotos", UserPhotoController
    resources "/userenquiries", UserEnquiryController
    resources "/userenquiryattachments", UserEnquiryAttachmentController
    resources "/usercvs", UserCvController
    resources "/payments", PaymentController
    resources "/paymentattachments", PaymentAttachmentController
    resources "/memberships", MembershipController
    resources "/facilities", FacilityController
    resources "/calendars", CalendarController
    resources "/events", EventController
  end

  # Other scopes may use custom stacks.
  # scope "/api", MsqhPortal do
  #   pipe_through :api
  # end
end
