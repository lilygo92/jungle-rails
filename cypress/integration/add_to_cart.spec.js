describe("Adding item to cart", () => {

  it ("visits the home page of the site", () => {
      cy.visit('/')
  })

  it ("clicks the add to cart button", () => {
    cy.get(':nth-child(1) > div > .button_to > .btn').click( { force: true })
  })

  it("verifies that the cart count increases by one", () => {
    cy.get("[href='/cart']").should('have.text', " \n          My Cart (1) ")
  })

})