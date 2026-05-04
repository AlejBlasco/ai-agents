```
SPEC_ID: S-XXX

TASKS:

[TASK-001]
TITLE: ...
DESCRIPTION: ...
FILES_ALLOWED:
- ...
DEPENDENCIES: none
CHECKLIST:
- ...
TEST_CONTRACT:
- ...

[TASK-002]
TITLE: ...
DESCRIPTION: ...
FILES_ALLOWED:
- ...
DEPENDENCIES: TASK-001
CHECKLIST:
- ...
TEST_CONTRACT:
- ...
```

---

CONSTRAINTS:

- Respect architecture if defined in context
- Do NOT modify unspecified files
- Prefer smaller tasks over larger ones
- Each task must be independently verifiable