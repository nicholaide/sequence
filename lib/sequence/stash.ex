#---
# Excerpted from "Programming Elixir",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/elixir for more book information.
#---
defmodule Sequence.Stash do
  use GenServer

  #####
  # External API  

  def start_link([current_number | deltoid] ) do
    {:ok,_pid} = GenServer.start_link( __MODULE__, [current_number | deltoid] )
  end

  def save_value(pid, value, deltoid) do
    GenServer.cast pid, {:save_value, [value | deltoid ] }
  end

  def get_value(pid) do
    GenServer.call pid, :get_value
  end

  #####
  # GenServer implementation

  def handle_call(:get_value, _from, current_value ) do 
    [ value | deltoid ] = current_value
    { :reply, [value | deltoid ], [value | deltoid] }
  end

  def handle_cast({:save_value, [value | deltoid]}, _current_value ) do
    { :noreply, [value | deltoid] }
  end
end