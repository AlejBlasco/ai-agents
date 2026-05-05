# Conventions

This document defines the coding and organizational conventions for multi-agent, .NET-based solutions.

## 1. Project Structure

- Each architectural layer (Application, Domain, Web, etc.) should reside in its own project.
- Source files are organized by feature or functional area (e.g., `Currency/`, `Payment/`, `Purchase/`, `Sales/`).
- Embedded resources (such as workflow JSON files) must be included using `<EmbeddedResource>` in the project file.

---

## 2. Naming Conventions

### 2.1. Files and Folders

- Folder names use **PascalCase**: `Purchase`, `Sales`.
- Class files use **PascalCase** and reflect the type and purpose:  
  Example: `PurchaseDocumentWorkflow@1.json`, `PurchaseService.cs`.
- Resource files use descriptive names and, if necessary, versioning with `@`.

### 2.2. Classes and Methods

- Classes, interfaces, and enums: **PascalCase**  
  Example: `PurchaseDocumentService`, `ICurrencyRepository`
- Methods and properties: **PascalCase**  
  Example: `GetAllPurchases()`, `IsActive`
- Private fields: **_camelCase**  
  Example: `_logger`, `_repository`
- Parameters and local variables: **camelCase**  
  Example: `purchaseId`, `currencyCode`

### 2.3. Interfaces

- Prefix interfaces with `I`: `IService`, `IRepository`

### 2.4. Query/Command Pattern

- Use the suffixes `Query` and `Command` for MediatR classes:  
  Example: `GetPurchaseQuery`, `CreatePaymentCommand`

---

## 3. Usings and Nullability

- Enable `ImplicitUsings`.
- Enable nullable reference types (`<Nullable>enable</Nullable>`).

---

## 4. Dependencies

- Always use dependency injection.
- Register validators with FluentValidation.
- Use MediatR for CQRS.

---

## 5. Test Organization

- Tests should mirror the application structure and use the same class names with the `Tests` suffix.

---

## 6. JSON and Embedded Resources

- JSON workflow files must be placed in the corresponding feature folder and embedded in the project.
- Use descriptive and versioned names if necessary.

---

## 7. File Cleanup

- Remove unused files from the project using `<Compile Remove=...>` or equivalent mechanisms.
- Use project references for internal dependencies.

---

## 8. CQRS: Handler and Validator Co-location

- The **Command Handler** or **Query Handler** and its corresponding **Validator** (if any) **must be defined in the same `.cs` file**.
- This improves maintainability and discoverability of related logic.
- Example:  
  - `CreatePurchase.cs` should contain both the handler (`CreatePurchaseCommandHandler`) and the validator (`CreatePurchaseCommandValidator`).

---
