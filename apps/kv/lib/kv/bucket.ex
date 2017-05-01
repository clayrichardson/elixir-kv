defmodule KV.Bucket do
  @doc """
  Starts a new bucket.
  """
  def start_link do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets a value from the `bucket` by `key`.
  This is functionally equivalent:
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end
  """

  def get(bucket, key) do
    Agent.get(bucket, fn dict ->
      Map.get(dict, key)
    end)
  end

  @doc """
  Puts the `value` for the given `key` in the `bucket`.
  This is functionally equivalent:
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end
  """

  def put(bucket, key, value) do
    Agent.update(bucket, fn dict ->
      Map.put(dict, key, value)
    end)
  end

  @doc """
  Deletes `key` from `bucket`.

  Returns the current value of `key`, if `key` exists.
  This is functionally equivalent:
    def delete(bucket, key) do
      Agent.get_and_update(bucket, &Map.pop(&1, key))
    end
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, fn dict ->
      Map.pop(dict, key)
    end)
  end
end
