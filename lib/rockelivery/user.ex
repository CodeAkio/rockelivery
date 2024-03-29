defmodule Rockelivery.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @create_params [:name, :age, :cpf, :email, :password, :cep, :address]
  @update_params @create_params -- [:password]
  @derive {Jason.Encoder, only: [:id, :name, :email, :age, :cpf, :address]}

  schema "users" do
    field :name, :string
    field :age, :integer
    field :cpf, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :cep, :string
    field :address, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> handle_changes(params, @create_params)
  end

  def changeset(struct, params) do
    struct
    |> handle_changes(params, @update_params)
  end

  defp handle_changes(changeset, params, fields) do
    changeset
    |> cast(params, fields)
    |> validate_required(fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:cep, is: 8)
    |> validate_length(:cpf, is: 11)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
