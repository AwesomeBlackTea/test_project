import { Application } from "@hotwired/stimulus"

const application = Application.start()

import DropdownController from "./dropdown_controller"
application.register("dropdown", DropdownController)

import PasswordVisibilityController from "./password_visibility_controller"
application.register("password-visibility", PasswordVisibilityController)

import RegistrationValidationController from "./registration_validation_controller"
application.register("registration-validation", RegistrationValidationController)
