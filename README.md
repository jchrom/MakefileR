<!-- README.md is generated from README.Rmd. Please edit that file -->
MakefileR [![wercker status](https://app.wercker.com/status/280c3f12547a0b3fd9d9e812d7fa854f/s/master "wercker status")](https://app.wercker.com/project/bykey/280c3f12547a0b3fd9d9e812d7fa854f) [![codecov.io](https://codecov.io/github/krlmlr/MakefileR/coverage.svg?branch=master)](https://codecov.io/github/krlmlr/MakefileR?branch=master)
=================================================================================================================================================================================================================================================================================================================================================

This little package helps creating `Makefile` files programmatically.

``` r
library(MakefileR)
create_make_rule("all", c("first_target", "second_target"))
```

``` makefile
all: first_target second_target
```

``` r
create_make_rule(".FORCE")
```

``` makefile
.FORCE: 
```

``` r
create_make_rule("first_target", ".FORCE", "echo 'Building first target'")
```

``` makefile
first_target: .FORCE
⇥      echo 'Building first target'
```

``` r
create_make_rule("second_target", "first_target",
  c("echo 'Building second target'", "echo 'Done'"))
```

``` makefile
second_target: first_target
⇥      echo 'Building second target'
⇥      echo 'Done'
```

``` r
create_makefile() %>%
  append_make_rule("all", c("first_target", "second_target")) %>%
  append_make_rule(".FORCE") %>%
  append_make_rule("first_target", ".FORCE", "echo 'Building first target'") %>%
  append_make_rule("second_target", "first_target",
    c("echo 'Building second target'", "echo 'Done'"))
```

``` makefile
# Generated by MakefileR, do not edit by hand

all: first_target second_target

.FORCE: 

first_target: .FORCE
⇥      echo 'Building first target'

second_target: first_target
⇥      echo 'Building second target'
⇥      echo 'Done'
```
