describe('Jungle', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("The product details are shown after product is clicked", () => {
    cy.get("article:first").click().should("be.visible");
    cy.get("section").should("have.class", "products-show");
  });

})