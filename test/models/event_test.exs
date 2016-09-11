defmodule MsqhPortal.EventTest do
  use MsqhPortal.ModelCase

  alias MsqhPortal.Event

  @valid_attrs %{end: 42, event_title: "some content", start: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
