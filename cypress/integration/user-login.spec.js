const context = describe

describe('users can sign up and log in or log out', () => {
  context('The registration and login/logout features work successfully', () => {
    it('loads the products index page', () => {
      cy.visit('localhost:3000/');
      cy.contains('Looking for a way to add some life to your home?');
    })

    it('Clicks on Sign Up and navigates to the registration page', () => {
      cy.get('#navbarSupportedContent > :nth-child(2) > :nth-child(2) > .nav-link').click()
      cy.contains('Sign Up for an Account')
    })

    it('Successfully registers for an account', () => {
      cy.get('#user_name').type('Axl Rose')
      cy.get('#user_email').type('gnrforever@fakemail.com')
      cy.get('#user_password').type('password')
      cy.get('#user_password_confirmation').type('password')
      cy.get('.btn').click()
    })

    it('Is logged in after registration', () => {
      cy.contains('Signed in as: Axl Rose')
    })

    it('Can log out from the homepage', () => {
      cy.get('#navbarSupportedContent > :nth-child(2) > :nth-child(2) > .nav-link').click()
    })

    it('Can click link to navigate to login page', () => {
      cy.visit('localhost:3000/');
      cy.get('#navbarSupportedContent > :nth-child(2) > :nth-child(1) > .nav-link').click()
      cy.contains('Log In to Your Account')
    })

    it('Cannot login using incorrect credentials', () => {
      cy.get('#email').type('gnrforever@fakemail.com')
      cy.get('#password').type('incorrectpassword')
      cy.get('.btn').click()
      cy.contains('Log In to Your Account')
    })

    it('Can successfully login using proper credentials', () => {
      cy.get('#email').type('gnrforever@fakemail.com')
      cy.get('#password').type('password')
      cy.get('.btn').click()
      cy.contains('Signed in as: Axl Rose')
    })

    it('Can logout from a different page', () => {
      cy.get('.me-auto > [href="/about"]').click()
      cy.get('#navbarSupportedContent > :nth-child(2) > :nth-child(2) > .nav-link').click()
      cy.contains('Signup')
    })

  })

})