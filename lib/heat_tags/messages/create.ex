defmodule HeatTags.Messages.Create do
  alias HeatTags.{Message, Repo}

  def call(params) do
    params |> Message.changeset() |> Repo.insert() |> handleInsert()
  end

  defp handleInsert({:ok, %Message{}} = result), do: result

  defp handleInsert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
