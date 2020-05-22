defmodule Proxy.HttpProxyPlug do
  import Plug.Conn
  alias Proxy.{Utils}

  def init(opts), do: opts

  def call(conn, _opts) do
    url = Utils.build_url conn
    body = Utils.build_body conn
    method = String.to_atom(conn.method)

    proxies = [
    ]

    { proxy_info, proxy_auth } = Enum.random(proxies)

    conn_options = [
      {:proxy, proxy_info},
      {:proxy_auth, proxy_auth}
    ]

    case HTTPoison.request(method, url, body, conn.req_headers, conn_options) do
      {:ok, resp} ->
        headers = List.keydelete resp.headers, "Transfer-Encoding", 0
        if method == :GET do
        end
        %{conn | resp_headers: headers}
        |> send_resp(resp.status_code, resp.body)
      {:error, reason} ->
        conn
        |> send_resp(500, reason)
    end
  end

end
