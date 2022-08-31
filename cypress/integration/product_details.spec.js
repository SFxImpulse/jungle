/// <reference types="cypress" />

describe("Jungle", () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it("Clicks on a product and shows the product page", () => {
    cy.get(".products article")
      .first()
      .click();
    
    cy.get(".product-detail").should("be.visible");
  });
});