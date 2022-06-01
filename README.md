# getxstarter

A new Flutter project.

## Getting Started 


Make flutter development easy with GetX and Get CLI tool


1. Install
=============
```php
flutter pub global activate get_cli
```
3. To create Project
=================
```php
get create project 
```
a. If no project name is specified it will take the folder name as project name
b. get create project:get_cli_project [project with name]
c. get create project:"get cli project"[project name with space]

3. To create the structure
```php
get init
```
4. Create a page
```php
get create page:login [will create controller, view and binding]
```

5. Create Controller
```php
get create controller:another [By default in Home folder]
```
```php
b. get create controller:another on login 
```

6. Create View
```php
get create view:another [By default in Home folder]
```
```php
get create view:another on login 
```

7. Create Provider
```php
get create provider:covid on login
```

8. Generate localization file
```php
get generate locales assets/locales
```

9. Generate Model
Will create both provider and model
```php
get generate model on login with assets/models/user.json[By default in Home folder]
```
To skip the provider generation
================================
```php
get generate model on login with assets/models/user.json --skipProvider
```

From URL
============
get generate model on login from https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie




10. Install a package
```php
get install camera
```
install several packages
========================
```php
get install http path camera 
```
install with specific version
============================
```php
get install path:1.6.4
```
11. Remove package
==================
To remove a package from your project
======================================
```php
get remove http
```
To remove several packages from your project
============================================
```php
get remove http path
```
```php
get update [Update the CLI] 
```
```php
get -v [CLI version] 
```
```php
get help
```
