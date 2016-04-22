defmodule Sequence.Server do
  use GenServer # this handles all the callbacks
  
  def handle_call(:next_number, _from, current_number) do
    { :reply, current_number, current_number + 1 }
  end
  
  def handle_call({:set_number, new_number}, _from, _current_number) do
    { :reply, new_number, new_number}
  end
  
#   def handle_call({:factors, number}, _ , _) do
#     { :reply, { :factors_of, number, factors(number)}, [] }
#   end
  
  def handle_cast({:increment_number, delta}, current_number) do
    { :noreply, current_number + delta }
  end
  
  
  
end