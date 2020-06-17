# resource
resource "aws_api_gateway_resource" "resource" {
  rest_api_id = var.api
  parent_id   = var.root_resource
  path_part   = var.resource
}

# resource methods
resource "aws_api_gateway_method" "method" {
  for_each = toset(var.methods[*].method)

  rest_api_id   = var.api
  resource_id   = aws_api_gateway_resource.resource.id
  authorization = "NONE"

  api_key_required = var.api_key_required

  http_method = each.key
}

resource "aws_api_gateway_method_response" "method_response" {
  for_each   = toset(var.methods[*].method)
  depends_on = [aws_api_gateway_method.method]

  rest_api_id = var.api
  resource_id = aws_api_gateway_resource.resource.id

  http_method = each.key

  status_code = "200"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true
  }
}

resource "aws_api_gateway_integration_response" "integration_response" {
  for_each   = toset(var.methods[*].method)
  depends_on = [aws_api_gateway_method_response.method_response]

  rest_api_id = var.api
  resource_id = aws_api_gateway_resource.resource.id

  http_method = each.key

  status_code = "200"
}

# resource lambdas
resource "aws_api_gateway_integration" "resource_lambda_integration" {
  for_each   = {for m in var.methods: m.method => m}
  depends_on = [aws_api_gateway_method.method]

  rest_api_id = var.api
  resource_id = aws_api_gateway_resource.resource.id

  http_method = each.key

  integration_http_method = "POST"
  type                    = each.value.type != null ? each.value.type : "AWS_PROXY"
  uri                     = each.value.invoke_arn
}

module "resource_cors" {
  source  = "mewa/apigateway-cors/aws"
  version = "2.0.0"

  api      = var.api
  resource = aws_api_gateway_resource.resource.id

  methods = var.methods[*].method

  origin = var.origin
}
