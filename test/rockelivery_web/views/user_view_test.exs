defmodule RockeliveryWeb.UserViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
      message: "User created",
      user: %Rockelivery.User{
        address: "Rua Hermano, 11",
        age: 27,
        cep: "12345678",
        cpf: "12345678901",
        email: "pedro@email.com",
        id: "6ca0de35-e2fc-4bf2-9a6a-b36f43887b34",
        inserted_at: nil,
        name: "Pedro",
        password: "123456",
        password_hash: nil,
        updated_at: nil,
      }
    } = response
  end
end
