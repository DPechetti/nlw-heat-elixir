defmodule HeatTags.Message do
  use Ecto.Schema

  import Ecto.Changeset

  @requiredParams [:message, :username, :email]

  schema "messages" do
    field :message, :string
    field :username, :string
    field :email, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @requiredParams)
    |> validate_required(@requiredParams)
    |> validate_length(:message, min: 1, max: 140)
    |> validate_format(:email, ~r/^([\w\-]+\.)*[\w\- ]+@([\w\- ]+\.)+([\w\-]{2,3})$/)
  end
end
