#!/usr/bin/python
# coding: utf8

'a command line module: click'

__author__ = 'Ryan Xue'

import click


@click.command()
def main():
    click.echo('Hello, World!')


if __name__ == '__main__':
    main()
    