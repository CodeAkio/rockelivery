defmodule Rockelivery.Factory do
  use ExMachina

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
end
