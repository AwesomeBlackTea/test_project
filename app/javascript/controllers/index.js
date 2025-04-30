// app/javascript/controllers/index.js
import { Application } from "@hotwired/stimulus"
import PasswordVisibilityController from "./password_visibility_controller"
import RegistrationValidationController from "./registration_validation_controller"

const application = Application.start()

application.register("password-visibility", PasswordVisibilityController)
application.register("registration-validation", RegistrationValidationController)