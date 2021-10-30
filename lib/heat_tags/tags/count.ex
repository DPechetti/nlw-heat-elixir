defmodule HeatTags.Tags.Count do
  alias HeatTags.Messages.Get

  def call do
    Get.todayMessages()
    |> Task.async_stream(&countWordsInMessage(&1.message))
    |> Enum.reduce(%{}, &sumValues(&1, &2))

    # |> Task.async_stream(fn messageItem -> countWordsInMessage(messageItem.message) end)
    # |> Enum.reduce(%{}, fn sentence, wordAccumulator -> sumValues(sentence, wordAccumulator) end)
  end

  defp countWordsInMessage(message) do
    message |> String.split() |> Enum.frequencies()
  end

  defp sumValues({:ok, sentense}, wordAccumulator) do
    Map.merge(sentense, wordAccumulator, fn _key, word1, word2 -> word1 + word2 end)
  end
end
