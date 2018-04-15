output "resource" {
  value = "${aws_api_gateway_resource.resource.id}"
  description = "Id of created resource"
}
