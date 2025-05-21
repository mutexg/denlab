## Name

pkg - Package Manager

## Synopsis

```**sh
$ pkg [-l] [-u] [-v] [-q package]
```

## Description

This program can list installed packages and query for [available packages](https://github.com/DenLabOS/denlab/blob/master/Ports/AvailablePorts.md). The [Ports for DenLabOS website](https://ports.denlabos.net) has more detailed information about available packages.

It does not currently support installing and uninstalling packages. To install third-party software use the [Ports system](https://github.com/DenLabOS/denlab/blob/master/Ports/README.md).

## Options

-   `-l`, `--list-manual-ports`: Show all manually-installed ports
-   `-u`, `--update-ports-database`: Sync/Update ports database
-   `-v`, `--verbose`: Verbose output
-   `-q`, `--query-package`: Query the ports database for package name

## Arguments

-   `package`: The name of the package you want to query

## Example

```sh
# Query the ports database for the denlab-theming package
$ pkg -q denlab-theming
```
