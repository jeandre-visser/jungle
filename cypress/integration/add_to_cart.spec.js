describe('Jungle', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("A product can be added to the cart from the homepage", () => {
    cy.get("article:first form button").click({ force: true });
    cy.get("nav").should("contain", "My Cart (1)");
  });

})