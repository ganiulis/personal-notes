---
layout: default
title: OPcache and the Just-in-Time Compiler
---

## Synopsis

Before 8.0 the PHP interpeter parsed and compiled each PHP script into byte
codes which could be processed by a virtual machine (Zend Engine).

This is inefficient when running the same scripts over and over again.

OPcache was introduced in 5.5 which caches unchanged PHP scripts, skipping the
step to parse and process each line.

JIT is another technology on top of OPcache which attempts to optimize and
compile each possible PHP script path at runtime once the line is cached.

JIT decides to precompile based on the frequency, usage and size of the script.
The technology does not precompile everything. For some applications such as
Wordpress this technology may decrease performance.

For CPU-intensive tasks such as mandelbrot set generation, OPcache with JIT may
increase performance tenfold or more.

OPcache and JIT is configured through `php.ini`.

## Procedures

PHP code goes through a set of layers at runtime. Without JIT:

1. Byte code (or: op code) generation by OPcache
2. Machine code generation by the virtual machine (Zend Engine)
3. CPU

With JIT:

1. Byte code generation (or: op code) generation by OPcache
2. JIT compiler activation
3. Machine code retrieval from the JIT buffer
4. CPU

# Trace

1. PHP 8.0: JIT. PHPWatch. https://php.watch/versions/8.0/JIT.
2. JIT Compiler in PHP. Atakan Demircioğlu. Medium.
   https://medium.com/developers-keep-learning/jit-compiler-in-php-655d690f976c.
3. OPcache. PHP Manual. https://www.php.net/manual/en/book.opcache.php.
4. PHP 8: JIT performance in real-life web applications. Brent. stitcher.io.
   https://stitcher.io/blog/jit-in-real-life-web-applications.
