data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "../lambda"
  output_path = "lambda.zip"
}

resource "aws_lambda_function" "telegram_bot" {
  function_name = "telegram_ping_pong_bot"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"

  role          = aws_iam_role.lambda_role.arn
  filename      = data.archive_file.lambda_zip.output_path

  timeout       = 10

  environment {
    variables = {
      TELEGRAM_TOKEN = var.telegram_token
    }
  }
}
