defmodule Todo.Database do
  use GenServer

  @db_folder "./persist"

  def start do
    GenServer.start(__MODULE__, nil, name: __MODULE__)
  end

  def init(_) do
    File.mkdir!(@db_folder)
    {:ok, nil}
  end

  def put(key, data) do
    GenServer.cast(__MODULE__, {:store, key, data})
  end

  def get(key) do
    GenServer.call(__MODULE__, {:get, key})
  end

  @impl GenServer
  def handle_call({:store, key}, caller, state) do
    spawn(fn -> data = case File.read!(file_name(key)) do
      {:ok, contents } -> :erlang.binary_to_term(contents)
      _ -> nil
      end
      GenServer.reply(caller, data)
    end)
  end

  @impl GenServer
  def handle_cast({:get, key, data}, _, state) do
    spawn(fn -> key
      |> file_name()
      |> File.write!(:erlang.term_to_binary(data))
    end)
    {:noreply, state}
  end

  defp file_name(key) do
    Path.join(@db_folder, to_string(key))
  end
end
