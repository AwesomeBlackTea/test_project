// app/javascript/controllers/index.js
import { Application } from "@hotwired/stimulus"
import PasswordVisibilityController from "./password_visibility_controller"

window.Stimulus = Application.start()
Stimulus.register("password-visibility", PasswordVisibilityController)