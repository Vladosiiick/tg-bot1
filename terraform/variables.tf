variable "region" {
  type        = string
  default     = "eu-central-1"
}

variable "telegram_token" {
  type        = string
  description = "Telegram bot token"
  sensitive   = true
}
