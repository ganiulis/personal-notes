---
layout: default
---

# PostgreSQL schema generation fix

## Problem

All migrations for [PostgreSQL](https://www.postgresql.org) produce `CREATE SCHEMA public` as an executable line.

This is a known bug the Doctrine developers deemed too low priority to fix.

## Solution

Taken from <https://github.com/doctrine/dbal/issues/1110>.

An event subscriber is used to remove the `CREATE SCHEMA public` line permanently:

```php
<?php

declare(strict_types=1);

namespace App\EventSubscriber;

use Doctrine\Common\EventSubscriber;
use Doctrine\DBAL\Schema\PostgreSQLSchemaManager;
use Doctrine\DBAL\Schema\SchemaException;
use Doctrine\ORM\Tools\Event\GenerateSchemaEventArgs;
use Doctrine\ORM\Tools\ToolEvents;
use Exception;

class MigrationEventSubscriber implements EventSubscriber
{
    public function getSubscribedEvents(): array
    {
        return [
            ToolEvents::postGenerateSchema,
        ];
    }

    /**
     * @throws SchemaException
     * @throws Exception
     */
    public function postGenerateSchema(GenerateSchemaEventArgs $args): void
    {
        $schemaManager = $args
            ->getEntityManager()
            ->getConnection()
            ->createSchemaManager()
        ;

        if (!$schemaManager instanceof PostgreSqlSchemaManager) {
            return;
        }

        $schema = $args->getSchema();

        foreach ($schemaManager->getExistingSchemaSearchPaths() as $namespace) {
            $schema->hasNamespace($namespace) ?: $schema->createNamespace($namespace);
        }
    }
}
```
