defmodule BankAccount do
  use GenServer

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  ## Public API

  @spec open() :: account
  def open() do
    {:ok, pid} = GenServer.start_link(__MODULE__, :ok)
    pid
  end

  @spec close(account) :: :ok
  def close(account) do
    GenServer.call(account, :close)
  end

  @spec balance(account) :: integer | {:error, :account_closed}
  def balance(account) do
    GenServer.call(account, :balance)
  end

  @spec deposit(account, integer) ::
          :ok | {:error, :account_closed | :amount_must_be_positive}
  def deposit(account, amount) do
    GenServer.call(account, {:deposit, amount})
  end

  @spec withdraw(account, integer) ::
          :ok | {:error, :account_closed | :amount_must_be_positive | :not_enough_balance}
  def withdraw(account, amount) do
    GenServer.call(account, {:withdraw, amount})
  end

  ## GenServer callbacks

  @impl true
  def init(:ok) do
    {:ok, %{balance: 0, open: true}}
  end

  @impl true
  def handle_call(:close, _from, state) do
    {:reply, :ok, %{state | open: false}}
  end

  def handle_call(:balance, _from, %{open: false} = state) do
    {:reply, {:error, :account_closed}, state}
  end

  def handle_call(:balance, _from, state) do
    {:reply, state.balance, state}
  end

  def handle_call({:deposit, amount}, _from, %{open: false} = state) do
    {:reply, {:error, :account_closed}, state}
  end

  def handle_call({:deposit, amount}, _from, state) when amount <= 0 do
    {:reply, {:error, :amount_must_be_positive}, state}
  end

  def handle_call({:deposit, amount}, _from, state) do
    {:reply, :ok, %{state | balance: state.balance + amount}}
  end

  def handle_call({:withdraw, amount}, _from, %{open: false} = state) do
    {:reply, {:error, :account_closed}, state}
  end

  def handle_call({:withdraw, amount}, _from, state) when amount <= 0 do
    {:reply, {:error, :amount_must_be_positive}, state}
  end

  def handle_call({:withdraw, amount}, _from, state) when amount > state.balance do
    {:reply, {:error, :not_enough_balance}, state}
  end

  def handle_call({:withdraw, amount}, _from, state) do
    {:reply, :ok, %{state | balance: state.balance - amount}}
  end
end
