defmodule TodoServer do
  def start do
    spawn(fn -> loop(TodoList2.new()) end)
  end

  defp loop(todo_list) do
    new_todo_list =
      receive do
        message -> process_message(todo_list, message)
      end
    loop(new_todo_list)
  end

  defp process_message(todo_list, {:add_entry, entry}) do
    TodoList2.add_entry(todo_list, entry)
  end
end

defmodule TodoList2 do
  defstruct auto_id: 1, entries: %{}

  def new(), do: %TodoList2{}

  def add_entry(todo_server, entry) do
    send(todo_server, {:add_entry, entry})
  end
end
