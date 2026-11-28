# `lib.gvariant`: GVariant formatted string serialization functions {#sec-functions-library-gvariant}

## `lib.gvariant.isGVariant` {#function-library-lib.gvariant.isGVariant}

Check if a value is a GVariant value

### Inputs

`v`
: value to check

### Type

```
isGVariant :: Any -> Bool
```

## `lib.gvariant.mkArray` {#function-library-lib.gvariant.mkArray}

Returns the GVariant array from the given type of the elements and a Nix list.

### Inputs

`elems`
: 1. Function argument

### Type

```
mkArray :: [Any] -> GVariant
```

### Examples

::: example
#### `lib.gvariant.mkArray` usage example

``` nix
# Creating a string array
lib.gvariant.mkArray [ "a" "b" "c" ]
```
:::

## `lib.gvariant.mkBoolean` {#function-library-lib.gvariant.mkBoolean}

Returns the GVariant boolean from the given Nix bool value.

### Inputs

`v`
: 1. Function argument

### Type

```
mkBoolean :: Bool -> GVariant
```

## `lib.gvariant.mkDictionaryEntry` {#function-library-lib.gvariant.mkDictionaryEntry}

Returns the GVariant dictionary entry from the given key and value.

### Inputs

`name`
: The key of the entry

`value`
: The value of the entry

### Type

```
mkDictionaryEntry :: String -> Any -> GVariant
```

### Examples

::: example
#### `lib.gvariant.mkDictionaryEntry` usage example

``` nix
# A dictionary describing an Epiphany’s search provider
[
  (lib.gvariant.mkDictionaryEntry "url" (lib.gvariant.mkVariant "https://duckduckgo.com/?q=%s&t=epiphany"))
  (lib.gvariant.mkDictionaryEntry "bang" (lib.gvariant.mkVariant "!d"))
  (lib.gvariant.mkDictionaryEntry "name" (lib.gvariant.mkVariant "DuckDuckGo"))
]
```
:::

## `lib.gvariant.mkDouble` {#function-library-lib.gvariant.mkDouble}

Returns the GVariant double from the given Nix float value.

### Inputs

`v`
: 1. Function argument

### Type

```
mkDouble :: Float -> GVariant
```

## `lib.gvariant.mkEmptyArray` {#function-library-lib.gvariant.mkEmptyArray}

Returns the GVariant array from the given empty Nix list.

### Inputs

`elemType`
: 1. Function argument

### Type

```
mkEmptyArray :: GVariantType -> GVariant
```

### Examples

::: example
#### `lib.gvariant.mkEmptyArray` usage example

``` nix
# Creating an empty string array
lib.gvariant.mkEmptyArray (lib.gvariant.type.string)
```
:::

## `lib.gvariant.mkInt16` {#function-library-lib.gvariant.mkInt16}

Returns the GVariant int16 from the given Nix int value.

### Type

```
mkInt16 :: Int -> GVariant
```

## `lib.gvariant.mkInt32` {#function-library-lib.gvariant.mkInt32}

Returns the GVariant int32 from the given Nix int value.

### Inputs

`v`
: 1. Function argument

### Type

```
mkInt32 :: Int -> GVariant
```

## `lib.gvariant.mkInt64` {#function-library-lib.gvariant.mkInt64}

Returns the GVariant int64 from the given Nix int value.

### Type

```
mkInt64 :: Int -> GVariant
```

## `lib.gvariant.mkJust` {#function-library-lib.gvariant.mkJust}

Returns the GVariant just from the given Nix value.

### Inputs

`elem`
: 1. Function argument

### Type

```
mkJust :: Any -> GVariant
```

## `lib.gvariant.mkMaybe` {#function-library-lib.gvariant.mkMaybe}

Returns the GVariant maybe from the given element type.

### Inputs

`elemType`
: 1. Function argument

`elem`
: 2. Function argument

### Type

```
mkMaybe :: GVariantType -> Any -> GVariant
```

## `lib.gvariant.mkNothing` {#function-library-lib.gvariant.mkNothing}

Returns the GVariant nothing from the given element type.

### Inputs

`elemType`
: 1. Function argument

### Type

```
mkNothing :: GVariantType -> GVariant
```

## `lib.gvariant.mkObjectpath` {#function-library-lib.gvariant.mkObjectpath}

Returns the GVariant object path from the given Nix string value.

### Inputs

`v`
: 1. Function argument

### Type

```
mkObjectpath :: String -> GVariant
```

## `lib.gvariant.mkString` {#function-library-lib.gvariant.mkString}

Returns the GVariant string from the given Nix string value.

### Inputs

`v`
: 1. Function argument

### Type

```
mkString :: String -> GVariant
```

## `lib.gvariant.mkTuple` {#function-library-lib.gvariant.mkTuple}

Returns the GVariant tuple from the given Nix list.

### Inputs

`elems`
: 1. Function argument

### Type

```
mkTuple :: [Any] -> GVariant
```

## `lib.gvariant.mkUchar` {#function-library-lib.gvariant.mkUchar}

Returns the GVariant uchar from the given Nix int value.

### Type

```
mkUchar :: Int -> GVariant
```

## `lib.gvariant.mkUint16` {#function-library-lib.gvariant.mkUint16}

Returns the GVariant uint16 from the given Nix int value.

### Type

```
mkUint16 :: Int -> GVariant
```

## `lib.gvariant.mkUint32` {#function-library-lib.gvariant.mkUint32}

Returns the GVariant uint32 from the given Nix int value.

### Type

```
mkUint32 :: Int -> GVariant
```

## `lib.gvariant.mkUint64` {#function-library-lib.gvariant.mkUint64}

Returns the GVariant uint64 from the given Nix int value.

### Type

```
mkUint64 :: Int -> GVariant
```

## `lib.gvariant.mkValue` {#function-library-lib.gvariant.mkValue}

Returns the GVariant value that most closely matches the given Nix value.
If no GVariant value can be found unambiguously then error is thrown.

### Inputs

`v`
: 1. Function argument

### Type

```
mkValue :: Any -> GVariant
```

## `lib.gvariant.mkVariant` {#function-library-lib.gvariant.mkVariant}

Returns the GVariant variant from the given Nix value. Variants are containers
of different GVariant type.

### Inputs

`elem`
: 1. Function argument

### Type

```
mkVariant :: Any -> GVariant
```

### Examples

::: example
#### `lib.gvariant.mkVariant` usage example

``` nix
lib.gvariant.mkArray [
  (lib.gvariant.mkVariant "a string")
  (lib.gvariant.mkVariant (lib.gvariant.mkInt32 1))
]
```
:::
