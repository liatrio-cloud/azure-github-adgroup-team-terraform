variable "team_name" {
  type = string
}

variable "permission" {
  type = string
}

variable "org" {
  type = string
}

variable "team_description" {
  type    = string
  default = ""
}

variable "team_privacy" {
  type    = string
  default = "closed"
}

variable "team_repos" {
  type        = list(string)
  description = "Additional repositories to be managed by the team"
  default     = []
}