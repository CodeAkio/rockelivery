defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        age: 27,
        address: "Rua Hermano, 11",
        cep: "12345678",
        cpf: "12345678901",
        email: "pedro@email.com",
        password: "123456",
        name: "Pedro"
      }

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Pedro"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = %{
        age: 27,
        address: "Rua Hermano, 11",
        cep: "12345678",
        cpf: "12345678901",
        email: "pedro@email.com",
        password: "123456",
        name: "Pedro"
      }

      update_params = %{name: "Piter", password: "123456"}

      response = params
      |> User.changeset()
      |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Piter"}, valid?: true} = response
    end

    test "when there are some error, returns on invalid changeset" do
      params = %{
        age: 15,
        address: "Rua Hermano, 11",
        cep: "12345678",
        cpf: "12345678901",
        email: "pedro@email.com",
        password: "123",
        name: "Pedro"
      }

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
