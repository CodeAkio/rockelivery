defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 27,
      address: "Rua Hermano, 11",
      cep: "12345678",
      cpf: "12345678901",
      email: "pedro@email.com",
      password: "123456",
      name: "Pedro"
    }
  end

  def user_factory do
    %User{
      age: 27,
      address: "Rua Hermano, 11",
      cep: "12345678",
      cpf: "12345678901",
      email: "pedro@email.com",
      password: "123456",
      name: "Pedro",
      id: "6ca0de35-e2fc-4bf2-9a6a-b36f43887b34"
    }
  end
end
