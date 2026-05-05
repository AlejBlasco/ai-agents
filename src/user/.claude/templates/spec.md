# Specification: {Feature Name}

## Metadata
- **ID**: S-{spec-number}-{spec name}
- **Date**: {YYYY-MM-DD}
- **Source(s)**: {Links}
- **Status**: Draft | Reviewed | Approved
- **Priority**: Critical | High | Medium | Low


## 1. Purpose

{2-3 sentences describing WHAT will be built}

Example:
"Users can download their profile and activity data in CSV, JSON, or XML format. 
The export completes within 5 seconds for files under 50MB, or via email link for larger files.
Exports expire after 7 days for security."

---

## 2. Functional Requirements

### 1. [MUST] {Requirement Name}

**Description**: {Clear statement of what must happen}

**Acceptance Criteria**:
- [ ] Criteria 1 (specific and measurable)
- [ ] Criteria 2 (testable)
- [ ] Criteria 3 (verifiable by non-technical person)

**Related to**: {If connects to other requirements: "Req 2.1, Req 3.2"}

---

### 2. [SHOULD] {Requirement Name}

**Description**: {What should happen if possible}

**Acceptance Criteria**:
- [ ] Criteria 1
- [ ] Criteria 2

---

### 3. [NICE-TO-HAVE] {Requirement Name}

**Description**: {Nice to have but not critical}

---

## 3. Non-Functional Requirements

### Performance
- Export must complete in < 5 seconds for files < 50MB
- Support up to 10,000 concurrent exports
- Response time < 200ms for API

### Security
- Data encrypted in transit (HTTPS)
- User can only export their own data
- No sensitive data (passwords, tokens) in export
- Audit log all export requests

### Scalability
- Handle 100k users daily
- Database queries optimized for large datasets

### Compatibility
- Support modern browsers (Chrome, Firefox, Safari, Edge)
- Mobile-friendly UI

---

## 4. Acceptance Criteria (Global)

These apply to the entire specification:
- [ ] ...
- [ ] ...
- [ ] ...

---

## 5. Clarifications Needed

[CLARIFY] Questions that need answering:

- [ ] **Question 1**: {Specific thing unclear}
  - Context: {Why is this unclear?}
  - Options: {Possible interpretations}

- [ ] **Question 2**: {Another ambiguity}

---

## 6. Dependencies & Context

### Technical Context (if provided)
- **Stack**: TypeScript, React, NestJS, PostgreSQL
- **Existing Systems**: {What systems this integrates with}
- **Constraints**: {Technical or business limitations}

### Related Features
- Relates to: {Other features or epics}
- Blocks: {What this might block}
- Blocked by: {What must be done first}

### Notes
- Any other relevant context
- Assumptions made during extraction