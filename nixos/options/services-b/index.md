# services (B) {#sec-options-services-b}

## `services.babeld.enable` {#opt-services.babeld.enable}

Whether to enable the babeld network routing daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/babeld.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/babeld.nix)

## `services.babeld.extraConfig` {#opt-services.babeld.extraConfig}

Options that will be copied to babeld.conf.
See `babeld(8)` for details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/babeld.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/babeld.nix)

## `services.babeld.interfaceDefaults` {#opt-services.babeld.interfaceDefaults}

A set describing default parameters for babeld interfaces.
See `babeld(8)` for options.

*Type:* null or (attribute set of unspecified value)

*Default:* `null`

*Example:*

``` nix
{
  split-horizon = true;
  type = "tunnel";
}
```

*Declared by:* [`nixos/modules/services/networking/babeld.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/babeld.nix)

## `services.babeld.interfaces` {#opt-services.babeld.interfaces}

A set describing babeld interfaces.
See `babeld(8)` for options.

*Type:* attribute set of attribute set of unspecified value

*Default:* `{ }`

*Example:*

``` nix
{
  enp0s2 = {
    hello-interval = 5;
    split-horizon = "auto";
    type = "wired";
  };
}
```

*Declared by:* [`nixos/modules/services/networking/babeld.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/babeld.nix)

## `services.bacula-dir.enable` {#opt-services.bacula-dir.enable}

Whether to enable Bacula Director Daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-dir.extraConfig` {#opt-services.bacula-dir.extraConfig}

Extra configuration for Bacula Director Daemon.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  TODO
''
```

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-dir.extraDirectorConfig` {#opt-services.bacula-dir.extraDirectorConfig}

Extra configuration to be passed in Director directive.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  Maximum Concurrent Jobs = 20;
  Heartbeat Interval = 30;
''
```

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-dir.extraMessagesConfig` {#opt-services.bacula-dir.extraMessagesConfig}

Extra configuration to be passed in Messages directive.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  console = all
''
```

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-dir.name` {#opt-services.bacula-dir.name}

The director name used by the system administrator. This directive is
required.

*Type:* string

*Default:* `"${config.networking.hostName}-dir"`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-dir.password` {#opt-services.bacula-dir.password}

Specifies the password that must be supplied for a Director.

*Type:* string

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-dir.port` {#opt-services.bacula-dir.port}

Specify the port (a positive integer) on which the Director daemon
will listen for Bacula Console connections. This same port number
must be specified in the Director resource of the Console
configuration file. The default is 9101, so normally this directive
need not be specified. This directive should not be used if you
specify DirAddresses (N.B plural) directive.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9101`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-dir.tls` {#opt-services.bacula-dir.tls}

TLS Options for the Director.
Important notice: The backup won't be encrypted.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-dir.tls.allowedCN` {#opt-services.bacula-dir.tls.allowedCN}

Common name attribute of allowed peer certificates.
This directive is valid for a server and in a client context.
If this directive is specified, the peer certificate will be verified against this list.
In the case this directive is configured on a server side, the allowed
CN list will not be checked if [services.bacula-dir.tls.verifyPeer](#opt-services.bacula-dir.tls.verifyPeer) is false.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-dir.tls.caCertificateFile` {#opt-services.bacula-dir.tls.caCertificateFile}

The path specifying a PEM encoded TLS CA certificate(s).
Multiple certificates are permitted in the file.
One of TLS CA Certificate File or TLS CA Certificate Dir are required in a server context, unless
[services.bacula-dir.tls.verifyPeer](#opt-services.bacula-dir.tls.verifyPeer) is false, and are always required in a client context.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-dir.tls.certificate` {#opt-services.bacula-dir.tls.certificate}

The full path to the PEM encoded TLS certificate.
It will be used as either a client or server certificate,
depending on the connection direction.
This directive is required in a server context, but it may
not be specified in a client context if [services.bacula-dir.tls.verifyPeer](#opt-services.bacula-dir.tls.verifyPeer) is
`false` in the corresponding server context.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-dir.tls.enable` {#opt-services.bacula-dir.tls.enable}

Specifies if TLS should be enabled.
If this set to `false` TLS will be completely disabled, even if [services.bacula-dir.tls.require](#opt-services.bacula-dir.tls.require) is true.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-dir.tls.key` {#opt-services.bacula-dir.tls.key}

The path of a PEM encoded TLS private key.
It must correspond to the TLS certificate.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-dir.tls.require` {#opt-services.bacula-dir.tls.require}

Require TLS or TLS-PSK encryption.
This directive is ignored unless one of [services.bacula-dir.tls.enable](#opt-services.bacula-dir.tls.enable) is true or TLS PSK Enable is set to `yes`.
If TLS is not required while TLS or TLS-PSK are enabled, then the Bacula component
will connect with other components either with or without TLS or TLS-PSK

If [services.bacula-dir.tls.enable](#opt-services.bacula-dir.tls.enable) or TLS-PSK is enabled and TLS is required, then the Bacula
component will refuse any connection request that does not use TLS.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-dir.tls.verifyPeer` {#opt-services.bacula-dir.tls.verifyPeer}

Verify peer certificate.
Instructs server to request and verify the client's X.509 certificate.
Any client certificate signed by a known-CA will be accepted.
Additionally, the client's X509 certificate Common Name must meet the value of the Address directive.
If [services.bacula-dir.tls.allowedCN](#opt-services.bacula-dir.tls.allowedCN) is used,
the client's x509 certificate Common Name must also correspond to
one of the CN specified in the [services.bacula-dir.tls.allowedCN](#opt-services.bacula-dir.tls.allowedCN) directive.
This directive is valid only for a server and not in client context.

Standard from Bacula is `true`.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.director` {#opt-services.bacula-fd.director}

This option defines director resources in Bacula File Daemon.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.director.<name>.monitor` {#opt-services.bacula-fd.director._name_.monitor}

If Monitor is set to `no`, this director will have
full access to this Storage daemon. If Monitor is set to
`yes`, this director will only be able to fetch the
current status of this Storage daemon.

Please note that if this director is being used by a Monitor, we
highly recommend to set this directive to yes to avoid serious
security problems.

*Type:* one of "no", "yes"

*Default:* `"no"`

*Example:* `"yes"`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.director.<name>.password` {#opt-services.bacula-fd.director._name_.password}

Specifies the password that must be supplied for the default Bacula
Console to be authorized. The same password must appear in the
Director resource of the Console configuration file. For added
security, the password is never passed across the network but instead
a challenge response hash code created with the password. This
directive is required. If you have either /dev/random or bc on your
machine, Bacula will generate a random password during the
configuration process, otherwise it will be left blank and you must
manually supply it.

The password is plain text. It is not generated through any special
process but as noted above, it is better to use random text for
security reasons.

*Type:* string

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.director.<name>.tls` {#opt-services.bacula-fd.director._name_.tls}

TLS Options for the Director in this Configuration.

*Type:* submodule

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.director.<name>.tls.allowedCN` {#opt-services.bacula-fd.director._name_.tls.allowedCN}

Common name attribute of allowed peer certificates.
This directive is valid for a server and in a client context.
If this directive is specified, the peer certificate will be verified against this list.
In the case this directive is configured on a server side, the allowed
CN list will not be checked if [services.bacula-fd.director.<name>.tls.verifyPeer](#opt-services.bacula-fd.director._name_.tls.verifyPeer) is false.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.director.<name>.tls.caCertificateFile` {#opt-services.bacula-fd.director._name_.tls.caCertificateFile}

The path specifying a PEM encoded TLS CA certificate(s).
Multiple certificates are permitted in the file.
One of TLS CA Certificate File or TLS CA Certificate Dir are required in a server context, unless
[services.bacula-fd.director.<name>.tls.verifyPeer](#opt-services.bacula-fd.director._name_.tls.verifyPeer) is false, and are always required in a client context.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.director.<name>.tls.certificate` {#opt-services.bacula-fd.director._name_.tls.certificate}

The full path to the PEM encoded TLS certificate.
It will be used as either a client or server certificate,
depending on the connection direction.
This directive is required in a server context, but it may
not be specified in a client context if [services.bacula-fd.director.<name>.tls.verifyPeer](#opt-services.bacula-fd.director._name_.tls.verifyPeer) is
`false` in the corresponding server context.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.director.<name>.tls.enable` {#opt-services.bacula-fd.director._name_.tls.enable}

Specifies if TLS should be enabled.
If this set to `false` TLS will be completely disabled, even if [services.bacula-fd.director.<name>.tls.require](#opt-services.bacula-fd.director._name_.tls.require) is true.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.director.<name>.tls.key` {#opt-services.bacula-fd.director._name_.tls.key}

The path of a PEM encoded TLS private key.
It must correspond to the TLS certificate.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.director.<name>.tls.require` {#opt-services.bacula-fd.director._name_.tls.require}

Require TLS or TLS-PSK encryption.
This directive is ignored unless one of [services.bacula-fd.director.<name>.tls.enable](#opt-services.bacula-fd.director._name_.tls.enable) is true or TLS PSK Enable is set to `yes`.
If TLS is not required while TLS or TLS-PSK are enabled, then the Bacula component
will connect with other components either with or without TLS or TLS-PSK

If [services.bacula-fd.director.<name>.tls.enable](#opt-services.bacula-fd.director._name_.tls.enable) or TLS-PSK is enabled and TLS is required, then the Bacula
component will refuse any connection request that does not use TLS.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.director.<name>.tls.verifyPeer` {#opt-services.bacula-fd.director._name_.tls.verifyPeer}

Verify peer certificate.
Instructs server to request and verify the client's X.509 certificate.
Any client certificate signed by a known-CA will be accepted.
Additionally, the client's X509 certificate Common Name must meet the value of the Address directive.
If [services.bacula-fd.director.<name>.tls.allowedCN](#opt-services.bacula-fd.director._name_.tls.allowedCN) is used,
the client's x509 certificate Common Name must also correspond to
one of the CN specified in the [services.bacula-fd.director.<name>.tls.allowedCN](#opt-services.bacula-fd.director._name_.tls.allowedCN) directive.
This directive is valid only for a server and not in client context.

Standard from Bacula is `true`.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.enable` {#opt-services.bacula-fd.enable}

Whether to enable the Bacula File Daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.extraClientConfig` {#opt-services.bacula-fd.extraClientConfig}

Extra configuration to be passed in Client directive.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  Maximum Concurrent Jobs = 20;
  Heartbeat Interval = 30;
''
```

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.extraMessagesConfig` {#opt-services.bacula-fd.extraMessagesConfig}

Extra configuration to be passed in Messages directive.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  console = all
''
```

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.name` {#opt-services.bacula-fd.name}

The client name that must be used by the Director when connecting.
Generally, it is a good idea to use a name related to the machine so
that error messages can be easily identified if you have multiple
Clients. This directive is required.

*Type:* string

*Default:* `"${config.networking.hostName}-fd"`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.port` {#opt-services.bacula-fd.port}

This specifies the port number on which the Client listens for
Director connections. It must agree with the FDPort specified in
the Client resource of the Director's configuration file.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9102`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.tls` {#opt-services.bacula-fd.tls}

TLS Options for the File Daemon.
Important notice: The backup won't be encrypted.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.tls.allowedCN` {#opt-services.bacula-fd.tls.allowedCN}

Common name attribute of allowed peer certificates.
This directive is valid for a server and in a client context.
If this directive is specified, the peer certificate will be verified against this list.
In the case this directive is configured on a server side, the allowed
CN list will not be checked if [services.bacula-fd.tls.verifyPeer](#opt-services.bacula-fd.tls.verifyPeer) is false.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.tls.caCertificateFile` {#opt-services.bacula-fd.tls.caCertificateFile}

The path specifying a PEM encoded TLS CA certificate(s).
Multiple certificates are permitted in the file.
One of TLS CA Certificate File or TLS CA Certificate Dir are required in a server context, unless
[services.bacula-fd.tls.verifyPeer](#opt-services.bacula-fd.tls.verifyPeer) is false, and are always required in a client context.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.tls.certificate` {#opt-services.bacula-fd.tls.certificate}

The full path to the PEM encoded TLS certificate.
It will be used as either a client or server certificate,
depending on the connection direction.
This directive is required in a server context, but it may
not be specified in a client context if [services.bacula-fd.tls.verifyPeer](#opt-services.bacula-fd.tls.verifyPeer) is
`false` in the corresponding server context.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.tls.enable` {#opt-services.bacula-fd.tls.enable}

Specifies if TLS should be enabled.
If this set to `false` TLS will be completely disabled, even if [services.bacula-fd.tls.require](#opt-services.bacula-fd.tls.require) is true.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.tls.key` {#opt-services.bacula-fd.tls.key}

The path of a PEM encoded TLS private key.
It must correspond to the TLS certificate.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.tls.require` {#opt-services.bacula-fd.tls.require}

Require TLS or TLS-PSK encryption.
This directive is ignored unless one of [services.bacula-fd.tls.enable](#opt-services.bacula-fd.tls.enable) is true or TLS PSK Enable is set to `yes`.
If TLS is not required while TLS or TLS-PSK are enabled, then the Bacula component
will connect with other components either with or without TLS or TLS-PSK

If [services.bacula-fd.tls.enable](#opt-services.bacula-fd.tls.enable) or TLS-PSK is enabled and TLS is required, then the Bacula
component will refuse any connection request that does not use TLS.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-fd.tls.verifyPeer` {#opt-services.bacula-fd.tls.verifyPeer}

Verify peer certificate.
Instructs server to request and verify the client's X.509 certificate.
Any client certificate signed by a known-CA will be accepted.
Additionally, the client's X509 certificate Common Name must meet the value of the Address directive.
If [services.bacula-fd.tls.allowedCN](#opt-services.bacula-fd.tls.allowedCN) is used,
the client's x509 certificate Common Name must also correspond to
one of the CN specified in the [services.bacula-fd.tls.allowedCN](#opt-services.bacula-fd.tls.allowedCN) directive.
This directive is valid only for a server and not in client context.

Standard from Bacula is `true`.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.autochanger` {#opt-services.bacula-sd.autochanger}

This option defines Autochanger resources in Bacula Storage Daemon.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.autochanger.<name>.changerCommand` {#opt-services.bacula-sd.autochanger._name_.changerCommand}

The name-string specifies an external program to be called that will
automatically change volumes as required by Bacula. Normally, this
directive will be specified only in the AutoChanger resource, which
is then used for all devices. However, you may also specify the
different Changer Command in each Device resource. Most frequently,
you will specify the Bacula supplied mtx-changer script as follows:

`"/path/mtx-changer %c %o %S %a %d"`

and you will install the mtx on your system (found in the depkgs
release). An example of this command is in the default bacula-sd.conf
file. For more details on the substitution characters that may be
specified to configure your autochanger please see the
AutochangersAutochangersChapter chapter of this manual. For FreeBSD
users, you might want to see one of the several chio scripts in
examples/autochangers.

*Type:* string

*Default:* `"/etc/bacula/mtx-changer %c %o %S %a %d"`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.autochanger.<name>.changerDevice` {#opt-services.bacula-sd.autochanger._name_.changerDevice}

The specified name-string must be the generic SCSI device name of the
autochanger that corresponds to the normal read/write Archive Device
specified in the Device resource. This generic SCSI device name
should be specified if you have an autochanger or if you have a
standard tape drive and want to use the Alert Command (see below).
For example, on Linux systems, for an Archive Device name of
`/dev/nst0`, you would specify
`/dev/sg0` for the Changer Device name.  Depending
on your exact configuration, and the number of autochangers or the
type of autochanger, what you specify here can vary. This directive
is optional. See the Using AutochangersAutochangersChapter chapter of
this manual for more details of using this and the following
autochanger directives.

*Type:* string

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.autochanger.<name>.devices` {#opt-services.bacula-sd.autochanger._name_.devices}

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.autochanger.<name>.extraAutochangerConfig` {#opt-services.bacula-sd.autochanger._name_.extraAutochangerConfig}

Extra configuration to be passed in Autochanger directive.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  
''
```

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.device` {#opt-services.bacula-sd.device}

This option defines Device resources in Bacula Storage Daemon.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.device.<name>.archiveDevice` {#opt-services.bacula-sd.device._name_.archiveDevice}

The specified name-string gives the system file name of the storage
device managed by this storage daemon. This will usually be the
device file name of a removable storage device (tape drive), for
example `/dev/nst0` or
`/dev/rmt/0mbn`. For a DVD-writer, it will be for
example `/dev/hdc`. It may also be a directory name
if you are archiving to disk storage. In this case, you must supply
the full absolute path to the directory. When specifying a tape
device, it is preferable that the "non-rewind" variant of the device
file name be given.

*Type:* string

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.device.<name>.extraDeviceConfig` {#opt-services.bacula-sd.device._name_.extraDeviceConfig}

Extra configuration to be passed in Device directive.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  LabelMedia = yes
  Random Access = no
  AutomaticMount = no
  RemovableMedia = no
  MaximumOpenWait = 60
  AlwaysOpen = no
''
```

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.device.<name>.mediaType` {#opt-services.bacula-sd.device._name_.mediaType}

The specified name-string names the type of media supported by this
device, for example, `DLT7000`. Media type names are
arbitrary in that you set them to anything you want, but they must be
known to the volume database to keep track of which storage daemons
can read which volumes. In general, each different storage type
should have a unique Media Type associated with it. The same
name-string must appear in the appropriate Storage resource
definition in the Director's configuration file.

Even though the names you assign are arbitrary (i.e. you choose the
name you want), you should take care in specifying them because the
Media Type is used to determine which storage device Bacula will
select during restore. Thus you should probably use the same Media
Type specification for all drives where the Media can be freely
interchanged. This is not generally an issue if you have a single
Storage daemon, but it is with multiple Storage daemons, especially
if they have incompatible media.

For example, if you specify a Media Type of `DDS-4`
then during the restore, Bacula will be able to choose any Storage
Daemon that handles `DDS-4`. If you have an
autochanger, you might want to name the Media Type in a way that is
unique to the autochanger, unless you wish to possibly use the
Volumes in other drives. You should also ensure to have unique Media
Type names if the Media is not compatible between drives. This
specification is required for all devices.

In addition, if you are using disk storage, each Device resource will
generally have a different mount point or directory. In order for
Bacula to select the correct Device resource, each one must have a
unique Media Type.

*Type:* string

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.director` {#opt-services.bacula-sd.director}

This option defines Director resources in Bacula Storage Daemon.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.director.<name>.monitor` {#opt-services.bacula-sd.director._name_.monitor}

If Monitor is set to `no`, this director will have
full access to this Storage daemon. If Monitor is set to
`yes`, this director will only be able to fetch the
current status of this Storage daemon.

Please note that if this director is being used by a Monitor, we
highly recommend to set this directive to yes to avoid serious
security problems.

*Type:* one of "no", "yes"

*Default:* `"no"`

*Example:* `"yes"`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.director.<name>.password` {#opt-services.bacula-sd.director._name_.password}

Specifies the password that must be supplied for the default Bacula
Console to be authorized. The same password must appear in the
Director resource of the Console configuration file. For added
security, the password is never passed across the network but instead
a challenge response hash code created with the password. This
directive is required. If you have either /dev/random or bc on your
machine, Bacula will generate a random password during the
configuration process, otherwise it will be left blank and you must
manually supply it.

The password is plain text. It is not generated through any special
process but as noted above, it is better to use random text for
security reasons.

*Type:* string

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.director.<name>.tls` {#opt-services.bacula-sd.director._name_.tls}

TLS Options for the Director in this Configuration.

*Type:* submodule

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.director.<name>.tls.allowedCN` {#opt-services.bacula-sd.director._name_.tls.allowedCN}

Common name attribute of allowed peer certificates.
This directive is valid for a server and in a client context.
If this directive is specified, the peer certificate will be verified against this list.
In the case this directive is configured on a server side, the allowed
CN list will not be checked if [services.bacula-sd.director.<name>.tls.verifyPeer](#opt-services.bacula-sd.director._name_.tls.verifyPeer) is false.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.director.<name>.tls.caCertificateFile` {#opt-services.bacula-sd.director._name_.tls.caCertificateFile}

The path specifying a PEM encoded TLS CA certificate(s).
Multiple certificates are permitted in the file.
One of TLS CA Certificate File or TLS CA Certificate Dir are required in a server context, unless
[services.bacula-sd.director.<name>.tls.verifyPeer](#opt-services.bacula-sd.director._name_.tls.verifyPeer) is false, and are always required in a client context.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.director.<name>.tls.certificate` {#opt-services.bacula-sd.director._name_.tls.certificate}

The full path to the PEM encoded TLS certificate.
It will be used as either a client or server certificate,
depending on the connection direction.
This directive is required in a server context, but it may
not be specified in a client context if [services.bacula-sd.director.<name>.tls.verifyPeer](#opt-services.bacula-sd.director._name_.tls.verifyPeer) is
`false` in the corresponding server context.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.director.<name>.tls.enable` {#opt-services.bacula-sd.director._name_.tls.enable}

Specifies if TLS should be enabled.
If this set to `false` TLS will be completely disabled, even if [services.bacula-sd.director.<name>.tls.require](#opt-services.bacula-sd.director._name_.tls.require) is true.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.director.<name>.tls.key` {#opt-services.bacula-sd.director._name_.tls.key}

The path of a PEM encoded TLS private key.
It must correspond to the TLS certificate.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.director.<name>.tls.require` {#opt-services.bacula-sd.director._name_.tls.require}

Require TLS or TLS-PSK encryption.
This directive is ignored unless one of [services.bacula-sd.director.<name>.tls.enable](#opt-services.bacula-sd.director._name_.tls.enable) is true or TLS PSK Enable is set to `yes`.
If TLS is not required while TLS or TLS-PSK are enabled, then the Bacula component
will connect with other components either with or without TLS or TLS-PSK

If [services.bacula-sd.director.<name>.tls.enable](#opt-services.bacula-sd.director._name_.tls.enable) or TLS-PSK is enabled and TLS is required, then the Bacula
component will refuse any connection request that does not use TLS.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.director.<name>.tls.verifyPeer` {#opt-services.bacula-sd.director._name_.tls.verifyPeer}

Verify peer certificate.
Instructs server to request and verify the client's X.509 certificate.
Any client certificate signed by a known-CA will be accepted.
Additionally, the client's X509 certificate Common Name must meet the value of the Address directive.
If [services.bacula-sd.director.<name>.tls.allowedCN](#opt-services.bacula-sd.director._name_.tls.allowedCN) is used,
the client's x509 certificate Common Name must also correspond to
one of the CN specified in the [services.bacula-sd.director.<name>.tls.allowedCN](#opt-services.bacula-sd.director._name_.tls.allowedCN) directive.
This directive is valid only for a server and not in client context.

Standard from Bacula is `true`.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.enable` {#opt-services.bacula-sd.enable}

Whether to enable Bacula Storage Daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.extraMessagesConfig` {#opt-services.bacula-sd.extraMessagesConfig}

Extra configuration to be passed in Messages directive.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  console = all
''
```

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.extraStorageConfig` {#opt-services.bacula-sd.extraStorageConfig}

Extra configuration to be passed in Storage directive.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  Maximum Concurrent Jobs = 20;
  Heartbeat Interval = 30;
''
```

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.name` {#opt-services.bacula-sd.name}

Specifies the Name of the Storage daemon.

*Type:* string

*Default:* `"${config.networking.hostName}-sd"`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.port` {#opt-services.bacula-sd.port}

Specifies port number on which the Storage daemon listens for
Director connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9103`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.tls` {#opt-services.bacula-sd.tls}

TLS Options for the Storage Daemon.
Important notice: The backup won't be encrypted.

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.tls.allowedCN` {#opt-services.bacula-sd.tls.allowedCN}

Common name attribute of allowed peer certificates.
This directive is valid for a server and in a client context.
If this directive is specified, the peer certificate will be verified against this list.
In the case this directive is configured on a server side, the allowed
CN list will not be checked if [services.bacula-sd.tls.verifyPeer](#opt-services.bacula-sd.tls.verifyPeer) is false.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.tls.caCertificateFile` {#opt-services.bacula-sd.tls.caCertificateFile}

The path specifying a PEM encoded TLS CA certificate(s).
Multiple certificates are permitted in the file.
One of TLS CA Certificate File or TLS CA Certificate Dir are required in a server context, unless
[services.bacula-sd.tls.verifyPeer](#opt-services.bacula-sd.tls.verifyPeer) is false, and are always required in a client context.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.tls.certificate` {#opt-services.bacula-sd.tls.certificate}

The full path to the PEM encoded TLS certificate.
It will be used as either a client or server certificate,
depending on the connection direction.
This directive is required in a server context, but it may
not be specified in a client context if [services.bacula-sd.tls.verifyPeer](#opt-services.bacula-sd.tls.verifyPeer) is
`false` in the corresponding server context.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.tls.enable` {#opt-services.bacula-sd.tls.enable}

Specifies if TLS should be enabled.
If this set to `false` TLS will be completely disabled, even if [services.bacula-sd.tls.require](#opt-services.bacula-sd.tls.require) is true.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.tls.key` {#opt-services.bacula-sd.tls.key}

The path of a PEM encoded TLS private key.
It must correspond to the TLS certificate.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.tls.require` {#opt-services.bacula-sd.tls.require}

Require TLS or TLS-PSK encryption.
This directive is ignored unless one of [services.bacula-sd.tls.enable](#opt-services.bacula-sd.tls.enable) is true or TLS PSK Enable is set to `yes`.
If TLS is not required while TLS or TLS-PSK are enabled, then the Bacula component
will connect with other components either with or without TLS or TLS-PSK

If [services.bacula-sd.tls.enable](#opt-services.bacula-sd.tls.enable) or TLS-PSK is enabled and TLS is required, then the Bacula
component will refuse any connection request that does not use TLS.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.bacula-sd.tls.verifyPeer` {#opt-services.bacula-sd.tls.verifyPeer}

Verify peer certificate.
Instructs server to request and verify the client's X.509 certificate.
Any client certificate signed by a known-CA will be accepted.
Additionally, the client's X509 certificate Common Name must meet the value of the Address directive.
If [services.bacula-sd.tls.allowedCN](#opt-services.bacula-sd.tls.allowedCN) is used,
the client's x509 certificate Common Name must also correspond to
one of the CN specified in the [services.bacula-sd.tls.allowedCN](#opt-services.bacula-sd.tls.allowedCN) directive.
This directive is valid only for a server and not in client context.

Standard from Bacula is `true`.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/bacula.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/bacula.nix)

## `services.baikal.enable` {#opt-services.baikal.enable}

Whether to enable baikal.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/baikal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/baikal.nix)

## `services.baikal.group` {#opt-services.baikal.group}

Group account under which the web-application run.

*Type:* string

*Default:* `"baikal"`

*Declared by:* [`nixos/modules/services/web-apps/baikal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/baikal.nix)

## `services.baikal.package` {#opt-services.baikal.package}

The baikal package to use.

*Type:* package

*Default:* `pkgs.baikal`

*Declared by:* [`nixos/modules/services/web-apps/baikal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/baikal.nix)

## `services.baikal.phpPackage` {#opt-services.baikal.phpPackage}

The php package to use.

*Type:* package

*Default:* `pkgs.php`

*Declared by:* [`nixos/modules/services/web-apps/baikal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/baikal.nix)

## `services.baikal.pool` {#opt-services.baikal.pool}

Name of existing phpfpm pool that is used to run web-application.
If not specified a pool will be created automatically with
default values.

*Type:* string

*Default:* `"baikal"`

*Declared by:* [`nixos/modules/services/web-apps/baikal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/baikal.nix)

## `services.baikal.user` {#opt-services.baikal.user}

User account under which the web-application run.

*Type:* string

*Default:* `"baikal"`

*Declared by:* [`nixos/modules/services/web-apps/baikal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/baikal.nix)

## `services.baikal.virtualHost` {#opt-services.baikal.virtualHost}

Name of the nginx virtualhost to use and setup. If null, do not setup any virtualhost.

*Type:* null or string

*Default:* `"baikal"`

*Declared by:* [`nixos/modules/services/web-apps/baikal.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/baikal.nix)

## `services.bamf.enable` {#opt-services.bamf.enable}

Whether to enable bamf.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/bamf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/bamf.nix)

## `services.bazarr.dataDir` {#opt-services.bazarr.dataDir}

The directory where Bazarr stores its data files.

*Type:* string

*Default:* `"/var/lib/bazarr"`

*Declared by:* [`nixos/modules/services/misc/bazarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bazarr.nix)

## `services.bazarr.enable` {#opt-services.bazarr.enable}

Whether to enable bazarr, a subtitle manager for Sonarr and Radarr.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/bazarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bazarr.nix)

## `services.bazarr.group` {#opt-services.bazarr.group}

Group under which bazarr runs.

*Type:* string

*Default:* `"bazarr"`

*Declared by:* [`nixos/modules/services/misc/bazarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bazarr.nix)

## `services.bazarr.openFirewall` {#opt-services.bazarr.openFirewall}

Open ports in the firewall for the bazarr web interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/bazarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bazarr.nix)

## `services.bazarr.package` {#opt-services.bazarr.package}

The bazarr package to use.

*Type:* package

*Default:* `pkgs.bazarr`

*Declared by:* [`nixos/modules/services/misc/bazarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bazarr.nix)

## `services.bazarr.settings` {#opt-services.bazarr.settings}

Bazarr configuration.
Settings are emitted as `DYNACONF_*` environment variables at startup,
overriding any value previously written by Bazarr's web UI to `config.yaml`.

Use `_secret` to load values from files via systemd's `LoadCredential=`.
Secret contents are exported into Bazarr's environment at service start,
as either a string or a list of strings.

*Type:* open submodule of (JSON value, where an attribute value may instead be an attribute-tagged union with choices: \_secret)

*Default:* `{ }`

*Example:*

``` nix
{
  auth = {
    apikey = {
      _secret = "/run/secrets/bazarr-apikey";
    };
  };
  general = {
    instance_name = "NixOS Bazarr";
    port = 12345;
  };
  translator = {
    gemini_keys = {
      _secret = [
        "/run/secrets/bazarr-gemini-key-0"
        "/run/secrets/bazarr-gemini-key-1"
      ];
    };
  };
}
```

*Declared by:* [`nixos/modules/services/misc/bazarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bazarr.nix)

## `services.bazarr.settings.analytics.enabled` {#opt-services.bazarr.settings.analytics.enabled}

Whether to enable sending anonymous usage statistics to Bazarr's developers.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/bazarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bazarr.nix)

## `services.bazarr.settings.general.auto_update` {#opt-services.bazarr.settings.general.auto_update}

Whether Bazarr self-updates.
Always `false`, because the package is managed by Nix.

*Type:* boolean

*Default:* `false`

*Read only*

*Declared by:* [`nixos/modules/services/misc/bazarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bazarr.nix)

## `services.bazarr.settings.general.port` {#opt-services.bazarr.settings.general.port}

Port on which the Bazarr web interface listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6767`

*Declared by:* [`nixos/modules/services/misc/bazarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bazarr.nix)

## `services.bazarr.user` {#opt-services.bazarr.user}

User account under which bazarr runs.

*Type:* string

*Default:* `"bazarr"`

*Declared by:* [`nixos/modules/services/misc/bazarr.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bazarr.nix)

## `services.bcachefs.autoScrub.enable` {#opt-services.bcachefs.autoScrub.enable}

Whether to enable regular bcachefs scrub.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/filesystems/bcachefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/bcachefs.nix)

## `services.bcachefs.autoScrub.fileSystems` {#opt-services.bcachefs.autoScrub.fileSystems}

List of paths to bcachefs filesystems to regularly call `bcachefs scrub` on.
Defaults to all mount points with bcachefs filesystems.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/"
]
```

*Declared by:* [`nixos/modules/tasks/filesystems/bcachefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/bcachefs.nix)

## `services.bcachefs.autoScrub.interval` {#opt-services.bcachefs.autoScrub.interval}

Systemd calendar expression for when to scrub bcachefs filesystems.
The recommended period is a month but could be less.
See
`systemd.time(7)`
for more information on the syntax.

*Type:* string

*Default:* `"monthly"`

*Example:* `"weekly"`

*Declared by:* [`nixos/modules/tasks/filesystems/bcachefs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/bcachefs.nix)

## `services.bcg.automaticRemoveKitFromNames` {#opt-services.bcg.automaticRemoveKitFromNames}

Automatically remove kits.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.automaticRenameGenericNodes` {#opt-services.bcg.automaticRenameGenericNodes}

Automatically rename generic nodes.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.automaticRenameKitNodes` {#opt-services.bcg.automaticRenameKitNodes}

Automatically rename kit's nodes.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.automaticRenameNodes` {#opt-services.bcg.automaticRenameNodes}

Automatically rename all nodes.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.baseTopicPrefix` {#opt-services.bcg.baseTopicPrefix}

Topic prefix added to all MQTT messages.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.device` {#opt-services.bcg.device}

Device name to configure gateway to use.

*Type:* string

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.enable` {#opt-services.bcg.enable}

Whether to enable BigClown gateway.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.environmentFiles` {#opt-services.bcg.environmentFiles}

File to load as environment file. Environment variables from this file
will be interpolated into the config file using envsubst with this
syntax: `$ENVIRONMENT` or `${VARIABLE}`.
This is useful to avoid putting secrets into the nix store.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/run/keys/bcg.env"
]
```

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.mqtt.cafile` {#opt-services.bcg.mqtt.cafile}

Certificate Authority file for MQTT server access.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.mqtt.certfile` {#opt-services.bcg.mqtt.certfile}

Certificate file for MQTT server access.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.mqtt.host` {#opt-services.bcg.mqtt.host}

Host where MQTT server is running.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.mqtt.keyfile` {#opt-services.bcg.mqtt.keyfile}

Key file for MQTT server access.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.mqtt.password` {#opt-services.bcg.mqtt.password}

MQTT server access password.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.mqtt.port` {#opt-services.bcg.mqtt.port}

Port of MQTT server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `1883`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.mqtt.username` {#opt-services.bcg.mqtt.username}

MQTT server access username.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.name` {#opt-services.bcg.name}

Name for the device.

Supported variables:

- `IP address *`The ID of the connected usb-dongle or core-module`null` can be used for automatic detection from gateway firmware.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.package` {#opt-services.bcg.package}

The bcg package to use.

*Type:* package

*Default:* `pkgs.python3Packages.bcg`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.qosNodeMessages` {#opt-services.bcg.qosNodeMessages}

Set the guarantee of MQTT message delivery.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.rename` {#opt-services.bcg.rename}

Rename nodes to different name.

*Type:* attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.retainNodeMessages` {#opt-services.bcg.retainNodeMessages}

Specify that node messages should be retaied in MQTT broker.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.bcg.verbose` {#opt-services.bcg.verbose}

Verbosity level.

*Type:* one of "CRITICAL", "ERROR", "WARNING", "INFO", "DEBUG"

*Default:* `"WARNING"`

*Declared by:* [`nixos/modules/services/misc/bcg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bcg.nix)

## `services.beanstalkd.enable` {#opt-services.beanstalkd.enable}

Whether to enable the Beanstalk work queue.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/beanstalkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/beanstalkd.nix)

## `services.beanstalkd.listen.address` {#opt-services.beanstalkd.listen.address}

IP address to listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/beanstalkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/beanstalkd.nix)

## `services.beanstalkd.listen.port` {#opt-services.beanstalkd.listen.port}

TCP port that will be used to accept client connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `11300`

*Declared by:* [`nixos/modules/services/misc/beanstalkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/beanstalkd.nix)

## `services.beanstalkd.openFirewall` {#opt-services.beanstalkd.openFirewall}

Whether to open ports in the firewall for the server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/beanstalkd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/beanstalkd.nix)

## `services.bee.daemonNiceLevel` {#opt-services.bee.daemonNiceLevel}

Daemon process priority for bee.
0 is the default Unix process priority, 19 is the lowest.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/bee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bee.nix)

## `services.bee.enable` {#opt-services.bee.enable}

Whether to enable Ethereum Swarm Bee.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/bee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bee.nix)

## `services.bee.group` {#opt-services.bee.group}

Group the bee binary should execute under.

*Type:* string

*Default:* `"bee"`

*Declared by:* [`nixos/modules/services/networking/bee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bee.nix)

## `services.bee.package` {#opt-services.bee.package}

The bee package to use.

*Type:* package

*Default:* `pkgs.bee`

*Example:* `bee-unstable`

*Declared by:* [`nixos/modules/services/networking/bee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bee.nix)

## `services.bee.settings` {#opt-services.bee.settings}

Ethereum Swarm Bee configuration. Refer to
[https://gateway.ethswarm.org/bzz/docs.swarm.eth/docs/installation/configuration/](https://gateway.ethswarm.org/bzz/docs.swarm.eth/docs/installation/configuration/)
for details on supported values.

*Type:* YAML 1.1 value

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/bee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bee.nix)

## `services.bee.user` {#opt-services.bee.user}

User the bee binary should execute under.

*Type:* string

*Default:* `"bee"`

*Declared by:* [`nixos/modules/services/networking/bee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bee.nix)

## `services.beesd.filesystems` {#opt-services.beesd.filesystems}

BTRFS filesystems to run block-level deduplication on.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "-" = {
    spec = "LABEL=root";
    hashTableSizeMB = 2048;
    verbosity = "crit";
    extraOptions = [ "--loadavg-target" "5.0" ];
  };
}
```

*Declared by:* [`nixos/modules/services/misc/bees.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bees.nix)

## `services.beesd.filesystems.<name>.extraOptions` {#opt-services.beesd.filesystems._name_.extraOptions}

Extra command-line options passed to the daemon. See upstream bees documentation.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[ "--thread-count" "4" ]
```

*Declared by:* [`nixos/modules/services/misc/bees.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bees.nix)

## `services.beesd.filesystems.<name>.hashTableSizeMB` {#opt-services.beesd.filesystems._name_.hashTableSizeMB}

Hash table size in MB; must be a multiple of 16.

A larger ratio of index size to storage size means smaller blocks of
duplicate content are recognized.

If you have 1TB of data, a 4GB hash table (which is to say, a value of
4096) will permit 4KB extents (the smallest possible size) to be
recognized, whereas a value of 1024 -- creating a 1GB hash table --
will recognize only aligned duplicate blocks of 16KB.

*Type:* signed integer

*Default:* `1024`

*Declared by:* [`nixos/modules/services/misc/bees.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bees.nix)

## `services.beesd.filesystems.<name>.spec` {#opt-services.beesd.filesystems._name_.spec}

Description of how to identify the filesystem to be duplicated by this
instance of bees. Note that deduplication crosses subvolumes; one must
not configure multiple instances for subvolumes of the same filesystem
(or block devices which are part of the same filesystem), but only for
completely independent btrfs filesystems.

This must be in a format usable by findmnt; that could be a key=value
pair, or a bare path to a mount point.
Using bare paths will allow systemd to start the beesd service only
after mounting the associated path.

*Type:* string

*Example:* `"LABEL=MyBulkDataDrive"`

*Declared by:* [`nixos/modules/services/misc/bees.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bees.nix)

## `services.beesd.filesystems.<name>.verbosity` {#opt-services.beesd.filesystems._name_.verbosity}

Log verbosity (syslog keyword/level).

*Type:* one of "alert", "crit", "debug", "emerg", "err", "info", "notice", "trace", "warning", 1, 2, 7, 0, 3, 6, 5, 8, 4

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/misc/bees.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bees.nix)

## `services.beesd.filesystems.<name>.workDir` {#opt-services.beesd.filesystems._name_.workDir}

Name (relative to the root of the filesystem) of the subvolume where
the hash table will be stored.

*Type:* string

*Default:* `".beeshome"`

*Declared by:* [`nixos/modules/services/misc/bees.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bees.nix)

## `services.below.cgroupFilterOut` {#opt-services.below.cgroupFilterOut}

A regexp matching the full paths of cgroups whose data shouldn't be collected

*Type:* null or string

*Default:* `null`

*Example:* `"user.slice.*"`

*Declared by:* [`nixos/modules/services/monitoring/below.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/below.nix)

## `services.below.collect.diskStats` {#opt-services.below.collect.diskStats}

Whether to enable dist\_stat collection.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/below.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/below.nix)

## `services.below.collect.exitStats` {#opt-services.below.collect.exitStats}

Whether to enable eBPF-based exitstats.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/below.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/below.nix)

## `services.below.collect.ioStats` {#opt-services.below.collect.ioStats}

Whether to enable io.stat collection for cgroups.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/below.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/below.nix)

## `services.below.compression.enable` {#opt-services.below.compression.enable}

Whether to enable data compression.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/below.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/below.nix)

## `services.below.dirs.log` {#opt-services.below.dirs.log}

Where to store below's logs

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/below.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/below.nix)

## `services.below.dirs.store` {#opt-services.below.dirs.store}

Where to store below's data

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/below"`

*Declared by:* [`nixos/modules/services/monitoring/below.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/below.nix)

## `services.below.enable` {#opt-services.below.enable}

Whether to enable 'below' resource monitor.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/below.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/below.nix)

## `services.below.retention.size` {#opt-services.below.retention.size}

Size limit for below's data, in bytes. Data is deleted oldest-first, in 24h 'shards'.

::: note
The size limit may be exceeded by at most the size of the active shard, as:

- the active shard cannot be deleted;
- the size limit is only enforced when a new shard is created.
:::

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/below.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/below.nix)

## `services.below.retention.time` {#opt-services.below.retention.time}

Retention time, in seconds.

::: note
As data is stored in 24 hour shards which are discarded as a whole,
only data expired by 24h (or more) is guaranteed to be discarded.
:::

::: note
If `retention.size` is set, data may be discarded earlier than the specified time.
:::

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/below.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/below.nix)

## `services.bentopdf.caddy.enable` {#opt-services.bentopdf.caddy.enable}

Whether to enable a virtualhost to serve bentopdf through caddy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.caddy.virtualHost` {#opt-services.bentopdf.caddy.virtualHost}

Extra configuration for the caddy virtual host of bentopdf.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  serverAliases = [ "bentopdf.${config.networking.domain}" ];
}
```

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.caddy.virtualHost.extraConfig` {#opt-services.bentopdf.caddy.virtualHost.extraConfig}

Additional lines of configuration appended to this virtual host in the
automatically generated `Caddyfile`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.caddy.virtualHost.hostName` {#opt-services.bentopdf.caddy.virtualHost.hostName}

Canonical hostname for the server.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.caddy.virtualHost.listenAddresses` {#opt-services.bentopdf.caddy.virtualHost.listenAddresses}

A list of host interfaces to bind to for this virtual host.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "127.0.0.1"
  "::1"
]
```

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.caddy.virtualHost.logFormat` {#opt-services.bentopdf.caddy.virtualHost.logFormat}

Configuration for HTTP request logging (also known as access logs). See
[https://caddyserver.com/docs/caddyfile/directives/log#log](https://caddyserver.com/docs/caddyfile/directives/log#log)
for details.

*Type:* null or strings concatenated with "\\n"

*Default:*

``` nix
''
  output file ''${config.services.caddy.logDir}/access-''${hostName}.log
''
```

*Example:*

``` nix
mkForce ''
  output discard
'';
```

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.caddy.virtualHost.serverAliases` {#opt-services.bentopdf.caddy.virtualHost.serverAliases}

Additional names of virtual hosts served by this virtual host configuration.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "www.example.org"
  "example.org"
]
```

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.caddy.virtualHost.useACMEHost` {#opt-services.bentopdf.caddy.virtualHost.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is mostly useful if you use DNS challenges but Caddy does not
currently support your provider.

*Note that this option does not create any certificates, nor
does it add subdomains to existing ones – you will need to create them
manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.domain` {#opt-services.bentopdf.domain}

Domain to use for the virtual host.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.enable` {#opt-services.bentopdf.enable}

Whether to enable bentopdf Privacy First PDF Toolkit.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.enable` {#opt-services.bentopdf.nginx.enable}

Whether to enable a virtualhost to serve bentopdf through nginx.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost` {#opt-services.bentopdf.nginx.virtualHost}

Extra configuration for the nginx virtual host of bentopdf.

*Type:* submodule

*Default:* `{ }`

*Example:*

``` nix
{
  serverAliases = [ "bentopdf.${config.networking.domain}" ];
}
```

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.acmeFallbackHost` {#opt-services.bentopdf.nginx.virtualHost.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.acmeRoot` {#opt-services.bentopdf.nginx.virtualHost.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.addSSL` {#opt-services.bentopdf.nginx.virtualHost.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.basicAuth` {#opt-services.bentopdf.nginx.virtualHost.basicAuth}

Basic Auth protection for a vhost.

WARNING: This is implemented to store the password in plain text in the
Nix store.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  user = "password";
};
```

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.basicAuthFile` {#opt-services.bentopdf.nginx.virtualHost.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.default` {#opt-services.bentopdf.nginx.virtualHost.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.enableACME` {#opt-services.bentopdf.nginx.virtualHost.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.extraConfig` {#opt-services.bentopdf.nginx.virtualHost.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.forceSSL` {#opt-services.bentopdf.nginx.virtualHost.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.globalRedirect` {#opt-services.bentopdf.nginx.virtualHost.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.http2` {#opt-services.bentopdf.nginx.virtualHost.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.http3` {#opt-services.bentopdf.nginx.virtualHost.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.http3_hq` {#opt-services.bentopdf.nginx.virtualHost.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.kTLS` {#opt-services.bentopdf.nginx.virtualHost.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.listen` {#opt-services.bentopdf.nginx.virtualHost.listen}

Listen addresses and ports for this virtual host.
IPv6 addresses must be enclosed in square brackets.
Note: this option overrides `addSSL`
and `onlySSL`.

If you only want to set the addresses manually and not
the ports, take a look at `listenAddresses`.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    addr = "195.154.1.1";
    port = 443;
    ssl = true;
  }
  {
    addr = "192.154.1.1";
    port = 80;
  }
  {
    addr = "unix:/var/run/nginx.sock";
  }
]
```

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.listen.*.addr` {#opt-services.bentopdf.nginx.virtualHost.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.listen.*.extraParameters` {#opt-services.bentopdf.nginx.virtualHost.listen._.extraParameters}

Extra parameters of this listen directive.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "backlog=1024"
  "deferred"
]
```

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.listen.*.port` {#opt-services.bentopdf.nginx.virtualHost.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.listen.*.proxyProtocol` {#opt-services.bentopdf.nginx.virtualHost.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.listen.*.ssl` {#opt-services.bentopdf.nginx.virtualHost.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.listenAddresses` {#opt-services.bentopdf.nginx.virtualHost.listenAddresses}

Listen addresses for this virtual host.
Compared to `listen` this only sets the addresses
and the ports are chosen automatically.

Note: This option overrides `networking.enableIPv6`

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "127.0.0.1"
  "[::1]"
]
```

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations` {#opt-services.bentopdf.nginx.virtualHost.locations}

Declarative location config

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "/" = {
    proxyPass = "http://localhost:3000";
  };
};
```

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.alias` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.basicAuth` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.basicAuth}

Basic Auth protection for a vhost.

WARNING: This is implemented to store the password in plain text in the
Nix store.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  user = "password";
};
```

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.basicAuthFile` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.extraConfig` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.fastcgiParams` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.index` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.priority` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.proxyPass` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.proxyWebsockets` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.recommendedProxySettings` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.recommendedUwsgiSettings` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.return` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.root` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.tryFiles` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.useGrpcErrorPages` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.locations.<name>.uwsgiPass` {#opt-services.bentopdf.nginx.virtualHost.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.onlySSL` {#opt-services.bentopdf.nginx.virtualHost.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.quic` {#opt-services.bentopdf.nginx.virtualHost.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.redirectCode` {#opt-services.bentopdf.nginx.virtualHost.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.rejectSSL` {#opt-services.bentopdf.nginx.virtualHost.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.reuseport` {#opt-services.bentopdf.nginx.virtualHost.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.root` {#opt-services.bentopdf.nginx.virtualHost.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.serverAliases` {#opt-services.bentopdf.nginx.virtualHost.serverAliases}

Additional names of virtual hosts served by this virtual host configuration.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "www.example.org"
  "example.org"
]
```

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.serverName` {#opt-services.bentopdf.nginx.virtualHost.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.sslCertificate` {#opt-services.bentopdf.nginx.virtualHost.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.sslCertificateKey` {#opt-services.bentopdf.nginx.virtualHost.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.sslTrustedCertificate` {#opt-services.bentopdf.nginx.virtualHost.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.nginx.virtualHost.useACMEHost` {#opt-services.bentopdf.nginx.virtualHost.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bentopdf.package` {#opt-services.bentopdf.package}

The bentopdf package to use. To use the "normal mode" variant of bentopdf, which includes all socials, marketing and explanatory texts, set this option to `pkgs.bentopdf.override { simpleMode = false; }`.

*Type:* package

*Default:* `pkgs.bentopdf`

*Declared by:* [`nixos/modules/services/web-apps/bentopdf.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bentopdf.nix)

## `services.bepasty.enable` {#opt-services.bepasty.enable}

Whether to enable bepasty, a binary pastebin server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/bepasty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bepasty.nix)

## `services.bepasty.servers` {#opt-services.bepasty.servers}

configure a number of bepasty servers which will be started with
gunicorn.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/misc/bepasty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bepasty.nix)

## `services.bepasty.servers.<name>.bind` {#opt-services.bepasty.servers._name_.bind}

Bind address to be used for this server.

*Type:* string

*Default:* `"127.0.0.1:8000"`

*Example:* `"0.0.0.0:8000"`

*Declared by:* [`nixos/modules/services/misc/bepasty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bepasty.nix)

## `services.bepasty.servers.<name>.dataDir` {#opt-services.bepasty.servers._name_.dataDir}

Path to the directory where the pastes will be saved to

*Type:* string

*Default:* `"/var/lib/bepasty/data"`

*Declared by:* [`nixos/modules/services/misc/bepasty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bepasty.nix)

## `services.bepasty.servers.<name>.defaultPermissions` {#opt-services.bepasty.servers._name_.defaultPermissions}

default permissions for all unauthenticated accesses.

*Type:* string

*Default:* `"read"`

*Example:* `"read,create,delete"`

*Declared by:* [`nixos/modules/services/misc/bepasty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bepasty.nix)

## `services.bepasty.servers.<name>.extraConfig` {#opt-services.bepasty.servers._name_.extraConfig}

Extra configuration for bepasty server to be appended on the
configuration.
see [https://bepasty-server.readthedocs.org/en/latest/quickstart.html#configuring-bepasty](https://bepasty-server.readthedocs.org/en/latest/quickstart.html#configuring-bepasty)
for all options.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  PERMISSIONS = {
    'myadminsecret': 'admin,list,create,read,delete',
  }
  MAX_ALLOWED_FILE_SIZE = 5 * 1000 * 1000
''
```

*Declared by:* [`nixos/modules/services/misc/bepasty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bepasty.nix)

## `services.bepasty.servers.<name>.secretKey` {#opt-services.bepasty.servers._name_.secretKey}

server secret for safe session cookies, must be set.

Warning: this secret is stored in the WORLD-READABLE Nix store!

It's recommended to use `secretKeyFile`
which takes precedence over `secretKey`.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/bepasty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bepasty.nix)

## `services.bepasty.servers.<name>.secretKeyFile` {#opt-services.bepasty.servers._name_.secretKeyFile}

A file that contains the server secret for safe session cookies, must be set.

`secretKeyFile` takes precedence over `secretKey`.

Warning: when `secretKey` is non-empty `secretKeyFile`
defaults to a file in the WORLD-READABLE Nix store containing that secret.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/bepasty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bepasty.nix)

## `services.bepasty.servers.<name>.workDir` {#opt-services.bepasty.servers._name_.workDir}

Path to the working directory (used for config and pidfile).
Defaults to the users home directory.

*Type:* string

*Default:* `"/var/lib/bepasty"`

*Declared by:* [`nixos/modules/services/misc/bepasty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bepasty.nix)

## `services.beszel.agent.dataDir` {#opt-services.beszel.agent.dataDir}

Data directory of beszel-agent.

*Type:* absolute path

*Default:* `"/var/lib/beszel-agent"`

*Declared by:* [`nixos/modules/services/monitoring/beszel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-agent.nix)

## `services.beszel.agent.enable` {#opt-services.beszel.agent.enable}

Whether to enable beszel agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/beszel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-agent.nix)

## `services.beszel.agent.environment` {#opt-services.beszel.agent.environment}

Environment variables for configuring the beszel-agent service.
This field will end up public in /nix/store, for secret values (such as `KEY`) use `environmentFile`.

See [https://www.beszel.dev/guide/environment-variables#agent](https://www.beszel.dev/guide/environment-variables#agent) for available options.

*Type:* open submodule of attribute set of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/monitoring/beszel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-agent.nix)

## `services.beszel.agent.environment.GPU_COLLECTOR` {#opt-services.beszel.agent.environment.GPU_COLLECTOR}

GPU collectors to use, in priority order. Overrides the agent's
auto-detection; the packages needed by the selected collectors are added
to the service path. If empty, the agent auto-detects available
collectors. `rocm-smi` is deprecated upstream in favour of `amd_sysfs`,
and `intel_gpu_top` is not used on the xe driver, where `intel_sysfs` is
preferred.

Access to GPU device nodes is only granted for the collectors listed
here, so a collector provided through
[`services.beszel.agent.extraPath`](#opt-services.beszel.agent.extraPath) has to be listed as well.

*Type:* (list of (one of "amd\_sysfs", "intel\_gpu\_top", "intel\_sysfs", "nvidia-smi", "nvml", "nvtop", "rocm-smi")) or string convertible to it

*Default:* derived from [`services.xserver.videoDrivers`](../../options/services-x/index.md#opt-services.xserver.videoDrivers)

*Example:*

``` nix
[
  "nvidia-smi"
  "intel_gpu_top"
]
```

*Declared by:* [`nixos/modules/services/monitoring/beszel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-agent.nix)

## `services.beszel.agent.environment.SKIP_GPU` {#opt-services.beszel.agent.environment.SKIP_GPU}

Whether to disable GPU monitoring.
Enabling this option will skip GPU tracking.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/beszel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-agent.nix)

## `services.beszel.agent.environment.SKIP_SYSTEMD` {#opt-services.beszel.agent.environment.SKIP_SYSTEMD}

Whether to disable systemd service monitoring.
Enabling this option will skip systemd tracking and its setup in NixOS.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/beszel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-agent.nix)

## `services.beszel.agent.environment.SKIP_SYSTEMD_LOGS` {#opt-services.beszel.agent.environment.SKIP_SYSTEMD_LOGS}

Whether to disable systemd service logs.
Enabling this option stops the agent from reading the system journal
and drops its membership in the `systemd-journal` group.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/beszel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-agent.nix)

## `services.beszel.agent.environmentFile` {#opt-services.beszel.agent.environmentFile}

File path containing environment variables for configuring the beszel-agent service in the format of an EnvironmentFile. See `systemd.exec(5)`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/beszel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-agent.nix)

## `services.beszel.agent.extraPath` {#opt-services.beszel.agent.extraPath}

Extra packages to add to beszel path (such as nvidia-smi or rocm-smi).

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/monitoring/beszel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-agent.nix)

## `services.beszel.agent.openFirewall` {#opt-services.beszel.agent.openFirewall}

Whether to open the firewall port (default 45876).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/beszel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-agent.nix)

## `services.beszel.agent.package` {#opt-services.beszel.agent.package}

The beszel package to use.

*Type:* package

*Default:* `pkgs.beszel`

*Declared by:* [`nixos/modules/services/monitoring/beszel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-agent.nix)

## `services.beszel.agent.smartmon.deviceAllow` {#opt-services.beszel.agent.smartmon.deviceAllow}

List of device paths to allow access to for SMART monitoring.
This is only needed if the ambient capabilities are not sufficient.
Devices will be granted read-only access.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/dev/sda"
  "/dev/sdb"
  "/dev/nvme0"
]
```

*Declared by:* [`nixos/modules/services/monitoring/beszel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-agent.nix)

## `services.beszel.agent.smartmon.enable` {#opt-services.beszel.agent.smartmon.enable}

Include services.beszel.agent.smartmon.package in the Beszel agent path for disk monitoring and add the agent to the disk group.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/beszel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-agent.nix)

## `services.beszel.agent.smartmon.package` {#opt-services.beszel.agent.smartmon.package}

The smartmontools package to use.

*Type:* package

*Default:* `pkgs.smartmontools`

*Declared by:* [`nixos/modules/services/monitoring/beszel-agent.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-agent.nix)

## `services.beszel.hub.dataDir` {#opt-services.beszel.hub.dataDir}

Data directory of beszel-hub.

*Type:* absolute path

*Default:* `"/var/lib/beszel-hub"`

*Declared by:* [`nixos/modules/services/monitoring/beszel-hub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-hub.nix)

## `services.beszel.hub.enable` {#opt-services.beszel.hub.enable}

Whether to enable beszel hub.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/beszel-hub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-hub.nix)

## `services.beszel.hub.environment` {#opt-services.beszel.hub.environment}

Environment variables passed to the systemd service.
See [https://www.beszel.dev/guide/environment-variables#hub](https://www.beszel.dev/guide/environment-variables#hub) for available options.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  DISABLE_PASSWORD_AUTH = "true";
}
```

*Declared by:* [`nixos/modules/services/monitoring/beszel-hub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-hub.nix)

## `services.beszel.hub.environmentFile` {#opt-services.beszel.hub.environmentFile}

Environment file to be passed to the systemd service.
Useful for passing secrets to the service to prevent them from being
world-readable in the Nix store. See `systemd.exec(5)`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/beszel-hub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-hub.nix)

## `services.beszel.hub.host` {#opt-services.beszel.hub.host}

Host or address this beszel hub listens on.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/monitoring/beszel-hub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-hub.nix)

## `services.beszel.hub.package` {#opt-services.beszel.hub.package}

The beszel package to use.

*Type:* package

*Default:* `pkgs.beszel`

*Declared by:* [`nixos/modules/services/monitoring/beszel-hub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-hub.nix)

## `services.beszel.hub.port` {#opt-services.beszel.hub.port}

Port for this beszel hub to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8090`

*Example:* `3002`

*Declared by:* [`nixos/modules/services/monitoring/beszel-hub.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/beszel-hub.nix)

## `services.biboumi.credentialsFile` {#opt-services.biboumi.credentialsFile}

Path to a configuration file to be merged with the settings.
Beware not to surround "=" with spaces when setting biboumi's options in this file.
Useful to merge a file which is better kept out of the Nix store
because it contains sensible data like
[password](#opt-services.biboumi.settings.password).

*Type:* absolute path

*Default:* `"/dev/null"`

*Example:* `"/run/keys/biboumi.cfg"`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.enable` {#opt-services.biboumi.enable}

Whether to enable the Biboumi XMPP gateway to IRC.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.openFirewall` {#opt-services.biboumi.openFirewall}

Whether to enable opening of the identd port in the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.package` {#opt-services.biboumi.package}

The biboumi package to use.

*Type:* package

*Default:* `pkgs.biboumi`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.settings` {#opt-services.biboumi.settings}

See [biboumi 9.0](https://doc.biboumi.louiz.org/9.0/admin.html#configuration)

for documentation.

*Type:* open submodule of settings option

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.settings.admin` {#opt-services.biboumi.settings.admin}

The bare JID of the gateway administrator. This JID will have more
privileges than other standard users, for example some administration
ad-hoc commands will only be available to that JID.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "admin@example.org"
]
```

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.settings.ca_file` {#opt-services.biboumi.settings.ca_file}

Specifies which file should be used as the list of trusted CA
when negotiating a TLS session.

*Type:* absolute path

*Default:* `config.security.pki.caBundle`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.settings.db_name` {#opt-services.biboumi.settings.db_name}

The name of the database to use.

Set it to null and use [credentialsFile](#opt-services.biboumi.credentialsFile)
if you do not want this connection string to go into the Nix store.

*Type:* null or absolute path or string

*Default:* `"/var/lib/biboumi/biboumi.sqlite"`

*Example:* `"postgresql://user:secret@localhost"`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.settings.hostname` {#opt-services.biboumi.settings.hostname}

The hostname served by the XMPP gateway.
This domain must be configured in the XMPP server
as an external component.

*Type:* string

*Example:* `"biboumi.example.org"`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.settings.identd_port` {#opt-services.biboumi.settings.identd_port}

The TCP port on which to listen for identd queries.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `113`

*Example:* `0`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.settings.log_level` {#opt-services.biboumi.settings.log_level}

Indicate what type of log messages to write in the logs.
0 is debug, 1 is info, 2 is warning, 3 is error.

*Type:* integer between 0 and 3 (both inclusive)

*Default:* `1`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.settings.password` {#opt-services.biboumi.settings.password}

The password used to authenticate the XMPP component to your XMPP server.
This password must be configured in the XMPP server,
associated with the external component on
[hostname](#opt-services.biboumi.settings.hostname).

Set it to null and use [credentialsFile](#opt-services.biboumi.credentialsFile)
if you do not want this password to go into the Nix store.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.settings.persistent_by_default` {#opt-services.biboumi.settings.persistent_by_default}

Whether all rooms will be persistent by default:
the value of the “persistent” option in the global configuration of each
user will be “true”, but the value of each individual room will still
default to false. This means that a user just needs to change the global
“persistent” configuration option to false in order to override this.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.settings.policy_directory` {#opt-services.biboumi.settings.policy_directory}

A directory that should contain the policy files,
used to customize Botan’s behaviour
when negotiating the TLS connections with the IRC servers.

*Type:* absolute path

*Default:* `"${pkgs.biboumi}/etc/biboumi"`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.settings.port` {#opt-services.biboumi.settings.port}

The TCP port to use to connect to the local XMPP component.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5347`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.settings.realname_customization` {#opt-services.biboumi.settings.realname_customization}

Whether the users will be able to use
the ad-hoc commands that lets them configure
their realname and username.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.settings.realname_from_jid` {#opt-services.biboumi.settings.realname_from_jid}

Whether the realname and username of each biboumi
user will be extracted from their JID.
Otherwise they will be set to the nick
they used to connect to the IRC server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.biboumi.settings.xmpp_server_ip` {#opt-services.biboumi.settings.xmpp_server_ip}

The IP address to connect to the XMPP server on.
The connection to the XMPP server is unencrypted,
so the biboumi instance and the server should
normally be on the same host.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/biboumi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/biboumi.nix)

## `services.bifrost.enable` {#opt-services.bifrost.enable}

Whether to enable Bifrost, a high-performance LLM gateway with native MCP support.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/bifrost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bifrost.nix)

## `services.bifrost.environment` {#opt-services.bifrost.environment}

Extra environment variables for the Bifrost service.

These end up world-readable in the Nix store, so pass provider API keys
through [`services.bifrost.environmentFile`](#opt-services.bifrost.environmentFile) instead.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  BIFROST_ENV_LABEL = "prod";
}
```

*Declared by:* [`nixos/modules/services/misc/bifrost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bifrost.nix)

## `services.bifrost.environmentFile` {#opt-services.bifrost.environmentFile}

Environment file passed to the systemd service. Useful for passing
provider API keys without making them world-readable in the Nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/bifrost.env"`

*Declared by:* [`nixos/modules/services/misc/bifrost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bifrost.nix)

## `services.bifrost.extraArgs` {#opt-services.bifrost.extraArgs}

Extra CLI arguments passed to `bifrost-http`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-some-flag"
  "value"
]
```

*Declared by:* [`nixos/modules/services/misc/bifrost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bifrost.nix)

## `services.bifrost.host` {#opt-services.bifrost.host}

Address Bifrost listens on.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/misc/bifrost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bifrost.nix)

## `services.bifrost.logLevel` {#opt-services.bifrost.logLevel}

Logger verbosity.

*Type:* one of "debug", "info", "warn", "error"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/misc/bifrost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bifrost.nix)

## `services.bifrost.logStyle` {#opt-services.bifrost.logStyle}

Logger output style.

*Type:* one of "json", "pretty"

*Default:* `"json"`

*Declared by:* [`nixos/modules/services/misc/bifrost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bifrost.nix)

## `services.bifrost.openFirewall` {#opt-services.bifrost.openFirewall}

Open [`services.bifrost.port`](#opt-services.bifrost.port) in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/bifrost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bifrost.nix)

## `services.bifrost.package` {#opt-services.bifrost.package}

The bifrost package to use.

*Type:* package

*Default:* `pkgs.bifrost`

*Declared by:* [`nixos/modules/services/misc/bifrost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bifrost.nix)

## `services.bifrost.port` {#opt-services.bifrost.port}

Port Bifrost listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Example:* `11111`

*Declared by:* [`nixos/modules/services/misc/bifrost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bifrost.nix)

## `services.bifrost.settings` {#opt-services.bifrost.settings}

Optional content for `config.json` under [`services.bifrost.stateDir`](#opt-services.bifrost.stateDir).

When set, the file is written on service start, overwriting any existing
`config.json`. When `null`, Bifrost uses an existing `config.json` or
bootstraps from environment variables / the admin UI.

This ends up world-readable in the Nix store, so keep secrets out of it:
provider keys accept an `env.VARIABLE` reference, and the `postgres`
backends of `config_store` and `logs_store` accept a `password_command`
(an executable printing the password on stdout) instead of `password`.

*Type:* null or JSON value

*Default:* `null`

*Example:*

``` nix
{
  providers = [
    {
      enabled = true;
      keys = [
        {
          name = "default";
          value = "env.OPENAI_API_KEY";
        }
      ];
      name = "openai";
    }
  ];
}
```

*Declared by:* [`nixos/modules/services/misc/bifrost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bifrost.nix)

## `services.bifrost.stateDir` {#opt-services.bifrost.stateDir}

Application data directory (contains `config.json` and logs).
Must be a direct child of `/var/lib` so it works with systemd's
`StateDirectory=` and `DynamicUser=`.

*Type:* absolute path

*Default:* `"/var/lib/bifrost"`

*Example:* `"/var/lib/bifrost"`

*Declared by:* [`nixos/modules/services/misc/bifrost.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/bifrost.nix)

## `services.bind.blockedNetworks` {#opt-services.bind.blockedNetworks}

What networks are just blocked.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.cacheNetworks` {#opt-services.bind.cacheNetworks}

What networks are allowed to use us as a resolver.  Note
that this is for recursive queries -- all networks are
allowed to query zones configured with the `zones` option
by default (although this may be overridden within each
zone's configuration, via the `allowQuery` option).
It is recommended that you limit cacheNetworks to avoid your
server being used for DNS amplification attacks.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.0/24"
  "::1/128"
]
```

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.checkConfig` {#opt-services.bind.checkConfig}

Check configuration.

The configuration will not be checked if you override the config file
with `configFile`.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.configFile` {#opt-services.bind.configFile}

Overridable config file to use for named. By default, that
generated by nixos. If overriden, it will not be checked by
named-checkconf.

*Type:* absolute path

*Default:* `confFile`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.directory` {#opt-services.bind.directory}

Working directory of BIND.

*Type:* string

*Default:* `"/run/named"`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.enable` {#opt-services.bind.enable}

Whether to enable BIND domain name server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.extraArgs` {#opt-services.bind.extraArgs}

Additional command-line arguments to pass to named.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-n"
  "4"
]
```

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.extraConfig` {#opt-services.bind.extraConfig}

Extra lines to be added verbatim to the generated named configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.extraOptions` {#opt-services.bind.extraOptions}

Extra lines to be added verbatim to the options section of the
generated named configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.forward` {#opt-services.bind.forward}

Whether to forward 'first' (try forwarding but lookup directly if forwarding fails) or 'only'.

*Type:* one of "first", "only"

*Default:* `"first"`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.forwarders` {#opt-services.bind.forwarders}

List of servers we should forward requests to.

*Type:* list of string

*Default:* `config.networking.nameservers`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.ipv4Only` {#opt-services.bind.ipv4Only}

Only use ipv4, even if the host supports ipv6.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.listenOn` {#opt-services.bind.listenOn}

Interfaces to listen on.

*Type:* list of string

*Default:*

``` nix
[
  "any"
]
```

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.listenOnIpv6` {#opt-services.bind.listenOnIpv6}

Ipv6 interfaces to listen on.

*Type:* list of string

*Default:*

``` nix
[
  "any"
]
```

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.listenOnIpv6Port` {#opt-services.bind.listenOnIpv6Port}

Ipv6 port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `53`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.listenOnPort` {#opt-services.bind.listenOnPort}

Port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `53`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.package` {#opt-services.bind.package}

The bind package to use.

*Type:* package

*Default:* `pkgs.bind`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.preCheckConfig` {#opt-services.bind.preCheckConfig}

Run a script during the configuration check phase.

This can be used to patch the configuration file if, for example, it
contains elements not available in the sandbox.
The configuration file is located in the variable `$target`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  substituteInPlace $target \
    --replace-fail 'include "/secrets/domain.key"' ""
''
```

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.zones` {#opt-services.bind.zones}

List of zones we claim authority over.

*Type:* (attribute set of (submodule)) or (list of (attribute set)) convertible to it

*Default:* `[ ]`

*Example:*

``` nix
{
  "example.com" = {
    extraConfig = "";
    file = "/var/dns/example.com";
    master = false;
    masters = [
      "192.168.0.1"
    ];
    slaves = [ ];
  };
}
```

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.zones.<name>.allowQuery` {#opt-services.bind.zones._name_.allowQuery}

List of address ranges allowed to query this zone. Instead of the address(es), this may instead
contain the single string "any".

*Type:* list of string

*Default:*

``` nix
[
  "any"
]
```

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.zones.<name>.extraConfig` {#opt-services.bind.zones._name_.extraConfig}

Extra zone config to be appended at the end of the zone section.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.zones.<name>.file` {#opt-services.bind.zones._name_.file}

Zone file resource records contain columns of data, separated by whitespace, that define the record.

*Type:* string or absolute path

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.zones.<name>.master` {#opt-services.bind.zones._name_.master}

Master=false means slave server

*Type:* boolean

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.zones.<name>.masters` {#opt-services.bind.zones._name_.masters}

List of servers for inclusion in stub and secondary zones.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.zones.<name>.name` {#opt-services.bind.zones._name_.name}

Name of the zone.

*Type:* string

*Default:* `"‹name›"`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bind.zones.<name>.slaves` {#opt-services.bind.zones._name_.slaves}

Addresses who may request zone transfers.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/bind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bind.nix)

## `services.bird-lg.frontend.bgpMapInfo` {#opt-services.bird-lg.frontend.bgpMapInfo}

Information displayed in bgpmap.

*Type:* list of string

*Default:*

``` nix
[
  "asn"
  "as-name"
  "ASName"
  "descr"
]
```

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.dnsInterface` {#opt-services.bird-lg.frontend.dnsInterface}

DNS zone to query ASN information.

*Type:* string

*Default:* `"asn.cymru.com"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.domain` {#opt-services.bird-lg.frontend.domain}

Server name domain suffixes.

*Type:* string

*Example:* `"dn42.lantian.pub"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.enable` {#opt-services.bird-lg.frontend.enable}

Whether to enable Bird Looking Glass Frontend Webserver.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.extraArgs` {#opt-services.bird-lg.frontend.extraArgs}

Extra parameters documented [here](https://github.com/xddxdd/bird-lg-go#frontend).

::: note
Passing lines (plain strings) is deprecated in favour of passing lists of strings.
:::

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.listenAddresses` {#opt-services.bird-lg.frontend.listenAddresses}

Address to listen on.

*Type:* string or list of string

*Default:* `"127.0.0.1:5000"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.nameFilter` {#opt-services.bird-lg.frontend.nameFilter}

Protocol names to hide in summary tables (RE2 syntax),

*Type:* string

*Default:* `""`

*Example:* `"^ospf"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.navbar.allServers` {#opt-services.bird-lg.frontend.navbar.allServers}

Text of 'All server' button in the navigation bar.

*Type:* string

*Default:* `"ALL Servers"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.navbar.allServersURL` {#opt-services.bird-lg.frontend.navbar.allServersURL}

URL of 'All servers' button.

*Type:* string

*Default:* `"all"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.navbar.brand` {#opt-services.bird-lg.frontend.navbar.brand}

Brand to show in the navigation bar .

*Type:* string

*Default:* `"Bird-lg Go"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.navbar.brandURL` {#opt-services.bird-lg.frontend.navbar.brandURL}

URL of the brand to show in the navigation bar.

*Type:* string

*Default:* `"/"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.netSpecificMode` {#opt-services.bird-lg.frontend.netSpecificMode}

Apply network-specific changes for some networks.

*Type:* string

*Default:* `""`

*Example:* `"dn42"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.protocolFilter` {#opt-services.bird-lg.frontend.protocolFilter}

Information displayed in bgpmap.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "ospf"
]
```

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.proxyPort` {#opt-services.bird-lg.frontend.proxyPort}

Port bird-lg-proxy is running on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8000`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.servers` {#opt-services.bird-lg.frontend.servers}

Server name prefixes.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "gigsgigscloud"
  "hostdare"
]
```

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.timeout` {#opt-services.bird-lg.frontend.timeout}

Time before request timed out, in seconds.

*Type:* signed integer

*Default:* `120`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.titleBrand` {#opt-services.bird-lg.frontend.titleBrand}

Prefix of page titles in browser tabs.

*Type:* string

*Default:* `"Bird-lg Go"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.frontend.whois` {#opt-services.bird-lg.frontend.whois}

Whois server for queries.

*Type:* string

*Default:* `"whois.verisign-grs.com"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.group` {#opt-services.bird-lg.group}

Group to run the service.

*Type:* string

*Default:* `"bird-lg"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.package` {#opt-services.bird-lg.package}

The bird-lg package to use.

*Type:* package

*Default:* `pkgs.bird-lg`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.proxy.allowedIPs` {#opt-services.bird-lg.proxy.allowedIPs}

List of IPs or networks to allow (default all allowed).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "192.168.25.52"
  "192.168.25.53"
  "192.168.0.0/24"
]
```

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.proxy.birdSocket` {#opt-services.bird-lg.proxy.birdSocket}

Bird control socket path.

*Type:* string

*Default:* `"/var/run/bird/bird.ctl"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.proxy.enable` {#opt-services.bird-lg.proxy.enable}

Whether to enable Bird Looking Glass Proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.proxy.extraArgs` {#opt-services.bird-lg.proxy.extraArgs}

Extra parameters documented [here](https://github.com/xddxdd/bird-lg-go#proxy).

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.proxy.listenAddresses` {#opt-services.bird-lg.proxy.listenAddresses}

Address to listen on.

*Type:* string or list of string

*Default:* `"127.0.0.1:8000"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.proxy.traceroute.binary` {#opt-services.bird-lg.proxy.traceroute.binary}

Traceroute's binary path.

*Type:* string

*Default:* `"${pkgs.traceroute}/bin/traceroute"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.proxy.traceroute.flags` {#opt-services.bird-lg.proxy.traceroute.flags}

Flags for traceroute process

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.proxy.traceroute.rawOutput` {#opt-services.bird-lg.proxy.traceroute.rawOutput}

Display traceroute output in raw format.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird-lg.user` {#opt-services.bird-lg.user}

User to run the service.

*Type:* string

*Default:* `"bird-lg"`

*Declared by:* [`nixos/modules/services/networking/bird-lg.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird-lg.nix)

## `services.bird.autoReload` {#opt-services.bird.autoReload}

Whether bird should be automatically reloaded when the configuration changes.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/bird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird.nix)

## `services.bird.checkConfig` {#opt-services.bird.checkConfig}

Whether the config should be checked at build time.
When the config can't be checked during build time, for example when it includes
other files, either disable this option or use `preCheckConfig` to create
the included files before checking.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/bird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird.nix)

## `services.bird.config` {#opt-services.bird.config}

BIRD Internet Routing Daemon configuration file.
[http://bird.network.cz/](http://bird.network.cz/)

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/networking/bird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird.nix)

## `services.bird.enable` {#opt-services.bird.enable}

Whether to enable BIRD Internet Routing Daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/bird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird.nix)

## `services.bird.package` {#opt-services.bird.package}

The bird3 package to use.

*Type:* package

*Default:* `pkgs.bird3`

*Declared by:* [`nixos/modules/services/networking/bird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird.nix)

## `services.bird.preCheckConfig` {#opt-services.bird.preCheckConfig}

Commands to execute before the config file check. The file to be checked will be
available as `bird.conf` in the current directory.

Files created with this option will not be available at service runtime, only during
build time checking.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  echo "cost 100;" > include.conf
''
```

*Declared by:* [`nixos/modules/services/networking/bird.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bird.nix)

## `services.birdwatcher.enable` {#opt-services.birdwatcher.enable}

Whether to enable Birdwatcher.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/birdwatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/birdwatcher.nix)

## `services.birdwatcher.flags` {#opt-services.birdwatcher.flags}

Flags to append to the program call

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-worker-pool-size 16"
  "-6"
]
```

*Declared by:* [`nixos/modules/services/networking/birdwatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/birdwatcher.nix)

## `services.birdwatcher.package` {#opt-services.birdwatcher.package}

The birdwatcher package to use.

*Type:* package

*Default:* `pkgs.birdwatcher`

*Declared by:* [`nixos/modules/services/networking/birdwatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/birdwatcher.nix)

## `services.birdwatcher.settings` {#opt-services.birdwatcher.settings}

birdwatcher configuration, for configuration options see the example on [github](https://github.com/alice-lg/birdwatcher/blob/master/etc/birdwatcher/birdwatcher.conf)

*Type:* strings concatenated with "\\n"

*Default:* `{ }`

*Example:*

``` nix
[server]
allow_from = []
allow_uncached = false
modules_enabled = ["status",
                   "protocols",
                   "protocols_bgp",
                   "protocols_short",
                   "routes_protocol",
                   "routes_peer",
                   "routes_table",
                   "routes_table_filtered",
                   "routes_table_peer",
                   "routes_filtered",
                   "routes_prefixed",
                   "routes_noexport",
                   "routes_pipe_filtered_count",
                   "routes_pipe_filtered"
                  ]

[status]
reconfig_timestamp_source = "bird"
reconfig_timestamp_match = "# created: (.*)"

filter_fields = []

[bird]
listen = "0.0.0.0:29184"
config = "/etc/bird/bird.conf"
birdc  = "${pkgs.bird2}/bin/birdc"
ttl = 5 # time to live (in minutes) for caching of cli output

[parser]
filter_fields = []

[cache]
use_redis = false # if not using redis cache, activate housekeeping to save memory!

[housekeeping]
interval = 5
force_release_memory = true
```

*Declared by:* [`nixos/modules/services/networking/birdwatcher.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/birdwatcher.nix)

## `services.bitbox-bridge.enable` {#opt-services.bitbox-bridge.enable}

Whether to enable Bitbox bridge daemon, for use with Bitbox hardware wallets..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/bitbox-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/bitbox-bridge.nix)

## `services.bitbox-bridge.package` {#opt-services.bitbox-bridge.package}

The bitbox-bridge package to use.

*Type:* package

*Default:* `pkgs.bitbox-bridge`

*Declared by:* [`nixos/modules/services/hardware/bitbox-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/bitbox-bridge.nix)

## `services.bitbox-bridge.port` {#opt-services.bitbox-bridge.port}

Listening port for the bitbox-bridge.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8178`

*Declared by:* [`nixos/modules/services/hardware/bitbox-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/bitbox-bridge.nix)

## `services.bitbox-bridge.runOnMount` {#opt-services.bitbox-bridge.runOnMount}

Run bitbox-bridge.service only when hardware wallet is plugged, also registers the systemd device unit.
This option is enabled by default to save power, when false, bitbox-bridge service runs all the time instead.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/bitbox-bridge.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/bitbox-bridge.nix)

## `services.bitcoind` {#opt-services.bitcoind}

Specification of one or more bitcoind instances.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.configFile` {#opt-services.bitcoind._name_.configFile}

The configuration file path to supply bitcoind.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/‹name›/bitcoin.conf"`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.dataDir` {#opt-services.bitcoind._name_.dataDir}

The data directory for bitcoind.

*Type:* absolute path

*Default:* `"/var/lib/bitcoind-‹name›"`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.dbCache` {#opt-services.bitcoind._name_.dbCache}

Override the default database cache size in MiB.

*Type:* null or integer between 4 and 16384 (both inclusive)

*Default:* `null`

*Example:* `4000`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.enable` {#opt-services.bitcoind._name_.enable}

Whether to enable Bitcoin daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.extraCmdlineOptions` {#opt-services.bitcoind._name_.extraCmdlineOptions}

Extra command line options to pass to bitcoind.
Run bitcoind --help to list all available options.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.extraConfig` {#opt-services.bitcoind._name_.extraConfig}

Additional configurations to be appended to `bitcoin.conf`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  par=16
  rpcthreads=16
  logips=1
''
```

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.group` {#opt-services.bitcoind._name_.group}

The group as which to run bitcoind.

*Type:* string

*Default:* `"bitcoind-‹name›"`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.package` {#opt-services.bitcoind._name_.package}

The bitcoind package to use.

*Type:* package

*Default:* `pkgs.bitcoind`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.pidFile` {#opt-services.bitcoind._name_.pidFile}

Location of bitcoind pid file.

*Type:* absolute path

*Default:* `"/var/lib/bitcoind-‹name›/bitcoind.pid"`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.port` {#opt-services.bitcoind._name_.port}

Override the default port on which to listen for connections.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.prune` {#opt-services.bitcoind._name_.prune}

Reduce storage requirements by enabling pruning (deleting) of old
blocks. This allows the pruneblockchain RPC to be called to delete
specific blocks, and enables automatic pruning of old blocks if a
target size in MiB is provided. This mode is incompatible with -txindex
and -rescan. Warning: Reverting this setting requires re-downloading
the entire blockchain. ("disable" = disable pruning blocks, "manual"
= allow manual pruning via RPC, \>=550 = automatically prune block files
to stay under the specified target size in MiB).

*Type:* null or ((unsigned integer, meaning \>=0) or (one of "disable", "manual") convertible to it)

*Default:* `null`

*Example:* `10000`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.rpc.port` {#opt-services.bitcoind._name_.rpc.port}

Override the default port on which to listen for JSON-RPC connections.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.rpc.users` {#opt-services.bitcoind._name_.rpc.users}

RPC user information for JSON-RPC connections.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  alice.passwordHMAC = "f7efda5c189b999524f151318c0c86$d5b51b3beffbc02b724e5d095828e0bc8b2456e9ac8757ae3211a5d9b16a22ae";
  bob.passwordHMAC = "b2dd077cb54591a2f3139e69a897ac$4e71f08d48b4347cf8eff3815c0e25ae2e9a4340474079f55705f40574f4ec99";
}
```

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.rpc.users.<name>.name` {#opt-services.bitcoind._name_.rpc.users._name_.name}

Username for JSON-RPC connections.

*Type:* string

*Example:* `"alice"`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.rpc.users.<name>.passwordHMAC` {#opt-services.bitcoind._name_.rpc.users._name_.passwordHMAC}

Password HMAC-SHA-256 for JSON-RPC connections. Must be a string of the
format \<SALT-HEX\>$\<HMAC-HEX\>.

Tool (Python script) for HMAC generation is available here:
[https://github.com/bitcoin/bitcoin/blob/master/share/rpcauth/rpcauth.py](https://github.com/bitcoin/bitcoin/blob/master/share/rpcauth/rpcauth.py)

*Type:* string matching the pattern \[0-9a-f\]+$\[0-9a-f\]{64}

*Example:* `"f7efda5c189b999524f151318c0c86$d5b51b3beffbc02b724e5d095828e0bc8b2456e9ac8757ae3211a5d9b16a22ae"`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.testnet` {#opt-services.bitcoind._name_.testnet}

Whether to use the testnet instead of mainnet.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitcoind.<name>.user` {#opt-services.bitcoind._name_.user}

The user as which to run bitcoind.

*Type:* string

*Default:* `"bitcoind-‹name›"`

*Declared by:* [`nixos/modules/services/networking/bitcoind.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitcoind.nix)

## `services.bitlbee.authBackend` {#opt-services.bitlbee.authBackend}

How users are authenticated
storage -- save passwords internally
pam -- Linux PAM authentication

*Type:* one of "storage", "pam"

*Default:* `"storage"`

*Declared by:* [`nixos/modules/services/networking/bitlbee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitlbee.nix)

## `services.bitlbee.authMode` {#opt-services.bitlbee.authMode}

The following authentication modes are available:
Open -- Accept connections from anyone, use NickServ for user authentication.
Closed -- Require authorization (using the PASS command during login) before allowing the user to connect at all.
Registered -- Only allow registered users to use this server; this disables the register- and the account command until the user identifies himself.

*Type:* one of "Open", "Closed", "Registered"

*Default:* `"Open"`

*Declared by:* [`nixos/modules/services/networking/bitlbee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitlbee.nix)

## `services.bitlbee.configDir` {#opt-services.bitlbee.configDir}

Specify an alternative directory to store all the per-user configuration
files.

*Type:* absolute path

*Default:* `"/var/lib/bitlbee"`

*Declared by:* [`nixos/modules/services/networking/bitlbee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitlbee.nix)

## `services.bitlbee.enable` {#opt-services.bitlbee.enable}

Whether to run the BitlBee IRC to other chat network gateway.
Running it allows you to access the MSN, Jabber, Yahoo! and ICQ chat
networks via an IRC client.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/bitlbee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitlbee.nix)

## `services.bitlbee.extraDefaults` {#opt-services.bitlbee.extraDefaults}

Will be inserted in the Default section of the config file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/bitlbee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitlbee.nix)

## `services.bitlbee.extraSettings` {#opt-services.bitlbee.extraSettings}

Will be inserted in the Settings section of the config file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/bitlbee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitlbee.nix)

## `services.bitlbee.hostName` {#opt-services.bitlbee.hostName}

Normally, BitlBee gets a hostname using getsockname(). If you have a nicer
alias for your BitlBee daemon, you can set it here and BitlBee will identify
itself with that name instead.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/bitlbee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitlbee.nix)

## `services.bitlbee.interface` {#opt-services.bitlbee.interface}

The interface the BitlBee daemon will be listening to.  If `127.0.0.1`,
only clients on the local host can connect to it; if `0.0.0.0`, clients
can access it from any network interface.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/bitlbee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitlbee.nix)

## `services.bitlbee.libpurple_plugins` {#opt-services.bitlbee.libpurple_plugins}

The list of libpurple plugins to install.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.purple-discord ]`

*Declared by:* [`nixos/modules/services/networking/bitlbee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitlbee.nix)

## `services.bitlbee.plugins` {#opt-services.bitlbee.plugins}

The list of bitlbee plugins to install.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.bitlbee-facebook ]`

*Declared by:* [`nixos/modules/services/networking/bitlbee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitlbee.nix)

## `services.bitlbee.portNumber` {#opt-services.bitlbee.portNumber}

Number of the port BitlBee will be listening to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6667`

*Declared by:* [`nixos/modules/services/networking/bitlbee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitlbee.nix)

## `services.bitlbee.protocols` {#opt-services.bitlbee.protocols}

This option allows to remove the support of protocol, even if compiled
in. If nothing is given, there are no restrictions.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/bitlbee.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/bitlbee.nix)

## `services.bitmagnet.enable` {#opt-services.bitmagnet.enable}

Whether to enable Bitmagnet service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.group` {#opt-services.bitmagnet.group}

Group of user running bitmagnet

*Type:* string

*Default:* `"bitmagnet"`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.openFirewall` {#opt-services.bitmagnet.openFirewall}

Open DHT ports in firewall

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.package` {#opt-services.bitmagnet.package}

The bitmagnet package to use.

*Type:* package

*Default:* `pkgs.bitmagnet`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.settings` {#opt-services.bitmagnet.settings}

Bitmagnet configuration (https://bitmagnet.io/setup/configuration.html).

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.settings.dht_server` {#opt-services.bitmagnet.settings.dht_server}

DHT server settings

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.settings.dht_server.port` {#opt-services.bitmagnet.settings.dht_server.port}

DHT listen port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3334`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.settings.http_server` {#opt-services.bitmagnet.settings.http_server}

HTTP server settings

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.settings.http_server.local_address` {#opt-services.bitmagnet.settings.http_server.local_address}

HTTP server listen address

*Type:* string

*Default:* `":3333"`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.settings.postgres` {#opt-services.bitmagnet.settings.postgres}

PostgreSQL database configuration

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.settings.postgres.host` {#opt-services.bitmagnet.settings.postgres.host}

Address, hostname or Unix socket path of the database server

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.settings.postgres.name` {#opt-services.bitmagnet.settings.postgres.name}

Database name to connect to

*Type:* string

*Default:* `"bitmagnet"`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.settings.postgres.password` {#opt-services.bitmagnet.settings.postgres.password}

Password for database user

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.settings.postgres.user` {#opt-services.bitmagnet.settings.postgres.user}

User to connect as

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.settings.tmdb` {#opt-services.bitmagnet.settings.tmdb}

TMDB api settings

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.settings.tmdb.api_key` {#opt-services.bitmagnet.settings.tmdb.api_key}

TMDB api key, to avoid api limits. Leave null to use the default shared key.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.useLocalPostgresDB` {#opt-services.bitmagnet.useLocalPostgresDB}

Use a local postgresql database, create user and database

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitmagnet.user` {#opt-services.bitmagnet.user}

User running bitmagnet

*Type:* string

*Default:* `"bitmagnet"`

*Declared by:* [`nixos/modules/services/torrent/bitmagnet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/torrent/bitmagnet.nix)

## `services.bitwarden-directory-connector-cli.domain` {#opt-services.bitwarden-directory-connector-cli.domain}

The domain the Bitwarden/Vaultwarden is accessible on.

*Type:* string

*Example:* `"https://vaultwarden.example.com"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.enable` {#opt-services.bitwarden-directory-connector-cli.enable}

Whether to enable Bitwarden Directory Connector.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.interval` {#opt-services.bitwarden-directory-connector-cli.interval}

The interval when to run the connector. This uses systemd's OnCalendar syntax.

*Type:* string

*Default:* `"*:0,15,30,45"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.ldap` {#opt-services.bitwarden-directory-connector-cli.ldap}

Options to configure the LDAP connection.
If you used the desktop application to test the configuration you can find the settings by searching for `ldap` in `~/.config/Bitwarden\ Directory\ Connector/data.json`.

*Type:* open submodule of attribute set of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.ldap.ad` {#opt-services.bitwarden-directory-connector-cli.ldap.ad}

Whether the LDAP Server is an Active Directory.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.ldap.hostname` {#opt-services.bitwarden-directory-connector-cli.ldap.hostname}

The host the LDAP is accessible on.

*Type:* string

*Example:* `"ldap.example.com"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.ldap.pagedSearch` {#opt-services.bitwarden-directory-connector-cli.ldap.pagedSearch}

Whether the LDAP server paginates search results.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.ldap.port` {#opt-services.bitwarden-directory-connector-cli.ldap.port}

Port LDAP is accessible on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `389`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.ldap.rootPath` {#opt-services.bitwarden-directory-connector-cli.ldap.rootPath}

Root path for LDAP.

*Type:* string

*Example:* `"dc=example,dc=com"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.ldap.ssl` {#opt-services.bitwarden-directory-connector-cli.ldap.ssl}

Whether to use TLS.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.ldap.startTls` {#opt-services.bitwarden-directory-connector-cli.ldap.startTls}

Whether to use STARTTLS.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.ldap.username` {#opt-services.bitwarden-directory-connector-cli.ldap.username}

The user to authenticate as.

*Type:* string

*Example:* `"cn=admin,dc=example,dc=com"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.package` {#opt-services.bitwarden-directory-connector-cli.package}

The bitwarden-directory-connector-cli package to use.

*Type:* package

*Default:* `pkgs.bitwarden-directory-connector-cli`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.secrets.bitwarden.client_path_id` {#opt-services.bitwarden-directory-connector-cli.secrets.bitwarden.client_path_id}

Path to file that contains Client ID.

*Type:* string

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.secrets.bitwarden.client_path_secret` {#opt-services.bitwarden-directory-connector-cli.secrets.bitwarden.client_path_secret}

Path to file that contains Client Secret.

*Type:* string

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.secrets.ldap` {#opt-services.bitwarden-directory-connector-cli.secrets.ldap}

Path to file that contains LDAP password for user in {option}\`ldap.username

*Type:* string

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync` {#opt-services.bitwarden-directory-connector-cli.sync}

Options to configure what gets synced.
If you used the desktop application to test the configuration you can find the settings by searching for `sync` in `~/.config/Bitwarden\ Directory\ Connector/data.json`.

*Type:* open submodule of attribute set of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.creationDateAttribute` {#opt-services.bitwarden-directory-connector-cli.sync.creationDateAttribute}

Attribute that lists a user's creation date.

*Type:* string

*Example:* `"whenCreated"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.emailPrefixAttribute` {#opt-services.bitwarden-directory-connector-cli.sync.emailPrefixAttribute}

The attribute that contains the users username.

*Type:* string

*Example:* `"accountName"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.emailSuffix` {#opt-services.bitwarden-directory-connector-cli.sync.emailSuffix}

Suffix for the email, normally @example.com.

*Type:* string

*Example:* `"@example.com"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.groupFilter` {#opt-services.bitwarden-directory-connector-cli.sync.groupFilter}

LDAP filter for groups.

*Type:* string

*Default:* `""`

*Example:* `"(cn=sales)"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.groupNameAttribute` {#opt-services.bitwarden-directory-connector-cli.sync.groupNameAttribute}

Attribute for a name of group.

*Type:* string

*Default:* `"cn"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.groupObjectClass` {#opt-services.bitwarden-directory-connector-cli.sync.groupObjectClass}

A class that groups will have.

*Type:* string

*Default:* `"groupOfNames"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.groupPath` {#opt-services.bitwarden-directory-connector-cli.sync.groupPath}

Group directory, relative to root.

*Type:* string

*Default:* `"ou=groups"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.groups` {#opt-services.bitwarden-directory-connector-cli.sync.groups}

Whether to sync ldap groups into BitWarden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.largeImport` {#opt-services.bitwarden-directory-connector-cli.sync.largeImport}

Enable if you are syncing more than 2000 users/groups.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.memberAttribute` {#opt-services.bitwarden-directory-connector-cli.sync.memberAttribute}

Attribute that lists members in a LDAP group.

*Type:* string

*Example:* `"uniqueMember"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.overwriteExisting` {#opt-services.bitwarden-directory-connector-cli.sync.overwriteExisting}

Remove and re-add users/groups, See [https://bitwarden.com/help/user-group-filters/#overwriting-syncs](https://bitwarden.com/help/user-group-filters/#overwriting-syncs) for more details.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.removeDisabled` {#opt-services.bitwarden-directory-connector-cli.sync.removeDisabled}

Remove users from bitwarden groups if no longer in the ldap group.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.useEmailPrefixSuffix` {#opt-services.bitwarden-directory-connector-cli.sync.useEmailPrefixSuffix}

If a user has no email address, combine a username prefix with a suffix value to form an email.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.userEmailAttribute` {#opt-services.bitwarden-directory-connector-cli.sync.userEmailAttribute}

Attribute for a users email.

*Type:* string

*Default:* `"mail"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.userFilter` {#opt-services.bitwarden-directory-connector-cli.sync.userFilter}

LDAP filter for users.

*Type:* string

*Default:* `""`

*Example:* `"(memberOf=cn=sales,ou=groups,dc=example,dc=com)"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.userObjectClass` {#opt-services.bitwarden-directory-connector-cli.sync.userObjectClass}

Class that users must have.

*Type:* string

*Default:* `"inetOrgPerson"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.userPath` {#opt-services.bitwarden-directory-connector-cli.sync.userPath}

User directory, relative to root.

*Type:* string

*Default:* `"ou=users"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.sync.users` {#opt-services.bitwarden-directory-connector-cli.sync.users}

Sync users.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.bitwarden-directory-connector-cli.user` {#opt-services.bitwarden-directory-connector-cli.user}

User to run the program.

*Type:* string

*Default:* `"bwdc"`

*Declared by:* [`nixos/modules/services/security/bitwarden-directory-connector-cli.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/bitwarden-directory-connector-cli.nix)

## `services.blackfire-agent.enable` {#opt-services.blackfire-agent.enable}

Whether to enable Blackfire profiler agent.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/development/blackfire.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/blackfire.nix)

## `services.blackfire-agent.settings` {#opt-services.blackfire-agent.settings}

See [https://blackfire.io/docs/up-and-running/configuration/agent](https://blackfire.io/docs/up-and-running/configuration/agent)

*Type:* open submodule of attribute set of string

*Declared by:* [`nixos/modules/services/development/blackfire.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/blackfire.nix)

## `services.blackfire-agent.settings.server-id` {#opt-services.blackfire-agent.settings.server-id}

Sets the server id used to authenticate with Blackfire

You can find your personal server-id at [https://blackfire.io/my/settings/credentials](https://blackfire.io/my/settings/credentials)

*Type:* string

*Declared by:* [`nixos/modules/services/development/blackfire.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/blackfire.nix)

## `services.blackfire-agent.settings.server-token` {#opt-services.blackfire-agent.settings.server-token}

Sets the server token used to authenticate with Blackfire

You can find your personal server-token at [https://blackfire.io/my/settings/credentials](https://blackfire.io/my/settings/credentials)

*Type:* string

*Declared by:* [`nixos/modules/services/development/blackfire.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/blackfire.nix)

## `services.blendfarm.basicSecurityPasswordFile` {#opt-services.blendfarm.basicSecurityPasswordFile}

Path to the password file the client needs to connect to the server.
The password must not contain a forward slash.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/blenderfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/blenderfarm.nix)

## `services.blendfarm.blenderPackage` {#opt-services.blendfarm.blenderPackage}

The blender package to use.

*Type:* package

*Default:* `pkgs.blender`

*Declared by:* [`nixos/modules/services/misc/blenderfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/blenderfarm.nix)

## `services.blendfarm.enable` {#opt-services.blendfarm.enable}

Whether to enable Blendfarm, a render farm management software for Blender.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/blenderfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/blenderfarm.nix)

## `services.blendfarm.group` {#opt-services.blendfarm.group}

Group under which blendfarm runs.

*Type:* string

*Default:* `"blendfarm"`

*Declared by:* [`nixos/modules/services/misc/blenderfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/blenderfarm.nix)

## `services.blendfarm.openFirewall` {#opt-services.blendfarm.openFirewall}

Whether to enable allowing blendfarm network access through the firewall.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/blenderfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/blenderfarm.nix)

## `services.blendfarm.package` {#opt-services.blendfarm.package}

The blendfarm package to use.

*Type:* package

*Default:* `pkgs.blendfarm`

*Declared by:* [`nixos/modules/services/misc/blenderfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/blenderfarm.nix)

## `services.blendfarm.serverConfig` {#opt-services.blendfarm.serverConfig}

Server configuration

*Type:* open submodule of attribute set of anything

*Default:*

``` nix
{
  BasicSecurityPassword = null;
  BroadcastPort = 16342;
  BypassScriptUpdate = false;
  Port = 15000;
}
```

*Declared by:* [`nixos/modules/services/misc/blenderfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/blenderfarm.nix)

## `services.blendfarm.serverConfig.BroadcastPort` {#opt-services.blendfarm.serverConfig.BroadcastPort}

Default port blendfarm server advertises itself on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `16342`

*Declared by:* [`nixos/modules/services/misc/blenderfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/blenderfarm.nix)

## `services.blendfarm.serverConfig.BypassScriptUpdate` {#opt-services.blendfarm.serverConfig.BypassScriptUpdate}

Prevents blendfarm from replacing the .py self-generated scripts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/blenderfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/blenderfarm.nix)

## `services.blendfarm.serverConfig.Port` {#opt-services.blendfarm.serverConfig.Port}

Default port blendfarm server listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `15000`

*Declared by:* [`nixos/modules/services/misc/blenderfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/blenderfarm.nix)

## `services.blendfarm.user` {#opt-services.blendfarm.user}

User under which blendfarm runs.

*Type:* string

*Default:* `"blendfarm"`

*Declared by:* [`nixos/modules/services/misc/blenderfarm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/blenderfarm.nix)

## `services.blockbook-frontend` {#opt-services.blockbook-frontend}

Specification of one or more blockbook-frontend instances.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.certFile` {#opt-services.blockbook-frontend._name_.certFile}

To enable SSL, specify path to the name of certificate files without extension.
Expecting `certFile.crt` and `certFile.key`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/etc/secrets/blockbook-frontend-‹name›/certFile"`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.coinName` {#opt-services.blockbook-frontend._name_.coinName}

See [https://github.com/trezor/blockbook/blob/master/bchain/coins/blockchain.go#L61](https://github.com/trezor/blockbook/blob/master/bchain/coins/blockchain.go#L61)
for current of coins supported in master (Note: may differ from release).

*Type:* string

*Default:* `"Bitcoin"`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.configFile` {#opt-services.blockbook-frontend._name_.configFile}

Location of the blockbook configuration file.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/blockbook-frontend-‹name›/config.json"`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.cssDir` {#opt-services.blockbook-frontend._name_.cssDir}

Location of the dir with `main.css` CSS file.
By default, the one shipped with the package is used.

*Type:* absolute path

*Default:* `"${package}/share/css/"`

*Example:* `"${dataDir}/static/css/"`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.dataDir` {#opt-services.blockbook-frontend._name_.dataDir}

Location of blockbook-frontend-‹name› data directory.

*Type:* absolute path

*Default:* `"/var/lib/blockbook-frontend-‹name›"`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.debug` {#opt-services.blockbook-frontend._name_.debug}

Debug mode, return more verbose errors, reload templates on each request.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.enable` {#opt-services.blockbook-frontend._name_.enable}

Whether to enable blockbook-frontend application.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.extraCmdLineOptions` {#opt-services.blockbook-frontend._name_.extraCmdLineOptions}

Extra command line options to pass to Blockbook.
Run blockbook --help to list all available options.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-workers=1"
  "-dbcache=0"
  "-logtosderr"
]
```

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.extraConfig` {#opt-services.blockbook-frontend._name_.extraConfig}

Additional configurations to be appended to `coin.conf`.
Overrides any already defined configuration options.
See [https://github.com/trezor/blockbook/tree/master/configs/coins](https://github.com/trezor/blockbook/tree/master/configs/coins)
for current configuration options supported in master (Note: may differ from release).

*Type:* attribute set

*Default:* `{ }`

*Example:*

``` nix
{
         "alternative_estimate_fee" = "whatthefee-disabled";
         "alternative_estimate_fee_params" = "{\"url\": \"https://whatthefee.io/data.json\", \"periodSeconds\": 60}";
         "fiat_rates" = "coingecko";
         "fiat_rates_params" = "{\"url\": \"https://api.coingecko.com/api/v3\", \"coin\": \"bitcoin\", \"periodSeconds\": 60}";
         "coin_shortcut" = "BTC";
         "coin_label" = "Bitcoin";
         "parse" = true;
         "subversion" = "";
         "address_format" = "";
         "xpub_magic" = 76067358;
         "xpub_magic_segwit_p2sh" = 77429938;
         "xpub_magic_segwit_native" = 78792518;
         "mempool_workers" = 8;
         "mempool_sub_workers" = 2;
         "block_addresses_to_keep" = 300;
       }
```

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.group` {#opt-services.blockbook-frontend._name_.group}

The group as which to run blockbook-frontend-‹name›.

*Type:* string

*Default:* `"blockbook-frontend-‹name›"`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.internal` {#opt-services.blockbook-frontend._name_.internal}

Internal http server binding `[address]:port`.

*Type:* null or string

*Default:* `":9030"`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.messageQueueBinding` {#opt-services.blockbook-frontend._name_.messageQueueBinding}

Message Queue Binding `address:port`.

*Type:* string

*Default:* `"tcp://127.0.0.1:38330"`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.package` {#opt-services.blockbook-frontend._name_.package}

The blockbook package to use.

*Type:* package

*Default:* `pkgs.blockbook`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.public` {#opt-services.blockbook-frontend._name_.public}

Public http server binding `[address]:port`.

*Type:* null or string

*Default:* `":9130"`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.rpc.password` {#opt-services.blockbook-frontend._name_.rpc.password}

RPC password for JSON-RPC connections.
Warning: this is stored in cleartext in the Nix store!!!
Use `configFile` or `passwordFile` if needed.

*Type:* string

*Default:* `"rpc"`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.rpc.passwordFile` {#opt-services.blockbook-frontend._name_.rpc.passwordFile}

File containing password of the RPC user.
Note: This options is ignored when `configFile` is used.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.rpc.port` {#opt-services.blockbook-frontend._name_.rpc.port}

Port for JSON-RPC connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8030`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.rpc.url` {#opt-services.blockbook-frontend._name_.rpc.url}

URL for JSON-RPC connections.

*Type:* string

*Default:* `"http://127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.rpc.user` {#opt-services.blockbook-frontend._name_.rpc.user}

Username for JSON-RPC connections.

*Type:* string

*Default:* `"rpc"`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.sync` {#opt-services.blockbook-frontend._name_.sync}

Synchronizes until tip, if together with zeromq, keeps index synchronized.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.templateDir` {#opt-services.blockbook-frontend._name_.templateDir}

Location of the HTML templates. By default, ones shipped with the package are used.

*Type:* absolute path

*Default:* `"${package}/share/templates/"`

*Example:* `"${dataDir}/templates/static/"`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blockbook-frontend.<name>.user` {#opt-services.blockbook-frontend._name_.user}

The user as which to run blockbook-frontend-‹name›.

*Type:* string

*Default:* `"blockbook-frontend-‹name›"`

*Declared by:* [`nixos/modules/services/networking/blockbook-frontend.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blockbook-frontend.nix)

## `services.blocky.enable` {#opt-services.blocky.enable}

Whether to enable blocky, a fast and lightweight DNS proxy as ad-blocker for local network with many features.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/blocky.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blocky.nix)

## `services.blocky.enableConfigCheck` {#opt-services.blocky.enableConfigCheck}

Whether to enable checking the config during build time.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/blocky.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blocky.nix)

## `services.blocky.package` {#opt-services.blocky.package}

The blocky package to use.

*Type:* package

*Default:* `pkgs.blocky`

*Declared by:* [`nixos/modules/services/networking/blocky.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blocky.nix)

## `services.blocky.settings` {#opt-services.blocky.settings}

Blocky configuration. Refer to
[https://0xerr0r.github.io/blocky/configuration/](https://0xerr0r.github.io/blocky/configuration/)
for details on supported values.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/blocky.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/blocky.nix)

## `services.bloop.extraOptions` {#opt-services.bloop.extraOptions}

Specifies additional command line argument to pass to bloop
java process.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-J-Xmx2G"
  "-J-XX:MaxInlineLevel=20"
  "-J-XX:+UseParallelGC"
]
```

*Declared by:* [`nixos/modules/services/development/bloop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/bloop.nix)

## `services.bloop.install` {#opt-services.bloop.install}

Whether to install a user service for the Bloop server.

The service must be manually started for each user with
"systemctl --user start bloop".

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/development/bloop.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/development/bloop.nix)

## `services.blueman.enable` {#opt-services.blueman.enable}

Whether to enable blueman, a bluetooth manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/blueman.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/blueman.nix)

## `services.bluemap.coreSettings` {#opt-services.bluemap.coreSettings}

Settings for the core.conf file, [see upstream docs](https://github.com/BlueMap-Minecraft/BlueMap/blob/master/common/src/main/resources/de/bluecolored/bluemap/config/core.conf).

*Type:* open submodule of (HOCON value)

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.coreSettings.data` {#opt-services.bluemap.coreSettings.data}

Folder for where bluemap stores its data

*Type:* absolute path

*Default:* `"/var/lib/bluemap"`

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.coreSettings.metrics` {#opt-services.bluemap.coreSettings.metrics}

Whether to enable Sending usage metrics containing the version of bluemap in use.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.defaultWorld` {#opt-services.bluemap.defaultWorld}

The world used by the default map ruleset.
If you configure your own maps you do not need to set this.

*Type:* absolute path

*Example:* `${config.services.minecraft.dataDir}/world`

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.enable` {#opt-services.bluemap.enable}

Whether to enable bluemap.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.enableNginx` {#opt-services.bluemap.enableNginx}

Enable configuring a virtualHost for serving the bluemap webapp

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.enableRender` {#opt-services.bluemap.enableRender}

Enable rendering

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.eula` {#opt-services.bluemap.eula}

By changing this option to true you confirm that you own a copy of minecraft Java Edition,
and that you agree to minecrafts EULA.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.host` {#opt-services.bluemap.host}

Domain on which nginx will serve the bluemap webapp

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.maps` {#opt-services.bluemap.maps}

Settings for files in `maps/`.
If you define anything here you must define everything yourself.
See the default for an example with good options for the different world types.
For valid values [consult upstream docs](https://github.com/BlueMap-Minecraft/BlueMap/blob/master/common/src/main/resources/de/bluecolored/bluemap/config/maps/map.conf).

*Type:* attribute set of (open submodule of (HOCON value))

*Default:*

``` nix
{
  "overworld" = {
    world = "${cfg.defaultWorld}";
    dimension = "minecraft:overworld";
    ambient-light = 0.1;
    cave-detection-ocean-floor = -5;
  };

  "nether" = {
    world = "${cfg.defaultWorld}";
    dimension = "minecraft:the_nether";
    sorting = 100;
    sky-color = "#290000";
    void-color = "#150000";
    ambient-light = 0.6;
    world-sky-light = 0;
    remove-caves-below-y = -10000;
    cave-detection-ocean-floor = -5;
    cave-detection-uses-block-light = true;
    max-y = 90;
  };

  "end" = {
    world = "${cfg.defaultWorld}";
    dimension = "minecraft:the_end";
    sorting = 200;
    sky-color = "#080010";
    void-color = "#080010";
    ambient-light = 0.6;
    world-sky-light = 0;
    remove-caves-below-y = -10000;
    cave-detection-ocean-floor = -5;
  };
};
```

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.maps.<name>.world` {#opt-services.bluemap.maps._name_.world}

Path to the world directory.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.onCalendar` {#opt-services.bluemap.onCalendar}

How often to trigger rendering the map,
in the format of a systemd timer onCalendar configuration.
See `systemd.timer(5)`.

*Type:* string

*Default:* `"*-*-* 03:10:00"`

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.packs` {#opt-services.bluemap.packs}

A set of resourcepacks, datapacks, and mods to extract resources from,
loaded in alphabetical order.

*Type:* attribute set of path in the Nix store

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.storage` {#opt-services.bluemap.storage}

Where the rendered map will be stored.
Unless you are doing something advanced you should probably leave this alone and configure webRoot instead.
[See upstream docs](https://github.com/BlueMap-Minecraft/BlueMap/tree/master/common/src/main/resources/de/bluecolored/bluemap/config/storages)

*Type:* attribute set of (open submodule of (HOCON value))

*Default:*

``` nix
{
  "file" = {
    root = "${config.services.bluemap.webRoot}/maps";
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.storage.<name>.storage-type` {#opt-services.bluemap.storage._name_.storage-type}

Type of storage config

*Type:* one of "FILE", "SQL"

*Default:* `"FILE"`

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.webRoot` {#opt-services.bluemap.webRoot}

The directory for saving and serving the webapp and the maps

*Type:* absolute path

*Default:* `"/var/lib/bluemap/web"`

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.webappSettings` {#opt-services.bluemap.webappSettings}

Settings for the webapp.conf file, see [upstream docs](https://github.com/BlueMap-Minecraft/BlueMap/blob/master/common/src/main/resources/de/bluecolored/bluemap/config/webapp.conf).

*Type:* open submodule of (HOCON value)

*Default:*

``` nix
{
  enabled = true;
  webroot = config.services.bluemap.webRoot;
}
```

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.webserverSettings` {#opt-services.bluemap.webserverSettings}

Settings for the webserver.conf file, usually not required.
[See upstream docs](https://github.com/BlueMap-Minecraft/BlueMap/blob/master/common/src/main/resources/de/bluecolored/bluemap/config/webserver.conf).

*Type:* open submodule of (HOCON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluemap.webserverSettings.enabled` {#opt-services.bluemap.webserverSettings.enabled}

Enable bluemap's built-in webserver.
Disabled by default in nixos for use of nginx directly.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bluemap.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluemap.nix)

## `services.bluesky-pds.enable` {#opt-services.bluesky-pds.enable}

Whether to enable pds.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.environmentFiles` {#opt-services.bluesky-pds.environmentFiles}

File to load environment variables from. Loaded variables override
values set in `environment`.

Use it to set values of `PDS_JWT_SECRET`, `PDS_ADMIN_PASSWORD`,
and `PDS_PLC_ROTATION_KEY_K256_PRIVATE_KEY_HEX` secrets.
`PDS_JWT_SECRET` and `PDS_ADMIN_PASSWORD` can be generated with

```
openssl rand --hex 16
```

`PDS_PLC_ROTATION_KEY_K256_PRIVATE_KEY_HEX` can be generated with

```
openssl ecparam --name secp256k1 --genkey --noout --outform DER | tail --bytes=+8 | head --bytes=32 | xxd --plain --cols 32
```

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.goat.enable` {#opt-services.bluesky-pds.goat.enable}

Add goat to PATH

*Type:* boolean

*Default:* `config.services.bluesky-pds.enable`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.package` {#opt-services.bluesky-pds.package}

The bluesky-pds package to use.

*Type:* package

*Default:* `pkgs.bluesky-pds`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.pdsadmin.enable` {#opt-services.bluesky-pds.pdsadmin.enable}

Add pdsadmin script to PATH

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.settings` {#opt-services.bluesky-pds.settings}

Environment variables to set for the service. Secrets should be
specified using `environmentFile`.

Refer to [https://github.com/bluesky-social/atproto/blob/main/packages/pds/src/config/env.ts](https://github.com/bluesky-social/atproto/blob/main/packages/pds/src/config/env.ts) for available environment variables.

*Type:* open submodule of attribute set of (null or string or 16 bit unsigned integer; between 0 and 65535 (both inclusive))

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.settings.LOG_ENABLED` {#opt-services.bluesky-pds.settings.LOG_ENABLED}

Enable logging

*Type:* null or string

*Default:* `"true"`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.settings.PDS_BLOBSTORE_DISK_LOCATION` {#opt-services.bluesky-pds.settings.PDS_BLOBSTORE_DISK_LOCATION}

Store blobs at this location, set to null to use e.g. S3

*Type:* null or string

*Default:* `"/var/lib/pds/blocks"`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.settings.PDS_BLOB_UPLOAD_LIMIT` {#opt-services.bluesky-pds.settings.PDS_BLOB_UPLOAD_LIMIT}

Size limit of uploaded blobs in bytes

*Type:* string

*Default:* `"314572800"`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.settings.PDS_BSKY_APP_VIEW_DID` {#opt-services.bluesky-pds.settings.PDS_BSKY_APP_VIEW_DID}

DID of bsky frontend

*Type:* string

*Default:* `"did:web:api.bsky.app"`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.settings.PDS_BSKY_APP_VIEW_URL` {#opt-services.bluesky-pds.settings.PDS_BSKY_APP_VIEW_URL}

URL of bsky frontend

*Type:* string

*Default:* `"https://api.bsky.app"`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.settings.PDS_CRAWLERS` {#opt-services.bluesky-pds.settings.PDS_CRAWLERS}

URL of crawlers

*Type:* string

*Default:* `"https://bsky.network"`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.settings.PDS_DATA_DIRECTORY` {#opt-services.bluesky-pds.settings.PDS_DATA_DIRECTORY}

Directory to store state

*Type:* string

*Default:* `"/var/lib/pds"`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.settings.PDS_DID_PLC_URL` {#opt-services.bluesky-pds.settings.PDS_DID_PLC_URL}

URL of DID PLC directory

*Type:* string

*Default:* `"https://plc.directory"`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.settings.PDS_HOSTNAME` {#opt-services.bluesky-pds.settings.PDS_HOSTNAME}

Instance hostname (base domain name)

*Type:* string

*Example:* `"pds.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.settings.PDS_INVITE_REQUIRED` {#opt-services.bluesky-pds.settings.PDS_INVITE_REQUIRED}

Require invite code for registration

*Type:* null or string

*Default:* `"true"`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.settings.PDS_PORT` {#opt-services.bluesky-pds.settings.PDS_PORT}

Port to listen on

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.settings.PDS_RATE_LIMITS_ENABLED` {#opt-services.bluesky-pds.settings.PDS_RATE_LIMITS_ENABLED}

Enable rate limiting

*Type:* null or string

*Default:* `"true"`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.settings.PDS_REPORT_SERVICE_DID` {#opt-services.bluesky-pds.settings.PDS_REPORT_SERVICE_DID}

DID of mod service

*Type:* string

*Default:* `"did:plc:ar7c4by46qjdydhdevvrndac"`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.bluesky-pds.settings.PDS_REPORT_SERVICE_URL` {#opt-services.bluesky-pds.settings.PDS_REPORT_SERVICE_URL}

URL of mod service

*Type:* string

*Default:* `"https://mod.bsky.app"`

*Declared by:* [`nixos/modules/services/web-apps/bluesky-pds.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bluesky-pds.nix)

## `services.boinc.allowRemoteGuiRpc` {#opt-services.boinc.allowRemoteGuiRpc}

If set to true, any remote host can connect to and control this BOINC
client (subject to password authentication). If instead set to false,
only the hosts listed in `dataDir`/remote\_hosts.cfg will be allowed to
connect.

See also: [https://github.com/BOINC/boinc/wiki/Controlling\_BOINC\_remotely#remote-access](https://github.com/BOINC/boinc/wiki/Controlling_BOINC_remotely#remote-access)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/computing/boinc/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/boinc/client.nix)

## `services.boinc.dataDir` {#opt-services.boinc.dataDir}

The directory in which to store BOINC's configuration and data files.

*Type:* absolute path

*Default:* `"/var/lib/boinc"`

*Declared by:* [`nixos/modules/services/computing/boinc/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/boinc/client.nix)

## `services.boinc.enable` {#opt-services.boinc.enable}

Whether to enable the BOINC distributed computing client. If this
option is set to true, the boinc\_client daemon will be run as a
background service. The boinccmd command can be used to control the
daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/computing/boinc/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/boinc/client.nix)

## `services.boinc.extraEnvPackages` {#opt-services.boinc.extraEnvPackages}

Additional packages to make available in the environment in which
BOINC will run. Common choices are:

- `pkgs.virtualbox`:
  The VirtualBox virtual machine framework. Required by some BOINC
  projects, such as ATLAS@home.

- `pkgs.ocl-icd`:
  OpenCL infrastructure library. Required by BOINC projects that
  use OpenCL, in addition to a device-specific OpenCL driver.

- `pkgs.linuxPackages.nvidia_x11`:
  Provides CUDA libraries. Required by BOINC projects that use
  CUDA. Note that this requires an NVIDIA graphics device to be
  present on the system.

  Also provides OpenCL drivers for NVIDIA GPUs;
  `pkgs.ocl-icd` is also needed in this case.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.virtualbox ]`

*Declared by:* [`nixos/modules/services/computing/boinc/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/boinc/client.nix)

## `services.boinc.package` {#opt-services.boinc.package}

The boinc package to use.

*Type:* package

*Default:* `pkgs.boinc`

*Example:* `boinc-headless`

*Declared by:* [`nixos/modules/services/computing/boinc/client.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/computing/boinc/client.nix)

## `services.bonsaid.configFile` {#opt-services.bonsaid.configFile}

Path to a .json file specifying the state transitions.
You don't need to set this unless you prefer to provide the json file
yourself instead of using the `settings` option.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/desktops/bonsaid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/bonsaid.nix)

## `services.bonsaid.enable` {#opt-services.bonsaid.enable}

Whether to enable bonsaid.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/desktops/bonsaid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/bonsaid.nix)

## `services.bonsaid.extraFlags` {#opt-services.bonsaid.extraFlags}

Extra flags to pass to `bonsaid`, such as `[ "-v" ]` to enable verbose logging.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/desktops/bonsaid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/bonsaid.nix)

## `services.bonsaid.package` {#opt-services.bonsaid.package}

The bonsai package to use.

*Type:* package

*Default:* `pkgs.bonsai`

*Declared by:* [`nixos/modules/services/desktops/bonsaid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/bonsaid.nix)

## `services.bonsaid.settings` {#opt-services.bonsaid.settings}

State transition definitions. See the upstream [README](https://git.sr.ht/~stacyharper/bonsai)
for extended documentation and a more complete example.

*Type:* list of (open submodule of (JSON value))

*Example:*

``` nix
[
  {
    event_name = "power_button_pressed";
    transitions = [
      {
        delay_duration = 600000000;
        transitions = [
          {
            command = [
              "swaymsg"
              "--"
              "output"
              "*"
              "power"
              "off"
            ];
            transitions = [ ];
            type = "exec";
          }
        ];
        type = "delay";
      }
      {
        event_name = "power_button_released";
        transitions = [ ];
        type = "event";
      }
    ];
    type = "event";
  }
]
```

*Declared by:* [`nixos/modules/services/desktops/bonsaid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/bonsaid.nix)

## `services.bonsaid.settings.*.command` {#opt-services.bonsaid.settings._.command}

Command to run when this transition is taken.
This is executed inline by `bonsaid` and blocks handling of any other events until completion.
To perform the command asynchronously, specify it like `[ "setsid" "-f" "my-command" ]`.

Only effects transitions with `type = "exec"`.

*Type:* null or (list of string)

*Default:* `null`

*Declared by:* [`nixos/modules/services/desktops/bonsaid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/bonsaid.nix)

## `services.bonsaid.settings.*.delay_duration` {#opt-services.bonsaid.settings._.delay_duration}

Nanoseconds to wait after the previous state change before performing this transition.
This can be placed at the same level as a `type = "event"` transition to achieve a
timeout mechanism.

Only effects transitions with `type = "delay"`.

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/desktops/bonsaid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/bonsaid.nix)

## `services.bonsaid.settings.*.event_name` {#opt-services.bonsaid.settings._.event_name}

Name of the event which should trigger this transition when received by `bonsaid`.
Events are sent to `bonsaid` by running `bonsaictl -e <event_name>`.

Only effects transitions with `type = "event"`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/desktops/bonsaid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/bonsaid.nix)

## `services.bonsaid.settings.*.transitions` {#opt-services.bonsaid.settings._.transitions}

List of transitions out of this state.
If left empty, then this state is considered a terminal state and entering it will
trigger an immediate transition back to the root state (after processing side effects).

*Type:* list of (open submodule of (JSON value))

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/desktops/bonsaid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/bonsaid.nix)

## `services.bonsaid.settings.*.type` {#opt-services.bonsaid.settings._.type}

Type of transition. Determines how bonsaid interprets the other options in this transition.

*Type:* one of "delay", "event", "exec"

*Declared by:* [`nixos/modules/services/desktops/bonsaid.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/desktops/bonsaid.nix)

## `services.bookorbit.createDatabaseLocally` {#opt-services.bookorbit.createDatabaseLocally}

Create the database locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bookorbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookorbit.nix)

## `services.bookorbit.enable` {#opt-services.bookorbit.enable}

Whether to enable BookOrbit.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bookorbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookorbit.nix)

## `services.bookorbit.environment` {#opt-services.bookorbit.environment}

Environment variables to pass to the BookOrbit service.
See [https://bookorbit.app/installation.html#configuration](https://bookorbit.app/installation.html#configuration) for available options.

*Type:* open submodule of attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  APP_URL = "https://bookorbit.example.com";
  JWT_SECRET = "change-me";
  SETUP_BOOTSTRAP_TOKEN = "change-me";
}
```

*Declared by:* [`nixos/modules/services/web-apps/bookorbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookorbit.nix)

## `services.bookorbit.environment.APP_DATA_PATH` {#opt-services.bookorbit.environment.APP_DATA_PATH}

Data storage directory.

*Type:* string

*Default:* `"/var/lib/bookorbit"`

*Declared by:* [`nixos/modules/services/web-apps/bookorbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookorbit.nix)

## `services.bookorbit.environment.DATABASE_URL` {#opt-services.bookorbit.environment.DATABASE_URL}

The URL of the postgresql database.

*Type:* string

*Default:* `if cfg.createDatabaseLocally then "postgresql:///bookorbit?host=/run/postgresql&user=bookorbit" else ""`

*Declared by:* [`nixos/modules/services/web-apps/bookorbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookorbit.nix)

## `services.bookorbit.environment.PORT` {#opt-services.bookorbit.environment.PORT}

TCP port for the BookOrbit server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/bookorbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookorbit.nix)

## `services.bookorbit.environmentFile` {#opt-services.bookorbit.environmentFile}

Path of a file with extra environment variables to be loaded from disk.
This file is not added to the nix store, so it can be used to pass secrets to BookOrbit.
See [https://bookorbit.app/installation.html#configuration](https://bookorbit.app/installation.html#configuration) for available options.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/bookorbit"`

*Declared by:* [`nixos/modules/services/web-apps/bookorbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookorbit.nix)

## `services.bookorbit.group` {#opt-services.bookorbit.group}

Group under which BookOrbit runs.

*Type:* string

*Default:* `"bookorbit"`

*Declared by:* [`nixos/modules/services/web-apps/bookorbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookorbit.nix)

## `services.bookorbit.openFirewall` {#opt-services.bookorbit.openFirewall}

Open the appropriate ports in the firewall for BookOrbit.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bookorbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookorbit.nix)

## `services.bookorbit.package` {#opt-services.bookorbit.package}

The bookorbit package to use.

*Type:* package

*Default:* `pkgs.bookorbit`

*Declared by:* [`nixos/modules/services/web-apps/bookorbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookorbit.nix)

## `services.bookorbit.user` {#opt-services.bookorbit.user}

User account under which BookOrbit runs.

*Type:* string

*Default:* `"bookorbit"`

*Declared by:* [`nixos/modules/services/web-apps/bookorbit.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookorbit.nix)

## `services.bookstack.dataDir` {#opt-services.bookstack.dataDir}

BookStack data directory

*Type:* absolute path

*Default:* `"/var/lib/bookstack"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.enable` {#opt-services.bookstack.enable}

Whether to enable BookStack: A platform to create documentation/wiki content built with PHP & Laravel.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.group` {#opt-services.bookstack.group}

Group bookstack runs as

*Type:* string

*Default:* ``"If `services.bookstack.nginx` has any attributes then `nginx` else bookstack"``

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.hostname` {#opt-services.bookstack.hostname}

The hostname to serve BookStack on.

*Type:* string

*Default:* `config.networking.fqdnOrHostName`

*Example:* `"bookstack.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.maxUploadSize` {#opt-services.bookstack.maxUploadSize}

The maximum size for uploads (e.g. images).

*Type:* string

*Default:* `"18M"`

*Example:* `"1G"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx` {#opt-services.bookstack.nginx}

With this option, you can customize the nginx virtualHost settings.

*Type:* null or (submodule)

*Default:* `null`

*Example:*

``` nix
{
  serverAliases = [
    "bookstack.${config.networking.domain}"
  ];
  # To enable encryption and let let's encrypt take care of certificate
  forceSSL = true;
  enableACME = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.acmeFallbackHost` {#opt-services.bookstack.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.acmeRoot` {#opt-services.bookstack.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.addSSL` {#opt-services.bookstack.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.basicAuth` {#opt-services.bookstack.nginx.basicAuth}

Basic Auth protection for a vhost.

WARNING: This is implemented to store the password in plain text in the
Nix store.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  user = "password";
};
```

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.basicAuthFile` {#opt-services.bookstack.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.default` {#opt-services.bookstack.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.enableACME` {#opt-services.bookstack.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.extraConfig` {#opt-services.bookstack.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.forceSSL` {#opt-services.bookstack.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.globalRedirect` {#opt-services.bookstack.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.http2` {#opt-services.bookstack.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.http3` {#opt-services.bookstack.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.http3_hq` {#opt-services.bookstack.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.kTLS` {#opt-services.bookstack.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.listen` {#opt-services.bookstack.nginx.listen}

Listen addresses and ports for this virtual host.
IPv6 addresses must be enclosed in square brackets.
Note: this option overrides `addSSL`
and `onlySSL`.

If you only want to set the addresses manually and not
the ports, take a look at `listenAddresses`.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    addr = "195.154.1.1";
    port = 443;
    ssl = true;
  }
  {
    addr = "192.154.1.1";
    port = 80;
  }
  {
    addr = "unix:/var/run/nginx.sock";
  }
]
```

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.listen.*.addr` {#opt-services.bookstack.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.listen.*.extraParameters` {#opt-services.bookstack.nginx.listen._.extraParameters}

Extra parameters of this listen directive.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "backlog=1024"
  "deferred"
]
```

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.listen.*.port` {#opt-services.bookstack.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.listen.*.proxyProtocol` {#opt-services.bookstack.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.listen.*.ssl` {#opt-services.bookstack.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.listenAddresses` {#opt-services.bookstack.nginx.listenAddresses}

Listen addresses for this virtual host.
Compared to `listen` this only sets the addresses
and the ports are chosen automatically.

Note: This option overrides `networking.enableIPv6`

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "127.0.0.1"
  "[::1]"
]
```

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations` {#opt-services.bookstack.nginx.locations}

Declarative location config

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  "/" = {
    proxyPass = "http://localhost:3000";
  };
};
```

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.alias` {#opt-services.bookstack.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.basicAuth` {#opt-services.bookstack.nginx.locations._name_.basicAuth}

Basic Auth protection for a vhost.

WARNING: This is implemented to store the password in plain text in the
Nix store.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  user = "password";
};
```

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.basicAuthFile` {#opt-services.bookstack.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.extraConfig` {#opt-services.bookstack.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.fastcgiParams` {#opt-services.bookstack.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.index` {#opt-services.bookstack.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.priority` {#opt-services.bookstack.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.proxyPass` {#opt-services.bookstack.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.proxyWebsockets` {#opt-services.bookstack.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.recommendedProxySettings` {#opt-services.bookstack.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.bookstack.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.return` {#opt-services.bookstack.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.root` {#opt-services.bookstack.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.tryFiles` {#opt-services.bookstack.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.bookstack.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.locations.<name>.uwsgiPass` {#opt-services.bookstack.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.onlySSL` {#opt-services.bookstack.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.quic` {#opt-services.bookstack.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.redirectCode` {#opt-services.bookstack.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.rejectSSL` {#opt-services.bookstack.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.reuseport` {#opt-services.bookstack.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.root` {#opt-services.bookstack.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.serverAliases` {#opt-services.bookstack.nginx.serverAliases}

Additional names of virtual hosts served by this virtual host configuration.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "www.example.org"
  "example.org"
]
```

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.serverName` {#opt-services.bookstack.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.sslCertificate` {#opt-services.bookstack.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.sslCertificateKey` {#opt-services.bookstack.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.sslTrustedCertificate` {#opt-services.bookstack.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.nginx.useACMEHost` {#opt-services.bookstack.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.package` {#opt-services.bookstack.package}

The bookstack package to use.

*Type:* package

*Default:* `pkgs.bookstack`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.poolConfig` {#opt-services.bookstack.poolConfig}

Options for the Bookstack PHP pool. See the documentation on `php-fpm.conf`
for details on configuration directives.

*Type:* attribute set of (string or signed integer or boolean)

*Default:*

``` nix
''
  {
    "pm" = "dynamic";
    "pm.max_children" = 32;
    "pm.start_servers" = 2;
    "pm.min_spare_servers" = 2;
    "pm.max_spare_servers" = 4;
    "pm.max_requests" = 500;
  }
''
```

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.settings` {#opt-services.bookstack.settings}

Options for Bookstack configuration. Refer to
[https://github.com/BookStackApp/BookStack/blob/development/.env.example](https://github.com/BookStackApp/BookStack/blob/development/.env.example) for
details on supported values. For passing secrets, append "\_FILE" to the
setting name. For example, you may create a file `/var/secrets/db_pass.txt`
and set `services.bookstack.settings.DB_PASSWORD_FILE` to `/var/secrets/db_pass.txt`
instead of providing a plaintext password using `services.bookstack.settings.DB_PASSWORD`.

*Type:* open submodule of attribute set of (string or signed integer or boolean)

*Default:* `{ }`

*Example:*

``` nix
{
  APP_ENV = "production";
  APP_KEY_FILE = "/var/secrets/bookstack-app-key.txt";
  DB_HOST = "db";
  DB_PORT = 3306;
  DB_DATABASE = "bookstack";
  DB_USERNAME = "bookstack";
  DB_PASSWORD_FILE = "/var/secrets/bookstack-mysql-password.txt";
}
```

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.settings.APP_KEY_FILE` {#opt-services.bookstack.settings.APP_KEY_FILE}

The path to your appkey.
The file should contain a 32 character random app key.
This may be set using `echo "base64:$(head -c 32 /dev/urandom | base64)" > /path/to/key-file`.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.settings.APP_URL` {#opt-services.bookstack.settings.APP_URL}

The root URL that you want to host BookStack on. All URLs in BookStack
will be generated using this value. It is used to validate specific
requests and to generate URLs in emails.

*Type:* string

*Default:* `"http(s)://\${config.services.bookstack.hostname}"`

*Example:* `"https://example.com"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.settings.DB_HOST` {#opt-services.bookstack.settings.DB_HOST}

The IP or hostname which hosts your database.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.settings.DB_PASSWORD_FILE` {#opt-services.bookstack.settings.DB_PASSWORD_FILE}

The file containing your mysql/mariadb database password.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/secrets/bookstack-mysql-pass.txt"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.settings.DB_PORT` {#opt-services.bookstack.settings.DB_PORT}

The port your database is listening at.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bookstack.user` {#opt-services.bookstack.user}

User bookstack runs as

*Type:* string

*Default:* `"bookstack"`

*Declared by:* [`nixos/modules/services/web-apps/bookstack.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bookstack.nix)

## `services.bootvine.enable` {#opt-services.bootvine.enable}

Whether to enable bootvine, a live dependency tree of systemd jobs on the boot console,
similar to nix-output-monitor for nix builds.
It starts in the initrd and survives the switch to the real root. It
hands the console back once the display manager switches to its
terminal or the default target is reached, and comes back for shutdown
until systemd hands over to systemd-shutdown
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/bootvine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/bootvine.nix)

## `services.bootvine.package` {#opt-services.bootvine.package}

The bootvine package to use.

*Type:* package

*Default:* `pkgs.bootvine`

*Declared by:* [`nixos/modules/services/system/bootvine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/bootvine.nix)

## `services.bootvine.settings` {#opt-services.bootvine.settings}

Configuration for bootvine. `bootvine defaults --format nix` prints
every key with its default. The build fails if `bootvine check`
rejects the result (disabled if cfg.package is non-default and
cross-compiling).

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  colors = {
    tree = {
      running-marker = "light-yellow";
    };
  };
  timing = {
    keep-final-frame-for = "500ms";
  };
}
```

*Declared by:* [`nixos/modules/services/system/bootvine.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/bootvine.nix)

## `services.borgbackup.jobs` {#opt-services.borgbackup.jobs}

Deduplicating backups using BorgBackup.
Adding a job will cause a borg-job-NAME wrapper to be added
to your system path, so that you can perform maintenance easily.
See also the chapter about BorgBackup in the NixOS manual.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
  { # for a local backup
    rootBackup = {
      paths = "/";
      exclude = [ "/nix" ];
      repo = "/path/to/local/repo";
      encryption = {
        mode = "repokey";
        passphrase = "secret";
      };
      compression = "auto,lzma";
      startAt = "weekly";
    };
  }
  { # Root backing each day up to a remote backup server. We assume that you have
    #   * created a password less key: ssh-keygen -N "" -t ed25519 -f /path/to/ssh_key
    #     best practices are: use -t ed25519, /path/to = /run/keys
    #   * the passphrase is in the file /run/keys/borgbackup_passphrase
    #   * you have initialized the repository manually
    paths = [ "/etc" "/home" ];
    exclude = [ "/nix" "'**/.cache'" ];
    doInit = false;
    repo =  "user3@arep.repo.borgbase.com:repo";
    encryption = {
      mode = "repokey-blake2";
      passCommand = "cat /path/to/passphrase";
    };
    environment = { BORG_RSH = "ssh -i /path/to/ssh_key"; };
    compression = "auto,lzma";
    startAt = "daily";
};
```

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.appendFailedSuffix` {#opt-services.borgbackup.jobs._name_.appendFailedSuffix}

Append a `.failed` suffix
to the archive name, which is only removed if
`borg create` has a zero exit status.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.archiveBaseName` {#opt-services.borgbackup.jobs._name_.archiveBaseName}

How to name the created archives. A timestamp, whose format is
determined by `dateFormat`, will be appended. The full
name can be modified at runtime (`$archiveName`).
Placeholders like \`\`must not be used. Use`null` for no base name.

*Type:* null or string matching the pattern \[^/{}\]+

*Default:* `"${config.networking.hostName}-<name>"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.compression` {#opt-services.borgbackup.jobs._name_.compression}

Compression method to use. Refer to
`borg help compression`
for all available options.

*Type:* string matching the pattern none|(auto,)?(lz4|zstd|zlib|lzma)(,\[\[:digit:\]\]{1,2})?

*Default:* `"lz4"`

*Example:* `"auto,lzma"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.createCommand` {#opt-services.borgbackup.jobs._name_.createCommand}

Borg command to use for archive creation. The default (`create`)
creates a regular Borg archive.

Use `import-tar` to instead read a tar archive stream from
`dumpCommand` output and import its contents into the
repository.

`import-tar` can not be used together with `exclude` or
`patterns`.

*Type:* one of "create", "import-tar"

*Default:* `"create"`

*Example:* `"import-tar"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.dateFormat` {#opt-services.borgbackup.jobs._name_.dateFormat}

Arguments passed to `date`
to create a timestamp suffix for the archive name.

*Type:* string

*Default:* `"+%Y-%m-%dT%H:%M:%S"`

*Example:* `"-u +%s"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.doInit` {#opt-services.borgbackup.jobs._name_.doInit}

Run `borg init` if the
specified `repo` does not exist.
You should set this to `false`
if the repository is located on an external drive
that might not always be mounted.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.dumpCommand` {#opt-services.borgbackup.jobs._name_.dumpCommand}

Backup the stdout of this program instead of filesystem paths.
Mutually exclusive with `paths`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/path/to/createZFSsend.sh"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.encryption.mode` {#opt-services.borgbackup.jobs._name_.encryption.mode}

Encryption mode to use. Setting a mode
other than `"none"` requires
you to specify a `passCommand`
or a `passphrase`.

*Type:* one of "repokey", "keyfile", "repokey-blake2", "keyfile-blake2", "authenticated", "authenticated-blake2", "none"

*Example:* `"repokey-blake2"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.encryption.passCommand` {#opt-services.borgbackup.jobs._name_.encryption.passCommand}

A command which prints the passphrase to stdout.
Mutually exclusive with `passphrase`.

*Type:* null or string

*Default:* `null`

*Example:* `"cat /path/to/passphrase_file"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.encryption.passphrase` {#opt-services.borgbackup.jobs._name_.encryption.passphrase}

The passphrase the backups are encrypted with.
Mutually exclusive with `passCommand`.
If you do not want the passphrase to be stored in the
world-readable Nix store, use `passCommand`.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.environment` {#opt-services.borgbackup.jobs._name_.environment}

Environment variables passed to the backup script.
You can for example specify which SSH key to use.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  BORG_RSH = "ssh -i /path/to/key";
}
```

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.exclude` {#opt-services.borgbackup.jobs._name_.exclude}

Exclude paths matching any of the given patterns. See
`borg help patterns` for pattern syntax.

Can not be set when `createCommand` is set to
`import-tar`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/home/*/.cache"
  "/nix"
]
```

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.extraArgs` {#opt-services.borgbackup.jobs._name_.extraArgs}

Additional arguments for all `borg` calls the
service has. Handle with care.

These extra arguments also get included in the wrapper
script for this job.

*Type:* string or (list of string) convertible to it

*Default:* `[ ]`

*Example:*

``` nix
[
  "--remote-path=/path/to/borg"
]
```

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.extraCompactArgs` {#opt-services.borgbackup.jobs._name_.extraCompactArgs}

Additional arguments for `borg compact`.
Can also be set at runtime using `$extraCompactArgs`.

*Type:* string or (list of string) convertible to it

*Default:* `[ ]`

*Example:*

``` nix
[
  "--cleanup-commits"
]
```

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.extraCreateArgs` {#opt-services.borgbackup.jobs._name_.extraCreateArgs}

Additional arguments for `borg create`.
Can also be set at runtime using `$extraCreateArgs`.

*Type:* string or (list of string) convertible to it

*Default:* `[ ]`

*Example:*

``` nix
[
  "--stats"
  "--checkpoint-interval 600"
]
```

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.extraInitArgs` {#opt-services.borgbackup.jobs._name_.extraInitArgs}

Additional arguments for `borg init`.
Can also be set at runtime using `$extraInitArgs`.

*Type:* string or (list of string) convertible to it

*Default:* `[ ]`

*Example:*

``` nix
[
  "--append-only"
]
```

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.extraPruneArgs` {#opt-services.borgbackup.jobs._name_.extraPruneArgs}

Additional arguments for `borg prune`.
Can also be set at runtime using `$extraPruneArgs`.

*Type:* string or (list of string) convertible to it

*Default:* `[ ]`

*Example:*

``` nix
[
  "--save-space"
]
```

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.failOnWarnings` {#opt-services.borgbackup.jobs._name_.failOnWarnings}

Fail the whole backup job if any borg command returns a warning
(exit code 1), for example because a file changed during backup.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.group` {#opt-services.borgbackup.jobs._name_.group}

The group borg is run as. User or group needs read permission
for the specified `paths`.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.inhibitsSleep` {#opt-services.borgbackup.jobs._name_.inhibitsSleep}

Prevents the system from sleeping while backing up.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.paths` {#opt-services.borgbackup.jobs._name_.paths}

Path(s) to back up.
Mutually exclusive with `dumpCommand`.

*Type:* null or ((list of string) or string convertible to it)

*Default:* `null`

*Example:* `"/home/user"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.patterns` {#opt-services.borgbackup.jobs._name_.patterns}

Include/exclude paths matching the given patterns. The first
matching patterns is used, so if an include pattern (prefix `+`)
matches before an exclude pattern (prefix `-`), the file is
backed up. See [`borg help patterns`](https://borgbackup.readthedocs.io/en/stable/usage/help.html#borg-patterns) for pattern syntax.

Can not be set when `createCommand` is set to
`import-tar`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "+ /home/susan"
  "- /home/*"
]
```

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.persistentTimer` {#opt-services.borgbackup.jobs._name_.persistentTimer}

Set the `Persistent` option for the
`systemd.timer(5)`
which triggers the backup immediately if the last trigger
was missed (e.g. if the system was powered down).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.postCreate` {#opt-services.borgbackup.jobs._name_.postCreate}

Shell commands to run after `borg create`. The name
of the created archive is stored in `$archiveName`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.postHook` {#opt-services.borgbackup.jobs._name_.postHook}

Shell commands to run just before exit. They are executed
even if a previous command exits with a non-zero exit code.
The latter is available as `$exitStatus`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.postInit` {#opt-services.borgbackup.jobs._name_.postInit}

Shell commands to run after `borg init`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.postPrune` {#opt-services.borgbackup.jobs._name_.postPrune}

Shell commands to run after `borg prune`.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.preHook` {#opt-services.borgbackup.jobs._name_.preHook}

Shell commands to run before the backup.
This can for example be used to mount file systems.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  # To add excluded paths at runtime
  extraCreateArgs+=("--exclude" "/some/path")
''
```

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.privateTmp` {#opt-services.borgbackup.jobs._name_.privateTmp}

Set the `PrivateTmp` option for
the systemd-service. Set to false if you need sockets
or other files from global /tmp.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.prune.keep` {#opt-services.borgbackup.jobs._name_.prune.keep}

Prune a repository by deleting all archives not matching any of the
specified retention options. See `borg help prune`
for the available options.

*Type:* attribute set of (signed integer or string matching the pattern \[\[:digit:\]\]+\[Hdwmy\])

*Default:* `{ }`

*Example:*

``` nix
{
  within = "1d"; # Keep all archives from the last day
  daily = 7;
  weekly = 4;
  monthly = -1;  # Keep at least one archive for each month
}
```

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.prune.prefix` {#opt-services.borgbackup.jobs._name_.prune.prefix}

Only consider archive names starting with this prefix for pruning.
By default, only archives created by this job are considered.
Use `""` or `null` to consider all archives.

*Type:* null or string

*Default:* `archiveBaseName`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.readWritePaths` {#opt-services.borgbackup.jobs._name_.readWritePaths}

By default, borg cannot write anywhere on the system but
`$HOME/.config/borg` and `$HOME/.cache/borg`.
If, for example, your preHook script needs to dump files
somewhere, put those directories here.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/var/backup/mysqldump"
]
```

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.removableDevice` {#opt-services.borgbackup.jobs._name_.removableDevice}

Whether the repo (which must be local) is a removable device.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.repo` {#opt-services.borgbackup.jobs._name_.repo}

Remote or local repository to back up to.

*Type:* string

*Example:* `"user@machine:/path/to/repo"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.startAt` {#opt-services.borgbackup.jobs._name_.startAt}

When or how often the backup should run.
Must be in the format described in
`systemd.time(7)`.
If you do not want the backup to start
automatically, use `[ ]`.
It will generate a systemd service borgbackup-job-NAME.
You may trigger it manually via systemctl restart borgbackup-job-NAME.

*Type:* string or list of string

*Default:* `"daily"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.user` {#opt-services.borgbackup.jobs._name_.user}

The user `borg` is run as.
User or group need read permission
for the specified `paths`.

*Type:* string

*Default:* `"root"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.jobs.<name>.wrapper` {#opt-services.borgbackup.jobs._name_.wrapper}

Name of the wrapper that is installed into `PATH`.
Set to `null` or `""` to disable it altogether.

*Type:* null or string

*Default:* `"borg-job-<name>"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.package` {#opt-services.borgbackup.package}

The borgbackup package to use.

*Type:* package

*Default:* `pkgs.borgbackup`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.repos` {#opt-services.borgbackup.repos}

Serve BorgBackup repositories to given public SSH keys,
restricting their access to the repository only.
See also the chapter about BorgBackup in the NixOS manual.
Also, clients do not need to specify the absolute path when accessing the repository,
i.e. `user@machine:.` is enough. (Note colon and dot.)

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.repos.<name>.allowSubRepos` {#opt-services.borgbackup.repos._name_.allowSubRepos}

Allow clients to create repositories in subdirectories of the
specified `path`. These can be accessed using
`user@machine:path/to/subrepo`. Note that a
`quota` applies to repositories independently.
Therefore, if this is enabled, clients can create multiple
repositories and upload an arbitrary amount of data.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.repos.<name>.authorizedKeys` {#opt-services.borgbackup.repos._name_.authorizedKeys}

Public SSH keys that are given full write access to this repository.
You should use a different SSH key for each repository you write to, because
the specified keys are restricted to running `borg serve`
and can only access this single repository.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.repos.<name>.authorizedKeysAppendOnly` {#opt-services.borgbackup.repos._name_.authorizedKeysAppendOnly}

Public SSH keys that can only be used to append new data (archives) to the repository.
Note that archives can still be marked as deleted and are subsequently removed from disk
upon accessing the repo with full write access, e.g. when pruning.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.repos.<name>.group` {#opt-services.borgbackup.repos._name_.group}

The group `borg serve` is run as.
User or group needs write permission
for the specified `path`.

*Type:* string

*Default:* `"borg"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.repos.<name>.path` {#opt-services.borgbackup.repos._name_.path}

Where to store the backups. Note that the directory
is created automatically, with correct permissions.

*Type:* absolute path

*Default:* `"/var/lib/borgbackup"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.repos.<name>.quota` {#opt-services.borgbackup.repos._name_.quota}

Storage quota for the repository. This quota is ensured for all
sub-repositories if `allowSubRepos` is enabled
but not for the overall storage space used.

*Type:* null or string matching the pattern \[\[:digit:\].\]+\[KMGTP\]?

*Default:* `null`

*Example:* `"100G"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgbackup.repos.<name>.user` {#opt-services.borgbackup.repos._name_.user}

The user `borg serve` is run as.
User or group needs write permission
for the specified `path`.

*Type:* string

*Default:* `"borg"`

*Declared by:* [`nixos/modules/services/backup/borgbackup.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgbackup.nix)

## `services.borgmatic.configurations` {#opt-services.borgmatic.configurations}

Set of borgmatic configurations, see [https://torsion.org/borgmatic/docs/reference/configuration/](https://torsion.org/borgmatic/docs/reference/configuration/)

*Type:* attribute set of (open submodule of (YAML 1.1 value))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/borgmatic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgmatic.nix)

## `services.borgmatic.configurations.<name>.repositories` {#opt-services.borgmatic.configurations._name_.repositories}

A required list of local or remote repositories with paths and
optional labels (which can be used with the --repository flag to
select a repository). Tildes are expanded. Multiple repositories are
backed up to in sequence. Borg placeholders can be used. See the
output of "borg help placeholders" for details. See ssh\_command for
SSH options like identity file or port. If systemd service is used,
then add local repository paths in the systemd service file to the
ReadWritePaths list.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    label = "backupserver";
    path = "ssh://user@backupserver/./sourcehostname.borg";
  }
  {
    label = "local";
    path = "/mnt/backup";
  }
]
```

*Declared by:* [`nixos/modules/services/backup/borgmatic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgmatic.nix)

## `services.borgmatic.configurations.<name>.repositories.*.label` {#opt-services.borgmatic.configurations._name_.repositories._.label}

Label to the repository

*Type:* string

*Declared by:* [`nixos/modules/services/backup/borgmatic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgmatic.nix)

## `services.borgmatic.configurations.<name>.repositories.*.path` {#opt-services.borgmatic.configurations._name_.repositories._.path}

Path to the repository

*Type:* string

*Declared by:* [`nixos/modules/services/backup/borgmatic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgmatic.nix)

## `services.borgmatic.configurations.<name>.source_directories` {#opt-services.borgmatic.configurations._name_.source_directories}

List of source directories and files to backup. Globs and tildes are
expanded. Do not backslash spaces in path names.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/home"
  "/etc"
  "/var/log/syslog*"
  "/home/user/path with spaces"
]
```

*Declared by:* [`nixos/modules/services/backup/borgmatic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgmatic.nix)

## `services.borgmatic.enable` {#opt-services.borgmatic.enable}

Whether to enable borgmatic.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/borgmatic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgmatic.nix)

## `services.borgmatic.enableConfigCheck` {#opt-services.borgmatic.enableConfigCheck}

Whether to enable checking all configurations during build time.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/backup/borgmatic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgmatic.nix)

## `services.borgmatic.settings` {#opt-services.borgmatic.settings}

See [https://torsion.org/borgmatic/docs/reference/configuration/](https://torsion.org/borgmatic/docs/reference/configuration/)

*Type:* null or (open submodule of (YAML 1.1 value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/backup/borgmatic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgmatic.nix)

## `services.borgmatic.settings.repositories` {#opt-services.borgmatic.settings.repositories}

A required list of local or remote repositories with paths and
optional labels (which can be used with the --repository flag to
select a repository). Tildes are expanded. Multiple repositories are
backed up to in sequence. Borg placeholders can be used. See the
output of "borg help placeholders" for details. See ssh\_command for
SSH options like identity file or port. If systemd service is used,
then add local repository paths in the systemd service file to the
ReadWritePaths list.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
[
  {
    label = "backupserver";
    path = "ssh://user@backupserver/./sourcehostname.borg";
  }
  {
    label = "local";
    path = "/mnt/backup";
  }
]
```

*Declared by:* [`nixos/modules/services/backup/borgmatic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgmatic.nix)

## `services.borgmatic.settings.repositories.*.label` {#opt-services.borgmatic.settings.repositories._.label}

Label to the repository

*Type:* string

*Declared by:* [`nixos/modules/services/backup/borgmatic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgmatic.nix)

## `services.borgmatic.settings.repositories.*.path` {#opt-services.borgmatic.settings.repositories._.path}

Path to the repository

*Type:* string

*Declared by:* [`nixos/modules/services/backup/borgmatic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgmatic.nix)

## `services.borgmatic.settings.source_directories` {#opt-services.borgmatic.settings.source_directories}

List of source directories and files to backup. Globs and tildes are
expanded. Do not backslash spaces in path names.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/home"
  "/etc"
  "/var/log/syslog*"
  "/home/user/path with spaces"
]
```

*Declared by:* [`nixos/modules/services/backup/borgmatic.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/borgmatic.nix)

## `services.bpftune.enable` {#opt-services.bpftune.enable}

Whether to enable bpftune BPF driven auto-tuning.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/bpftune.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/bpftune.nix)

## `services.bpftune.package` {#opt-services.bpftune.package}

The bpftune package to use.

*Type:* package

*Default:* `pkgs.bpftune`

*Declared by:* [`nixos/modules/services/system/bpftune.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/bpftune.nix)

## `services.brltty.enable` {#opt-services.brltty.enable}

Whether to enable the BRLTTY daemon.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/hardware/brltty.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/brltty.nix)

## `services.broadcast-box.enable` {#opt-services.broadcast-box.enable}

Whether to enable Broadcast Box.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/broadcast-box.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/broadcast-box.nix)

## `services.broadcast-box.openFirewall` {#opt-services.broadcast-box.openFirewall}

Whether to enable opening WebRTC traffic ports in the firewall. Randomly selected ports
will not be opened.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/broadcast-box.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/broadcast-box.nix)

## `services.broadcast-box.package` {#opt-services.broadcast-box.package}

The broadcast-box package to use.

*Type:* package

*Default:* `pkgs.broadcast-box`

*Declared by:* [`nixos/modules/services/video/broadcast-box.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/broadcast-box.nix)

## `services.broadcast-box.settings` {#opt-services.broadcast-box.settings}

Attribute set of environment variables.

[https://github.com/Glimesh/broadcast-box#environment-variables](https://github.com/Glimesh/broadcast-box#environment-variables)

::: warning
The status API exposes stream keys so `DISABLE_STATUS` is enabled
by default.
:::

*Type:* open submodule of attribute set of (null or boolean or signed integer or string)

*Default:*

``` nix
{
  DISABLE_STATUS = true;
}
```

*Example:*

``` nix
{
  DISABLE_STATUS = true;
  INCLUDE_PUBLIC_IP_IN_NAT_1_TO_1_IP = true;
  UDP_MUX_PORT = 3000;
}
```

*Declared by:* [`nixos/modules/services/video/broadcast-box.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/broadcast-box.nix)

## `services.broadcast-box.web.host` {#opt-services.broadcast-box.web.host}

Host address the HTTP server listens on. By default the server
listens on all interfaces.

*Type:* string

*Default:* `""`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/video/broadcast-box.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/broadcast-box.nix)

## `services.broadcast-box.web.openFirewall` {#opt-services.broadcast-box.web.openFirewall}

Whether to enable opening the HTTP server port and, if enabled, the HTTPS redirect server
port in the firewall.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/video/broadcast-box.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/broadcast-box.nix)

## `services.broadcast-box.web.port` {#opt-services.broadcast-box.web.port}

Port the HTTP server listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/video/broadcast-box.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/video/broadcast-box.nix)

## `services.btrbk.extraPackages` {#opt-services.btrbk.extraPackages}

Extra packages for btrbk, like compression utilities for `stream_compress`.

**Note**: This option will get deprecated in future releases.
Required compression programs will get automatically provided to btrbk
depending on configured compression method in
`services.btrbk.instances.<name>.settings` option.

*Type:* list of package

*Default:* `[ ]`

*Example:* `[ pkgs.xz ]`

*Declared by:* [`nixos/modules/services/backup/btrbk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/btrbk.nix)

## `services.btrbk.instances` {#opt-services.btrbk.instances}

Set of btrbk instances. The instance named `btrbk` is the default one.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/backup/btrbk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/btrbk.nix)

## `services.btrbk.instances.<name>.onCalendar` {#opt-services.btrbk.instances._name_.onCalendar}

How often this btrbk instance is started. See `systemd.time(7)` for more information about the format.
Setting it to null disables the timer, thus this instance can only be started manually.

*Type:* null or string

*Default:* `"daily"`

*Declared by:* [`nixos/modules/services/backup/btrbk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/btrbk.nix)

## `services.btrbk.instances.<name>.settings` {#opt-services.btrbk.instances._name_.settings}

configuration options for btrbk. Nested attrsets translate to subsections.

*Type:* open submodule of attribute set of (string or instances of this type recursively)

*Default:* `{ }`

*Example:*

``` nix
{
  snapshot_preserve = "14d";
  snapshot_preserve_min = "2d";
  volume = {
    "/mnt/btr_pool" = {
      subvolume = {
        home = {
          snapshot_create = "always";
        };
        rootfs = { };
      };
      target = "/mnt/btr_backup/mylaptop";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/backup/btrbk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/btrbk.nix)

## `services.btrbk.instances.<name>.settings.stream_compress` {#opt-services.btrbk.instances._name_.settings.stream_compress}

Compress the btrfs send stream before transferring it from/to remote locations using a
compression command.

*Type:* one of "gzip", "pigz", "bzip2", "pbzip2", "bzip3", "xz", "lzo", "lz4", "zstd", "no"

*Default:* `"no"`

*Declared by:* [`nixos/modules/services/backup/btrbk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/btrbk.nix)

## `services.btrbk.instances.<name>.snapshotOnly` {#opt-services.btrbk.instances._name_.snapshotOnly}

Whether to run in snapshot only mode. This skips backup creation and deletion steps.
Useful when you want to manually backup to an external drive that might not always be connected.
Use `btrbk -c /path/to/conf resume` to trigger manual backups.
More examples [here](https://github.com/digint/btrbk#example-backups-to-usb-disk).
See also `snapshot` subcommand in `btrbk(1)`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/backup/btrbk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/btrbk.nix)

## `services.btrbk.ioSchedulingClass` {#opt-services.btrbk.ioSchedulingClass}

IO scheduling class for btrbk (see `ionice(1)` for a quick description). Applies to local instances, and remote ones connecting by ssh if set to idle.

*Type:* one of "idle", "best-effort", "realtime"

*Default:* `"best-effort"`

*Declared by:* [`nixos/modules/services/backup/btrbk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/btrbk.nix)

## `services.btrbk.niceness` {#opt-services.btrbk.niceness}

Niceness for local instances of btrbk. Also applies to remote ones connecting via ssh when positive.

*Type:* integer between -20 and 19 (both inclusive)

*Default:* `10`

*Declared by:* [`nixos/modules/services/backup/btrbk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/btrbk.nix)

## `services.btrbk.sshAccess` {#opt-services.btrbk.sshAccess}

SSH keys that should be able to make or push snapshots on this system remotely with btrbk

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/backup/btrbk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/btrbk.nix)

## `services.btrbk.sshAccess.*.extraArgs` {#opt-services.btrbk.sshAccess._.extraArgs}

Additional arguments to pass to ssh\_filter\_btrbk

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--log"
  "--restrict-path <path>"
]
```

*Declared by:* [`nixos/modules/services/backup/btrbk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/btrbk.nix)

## `services.btrbk.sshAccess.*.key` {#opt-services.btrbk.sshAccess._.key}

SSH public key allowed to login as user `btrbk` to run remote backups.

*Type:* string

*Declared by:* [`nixos/modules/services/backup/btrbk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/btrbk.nix)

## `services.btrbk.sshAccess.*.roles` {#opt-services.btrbk.sshAccess._.roles}

What actions can be performed with this SSH key. See ssh\_filter\_btrbk(1) for details

*Type:* list of (one of "info", "source", "target", "delete", "snapshot", "send", "receive")

*Default:* `[ ]`

*Example:*

``` nix
[
  "source"
  "info"
  "send"
]
```

*Declared by:* [`nixos/modules/services/backup/btrbk.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/backup/btrbk.nix)

## `services.btrfs.autoScrub.enable` {#opt-services.btrfs.autoScrub.enable}

Whether to enable regular btrfs scrub.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/tasks/filesystems/btrfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/btrfs.nix)

## `services.btrfs.autoScrub.fileSystems` {#opt-services.btrfs.autoScrub.fileSystems}

List of paths to btrfs filesystems to regularly call `btrfs scrub` on.
Defaults to all mount points with btrfs filesystems.
Note that if you have filesystems that span multiple devices (e.g. RAID), you should
take care to use the same device for any given mount point and let btrfs take care
of automatically mounting the rest, in order to avoid scrubbing the same data multiple times.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  "/"
]
```

*Declared by:* [`nixos/modules/tasks/filesystems/btrfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/btrfs.nix)

## `services.btrfs.autoScrub.interval` {#opt-services.btrfs.autoScrub.interval}

Systemd calendar expression for when to scrub btrfs filesystems.
The recommended period is a month but could be less
(`btrfs-scrub(8)`).
See
`systemd.time(7)`
for more information on the syntax.

*Type:* string

*Default:* `"monthly"`

*Example:* `"weekly"`

*Declared by:* [`nixos/modules/tasks/filesystems/btrfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/btrfs.nix)

## `services.btrfs.autoScrub.limit` {#opt-services.btrfs.autoScrub.limit}

The scrub throughput limit applied on all scrubbed filesystems.
The value is bytes per second, and accepts the usual KMGT prefixes.

*Type:* null or string matching the pattern \[0-9\]+\[KMGT\]?

*Default:* `null`

*Example:* `"100M"`

*Declared by:* [`nixos/modules/tasks/filesystems/btrfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/tasks/filesystems/btrfs.nix)

## `services.buffyboard.configFile` {#opt-services.buffyboard.configFile}

Path to an INI format configuration file to provide Buffyboard.
By default, this is generated from whatever you've set in `settings`.
If specified manually, then `settings` is ignored.

For an example config file see [here](https://gitlab.nura.eco/nura/buffybox/-/blob/main/buffyboard/buffyboard.conf)

*Type:* absolute path

*Default:* `ini.generate "buffyboard.conf" cfg.settings`

*Declared by:* [`nixos/modules/services/hardware/buffyboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/buffyboard.nix)

## `services.buffyboard.enable` {#opt-services.buffyboard.enable}

Whether to enable buffyboard framebuffer keyboard (on-screen keyboard).

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/buffyboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/buffyboard.nix)

## `services.buffyboard.extraFlags` {#opt-services.buffyboard.extraFlags}

Extra CLI arguments to pass to buffyboard.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--geometry=1920x1080@640,0"
  "--dpi=192"
  "--rotate=2"
  "--verbose"
]
```

*Declared by:* [`nixos/modules/services/hardware/buffyboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/buffyboard.nix)

## `services.buffyboard.package` {#opt-services.buffyboard.package}

The buffybox package to use.

*Type:* package

*Default:* `pkgs.buffybox`

*Declared by:* [`nixos/modules/services/hardware/buffyboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/buffyboard.nix)

## `services.buffyboard.settings` {#opt-services.buffyboard.settings}

Settings to include in /etc/buffyboard.conf.
Every option here is strictly optional:
Buffyboard will use its own baked-in defaults for those options left unset.

*Type:* open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/buffyboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/buffyboard.nix)

## `services.buffyboard.settings.input.pointer` {#opt-services.buffyboard.settings.input.pointer}

Enable or disable the use of a hardware mouse or other pointing device.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/buffyboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/buffyboard.nix)

## `services.buffyboard.settings.input.touchscreen` {#opt-services.buffyboard.settings.input.touchscreen}

Enable or disable the use of the touchscreen.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/buffyboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/buffyboard.nix)

## `services.buffyboard.settings.keyboard.haptic_feedback` {#opt-services.buffyboard.settings.keyboard.haptic_feedback}

Enable or disable vibrations when pressing keys.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/buffyboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/buffyboard.nix)

## `services.buffyboard.settings.keyboard.sticky_shift` {#opt-services.buffyboard.settings.keyboard.sticky_shift}

Changes shift key behavior. When true, the keyboard remains in uppercase mode until
the shift key is pressed again (sticky). When false, the keyboard switches back to
lowercase mode and the shift key deactivates after a non-modifier key is pressed.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/buffyboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/buffyboard.nix)

## `services.buffyboard.settings.quirks.fbdev_force_refresh` {#opt-services.buffyboard.settings.quirks.fbdev_force_refresh}

If true and using the framebuffer backend, this triggers a display refresh after every draw operation.
This has a negative performance impact.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/buffyboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/buffyboard.nix)

## `services.buffyboard.settings.quirks.ignore_unused_terminals` {#opt-services.buffyboard.settings.quirks.ignore_unused_terminals}

If true, buffyboard won't automatically update the layout of a new terminal and
draw the keyboard, if the terminal is not opened by any process. In this case
SIGUSR1 should be sent to buffyboard to update the layout. This quirk was introduced
to resolve a race between buffyboard and systemd-logind according to the following scenario:

- A user switches to a new virtual terminal
- Buffyboard opens the terminal and changes the number of rows
- systemd-logind sees that the terminal is opened by some other process and don't start getty@.service

The race is resolved by enabling this option and installing a drop-in file
for getty@.service that sends SIGUSR1 to buffyboard.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/buffyboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/buffyboard.nix)

## `services.buffyboard.settings.theme.default` {#opt-services.buffyboard.settings.theme.default}

Selects the default theme on boot. Can be changed at runtime to the alternative theme.

*Type:* string or one of <null>, "adwaita-dark", "breezy-dark", "breezy-light", "nord-dark", "nord-light", "pmos-dark", "pmos-light"

*Default:* `null`

*Declared by:* [`nixos/modules/services/hardware/buffyboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/buffyboard.nix)

## `services.buildbot-master.buildbotDir` {#opt-services.buildbot-master.buildbotDir}

Specifies the Buildbot directory.

*Type:* absolute path

*Default:* `"${config.services.buildbot-master.home}/master"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.buildbotUrl` {#opt-services.buildbot-master.buildbotUrl}

Specifies the Buildbot URL.

*Type:* string

*Default:* `"http://localhost:8010/"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.builders` {#opt-services.buildbot-master.builders}

List of Builders.

*Type:* list of string

*Default:*

``` nix
[
  "util.BuilderConfig(name='runtests',workernames=['example-worker'],factory=factory)"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.changeSource` {#opt-services.buildbot-master.changeSource}

List of Change Sources.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "changes.GitPoller('https://github.com/buildbot/pyflakes.git', workdir='gitpoller-workdir', branch='master', pollinterval=300)"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.configurators` {#opt-services.buildbot-master.configurators}

Configurator Steps, see [https://docs.buildbot.net/latest/manual/configuration/configurators.html](https://docs.buildbot.net/latest/manual/configuration/configurators.html)

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "util.JanitorConfigurator(logHorizon=timedelta(weeks=4), hour=12, dayOfWeek=6)"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.dbUrl` {#opt-services.buildbot-master.dbUrl}

Specifies the database connection string.

*Type:* string

*Default:* `"sqlite:///state.sqlite"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.enable` {#opt-services.buildbot-master.enable}

Whether to enable the Buildbot continuous integration server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.extraConfig` {#opt-services.buildbot-master.extraConfig}

Extra configuration to append to master.cfg

*Type:* strings concatenated with "\\n"

*Default:* `"c['buildbotNetUsageData'] = None"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.extraGroups` {#opt-services.buildbot-master.extraGroups}

List of extra groups that the buildbot user should be a part of.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.extraImports` {#opt-services.buildbot-master.extraImports}

Extra python imports to prepend to master.cfg

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"from buildbot.process.project import Project"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.factorySteps` {#opt-services.buildbot-master.factorySteps}

Factory Steps

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "steps.Git(repourl='https://github.com/buildbot/pyflakes.git', mode='incremental')"
  "steps.ShellCommand(command=['trial', 'pyflakes'])"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.group` {#opt-services.buildbot-master.group}

Primary group of buildbot user.

*Type:* string

*Default:* `"buildbot"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.home` {#opt-services.buildbot-master.home}

Buildbot home directory.

*Type:* absolute path

*Default:* `"/home/buildbot"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.listenAddress` {#opt-services.buildbot-master.listenAddress}

Specifies the bind address on which the buildbot HTTP interface listens.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.masterCfg` {#opt-services.buildbot-master.masterCfg}

Optionally pass master.cfg path. Other options in this configuration will be ignored.

*Type:* absolute path

*Default:* generated configuration file

*Example:* `"/etc/nixos/buildbot/master.cfg"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.package` {#opt-services.buildbot-master.package}

The buildbot-full package to use.

*Type:* package

*Default:* `pkgs.buildbot-full`

*Example:* `buildbot`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.packages` {#opt-services.buildbot-master.packages}

Packages to add to PATH for the buildbot process.

*Type:* list of package

*Default:* `[ pkgs.git ]`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.pbPort` {#opt-services.buildbot-master.pbPort}

The buildmaster will listen on a TCP port of your choosing
for connections from workers.
It can also use this port for connections from remote Change Sources,
status clients, and debug tools.
This port should be visible to the outside world, and you’ll need to tell
your worker admins about your choice.
If put in (single) quotes, this can also be used as a connection string,
as defined in the [ConnectionStrings guide](https://twistedmatrix.com/documents/current/core/howto/endpoints.html).

*Type:* string or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9989`

*Example:* `"'tcp:9990:interface=127.0.0.1'"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.port` {#opt-services.buildbot-master.port}

Specifies port number on which the buildbot HTTP interface listens.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8010`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.pythonPackages` {#opt-services.buildbot-master.pythonPackages}

Packages to add the to the PYTHONPATH of the buildbot process.

*Type:* function that evaluates to a(n) list of package

*Default:* `pythonPackages: with pythonPackages; [ ]`

*Example:* `pythonPackages: with pythonPackages; [ requests ]`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.reporters` {#opt-services.buildbot-master.reporters}

List of reporter objects used to present build status to various users.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.schedulers` {#opt-services.buildbot-master.schedulers}

List of Schedulers.

*Type:* list of string

*Default:*

``` nix
[
  "schedulers.SingleBranchScheduler(name='all', change_filter=util.ChangeFilter(branch='master'), treeStableTimer=None, builderNames=['runtests'])"
  "schedulers.ForceScheduler(name='force',builderNames=['runtests'])"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.title` {#opt-services.buildbot-master.title}

Specifies the Buildbot Title.

*Type:* string

*Default:* `"Buildbot"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.titleUrl` {#opt-services.buildbot-master.titleUrl}

Specifies the Buildbot TitleURL.

*Type:* string

*Default:* `"Buildbot"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.user` {#opt-services.buildbot-master.user}

User the buildbot server should execute under.

*Type:* string

*Default:* `"buildbot"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-master.workers` {#opt-services.buildbot-master.workers}

List of Workers.

*Type:* list of string

*Default:*

``` nix
[
  "worker.Worker('example-worker', 'pass')"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/master.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/master.nix)

## `services.buildbot-worker.adminMessage` {#opt-services.buildbot-worker.adminMessage}

Name of the administrator of this worker

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/worker.nix)

## `services.buildbot-worker.buildbotDir` {#opt-services.buildbot-worker.buildbotDir}

Specifies the Buildbot directory.

*Type:* absolute path

*Default:* `"${config.services.buildbot-worker.home}/worker"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/worker.nix)

## `services.buildbot-worker.enable` {#opt-services.buildbot-worker.enable}

Whether to enable the Buildbot Worker.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/worker.nix)

## `services.buildbot-worker.extraGroups` {#opt-services.buildbot-worker.extraGroups}

List of extra groups that the Buildbot Worker user should be a part of.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/worker.nix)

## `services.buildbot-worker.group` {#opt-services.buildbot-worker.group}

Primary group of buildbot Worker user.

*Type:* string

*Default:* `"bbworker"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/worker.nix)

## `services.buildbot-worker.home` {#opt-services.buildbot-worker.home}

Buildbot home directory.

*Type:* absolute path

*Default:* `"/home/bbworker"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/worker.nix)

## `services.buildbot-worker.hostMessage` {#opt-services.buildbot-worker.hostMessage}

Description of this worker

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/worker.nix)

## `services.buildbot-worker.keepalive` {#opt-services.buildbot-worker.keepalive}

This is a number that indicates how frequently keepalive messages should be sent
from the worker to the buildmaster, expressed in seconds.

*Type:* signed integer

*Default:* `600`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/worker.nix)

## `services.buildbot-worker.masterUrl` {#opt-services.buildbot-worker.masterUrl}

Specifies the Buildbot Worker connection string.

*Type:* string

*Default:* `"localhost:9989"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/worker.nix)

## `services.buildbot-worker.package` {#opt-services.buildbot-worker.package}

The buildbot-worker package to use.

*Type:* package

*Default:* `pkgs.buildbot-worker`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/worker.nix)

## `services.buildbot-worker.packages` {#opt-services.buildbot-worker.packages}

Packages to add to PATH for the buildbot process.

*Type:* list of package

*Default:* `[ pkgs.git ]`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/worker.nix)

## `services.buildbot-worker.user` {#opt-services.buildbot-worker.user}

User the buildbot Worker should execute under.

*Type:* string

*Default:* `"bbworker"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/worker.nix)

## `services.buildbot-worker.workerPass` {#opt-services.buildbot-worker.workerPass}

Specifies the Buildbot Worker password.

*Type:* string

*Default:* `"pass"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/worker.nix)

## `services.buildbot-worker.workerPassFile` {#opt-services.buildbot-worker.workerPassFile}

File used to store the Buildbot Worker password

*Type:* absolute path

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/worker.nix)

## `services.buildbot-worker.workerUser` {#opt-services.buildbot-worker.workerUser}

Specifies the Buildbot Worker user.

*Type:* string

*Default:* `"example-worker"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildbot/worker.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildbot/worker.nix)

## `services.buildkite-agents` {#opt-services.buildkite-agents}

Attribute set of buildkite agents.
The attribute key is combined with the hostname and a unique integer to
create the final agent name. This can be overridden by setting the `name`
attribute.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/continuous-integration/buildkite-agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildkite-agents.nix)

## `services.buildkite-agents.<name>.dataDir` {#opt-services.buildkite-agents._name_.dataDir}

The workdir for the agent

*Type:* string

*Default:* `"/var/lib/buildkite-agent-‹name›"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildkite-agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildkite-agents.nix)

## `services.buildkite-agents.<name>.enable` {#opt-services.buildkite-agents._name_.enable}

Whether to enable this buildkite agent

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/continuous-integration/buildkite-agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildkite-agents.nix)

## `services.buildkite-agents.<name>.extraConfig` {#opt-services.buildkite-agents._name_.extraConfig}

Extra lines to be added verbatim to the configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"debug=true"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildkite-agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildkite-agents.nix)

## `services.buildkite-agents.<name>.extraGroups` {#opt-services.buildkite-agents._name_.extraGroups}

Groups the user for this buildkite agent should belong to

*Type:* list of string

*Default:*

``` nix
[
  "keys"
]
```

*Declared by:* [`nixos/modules/services/continuous-integration/buildkite-agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildkite-agents.nix)

## `services.buildkite-agents.<name>.hooks` {#opt-services.buildkite-agents._name_.hooks}

"Agent" hooks to install.
See [https://buildkite.com/docs/agent/v3/hooks](https://buildkite.com/docs/agent/v3/hooks) for possible options.

*Type:* attribute set of strings concatenated with "\\n"

*Default:* `{ }`

*Example:*

``` nix
{
  environment = ''
    export SECRET_VAR=`head -1 /run/keys/secret`
  '';
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/buildkite-agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildkite-agents.nix)

## `services.buildkite-agents.<name>.hooksPath` {#opt-services.buildkite-agents._name_.hooksPath}

Path to the directory storing the hooks.
Consider using `services.buildkite-agents.<name>.hooks.<name>`
instead.

*Type:* absolute path

*Default:* generated from [`services.buildkite-agents.<name>.hooks`](#opt-services.buildkite-agents._name_.hooks)

*Declared by:* [`nixos/modules/services/continuous-integration/buildkite-agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildkite-agents.nix)

## `services.buildkite-agents.<name>.name` {#opt-services.buildkite-agents._name_.name}

The name of the agent as seen in the buildkite dashboard.

*Type:* string

*Default:* `"%hostname-‹name›-%n"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildkite-agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildkite-agents.nix)

## `services.buildkite-agents.<name>.package` {#opt-services.buildkite-agents._name_.package}

The buildkite-agent package to use.

*Type:* package

*Default:* `pkgs.buildkite-agent`

*Declared by:* [`nixos/modules/services/continuous-integration/buildkite-agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildkite-agents.nix)

## `services.buildkite-agents.<name>.privateSshKeyPath` {#opt-services.buildkite-agents._name_.privateSshKeyPath}

OpenSSH private key

A run-time path to the key file, which is supposed to be provisioned
outside of Nix store.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/continuous-integration/buildkite-agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildkite-agents.nix)

## `services.buildkite-agents.<name>.runtimePackages` {#opt-services.buildkite-agents._name_.runtimePackages}

Add programs to the buildkite-agent environment

*Type:* list of package

*Default:* `[ pkgs.bash pkgs.gnutar pkgs.gzip pkgs.git pkgs.nix ]`

*Declared by:* [`nixos/modules/services/continuous-integration/buildkite-agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildkite-agents.nix)

## `services.buildkite-agents.<name>.shell` {#opt-services.buildkite-agents._name_.shell}

Command that buildkite-agent 3 will execute when it spawns a shell.

*Type:* string

*Default:* `"${pkgs.bash}/bin/bash -e -c"`

*Declared by:* [`nixos/modules/services/continuous-integration/buildkite-agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildkite-agents.nix)

## `services.buildkite-agents.<name>.tags` {#opt-services.buildkite-agents._name_.tags}

Tags for the agent.

*Type:* attribute set of (string or list of string)

*Default:* `{ }`

*Example:*

``` nix
{
  docker = "true";
  queue = "default";
  ruby2 = "true";
}
```

*Declared by:* [`nixos/modules/services/continuous-integration/buildkite-agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildkite-agents.nix)

## `services.buildkite-agents.<name>.tokenPath` {#opt-services.buildkite-agents._name_.tokenPath}

The token from your Buildkite "Agents" page.

A run-time path to the token file, which is supposed to be provisioned
outside of Nix store.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/continuous-integration/buildkite-agents.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/continuous-integration/buildkite-agents.nix)

## `services.bulwark.admin` {#opt-services.bulwark.admin}

Bulwark Admin configuration

*Type:* null or (open submodule of (JSON value))

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.admin.passwordHashFile` {#opt-services.bulwark.admin.passwordHashFile}

File containing the admin password hash

Generate with

```
SALT=$(openssl rand -hex 32)
HASH64=$(openssl kdf \
  -kdfopt pass:"YOUR-PASSWORD" \
  -kdfopt hexsalt:$SALT \
  -keylen 64 -kdfopt n:16384 -kdfopt r:8 -kdfopt p:1 \
  -binary SCRYPT | base64)
SALT64=$(echo $SALT | xxd -r -p | base64)

echo "\$scrypt\$N=16384,r=8,p=1\$$SALT64\$$HASH64"
```

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.admin.sessionTTL` {#opt-services.bulwark.admin.sessionTTL}

Admin session lifetime in seconds

*Type:* signed integer

*Default:* `3600`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.admin.trustedProxyDepth` {#opt-services.bulwark.admin.trustedProxyDepth}

Number of `X-Forwarded-For` hops to trust when resolving the client IP for admin sessions and audit logs.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.admin_state_dir` {#opt-services.bulwark.admin_state_dir}

State dir - runtime mutations. Holds admin-state.json (login timestamps),
audit.log, and the bootstrap setup token. Always read-write.

*Type:* string

*Default:* `"/var/lib/bulwark/admin-state"`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.enable` {#opt-services.bulwark.enable}

Whether to enable Bulwark, a modern, self-hosted webmail client for Stalwart Mail Server..

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.hostname` {#opt-services.bulwark.hostname}

Hostname the server binds to.

*Type:* string

*Default:* `"::"`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.package` {#opt-services.bulwark.package}

The bulwark package to use.

*Type:* package

*Default:* `pkgs.bulwark`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.plugins` {#opt-services.bulwark.plugins}

Additional plugins to be used.

*Type:* list of (submodule)

*Default:* `[ ]`

*Example:*

``` nix
with pkgs.bulwark-plugins; [
  {
    package = calendar-agenda;
  }
  {
    package = spam-score;
    forceEnabled = true;
  }
  {
    package = external-link-warning;
    config.trustedDomains = "example.com";
  }
] ++ [
  {
    package = mkBulwarkPlugin {
      name = "gravatar";
      version = "1.3.1";
      hash = "sha256-Rz+xgBw4mfQcdGvQnPLrrW5i4nDQYwMt5Y37gZ2WxyE=";
    };
  }
]
```

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.plugins.*.config` {#opt-services.bulwark.plugins._.config}

Plugin configuration

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.plugins.*.forceEnabled` {#opt-services.bulwark.plugins._.forceEnabled}

Whether this plugin is force-enabled (users cannot disable).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.plugins.*.package` {#opt-services.bulwark.plugins._.package}

Plugin package

*Type:* package

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies` {#opt-services.bulwark.policies}

Bulwark Policy configuration

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.approvedPlugins` {#opt-services.bulwark.policies.approvedPlugins}

Approved Plugins

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.calendarTasksEnabled` {#opt-services.bulwark.policies.features.calendarTasksEnabled}

Show task panel in calendar view.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.contactsEnabled` {#opt-services.bulwark.policies.features.contactsEnabled}

Enable contacts/address book features.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.crossAllViewEnabled` {#opt-services.bulwark.policies.features.crossAllViewEnabled}

Allow an All mail entry in the Unified Mailbox section that lists all mail across the account and its shared folders
(or every account when the cross-account sub-option is on).
Honors the user's folder selection. Requires the matching per-user toggle in Settings → Appearance.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.crossStarredViewEnabled` {#opt-services.bulwark.policies.features.crossStarredViewEnabled}

Allow a Starred entry in the Unified Mailbox section that lists flagged/starred mail across the account and its shared folders
(or every account when the cross-account sub-option is on). Honors the user's folder selection.
Requires the matching per-user toggle in Settings → Appearance.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.crossUnreadViewEnabled` {#opt-services.bulwark.policies.features.crossUnreadViewEnabled}

Allow an Unread entry in the Unified Mailbox section that lists unread mail across the account and its shared folders
(or every account when the cross-account sub-option is on). Honors the user's folder selection.
Requires the matching per-user toggle in Settings → Appearance.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.customKeywordsEnabled` {#opt-services.bulwark.policies.features.customKeywordsEnabled}

Allow user-created labels and tags.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.debugModeEnabled` {#opt-services.bulwark.policies.features.debugModeEnabled}

Allow users to enable debug/diagnostic mode.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.externalContentEnabled` {#opt-services.bulwark.policies.features.externalContentEnabled}

Allow users to choose external content loading policy.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.filesEnabled` {#opt-services.bulwark.policies.features.filesEnabled}

Enable file storage via WebDAV. WARNING: Large uploads can cause Stalwart/RocksDB instability. Not recommended for production.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.folderIconsEnabled` {#opt-services.bulwark.policies.features.folderIconsEnabled}

Allow custom folder icon picker.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.hoverActionsConfigEnabled` {#opt-services.bulwark.policies.features.hoverActionsConfigEnabled}

Allow users to customize email hover actions.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.pluginsEnabled` {#opt-services.bulwark.policies.features.pluginsEnabled}

Allow the plugin system to load and run plugins for users.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.requirePluginApproval` {#opt-services.bulwark.policies.features.requirePluginApproval}

User-uploaded plugins must be approved by an admin before they can be enabled.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.settingsExportEnabled` {#opt-services.bulwark.policies.features.settingsExportEnabled}

Allow users to export and import settings JSON.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.sidebarAppsEnabled` {#opt-services.bulwark.policies.features.sidebarAppsEnabled}

Allow custom web apps in navigation rail.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.smimeEnabled` {#opt-services.bulwark.policies.features.smimeEnabled}

Enable certificate management and email signing.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.templatesEnabled` {#opt-services.bulwark.policies.features.templatesEnabled}

Allow email template creation and library.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.themesEnabled` {#opt-services.bulwark.policies.features.themesEnabled}

Allow users to select and apply themes.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.features.unifiedCrossAccountEnabled` {#opt-services.bulwark.policies.features.unifiedCrossAccountEnabled}

Allow users to expand the Unified Mailbox beyond the active account boundary so its lists merge across every logged-in account.
When off, the Unified Mailbox stays within the active account and its shared folders.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.forceEnabledPlugins` {#opt-services.bulwark.policies.forceEnabledPlugins}

Force-enabled Plugins

*Type:* list of string

*Default:*

``` nix
map (plugin: plugin.package.pluginName) (
  filter (plugin: plugin.forceEnabled) config.services.bulwark.plugins
);
```

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.forceEnabledThemes` {#opt-services.bulwark.policies.forceEnabledThemes}

Force-enabled Themes

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.pushRelayUrl` {#opt-services.bulwark.policies.pushRelayUrl}

Override the Web Push relay URL shown in user notification settings.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.pushRelayUrlLocked` {#opt-services.bulwark.policies.pushRelayUrlLocked}

Whether the Web Push relay URL is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.animationsEnabled` {#opt-services.bulwark.policies.restrictions.animationsEnabled}

Appearance: Animations

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.animationsEnabled.hidden` {#opt-services.bulwark.policies.restrictions.animationsEnabled.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.animationsEnabled.locked` {#opt-services.bulwark.policies.restrictions.animationsEnabled.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.autoSelectReplyIdentity` {#opt-services.bulwark.policies.restrictions.autoSelectReplyIdentity}

Composer: Auto-select Reply Identity

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.autoSelectReplyIdentity.hidden` {#opt-services.bulwark.policies.restrictions.autoSelectReplyIdentity.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.autoSelectReplyIdentity.locked` {#opt-services.bulwark.policies.restrictions.autoSelectReplyIdentity.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.calendarNotificationsEnabled` {#opt-services.bulwark.policies.restrictions.calendarNotificationsEnabled}

Notifications: Calendar Notifications

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.calendarNotificationsEnabled.hidden` {#opt-services.bulwark.policies.restrictions.calendarNotificationsEnabled.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.calendarNotificationsEnabled.locked` {#opt-services.bulwark.policies.restrictions.calendarNotificationsEnabled.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.debugMode` {#opt-services.bulwark.policies.restrictions.debugMode}

Advanced: Debug Mode

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.debugMode.hidden` {#opt-services.bulwark.policies.restrictions.debugMode.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.debugMode.locked` {#opt-services.bulwark.policies.restrictions.debugMode.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.defaultReplyMode` {#opt-services.bulwark.policies.restrictions.defaultReplyMode}

Composer: Default Reply Mode

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.defaultReplyMode.hidden` {#opt-services.bulwark.policies.restrictions.defaultReplyMode.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.defaultReplyMode.locked` {#opt-services.bulwark.policies.restrictions.defaultReplyMode.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.deleteAction` {#opt-services.bulwark.policies.restrictions.deleteAction}

Email: Delete Action

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.deleteAction.hidden` {#opt-services.bulwark.policies.restrictions.deleteAction.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.deleteAction.locked` {#opt-services.bulwark.policies.restrictions.deleteAction.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.density` {#opt-services.bulwark.policies.restrictions.density}

Appearance: Density

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.density.hidden` {#opt-services.bulwark.policies.restrictions.density.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.density.locked` {#opt-services.bulwark.policies.restrictions.density.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.emailNotificationsEnabled` {#opt-services.bulwark.policies.restrictions.emailNotificationsEnabled}

Notifications: Email Notifications

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.emailNotificationsEnabled.hidden` {#opt-services.bulwark.policies.restrictions.emailNotificationsEnabled.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.emailNotificationsEnabled.locked` {#opt-services.bulwark.policies.restrictions.emailNotificationsEnabled.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.emailsPerPage` {#opt-services.bulwark.policies.restrictions.emailsPerPage}

Email: Emails Per Page

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.emailsPerPage.hidden` {#opt-services.bulwark.policies.restrictions.emailsPerPage.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.emailsPerPage.locked` {#opt-services.bulwark.policies.restrictions.emailsPerPage.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.externalContentPolicy` {#opt-services.bulwark.policies.restrictions.externalContentPolicy}

Email: External Content Policy

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.externalContentPolicy.hidden` {#opt-services.bulwark.policies.restrictions.externalContentPolicy.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.externalContentPolicy.locked` {#opt-services.bulwark.policies.restrictions.externalContentPolicy.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.fontSize` {#opt-services.bulwark.policies.restrictions.fontSize}

Appearance: Font Size

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.fontSize.hidden` {#opt-services.bulwark.policies.restrictions.fontSize.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.fontSize.locked` {#opt-services.bulwark.policies.restrictions.fontSize.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.mailLayout` {#opt-services.bulwark.policies.restrictions.mailLayout}

Email: Mail Layout

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.mailLayout.hidden` {#opt-services.bulwark.policies.restrictions.mailLayout.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.mailLayout.locked` {#opt-services.bulwark.policies.restrictions.mailLayout.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.markAsReadDelay` {#opt-services.bulwark.policies.restrictions.markAsReadDelay}

Email: Mark as Read Delay

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.markAsReadDelay.hidden` {#opt-services.bulwark.policies.restrictions.markAsReadDelay.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.markAsReadDelay.locked` {#opt-services.bulwark.policies.restrictions.markAsReadDelay.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.plainTextMode` {#opt-services.bulwark.policies.restrictions.plainTextMode}

Composer: Plain Text Only

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.plainTextMode.hidden` {#opt-services.bulwark.policies.restrictions.plainTextMode.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.plainTextMode.locked` {#opt-services.bulwark.policies.restrictions.plainTextMode.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.sendConfirmation` {#opt-services.bulwark.policies.restrictions.sendConfirmation}

Composer: Send Confirmation

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.sendConfirmation.hidden` {#opt-services.bulwark.policies.restrictions.sendConfirmation.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.sendConfirmation.locked` {#opt-services.bulwark.policies.restrictions.sendConfirmation.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.sessionTimeout` {#opt-services.bulwark.policies.restrictions.sessionTimeout}

Privacy: Session Timeout

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.sessionTimeout.hidden` {#opt-services.bulwark.policies.restrictions.sessionTimeout.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.sessionTimeout.locked` {#opt-services.bulwark.policies.restrictions.sessionTimeout.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.showPreview` {#opt-services.bulwark.policies.restrictions.showPreview}

Email: Show Preview

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.showPreview.hidden` {#opt-services.bulwark.policies.restrictions.showPreview.hidden}

Whether this option is hidden.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.restrictions.showPreview.locked` {#opt-services.bulwark.policies.restrictions.showPreview.locked}

Whether this option is locked.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.themePolicy.defaultThemeId` {#opt-services.bulwark.policies.themePolicy.defaultThemeId}

Theme applied when users have not chosen one.

*Type:* null or one of "builtin-flat-fields", "builtin-qui", "builtin-nord", "builtin-catppuccin", "builtin-solarized", "builtin-roundcube-elastic", "builtin-aurora-glass"

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.themePolicy.disabledBuiltinThemes` {#opt-services.bulwark.policies.themePolicy.disabledBuiltinThemes}

Disabled builtin Themes

*Type:* list of (one of "builtin-flat-fields", "builtin-qui", "builtin-nord", "builtin-catppuccin", "builtin-solarized", "builtin-roundcube-elastic", "builtin-aurora-glass")

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.policies.themePolicy.disabledThemes` {#opt-services.bulwark.policies.themePolicy.disabledThemes}

Disabled Themes

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.port` {#opt-services.bulwark.port}

Port the server listens on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3000`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings` {#opt-services.bulwark.settings}

Bulwark configuration. Check [the example env configuration](https://github.com/bulwarkmail/webmail/blob/1.8.1/.env.example) for more configuration options, keys are written in camel case.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.allowCustomJmapEndpoint` {#opt-services.bulwark.settings.allowCustomJmapEndpoint}

Allow users to specify a custom JMAP server URL on the login form.
When enabled, a "JMAP Server" field appears on the login page.
Users can connect to any JMAP-compatible server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.autoSsoEnabled` {#opt-services.bulwark.settings.autoSsoEnabled}

Automatically redirect to SSO provider on load.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.branding` {#opt-services.bulwark.settings.branding}

Branding configuration. Check [the example env configuration](https://github.com/bulwarkmail/webmail/blob/1.8.1/.env.example#L191), keys are written in camel case.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.branding.appName` {#opt-services.bulwark.settings.branding.appName}

App name displayed in the UI, browser tab title, and PWA manifest.

*Type:* string

*Default:* `"Webmail"`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.domainBranding` {#opt-services.bulwark.settings.domainBranding}

When you serve the webmail on multiple hostnames, each hostname can override
a subset of branding fields. Unset fields fall back to the global values.
Match is on the request's Host (or X-Forwarded-Host) header.

Use "*." to match any subdomain (e.g. "*.example.com"
matches mail.example.com and any deeper subdomain, but NOT example.com).
Exact matches always win over wildcards; the longest wildcard suffix wins
among multiple wildcard matches.

*Type:* attribute set of (open submodule of (JSON value))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.domainBranding.<name>.appName` {#opt-services.bulwark.settings.domainBranding._name_.appName}

App name displayed in the UI, browser tab title, and PWA manifest.

*Type:* string

*Default:* `"Webmail"`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.extensionDirectoryUrl` {#opt-services.bulwark.settings.extensionDirectoryUrl}

URL of the BulwarkMail extension directory for the admin marketplace.

*Type:* string

*Default:* `"https://extensions.bulwarkmail.org"`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.jmapServerAutoPickByDomain` {#opt-services.bulwark.settings.jmapServerAutoPickByDomain}

When users type their email, automatically select the matching server from `settings.jmapServers`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.jmapServerUrl` {#opt-services.bulwark.settings.jmapServerUrl}

URL of your JMAP-compatible mail server (required unless `settings.allowCustomJmapEndpoint` is set).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.jmapServers` {#opt-services.bulwark.settings.jmapServers}

Allow users to connect to multiple JMAP servers.

*Type:* attribute set of (open submodule of (JSON value))

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.jmapServers.<name>.domains` {#opt-services.bulwark.settings.jmapServers._name_.domains}

Email domains

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.jmapServers.<name>.label` {#opt-services.bulwark.settings.jmapServers._name_.label}

Server label

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.jmapServers.<name>.url` {#opt-services.bulwark.settings.jmapServers._name_.url}

JMAP URL

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.logFormat` {#opt-services.bulwark.settings.logFormat}

Log format: `text` (colored, human-readable) or `json` (structured, for log aggregation)

*Type:* one of "text", "json"

*Default:* `"text"`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.logLevel` {#opt-services.bulwark.settings.logLevel}

Log level: `error`, `warn`, `info`, or `debug`

*Type:* one of "error", "warn", "info", "debug"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.oauth` {#opt-services.bulwark.settings.oauth}

OAuth / OpenID Connect. Options are prefixed with `oauth` and the `oauth` submodule is flattened, so `oauth.clientId` turns to `oauthClientId`.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.oauth.allowPrivateEndpoints` {#opt-services.bulwark.settings.oauth.allowPrivateEndpoints}

Allow OAuth discovery to resolve to private (RFC-1918 / loopback) addresses.
Off by default as an SSRF guard. Enable for split-DNS deployments where the
OAuth issuer's public hostname resolves to an internal IP from this server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.oauth.authorizeUrl` {#opt-services.bulwark.settings.oauth.authorizeUrl}

Overrides only the user-facing authorize endpoint (e.g. a per-brand login
host). Discovery, token exchange and refresh keep using `settings.oauth.issuerUrl`.
Leave unset to use the authorization\_endpoint from discovery.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.oauth.clientId` {#opt-services.bulwark.settings.oauth.clientId}

OAuth client ID registered with your identity provider.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.oauth.clientSecretFile` {#opt-services.bulwark.settings.oauth.clientSecretFile}

Path to a file containing the OAuth client secret (server-side only, never exposed to the browser).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.oauth.enabled` {#opt-services.bulwark.settings.oauth.enabled}

Set to `true` to use OAuth instead of basic JMAP authentication.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.oauth.extraScopes` {#opt-services.bulwark.settings.oauth.extraScopes}

Additional OpenID Connect scopes (urn:ietf:params:oauth:...).

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.oauth.issuerUrl` {#opt-services.bulwark.settings.oauth.issuerUrl}

OpenID Connect issuer URL for discovery.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.oauth.only` {#opt-services.bulwark.settings.oauth.only}

Set to `true` to only allow OAuth login (hides username/password form).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.oauth.scopes` {#opt-services.bulwark.settings.oauth.scopes}

OpenID Connect scopes.

*Type:* string

*Default:* `"openid email profile"`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.sessionSecretFile` {#opt-services.bulwark.settings.sessionSecretFile}

Path to a file containing the secret key for encrypting "Remember me" sessions and settings sync data.
Required for both "Remember me" and settings sync features.
Generate with: openssl rand -base64 32

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.settingsSyncEnabled` {#opt-services.bulwark.settings.settingsSyncEnabled}

Enable server-side settings persistence (requires `settings.sessionSecretFile`).
When enabled, user settings are encrypted and stored on the server,
allowing them to sync across browsers and devices.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.stalwartAdminAccess` {#opt-services.bulwark.settings.stalwartAdminAccess}

What a Stalwart admin account grants in the Bulwark admin dashboard.

auto     - Stalwart admins see the admin shield and are signed into /admin without the Bulwark admin password.
password - Stalwart admins see the shield, but must enter the Bulwark admin password.
off      - Stalwart admin status is ignored: no shield, and /admin is reachable only via /admin/login with the admin password.

*Type:* one of "auto", "password", "off"

*Default:* `"auto"`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings.stalwartFeaturesEnabled` {#opt-services.bulwark.settings.stalwartFeaturesEnabled}

Enable Stalwart-specific features (password change, sieve filters, etc.).
Set to `false` to disable if using a non-Stalwart JMAP server.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.settings_data_dir` {#opt-services.bulwark.settings_data_dir}

Directory for storing encrypted settings files.

*Type:* string

*Default:* `"/var/lib/bulwark/settings"`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.telemetry` {#opt-services.bulwark.telemetry}

Anonymous Telemetry

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.telemetry.data_dir` {#opt-services.bulwark.telemetry.data_dir}

Directory for telemetry state: instance id, consent, login HMACs.

*Type:* string

*Default:* `"/var/lib/bulwark/telemetry"`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.telemetry.enabled` {#opt-services.bulwark.telemetry.enabled}

Anonymous instance telemetry is OPT-IN and disabled by default. Enabling it
helps us understand how Bulwark is used so we can make the product better.
Heartbeats contain no PII: version, platform, bucketed account counts, and
feature toggles only - never email addresses, hostnames, or IPs. See
https://bulwarkmail.org/docs/legal/privacy/telemetry for the full schema.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.updateCheck` {#opt-services.bulwark.updateCheck}

The app periodically checks for new releases and shows a notice

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.updateCheck.enabled` {#opt-services.bulwark.updateCheck.enabled}

Whether to enable update checks

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.updateCheck.url` {#opt-services.bulwark.updateCheck.url}

Override the endpoint it checks. Takes priority over the on-disk state file.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.bulwark.version_check_data_dir` {#opt-services.bulwark.version_check_data_dir}

Version check dir - necessary to perform version checks.

*Type:* string

*Default:* `"/var/lib/bulwark/version-check"`

*Declared by:* [`nixos/modules/services/web-apps/bulwark.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/bulwark.nix)

## `services.byedpi.enable` {#opt-services.byedpi.enable}

Whether to enable the ByeDPI service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/byedpi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/byedpi.nix)

## `services.byedpi.extraArgs` {#opt-services.byedpi.extraArgs}

Extra command line arguments.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--split"
  "1"
  "--disorder"
  "3+s"
  "--mod-http=h,d"
  "--auto=torst"
  "--tlsrec"
  "1+s"
]
```

*Declared by:* [`nixos/modules/services/networking/byedpi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/byedpi.nix)

## `services.byedpi.package` {#opt-services.byedpi.package}

The byedpi package to use.

*Type:* package

*Default:* `pkgs.byedpi`

*Declared by:* [`nixos/modules/services/networking/byedpi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/byedpi.nix)
