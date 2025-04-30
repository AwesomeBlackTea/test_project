import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "phone", "username", "phoneError", "usernameError",
    "name", "surname", "birthday", "nameError", "surnameError", "birthdayError",
    "email", "emailError", "password", "passwordError", "passwordConfirmation", "passwordConfirmationError"
  ]

  minimumPasswordLength = 6

  handleSubmit(event) {
    event.preventDefault()

    const validPhone = this.validatePhone(this.phoneTarget)
    const validUsername = this.validateUsername(this.usernameTarget)
    const validName = this.validateName(this.nameTarget)
    const validSurname = this.validateSurname(this.surnameTarget)
    const validBirthday = this.validateBirthday(this.birthdayTarget)
    const validEmail = this.validateEmail(this.emailTarget)
    const validPassword = this.validatePassword(this.passwordTarget)
    const validPasswordConfirmation = this.validatePasswordConfirmation(this.passwordConfirmationTarget)

    if (
      validPhone && validUsername && validName &&
      validSurname && validBirthday && validEmail &&
      validPassword && validPasswordConfirmation
    ) {
      this.element.requestSubmit()
    }
  }

  validatePhone(field) {
    const value = field.value.trim()
    let message = ""
    let isValid = true

    if (value.length < 7 || value.length > 20) {
      message = "Phone must be between 7 and 20 characters"
      isValid = false
    }

    this.showError(field, this.phoneErrorTarget, message, isValid)
    return isValid
  }

  validateUsername(field) {
    const value = field.value.trim()
    let message = ""
    let isValid = true

    if (value.length < 3 || value.length > 20) {
      message = "Username must be between 3 and 20 characters"
      isValid = false
    }

    this.showError(field, this.usernameErrorTarget, message, isValid)
    return isValid
  }

  validateName(field) {
    const value = field.value.trim()
    let message = ""
    let isValid = true

    if (value.length === 0) {
      message = "Name is required"
      isValid = false
    }

    this.showError(field, this.nameErrorTarget, message, isValid)
    return isValid
  }

  validateSurname(field) {
    const value = field.value.trim()
    let message = ""
    let isValid = true

    if (value.length === 0) {
      message = "Surname is required"
      isValid = false
    }

    this.showError(field, this.surnameErrorTarget, message, isValid)
    return isValid
  }

  validateBirthday(field) {
    const value = field.value.trim()
    let message = ""
    let isValid = true

    if (value.length === 0) {
      message = "Birthday is required"
      isValid = false
    }

    this.showError(field, this.birthdayErrorTarget, message, isValid)
    return isValid
  }

  validateEmail(field) {
    const value = field.value.trim()
    let message = ""
    let isValid = true

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/

    if (value.length === 0) {
      message = "Email is required"
      isValid = false
    } else if (!emailRegex.test(value)) {
      message = "Invalid email format"
      isValid = false
    }

    this.showError(field, this.emailErrorTarget, message, isValid)
    return isValid
  }

  validatePassword(field) {
    const value = field.value.trim()
    let message = ""
    let isValid = true

    if (value.length < this.minimumPasswordLength) {
      message = `Password must be at least ${this.minimumPasswordLength} characters`
      isValid = false
    }

    this.showError(field, this.passwordErrorTarget, message, isValid)
    return isValid
  }

  validatePasswordConfirmation(field) {
    const passwordValue = this.passwordTarget.value.trim()
    const confirmValue = field.value.trim()
    let message = ""
    let isValid = true

    if (confirmValue.length === 0) {
      message = "Password confirmation is required"
      isValid = false
    } else if (confirmValue !== passwordValue) {
      message = "Passwords do not match"
      isValid = false
    }

    this.showError(field, this.passwordConfirmationErrorTarget, message, isValid)
    return isValid
  }

  showError(field, errorTarget, message, isValid) {
    if (!isValid) {
      errorTarget.textContent = message
      field.classList.add("border-red-500", "focus:border-red-500", "focus:ring-red-500")
    } else {
      errorTarget.textContent = ""
      field.classList.remove("border-red-500", "focus:border-red-500", "focus:ring-red-500")
    }

    field.setCustomValidity(message)
    field.reportValidity()
  }
}
