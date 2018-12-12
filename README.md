# Terraform Serverless Resource module

This module simplifies the setup required to deploy Lambda functions under API Gateway. It also sets up CORS for created resources and methods.

It creates resources and sets up HTTP methods to invoke supplied Lambdas.

# Examples

```hcl
# /test
module "test" {
  source = "mewa/serverless-resource/aws"
  version = "1.2.0"

  api = "${aws_api_gateway_rest_api.test_api.id}"
  root_resource = "${aws_api_gateway_rest_api.test_api.root_resource_id}"

  api_key_required = true # false by default

  resource = "test"
  origin = "https://example.com"

  num_methods = 2
  methods = [
    {
      method = "PUT"
      type = "AWS", # Optionally override lambda integration type, defaults to "AWS_PROXY"
      invoke_arn = "${aws_lambda_function.test_put_lambda.invoke_arn}"
    },
    {
      method = "DELETE"
      invoke_arn = "${aws_lambda_function.test_delete_lambda.invoke_arn}"
    }
  ]
}
```
