# PHPStorm Docker Integration

Docker, along with any common PHP extension, has built-in support in PHPStorm.

Many applications within the PHP container can be connected with PHPStorm for
seamless development, debugging, and testing.

# Instructions

## PHP Server

PHPStorm can connect to a remote PHP interpreter:

1. Build and start the PHP Docker container.
2. Add a new remote CLI interpreter.
3. Point to the PHP container in Docker Compose or Docker.
4. Set the `.../php.ini` configuration file if it is not detected.

## Composer

Composer can be connected with PHPStorm:

1. Select the pre-configured remote PHP interpreter.
2. PHPStorm should auto-detect the default configuration.

## PHPUnit

PHPUnit can be connected with PHPStorm:

1. Add a new Test Framework (PHPUnit by Remote Interpreter).
2. Select the preconfigured remote PHP interpreter.
3. Set the autoload file `.../vendor/autoload.php`.
4. Set the configuration file `.../phpunit.xml`.
5. Set the bootstrap file `.../tests/bootstrap.php`.
6. Run some tests and check if the configuration works.

## PHPStan

PHPStan can be connected with PHPStorm.

1. Find PHPStan in Quality Tools.
2. Select and enable the preconfigured PHP interpreter.
3. Set the desired validation level.
4. Set the configuration file `.../phpstan.neon`.
5. Set the autoload file `.../vendor/autoload.php`.

# Tips

1. Most configuration paths are meant to be used inside the container, not the
   host machine.
