---
layout: default
---

# Workflow

My workflow template for new Jira projects:

1. Draft: new issues
2. Blocked: need external support
   - Stop: to Ready
   - Unblock: to Doing
3. Ready
   - Regress: to Draft
   - Block: to Blocked
   - Start: to Doing
4. Doing
   - Block: to Blocked
   - Stop: to Ready
   - Finish: to Review
5. Review
   - Block: to Blocked
   - Regress: to Doing
   - Complete/Deploy: to Done
6. Done
   - Regress: to Review
