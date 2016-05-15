defmodule Peepchat.GuardianSerializer do
  @behavior Guardian.Serializer

  alias Peepchat.Repo
  alias Peepchat.User

  def for_token(user = %User{}), do: { :ok, "User:#{user.id}"}
  def for_token(_), do: { :error, "Unkown resource type"}

  def frome("User:" <> id), do: { :ok, Repo.get(User, id)}
  def frome(_), do: { :error, "Unkown resource type"}
end
