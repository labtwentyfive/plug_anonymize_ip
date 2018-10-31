defmodule PlugAnonymizeIp do
  @moduledoc """
  PlugAnonymizeIp is a plug anonymize request IPs to respect privacy and data
  protection laws.
  """

  def init(opts \\ []) do
    [
      ip_field: Keyword.get(opts, :ip_field, :remote_ip)
    ]
  end

  def call(conn, opts) do
    ip_field = Keyword.get(opts, :ip_field)
    %{conn | ip_field => conn |> Map.get(ip_field) |> anonymize_ip()}
  end

  @doc """
  Anonymizes an IP tuple.

  Returns the a tuple with some bits of the Ip anonymized.
  """
  def anonymize_ip(ip_tuple)

  def anonymize_ip({part1, part2, part3, _}) do
    {part1, part2, part3, 0}
  end

  def anonymize_ip({part1, part2, part3, _, _, _, _, _}) do
    {part1, part2, part3, 0, 0, 0, 0, 0}
  end
end
