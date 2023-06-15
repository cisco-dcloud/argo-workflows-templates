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
  default = [ "string1" , "string2"]
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
        key1 = "string1"
        key2 = 1
        key3   = true
      },
      {
        key1 = "string2"
        key2 = 2
        key3   = false
      }      
    ]
}
