describe("Product Details", () => {

  it ("visits the home page of the site", () => {
      cy.visit('/')
  })

  it ("clicks the link to the product details page", () => {
    cy.get("[alt='Scented Blade']").click()
  })

  it("should have the product description on the page", () => {
    cy.get(".product-detail p").should('be.visible')
  })

  it("should display stock information", () => {
    cy.get('.quantity').should('be.visible')
  })

})