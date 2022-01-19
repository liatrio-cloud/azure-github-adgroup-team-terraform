variable "org" {
  type        = string
  description = "GitHub org to manage teams in"
  default     = "OneGHEOrg"
}

variable "default_access" {
  type        = string
  description = "Default access level to give teams"
  default     = "maintain"
}