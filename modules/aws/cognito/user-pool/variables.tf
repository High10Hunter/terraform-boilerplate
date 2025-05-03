### AWS Cognito user pool variables ###
variable "user_pool_name" {
  description = "Name of the user pool"
  type        = string
}

variable "email_verification_message" {
  description = "Content of the email verification message"
  type        = string
  default     = "Your verification code is {####}"
}

variable "email_verification_subject" {
  description = "Subject of the email verification message"
  type        = string
  default     = "Your verification code"
}

# username configuration
variable "username_configuration" {
  description = "The username configuration"
  type        = map(any)
  default     = {}
}

# admin create user configuration
variable "admin_create_user_config" {
  description = "The configuration for AdminCreateUser requests"
  type        = map(any)
  default     = {}
}

variable "admin_create_user_config_allow_admin_create_user_only" {
  description = "True if only the administrator is allowed to create user profiles. False if users can sign themselves up via an app"
  type        = bool
  default     = true
}

variable "temporary_password_validity_days" {
  description = "The user account expiration limit, in days, after which the account is no longer usable"
  type        = number
  default     = 7
}

variable "admin_create_user_config_email_message" {
  description = "The template for email messages. Must contain `{username}` and `{####}` placeholders, for username and temporary password, respectively"
  type        = string
  default     = "Your username is {username} and temporary password is {####}"
}


variable "admin_create_user_config_email_subject" {
  description = "The subject of email messages"
  type        = string
  default     = "Your verification code"
}

variable "admin_create_user_config_sms_message" {
  description = "- The message template for SMS messages. Must contain `{username}` and `{####}` placeholders, for username and temporary password, respectively"
  type        = string
  default     = "Your username is {username} and temporary password is {####}"
}

variable "alias_attributes" {
  description = "Attributes supported as an alias for this user pool. Possible values: phone_number, email, or preferred_username. Conflicts with `username_attributes`"
  type        = list(string)
  default     = null
}

variable "username_attributes" {
  description = "Specifies whether email addresses or phone numbers can be specified as usernames when a user signs up. Conflicts with `alias_attributes`"
  type        = list(string)
  default     = null
}

variable "deletion_protection" {
  description = "Whether to prevents accidental deletion of your user pool. Valid values are `ACTIVE` and `INACTIVE`"
  type        = string
  default     = "INACTIVE"
}

variable "auto_verified_attributes" {
  description = "The attributes to be auto-verified. Possible values: email, phone_number"
  type        = list(string)
  default     = []
}

# sms configuration
variable "sms_configuration" {
  description = "The SMS Configuration"
  type        = map(any)
  default     = {}
}

variable "sms_configuration_external_id" {
  description = "The external ID used in IAM role trust relationships"
  type        = string
  default     = ""
}

variable "sms_configuration_sns_caller_arn" {
  description = "The ARN of the Amazon SNS caller"
  type        = string
  default     = ""
}

# device configuration
variable "device_configuration" {
  description = "The configuration for the user pool's device tracking"
  type        = map(any)
  default     = {}
}

variable "device_configuration_challenge_required_on_new_device" {
  description = "Indicates whether a challenge is required on a new device"
  type        = bool
  default     = false
}

variable "device_configuration_device_only_remembered_on_user_prompt" {
  description = "If true then a device is only remembered on user prompt"
  type        = bool
  default     = false
}

# email configuration
variable "email_configuration" {
  description = "The Email Configuration"
  type        = map(any)
  default     = {}
}

variable "email_configuration_configuration_set" {
  description = "The name of the configuration set"
  type        = string
  default     = null
}

variable "email_configuration_reply_to_email_address" {
  description = "The REPLY-TO email address"
  type        = string
  default     = ""
}

variable "email_configuration_source_arn" {
  description = "The ARN of the email source"
  type        = string
  default     = ""
}

variable "email_configuration_email_sending_account" {
  description = "Instruct Cognito to either use its built-in functionality or Amazon SES to send out emails. Allowed values: `COGNITO_DEFAULT` or `DEVELOPER`"
  type        = string
  default     = "COGNITO_DEFAULT"
}

variable "email_configuration_from_email_address" {
  description = "Sender's email address or sender’s display name with their email address"
  type        = string
  default     = null
}

variable "mfa_configuration" {
  description = "Set to enable multi-factor authentication. Must be one of the following values (ON, OFF, OPTIONAL)"
  type        = string
  default     = "OFF"
}

# password policy
variable "password_policy" {
  description = "A container for information about the user pool password policy"
  type = object({
    minimum_length                   = number,
    require_lowercase                = bool,
    require_numbers                  = bool,
    require_symbols                  = bool,
    require_uppercase                = bool,
    temporary_password_validity_days = number
  })
  default = null
}

variable "password_policy_minimum_length" {
  description = "The minimum length of the password policy that you have set"
  type        = number
  default     = 8
}

variable "password_policy_require_lowercase" {
  description = "Whether you have required users to use at least one lowercase letter in their password"
  type        = bool
  default     = true
}

variable "password_policy_require_numbers" {
  description = "Whether you have required users to use at least one number in their password"
  type        = bool
  default     = true
}

variable "password_policy_require_symbols" {
  description = "Whether you have required users to use at least one symbol in their password"
  type        = bool
  default     = true
}

variable "password_policy_require_uppercase" {
  description = "Whether you have required users to use at least one uppercase letter in their password"
  type        = bool
  default     = true
}

variable "password_policy_temporary_password_validity_days" {
  description = "The minimum length of the password policy that you have set"
  type        = number
  default     = 7
}

# schema user attributes configuration
variable "schemas" {
  description = "A container with the schema attributes of a user pool. Maximum of 50 attributes"
  type        = list(any)
  default     = []
}

variable "string_schemas" {
  description = "A container with the string schema attributes of a user pool. Maximum of 50 attributes"
  type        = list(any)
  default     = []
}

variable "number_schemas" {
  description = "A container with the number schema attributes of a user pool. Maximum of 50 attributes"
  type        = list(any)
  default     = []
}

# sms messages
variable "sms_authentication_message" {
  description = "Content of the SMS authentication message"
  type        = string
  default     = null
}

variable "sms_verification_message" {
  description = "Content of the SMS verification message"
  type        = string
  default     = null
}

# tags
variable "tags" {
  description = "The tags to assign to the User Pool"
  type        = map(string)
  default     = {}
}

# user attribute update settings
variable "user_attribute_update_settings" {
  description = "Configuration block for user attribute update settings. Must contain key `attributes_require_verification_before_update` with list with only valid values of `email` and `phone_number`"
  type        = map(list(string))
  default     = null
}

# user pool add ons
variable "user_pool_add_ons" {
  description = "Configuration block for user pool add-ons to enable user pool advanced security mode features"
  type        = map(any)
  default     = {}
}

variable "user_pool_add_ons_advanced_security_mode" {
  description = "The mode for advanced security, must be one of `OFF`, `AUDIT` or `ENFORCED`"
  type        = string
  default     = null
}

# verification message template
variable "verification_message_template" {
  description = "The verification message templates configuration"
  type        = map(any)
  default     = {}
}

variable "verification_message_template_default_email_option" {
  description = "The default email option. Must be either `CONFIRM_WITH_CODE` or `CONFIRM_WITH_LINK`. Defaults to `CONFIRM_WITH_CODE`"
  type        = string
  default     = "CONFIRM_WITH_CODE"
}

variable "verification_message_template_email_message_by_link" {
  description = "The email message template for sending a confirmation link to the user, it must contain the `{##Click Here##}` placeholder"
  type        = string
  default     = null
}

variable "verification_message_template_email_subject_by_link" {
  description = "The subject line for the email message template for sending a confirmation link to the user"
  type        = string
  default     = null
}

# account recovery setting
variable "recovery_mechanisms" {
  description = "The list of Account Recovery Options"
  type        = list(any)
  default     = []
}

# lambda configuration
variable "lambda_config" {
  description = "A container for the lambda triggers configuration associated with the user pool"
  type        = any
  default     = {}
}

variable "lambda_config_create_auth_challenge" {
  description = "The ARN of the lambda creating an authentication challenge."
  type        = string
  default     = null
}

variable "lambda_config_custom_message" {
  description = "A custom Message AWS Lambda trigger."
  type        = string
  default     = null
}

variable "lambda_config_define_auth_challenge" {
  description = "Defines the authentication challenge."
  type        = string
  default     = null
}

variable "lambda_config_post_authentication" {
  description = "A post-authentication AWS Lambda trigger"
  type        = string
  default     = null
}

variable "lambda_config_post_confirmation" {
  description = "A post-confirmation AWS Lambda trigger"
  type        = string
  default     = null
}

variable "lambda_config_pre_authentication" {
  description = "A pre-authentication AWS Lambda trigger"
  type        = string
  default     = null
}
variable "lambda_config_pre_sign_up" {
  description = "A pre-registration AWS Lambda trigger"
  type        = string
  default     = null
}

### AWS Cognito user pool client ###
variable "clients" {
  description = "A container with the clients definitions"
  type        = any
  default     = []
}

variable "client_allowed_oauth_flows" {
  description = "The name of the application client"
  type        = list(string)
  default     = []
}

variable "client_allowed_oauth_flows_user_pool_client" {
  description = "Whether the client is allowed to follow the OAuth protocol when interacting with Cognito user pools"
  type        = bool
  default     = true
}

variable "client_allowed_oauth_scopes" {
  description = "List of allowed OAuth scopes. Valid values are (phone, email, openid, profile, and aws.cognito.signin.user.admin)"
  type        = list(string)
  default     = []
}

variable "client_auth_session_validity" {
  description = "Session token duration to for user pool native user respond to authentication challenge. Valid values between 3 and 15. Default value is 3."
  type        = number
  default     = 3
}

variable "client_callback_urls" {
  description = "List of allowed callback URLs for the identity providers"
  type        = list(string)
  default     = []
}

variable "client_default_redirect_uri" {
  description = "The default redirect URI. Must be in the list of callback URLs"
  type        = string
  default     = ""
}

variable "client_enable_token_revocation" {
  description = "Whether the client token can be revoked"
  type        = bool
  default     = true
}

variable "client_explicit_auth_flows" {
  description = "List of authentication flows (ADMIN_NO_SRP_AUTH, CUSTOM_AUTH_FLOW_ONLY, USER_PASSWORD_AUTH, ALLOW_ADMIN_USER_PASSWORD_AUTH, ALLOW_CUSTOM_AUTH, ALLOW_USER_PASSWORD_AUTH, ALLOW_USER_SRP_AUTH, ALLOW_REFRESH_TOKEN_AUTH)"
  type        = list(string)
  default     = []
}

variable "client_generate_secret" {
  description = "Whether an application secret be generated"
  type        = bool
  default     = false
}

variable "client_logout_urls" {
  description = "List of allowed logout URLs for the identity providers"
  type        = list(string)
  default     = []
}

variable "client_name" {
  description = "The name of the application client"
  type        = string
  default     = null
}

variable "client_read_attributes" {
  description = "List of user pool attributes the application client can read from"
  type        = list(string)
  default     = []
}

variable "client_prevent_user_existence_errors" {
  description = "Errors response when user does not exist. Valid values are `ENABLED` and `LEGACY`"
  type        = string
  default     = null
}

variable "client_supported_identity_providers" {
  description = "List of provider names for the identity providers that are supported on this client"
  type        = list(string)
  default     = []
}

variable "client_write_attributes" {
  description = "List of user pool attributes the application client can write to"
  type        = list(string)
  default     = []
}

variable "client_access_token_validity" {
  description = "Time limit after which the access token is no longer valid and cannot be used, between 5 minutes and 1 day"
  type        = number
  default     = 60
}

variable "client_id_token_validity" {
  description = "Time limit after which the access token is no longer valid and cannot be used, between 5 minutes and 1 day"
  type        = number
  default     = 60
}

variable "client_refresh_token_validity" {
  description = "The time limit in days refresh tokens are valid for. Must be between 60 minutes and 3650 days"
  type        = number
  default     = 30
}

variable "client_token_validity_units" {
  description = "Configuration block for units in which the validity times are represented in. Valid values for the following arguments are: `seconds`, `minutes`, `hours` or `days`."
  type        = any
  default = {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "days"
  }
}

### AWS Cognito user pool domain ###
variable "domain" {
  description = "The domain for user pool"
  type        = string
  default     = null
}

variable "certificate_arn" {
  description = "The ARN of an ACM certificate for secured domain"
  type        = string
  default     = null
}

### AWS Cognito user pool identity ###
variable "identity_providers" {
  description = "A list of identity providers"
  type        = list(any)
  default     = []
  sensitive   = true
}

