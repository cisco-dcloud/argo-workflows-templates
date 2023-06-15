variable "input_string" {
  type        = string
  description = "Bogus string input"
  default     = "default_string_input"
}

variable "input_number" {
  type        = number
  description = "Bogus number input"
  default     = 100
}

variable "input_bool" {
  type        = bool
  description = "Bogus bool input"
  default     = true
}

variable "input_list_of_strings" {
  type        = list(string)
  description = "Bogus list of strings"
  default = [ var.input_string , var.input_string]
}

variable "input_list_of_objects" {
  type        = list(object({
    key1     = string
    key2     = number
    key3     = bool
  }))
  description = "List of objects"
  default = [
      {
        my_string_1 = var.input_string
        my_number_1 = var.input_number
        my_bool_1   = var.input_bool
      },
      {
        my_string_2 = var.input_string
        my_number_2 = var.input_number
        my_bool_2   = var.input_bool
      }      
    ]
}
