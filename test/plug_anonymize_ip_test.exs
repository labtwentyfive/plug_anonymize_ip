defmodule PlugAnonymizeIpTest do
  use ExUnit.Case
  doctest PlugAnonymizeIp

  test "anonymizes ipv4 addresses" do
    conn = %Plug.Conn{remote_ip: {1, 2, 3, 4}}

    assert %{remote_ip: {1, 2, 3, 0}} = PlugAnonymizeIp.call(conn, ip_field: :remote_ip)
  end

  test "anonymizes ipv6 addresses" do
    conn = %Plug.Conn{
      remote_ip: {8195, 122, 44802, 51968, 53666, 31863, 61887, 36668}
    }

    assert %{remote_ip: {8195, 122, 44802, 0, 0, 0, 0, 0}} =
             PlugAnonymizeIp.call(conn, ip_field: :remote_ip)
  end
end
