# Terraform Serverless Resource module

This module simplifies the setup required to deploy Lambda functions under API Gateway (v1/REST). It also sets up CORS for created resources and methods.

It creates resources and sets up HTTP methods to invoke supplied Lambdas.

# Examples

```hcl
# /test
module "test" {
  source  = "mewa/serverless-resource/aws"
  version = "2.0.0"

  api           = aws_api_gateway_rest_api.api.id
  root_resource = aws_api_gateway_rest_api.api.root_resource_id

  api_key_required = true # false by default

  resource = "test"
  origin   = "https://example.com" # optional, defaults to "*"

  methods = [
    {
      method     = "PUT" # HTTP method
      type       = "AWS" # lambda integration type
      invoke_arn = aws_lambda_function.test_put_lambda.invoke_arn # lambda invoke ARN
    },
    {
      method     = "DELETE"
      type       = null # if null defaults to "AWS_PROXY"
      invoke_arn = aws_lambda_function.test_delete_lambda.invoke_arn
    }
  ]
}
```
