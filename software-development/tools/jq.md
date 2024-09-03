---
layout: default
---

# jq

## Introduction

[jq](https://jqlang.github.io/jq/) is a [JSON](https://www.json.org/json-en.html) parser and formatter for the command-line. It ingests JSON as input and yields human-readable output.

Useful for parsing JSON-formatted system logs.

## Use

Filtering and selecting:

```bash
cat my.json | jq 'select ( .first_key.second_key[1].second_object_key == "my value" ).filtered_result_key'
```

Output may be piped into [less](<https://en.wikipedia.org/wiki/Less_(Unix)>) or a similar tool:

```bash
cat my.json | jq -C | less -R
```
