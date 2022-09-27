const context = describe

describe('loads the homepage', () => {
  context('the homepage is valid and contains the proper content', () => {
    it('loads the products index page', () => {
      cy.visit('localhost:3000/')
      cy.contains('Looking for a way to add some life to your home?')
    })

    it("There are products on the page", () => {
      cy.get(".products article").should("be.visible");
    });

    it("There are 2 products on the page", () => {
      cy.get(".products article").should("have.length", 2);
    });

    it("Before adding, cart should be empty", () => {
      cy.contains('(0)');
    })

    it("The client should be able to click Add to Cart for desired product", () => {
      cy.get(':nth-child(1) > div > .button_to > .btn').click({force: true})
    });

    it("The count on the cart button should increase by one after the click", () => {
      cy.contains('(1)')
    });

    it("If a sold-out item is added to cart, submit should be disabled and count should not change", () => {
      cy.get(':nth-child(2) > div > .button_to > .btn').click({force: true})
      cy.contains('(1)')
    });

  })
})