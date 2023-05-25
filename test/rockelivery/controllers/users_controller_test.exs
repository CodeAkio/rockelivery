defmodule Rockelivery.Controllers.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "age" => 27,
        "address" => "Rua Hermano, 11",
        "cep" => "12345678",
        "cpf" => "12345678901",
        "email" => "pedro@email.com",
        "password" => "123456",
        "name" => "Pedro"
      }

      response = conn
      |> post(Routes.users_path(conn, :create, params))
      |> json_response(:created)

      assert %{
        "message" => "User created",
        "user" => %{
          "address" => "Rua Hermano, 11",
          "age" => 27,
          "cpf" => "12345678901",
          "email" => "pedro@email.com",
          "id" => _id,
        }
      } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "password" => "123456",
        "name" => "Pedro"
      }

      response = conn
      |> post(Routes.users_path(conn, :create, params))
      |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"],
        }
      }

      assert expected_response = response
    end
  end

  describe "delete/2" do
    test "when there is a user with the giver id, deletes the user", %{conn: conn} do
      id = "6ca0de35-e2fc-4bf2-9a6a-b36f43887b34"
      insert(:user)

      response = conn
      |> delete(Routes.users_path(conn, :delete, id))
      |> response(:no_content)

      expected_response = ""

      assert expected_response == response
    end
  end
end
