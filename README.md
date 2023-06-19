# Terraform Public IP module

This Terraform module fetches the public IP address of the system running the Terraform code. It queries three different public APIs to ensure reliability and fallback support.

* Big Data Cloud API: (https://api.bigdatacloud.net/data/client-ip)[https://api.bigdatacloud.net/data/client-ip]
* See IP API: (https://ipv4.seeip.org/jsonip)[https://ipv4.seeip.org/jsonip]
* Ifconfig.me API: (https://ifconfig.me/all.json)[https://ifconfig.me/all.json]

The module will attempt to fetch the IP address from the Big Data Cloud API first. If the IP address is not available, it will try the See IP API. If both of these fail, it will fall back to the Ifconfig.me API.

Example:

```hcl
module "ip" {
  source = "../.."
}

output "public_ip" {
  value = module.ip.public_ip
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                      | Version  |
|---------------------------------------------------------------------------|----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1   |
| <a name="requirement_curl"></a> [curl](#requirement\_curl)                | >= 1.0.2 |

## Providers

| Name                                                 | Version  |
|------------------------------------------------------|----------|
| <a name="provider_curl"></a> [curl](#provider\_curl) | >= 1.0.2 |

## Modules

No modules.

## Resources

| Name                                                                                                             | Type        |
|------------------------------------------------------------------------------------------------------------------|-------------|
| [curl_curl.big_data_cloud](https://registry.terraform.io/providers/anschoewe/curl/latest/docs/data-sources/curl) | data source |
| [curl_curl.ifconfig_me](https://registry.terraform.io/providers/anschoewe/curl/latest/docs/data-sources/curl)    | data source |
| [curl_curl.see_ip](https://registry.terraform.io/providers/anschoewe/curl/latest/docs/data-sources/curl)         | data source |

## Inputs

No inputs.

## Outputs

| Name                                                              | Description         |
|-------------------------------------------------------------------|---------------------|
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Your ipv4 public ip |
<!-- END_TF_DOCS -->
