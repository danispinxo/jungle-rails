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
  })
})