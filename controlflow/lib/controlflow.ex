defmodule Controlflow do

  #### Solution with Case
  ## %{"email" => "spiros", "password": "1234"}
  def login(user) do
    case extract_email(user) do
      {:error, reason} -> {:error, reason}
      {:ok, email} ->
        case extract_password(user) do
          {:error, reason} ->  {:error, reason}
          {:ok, password} -> %{email: email, password: password}
        end

    end
  end


  #### Cleaner Solution with WITH
  def loginw(user) do
    with {:ok, email} <- extract_email(user),
      {:ok, password} <- extract_password(user) do
      {:ok, %{email: email, password: password}}
    end
  end

  defp extract_email(%{"email" => email}), do: {:ok, email}
  defp extract_email(_), do: {:error, "email missing"}

  defp extract_password(%{"password" => password}), do: {:ok, password}
  defp extract_password(_), do: {:error, "password missing"}
end
