# `lib.debug`: debugging functions {#sec-functions-library-debug}

## `lib.debug.runTests` {#function-library-lib.debug.runTests}

Evaluates a set of tests.

A test is an attribute set `{expr, expected}`,
denoting an expression and its expected result.

The result is a `list` of **failed tests**, each represented as
`{name, expected, result}`,

- expected
  - What was passed as `expected`
- result
  - The actual `result` of the test

Used for regression testing of the functions in lib; see
tests.nix for more examples.

Important: Only attributes that start with `test` are executed.

- If you want to run only a subset of the tests add the attribute `tests = ["testName"];`

### Inputs

`tests`
: Tests to run

### Type

```
runTests :: {
  tests :: [String];
  ${testName} :: {
    expr :: a;
    expected :: a;
  };
}
->
[
  {
    name :: String;
    expected :: a;
    result :: a;
  }
]
```

### Examples

::: example
#### `lib.debug.runTests` usage example

``` nix
runTests {
  testAndOk = {
    expr = lib.and true false;
    expected = false;
  };
  testAndFail = {
    expr = lib.and true false;
    expected = true;
  };
}
->
[
  {
    name = "testAndFail";
    expected = true;
    result = false;
  }
]
```
:::

## `lib.debug.testAllTrue` {#function-library-lib.debug.testAllTrue}

Create a test assuming that list elements are `true`.

### Inputs

`expr`
: 1. Function argument

### Examples

::: example
#### `lib.debug.testAllTrue` usage example

``` nix
{ testX = allTrue [ true ]; }
```
:::

## `lib.debug.throwTestFailures` {#function-library-lib.debug.throwTestFailures}

Pretty-print a list of test failures.

This takes an attribute set containing `failures` (a list of test failures
produced by `runTests`) and pretty-prints each failing test, before
throwing an error containing the raw test data as JSON.

If the input list is empty, `null` is returned.

### Inputs

`failures`
: A list of test failures (produced `runTests`), each containing `name`,
`expected`, and `result` attributes.

### Type

```
throwTestFailures :: {
  failures = [
    {
      name :: String;
      expected :: a;
      result :: a;
    }
  ];
}
->
Null
```

### Examples

::: example
#### `lib.debug.throwTestFailures` usage example

``` nix
throwTestFailures {
  failures = [
    {
      name = "testDerivation";
      expected = derivation {
        name = "a";
        builder = "bash";
        system = "x86_64-linux";
      };
      result = derivation {
        name = "b";
        builder = "bash";
        system = "x86_64-linux";
      };
    }
  ];
}
->
trace: FAIL testDerivation:
  Expected: <derivation a>
    Result: <derivation b>

error:
       … while evaluating the file '...':

       … caused by explicit throw
         at /nix/store/.../lib/debug.nix:528:7:
          527|       in
          528|       throw (
             |       ^
          529|         builtins.seq traceFailures (

       error: 1 tests failed:
       - testDerivation

       [{"expected":"/nix/store/xh7kyqp69mxkwspmi81a94m9xx74r8dr-a","name":"testDerivation","result":"/nix/store/503l84nir4zw57d1shfhai25bxxn16c6-b"}]
null
```
:::

## `lib.debug.traceFnSeqN` {#function-library-lib.debug.traceFnSeqN}

Trace the input and output of a function `f` named `name`,
both down to `depth`.

This is useful for adding around a function call,
to see the before/after of values as they are transformed.

### Inputs

`depth`
: 1. Function argument

`name`
: 2. Function argument

`f`
: 3. Function argument

`v`
: 4. Function argument

### Type

```
traceFnSeqN :: Int -> String -> (a -> b) -> a -> b
```

### Examples

::: example
#### `lib.debug.traceFnSeqN` usage example

``` nix
traceFnSeqN 2 "id" (x: x) { a.b.c = 3; }
trace: { fn = "id"; from = { a.b = {…}; }; to = { a.b = {…}; }; }
=> { a = { ... }; }
```
:::

## `lib.debug.traceIf` {#function-library-lib.debug.traceIf}

Conditionally trace the supplied message, based on a predicate.

### Inputs

`pred`
: Predicate to check

`msg`
: Message that should be traced

`x`
: Value to return

### Type

```
traceIf :: Bool -> String -> a -> a
```

### Examples

::: example
#### `lib.debug.traceIf` usage example

``` nix
traceIf true "hello" 3
trace: hello
=> 3
```
:::

## `lib.debug.traceSeq` {#function-library-lib.debug.traceSeq}

`builtins.trace`, but the value is `builtins.deepSeq`ed first.

### Inputs

`x`
: The value to trace

`y`
: The value to return

### Type

```
traceSeq :: a -> b -> b
```

### Examples

::: example
#### `lib.debug.traceSeq` usage example

``` nix
trace { a.b.c = 3; } null
trace: { a = <thunk>; }
=> null
traceSeq { a.b.c = 3; } null
trace: { a = { b = { c = 3; }; }; }
=> null
```
:::

## `lib.debug.traceSeqN` {#function-library-lib.debug.traceSeqN}

Like `traceSeq`, but only evaluate down to depth n.
This is very useful because lots of `traceSeq` usages
lead to an infinite recursion.

### Inputs

`depth`
: 1. Function argument

`x`
: 2. Function argument

`y`
: 3. Function argument

### Type

```
traceSeqN :: Int -> a -> b -> b
```

### Examples

::: example
#### `lib.debug.traceSeqN` usage example

``` nix
traceSeqN 2 { a.b.c = 3; } null
trace: { a = { b = {…}; }; }
=> null
```
:::

## `lib.debug.traceVal` {#function-library-lib.debug.traceVal}

Trace the supplied value and return it.

### Inputs

`x`
: Value to trace and return

### Type

```
traceVal :: a -> a
```

### Examples

::: example
#### `lib.debug.traceVal` usage example

``` nix
traceVal 42
# trace: 42
=> 42
```
:::

## `lib.debug.traceValFn` {#function-library-lib.debug.traceValFn}

Trace the supplied value after applying a function to it, and
return the original value.

### Inputs

`f`
: Function to apply

`x`
: Value to trace and return

### Type

```
traceValFn :: (a -> b) -> a -> a
```

### Examples

::: example
#### `lib.debug.traceValFn` usage example

``` nix
traceValFn (v: "mystring ${v}") "foo"
trace: mystring foo
=> "foo"
```
:::

## `lib.debug.traceValSeq` {#function-library-lib.debug.traceValSeq}

A combination of `traceVal` and `traceSeq`.

### Inputs

`v`
: Value to trace

### Type

```
traceValSeq :: a -> a
```

### Examples

::: example
#### `lib.debug.traceValSeq` usage example

``` nix
traceValSeq { a.b.c = 3; }
trace: { a = { b = { c = 3; }; }; }
=> { a = { ... }; }
```
:::

## `lib.debug.traceValSeqFn` {#function-library-lib.debug.traceValSeqFn}

A combination of `traceVal` and `traceSeq` that applies a
provided function to the value to be traced after `deepSeq`ing
it.

### Inputs

`f`
: Function to apply

`v`
: Value to trace

### Type

```
traceValSeqFn :: (a -> b) -> a -> a
```

### Examples

::: example
#### `lib.debug.traceValSeqFn` usage example

``` nix
traceValSeqFn (v: v // { d = "foo";}) { a.b.c = 3; }
trace: { a = { b = { c = 3; }; }; d = "foo"; }
=> { a = { ... }; }

```
:::

## `lib.debug.traceValSeqN` {#function-library-lib.debug.traceValSeqN}

A combination of `traceVal` and `traceSeqN`.

### Inputs

`depth`
: 1. Function argument

`v`
: Value to trace

### Type

```
traceValSeqN :: Int -> a -> a
```

### Examples

::: example
#### `lib.debug.traceValSeqN` usage example

``` nix
traceValSeqN 2 { a.b.c = 3; }
trace: { a = { b = {…}; }; }
=> { a = { ... }; }
```
:::

## `lib.debug.traceValSeqNFn` {#function-library-lib.debug.traceValSeqNFn}

A combination of `traceVal` and `traceSeqN` that applies a
provided function to the value to be traced.

### Inputs

`f`
: Function to apply

`depth`
: 2. Function argument

`v`
: Value to trace

### Type

```
traceValSeqNFn :: (a -> b) -> Int -> a -> a
```

### Examples

::: example
#### `lib.debug.traceValSeqNFn` usage example

``` nix
traceValSeqNFn (v: v // { d = "foo";}) 2 { a.b.c = 3; }
trace: { a = { b = {…}; }; d = "foo"; }
=> { a = { ... }; }
```
:::
