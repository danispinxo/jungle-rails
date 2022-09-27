const context = describe

describe('loads the product details page', () => {
  context('the details page for a particular product', () => {
    it('loads the products index page', () => {
      cy.visit('localhost:3000/')
      cy.contains('Looking for a way to add some life to your home?')
    })

    it("There are products on the page", () => {
      cy.get(".products article").should("be.visible");
    });


    it("If you click a card it moves to that product's details page", () => {
      cy.contains('Scented Blade').click()
      cy.get(".product-detail").should("be.visible")
    });

  })
})