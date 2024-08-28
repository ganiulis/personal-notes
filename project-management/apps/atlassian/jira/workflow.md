---
layout: default
---

# Workflow

My workflow template for new Jira projects:

1. Draft: new issues
   - Prepare: to Ready
2. Blocked: need external support
   - Stop: to Ready
   - Restart: to Doing
   - Review: to Review
3. Ready
   - Draft: to Draft
   - Block: to Blocked
   - Start: to Doing
4. Doing
   - Block: to Blocked
   - Stop: to Ready
   - Review: to Review
5. Review
   - Block: to Blocked
   - Regress: to Doing
   - Complete/Deploy: to Done
6. Done
   - Regress: to Review
