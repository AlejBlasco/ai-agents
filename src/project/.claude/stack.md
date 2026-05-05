# Tech Stack

## Metadata
- **Project**: My Project
- **Status**: Active

---

## STACK

### Backend

#### Runtime & Language
- **Primary**: .NET 10 (preferred) or .NET 8
- **Language**: C#
- **Version**: C# 13 (for .NET 10) or C# 12 (for .NET 8)
- **Min Target**: .NET 8

#### Architecture Patterns
- **Architecture Style**: N-Layer (Presentation → Business Logic → Data Access → Database)
- **Design Patterns**: 
  - SOLID principles (all 5)
  - CQRS (Command Query Responsibility Segregation)
  - Repository pattern
  - Dependency Injection (DI)
- **Frameworks & Libraries**:
  - **Mediator**: MediatR (for CQRS)
  - **Validation**: FluentValidation
  - **Logging**: Microsoft.Extensions.Logging
  - **Error Handling**: Polly (resilience)

#### Data Access
- **ORM**: Entity Framework Core (latest compatible)
- **Database**: SQL Server
- **Migrations**: EF Core migrations
<!-- - **Connection String**: Stored in `.env` (development), Azure Key Vault (production) -->

#### API
- **API Type**: REST (JSON)
- **Documentation**: Swagger/OpenAPI
- **Versioning**: URL-based (v1, v2)

---

### Frontend

#### UI Framework
- **Framework**: Blazor WebAssembly
- **Language**: C# / HTML / CSS
- **UI Library**: Radzen
- **HTTP Client**: HttpClient + custom wrappers
- **Testing**: bUnit (for Blazor components)

#### Styling
- **CSS Framework**: Bootstrap
- **Preprocessor**: SCSS ()
- **Design System**: (specify if exists)

---

### DevOps & Cloud

#### Cloud Platform
- **Provider**: Azure
- **Services**:
  <!-- - Azure App Service (for APIs)
  - Azure SQL Database (for database)
  - Azure Storage (for file storage if needed)
  - Azure Key Vault (for secrets)
  - Azure DevOps (pipelines) or GitHub Actions -->

#### CI/CD
- **Platform**: Azure DevOps Pipelines OR GitHub Actions
- **Build**: MSBuild
- **Test Runner**: xUnit
<!-- - **Coverage Tool**: Coverlet -->
<!-- - **Deployment**: Automated on main branch -->

#### Containerization (if applicable)
- **Docker**: (Yes/No, specify if needed)
- **Container Registry**: Azure Container Registry

---

## CONVENCIONES DE CÓDIGO

### Naming
- **Namespaces**: `CompanyName.ProjectName.{Feature}.{Layer}`
  - Example: `MyCompany.MyProject.Authentication.Domain`
- **Classes**: PascalCase
- **Methods**: PascalCase
- **Properties**: PascalCase
- **Private fields**: camelCase with underscore prefix (`_fieldName`)
- **Constants**: UPPER_SNAKE_CASE
- **Async methods**: Suffix with `Async`

---

## File Structure
```
docs/
    Technical/
    Functional/
src/
    {Project Name}/
        Shared/
        Web/
        Client/
    {Project Name}.Application/
    {Project Name}.Domain/
    {Project Name}.Infrastructure.EF/
test/
    {Project Name}.Application.IntegrationTests/
    {Project Name}.Application.UnitTests/
        {Feature Name}/
    {Project Name}.Domain.UnitTests/
    {Project Name}.Shared.UnitTests/
    {Project Name}.Web.AcceptanceTests/
.claude/
    context/
    prompts/
    templates/
    outputs/
        specs/
        tasks/
```

---

## TOOLS & TESTING

### Unit Testing
- **Framework**: xUnit
- **Mocking**: Moq
- **Coverage Target**: 85% minimum
- **Assertion Library**: FluentAssertions

### Integration Testing
- **Framework**: xUnit with TestContainers
- **Database**: SQL Server test containers
- **API Testing**: HttpClient

### Code Quality
- **Linter**: StyleCop or Roslyn analyzers
- **Code Review**: Azure DevOps PR reviews (mandatory)
- **Static Analysis**: SonarQube

### Performance
- **Profiling**: Visual Studio profiler
- **Load Testing**: (if needed, specify tool)
- **Benchmarking**: BenchmarkDotNet

---

## SECURITY

### Authentication & Authorization
- **Method**: JWT (JSON Web Tokens) or Azure AD
- **Password Hashing**: bcrypt or similar (EF Core built-in if using Identity)
- **HTTPS**: Mandatory for all endpoints
- **CORS**: Configured for Blazor WASM

### Data Protection
- **Encryption in Transit**: TLS 1.2+
- **Encryption at Rest**: Azure SQL encryption
- **Secrets Management**: Azure Key Vault
- **Environment Variables**: Never commit secrets to Git

### API Security
- **Rate Limiting**: (Implement or Azure API Management)
- **Input Validation**: FluentValidation
- **SQL Injection Prevention**: EF Core parameterized queries only
- **XSS Protection**: Blazor automatic encoding

---

## PERFORMANCE REQUIREMENTS

### Backend API
- **Response Time**: < 200ms (p95) for standard queries
- **Throughput**: Handle 1000 concurrent requests
- **Database**: Queries < 500ms (optimize with indexes)
- **Memory**: Monitor with Azure Application Insights

### Frontend
- **Load Time**: < 3 seconds (initial load)
- **Time to Interactive**: < 5 seconds
- **Bundle Size**: < 1MB (gzipped)

---

## UPDATING THIS DOCUMENT

This stack document should be:
- **Reviewed**: Every 6 months
- **Updated**: When new major dependencies are added
- **Versioned**: Use semantic versioning (1.0.0)
- **Communicated**: Notify team of changes

---

## REFERENCES

- [.NET Documentation](https://docs.microsoft.com/dotnet)
- [Blazor Documentation](https://docs.microsoft.com/aspnet/core/blazor)
- [SOLID Principles](https://en.wikipedia.org/wiki/SOLID)
- [CQRS Pattern](https://martinfowler.com/bliki/CQRS.html)
- [Azure Documentation](https://docs.microsoft.com/azure)

---

## VERSION HISTORY

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2025-05-05 | Initial stack definition |
| | | |