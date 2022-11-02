it("Displays Hello, world", () => {
    cy.visit("http://localhost:3000")
    cy.get(body).should("contain", "Hello, world!")
})