/// <reference types="cypress" />

describe("Jungle", () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it("Clicks on the add a product to cart and shows the cart has one item in it", () => {
    cy.get(".products > :nth-child(1)");

    cy.get(":nth-child(1) > div > .button_to > .btn")
      .click({ force: true });
    
    cy.get("#navbarSupportedContent > :nth-child(2) > :nth-child(2) > .nav-link").should("have.length", 1);
  });
});