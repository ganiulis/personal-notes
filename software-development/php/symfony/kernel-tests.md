---
layout: default
---

# Kernel tests

Tests which extend `Symfony\Bundle\FrameworkBundle\Test\KernelTestCase` may be
confusing to set up for first-time users. However, the required configuration is
minimal.

# Instructions

Minimal `phpunit.xml` configuration (extended by
[Symfony](https://symfony.com)):

```xml
<?xml version="1.0" encoding="UTF-8"?>

<phpunit xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:noNamespaceSchemaLocation="vendor/phpunit/phpunit/phpunit.xsd"
         bootstrap="tests/bootstrap.php"
         colors="true"
>
    <php>
        <ini name="display_errors" value="1" />
        <ini name="error_reporting" value="-1" />
        <ini name="memory_limit" value="2G" />

        <server name="APP_ENV" value="test" force="true" />
        <server name="SYMFONY_PHPUNIT_VERSION" value="9.5" />
    </php>

    <testsuites>
        <testsuite name="Unit">
            <directory>tests/Unit</directory>
        </testsuite>
        <testsuite name="Functional">
            <directory>tests/Functional</directory>
            <file>"tests/Functional/bootstrap.php"</file>
        </testsuite>
    </testsuites>

    <coverage processUncoveredFiles="true">
        <include>
            <directory suffix=".php">src</directory>
        </include>
    </coverage>
</phpunit>
```

`KERNEL_CLASS=...\Kernel` must be set in one of several places:

1. In `phpunit.xml` as `<env name="KERNEL_CLASS" value="..."/>`.
2. In`.env.test` and imported with an environment class, such as
   `Symfony\Component\Dotenv\Dotenv`.

In this case, inside `tests` there must be a `bootstrap.php`, and a secondary
`bootstrap.php` inside `tests/Functional` for functional tests.

Minimal `bootstrap.php`:

```php
<?php

declare(strict_types=1);

use Symfony\Component\Dotenv\Dotenv;

(new Dotenv())->bootEnv(dirname(__DIR__) . '/.env.test');
```

Functional tests which require an intricate setup can have its own bootstrap
script which imports the real bootstrap and initiates the Kernel and the
Application mechanisms.

Minimal functional `bootstrap.php`:

```php
<?php

declare(strict_types=1);

require_once dirname(__DIR__) . '/bootstrap.php';

use Symfony\Bundle\FrameworkBundle\Console\Application;
use My\Kernel;

$kernel = new Kernel(environment: 'test', debug: false);

$kernel->boot();

$application = new Application($kernel);

// Set up...
```

In this case you can run `bin/phpunit --testsuite Unit` and
`bin/phpunit --testsuite Functional` to trigger each bootstrap script
separately.

Make sure to read the errors if there's more issues.
