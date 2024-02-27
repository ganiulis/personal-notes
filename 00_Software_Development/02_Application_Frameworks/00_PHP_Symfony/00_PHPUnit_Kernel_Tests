# Summary

Tests which extend `Symfony\Bundle\FrameworkBundle\Test\KernelTestCase` may be confusing to set up for first-time users. However, the required configuration is minimal.

# Instructions

Minimal `phpunit.xml` configuration:

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
        <testsuite name="Project Test Suite">
            <directory>tests</directory>
        </testsuite>
    </testsuites>

    <coverage processUncoveredFiles="true">
        <include>
            <directory suffix=".php">src</directory>
        </include>
    </coverage>
</phpunit>

```

`KERNEL_CLASS=Vengine\RentalAllocation\Kernel` must be set in either `phpunit.xml` or `.env.test`.

Make sure to read the errors if there's more issues.
