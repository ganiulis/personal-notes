---
layout: default
title: Storage structures
---

## Hash Table

A hash function (or: hashing alhorithm) is a calculation applied to a key to
transform it into an address. There's several available methods.

A common issue is open addressing, which can overwrite an already existing item
in a hash table. This is solved by a linked list which can contain several items
chained together (Linear O(n) complexity).

## Balanced Tree

Used for indexing rows. Logarithmic O(logn) complexity. Fixed height. Faster
reading, but slower writing.

Sacrifices some space for speed compared to a linked list.

Rules:

1. Every node has at most x children.
2. Every node, except for the root and the leaves, has at least x/2 children.
3. The root node has at least two children unless it is a leaf.
4. All leaves are at the same height.
5. A non-leaf node with x children has x−1 keys.

# Trace

1. Hash tables. https://www.youtube.com/watch?v=KyUTuwz_b7Q.
2. B-Tree. https://www.youtube.com/watch?v=NI9wYuVIYcA.
3. B-Tree insertion visualization. https://www.youtube.com/watch?v=coRJrcIYbF4.
4. B-Tree deletion visualization. https://www.youtube.com/watch?v=QrbaQDSuxIM.
5. UUID index.
   https://dba.stackexchange.com/questions/102448/how-should-i-index-a-uuid-in-postgres.
