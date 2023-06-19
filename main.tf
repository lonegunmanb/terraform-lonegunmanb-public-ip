data "curl" "big_data_cloud" {
  http_method = "GET"
  uri         = "https://api.bigdatacloud.net/data/client-ip"
}

data "curl" "see_ip" {
  count = can(jsondecode(data.curl.big_data_cloud.response).ipString) ? 0 : 1

  http_method = "GET"
  uri         = "https://ipv4.seeip.org/jsonip"
}

data "curl" "ifconfig_me" {
  count = can(jsondecode(data.curl.big_data_cloud.response).ipString) || can(jsondecode(data.curl.see_ip[0].response).ip) ? 0 : 1

  http_method = "GET"
  uri         = "https://ifconfig.me/all.json"
}

locals {
  big_data_cloud = try(jsondecode(data.curl.big_data_cloud.response).ipString, "")
  ifconfig_me    = try(jsondecode(data.curl.ifconfig_me[0].response).ip_addr, "")
  see_ip         = try(jsondecode(data.curl.see_ip[0].response).ip, "")
}
