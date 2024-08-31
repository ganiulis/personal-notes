---
layout: default
---

# Workflow

My workflow template for new Jira projects:

1. Blocked—need external support
   - Stop: to Ready
   - Restart: to Doing
   - Review: to Review
2. Draft—new issues
   - Promote: to Ready
3. Ready
   - Demote: to Draft
   - Block: to Blocked
   - Start: to Doing
4. Doing
   - Block: to Blocked
   - Stop: to Ready
   - Review: to Review
5. Review—checked by a separate colleague
   - Block: to Blocked
   - Regress: to Doing
   - Complete/Deploy: to Done
6. Done
   - Regress: to Review
