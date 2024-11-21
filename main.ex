
defmodule Number do
  # Function to read a number from the user
  defp get_number(prompt) do
    IO.puts(prompt)
    input = IO.read(:stdio, :line) |> String.trim()

    case Integer.parse(input) do
      {number, ""} -> number
      _ ->
        IO.puts("Invalid input. Please enter a valid number.")
        get_number(prompt)
    end
  end

  # Function to read an operation from the user
  defp get_operation do
    IO.puts("Choose an operation (+, -, *, /):")
    operation = IO.read(:stdio, :line) |> String.trim()

    case operation do
      "+" -> :add
      "-" -> :subtract
      "*" -> :multiply
      "/" -> :divide
      _ ->
        IO.puts("Invalid operation. Please choose one of (+, -, *, /).")
        get_operation()
    end
  end

  # Function to perform the operation
  defp perform_operation(number1, number2, :add), do: number1 + number2
  defp perform_operation(number1, number2, :subtract), do: number1 - number2
  defp perform_operation(number1, number2, :multiply), do: number1 * number2

  defp perform_operation(number1, number2, :divide) do
    if number2 == 0 do
      IO.puts("Cannot divide by zero.")
      :error
    else
      number1 / number2
    end
  end

  # Function to execute the main flow
  def main do
    number1 = get_number("Hi, please provide a number:")
    number2 = get_number("Please provide a second number:")
    operation = get_operation()

    case perform_operation(number1, number2, operation) do
      :error -> IO.puts("Operation failed. Please try again.")
      result -> IO.puts("Result: #{result}")
    end
  end
end

# To run the program:
Number.main()
