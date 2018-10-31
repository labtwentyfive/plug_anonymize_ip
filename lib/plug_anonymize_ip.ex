defmodule PlugAnonymizeIp do
  @moduledoc """
  PlugAnonymizeIp is a plug anonymize request IPs to respect privacy and data
  protection laws.
  """

  @doc false
  def init(opts \\ []), do: Keyword.put_new(opts, :ip_field, :remote_ip)

  @doc false
  def call(conn, opts) do
    ip_field = Keyword.fetch!(opts, :ip_field)
    Map.update(conn, ip_field, {0, 0, 0, 0}, &anonymize_ip/1)
  end

  @doc """
  Anonymizes an IP tuple.

  Returns the a tuple with some bits of the Ip anonymized.
  """
  def anonymize_ip(ip_tuple)

  # IPv4
  def anonymize_ip({part1, part2, part3, _}) do
    {part1, part2, part3, 0}
  end

  # IPv6
  def anonymize_ip({part1, part2, part3, _, _, _, _, _}) do
    {part1, part2, part3, 0, 0, 0, 0, 0}
  end
end
