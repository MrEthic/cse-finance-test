output "base_url" {
  description = "Base URL for API Gateway stage."

  value = aws_apigatewayv2_stage.indoor-air-restapi-stage.invoke_url
}