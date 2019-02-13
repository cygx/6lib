# 6lib

Creates local symlink-based Perl6 module repositories


# Synopsis

```
Usage:
  6lib init -- create repository in current working directory
  6lib add [<libs> ...] -- eagerly add libs to repository
  6lib rm [<libs> ...] -- lazily remove libs from repository
  6lib sync -- synchronize repository with indexed libs
  6lib list -- list indexed libs
  6lib prune -- lazily remove missing libs from index
  6lib flush -- delete precompilation cache
  6lib clear -- clear repository but keep index
  6lib clobber -- remove repository
  6lib -C <dir> [<command> ...] -- specify location of target repository
```

# Example Usage

```shell
perl6 -Ilib -I../other/lib script.p6

# equivalent call using a local repository
6lib init
6lib add . ../other
perl6 -I.6lib script.p6

# equivalent call using a global repository
export PERL6LIB=$HOME/.6lib
6lib -C $HOME init
6lib -C $HOME add . ../other
perl6 script.p6
```

# Description

Modules are identified by their absolute paths. For each file in a module's
`lib` subdirectory, a symbolic link is created in the `.6lib` repository.

Paths to module directories are kept in an index file `.6lib/lib.list`.

### Warning

When adding source files to a module's `lib` directory, you need to re-add the module or call `6lib sync` afterwards!

# A Note on Windows Usage

The creation of symbolic links in non-administrator mode is only permitted
if *Developer mode* has been enabled. This can be done in Windows 10 in the
settings under *Update & security* / *For developers*.


# Bugs and Development

Development happens at [GitHub][GH]. If you found a bug or have a feature
request, use the [issue tracker][TRACKER] over there.


# Copyright and License

Copyright (C) 2019 by cygx \<<cygx@cpan.org>\>

Distributed under the [Boost Software License, Version 1.0][LICENSE]


[GH]:           https://github.com/cygx/6lib
[TRACKER]:      https://github.com/cygx/6lib/issues
[LICENSE]:      https://www.boost.org/LICENSE_1_0.txt
