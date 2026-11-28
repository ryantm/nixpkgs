# services (K) {#sec-options-services-k}

## `services.k3s.agentToken` {#opt-services.k3s.agentToken}

The k3s token agents can use to connect to the server.
This option only makes sense on server nodes (`role = server`).

**WARNING**: This option will expose your token unencrypted in the world-readable nix store.
If this is undesired use the tokenFile option instead.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.agentTokenFile` {#opt-services.k3s.agentTokenFile}

File path containing the k3s token agents can use to connect to the server.
This option only makes sense on server nodes (`role = server`).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.autoDeployCharts` {#opt-services.k3s.autoDeployCharts}

Auto deploying Helm charts that are installed by the k3s Helm controller. Avoid using
attribute names that are also used in the [services (K)](#opt-services.k3s.manifests) and
[services (K)](#opt-services.k3s.charts) options. Manifests with the same name will override
auto deploying charts with the same name.
This option only makes sense on server nodes (`role = server`). See the
[k3s Helm documentation](https://docs.k3s.io/helm) for further information.

**WARNING**: If you have multiple server nodes, and set this option on more than one server,
it is your responsibility to ensure that files stay in sync across those nodes. AddOn content is
not synced between nodes, and k3s cannot guarantee correct behavior if different servers attempt
to deploy conflicting manifests.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  harbor = {
    name = "harbor";
    repo = "https://helm.goharbor.io";
    version = "1.14.0";
    hash = "sha256-fMP7q1MIbvzPGS9My91vbQ1d3OJMjwc+o8YE/BXZaYU=";
    values = {
      existingSecretAdminPassword = "harbor-admin";
      expose = {
        tls = {
          enabled = true;
          certSource = "secret";
          secret.secretName = "my-tls-secret";
        };
        ingress = {
          hosts.core = "example.com";
          className = "nginx";
        };
      };
    };
  };
  nginx = {
    repo = "oci://registry-1.docker.io/bitnamicharts/nginx";
    version = "20.0.0";
    hash = "sha256-sy+tzB+i9jIl/tqOMzzuhVhTU4EZVsoSBtPznxF/36c=";
  };
  custom-chart = {
    package = ../charts/my-chart.tgz;
    values = ../values/my-values.yaml;
    extraFieldDefinitions = {
      spec.timeout = "60s";
    };
  };
}
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.autoDeployCharts.<name>.createNamespace` {#opt-services.k3s.autoDeployCharts._name_.createNamespace}

Whether to create the target namespace if not present.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.autoDeployCharts.<name>.enable` {#opt-services.k3s.autoDeployCharts._name_.enable}

Whether to enable the installation of this Helm chart. Note that setting
this option to `false` will not uninstall the chart from the cluster, if
it was previously installed. Please use the the `--disable` flag or `.skip`
files to delete/disable Helm charts, as mentioned in the
[docs](https://docs.k3s.io/installation/packaged-components#disabling-manifests).

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.autoDeployCharts.<name>.extraDeploy` {#opt-services.k3s.autoDeployCharts._name_.extraDeploy}

List of extra Kubernetes manifests to deploy with this Helm chart.

*Type:* list of (absolute path or (attribute set))

*Default:* `[ ]`

*Example:*

``` nix
[
  ../manifests/my-extra-deployment.yaml
  {
    apiVersion = "v1";
    kind = "Service";
    metadata = {
      name = "app-service";
    };
    spec = {
      selector = {
        "app.kubernetes.io/name" = "MyApp";
      };
      ports = [
        {
          name = "name-of-service-port";
          protocol = "TCP";
          port = 80;
          targetPort = "http-web-svc";
        }
      ];
    };
  }
];
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.autoDeployCharts.<name>.extraFieldDefinitions` {#opt-services.k3s.autoDeployCharts._name_.extraFieldDefinitions}

Extra HelmChart field definitions that are merged with the rest of the HelmChart
custom resource. This can be used to set advanced fields or to overwrite
generated fields. See [https://docs.k3s.io/helm#helmchart-field-definitions](https://docs.k3s.io/helm#helmchart-field-definitions)
for possible fields.

*Type:* YAML 1.2 value

*Default:* `{ }`

*Example:*

``` nix
{
  spec = {
    backOffLimit = 3;
    bootstrap = true;
    helmVersion = "v2";
    jobImage = "custom-helm-controller:v0.0.1";
  };
}
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.autoDeployCharts.<name>.hash` {#opt-services.k3s.autoDeployCharts._name_.hash}

The hash of the packaged Helm chart. Only has an effect if `package` is not set.
The Helm chart is fetched during build time and placed as a `.tgz` archive on the
filesystem.

*Type:* string

*Default:* `""`

*Example:* `"sha256-ej+vpPNdiOoXsaj1jyRpWLisJgWo8EqX+Z5VbpSjsPA="`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.autoDeployCharts.<name>.name` {#opt-services.k3s.autoDeployCharts._name_.name}

The name of the Helm chart. Only has an effect if `package` is not set.
The Helm chart is fetched during build time and placed as a `.tgz` archive on the
filesystem.

*Type:* non-empty string

*Example:* `"ingress-nginx"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.autoDeployCharts.<name>.package` {#opt-services.k3s.autoDeployCharts._name_.package}

The packaged Helm chart. Overwrites the options `repo`, `name`, `version`
and `hash` in case of conflicts.

*Type:* absolute path or package

*Example:* `../my-helm-chart.tgz`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.autoDeployCharts.<name>.repo` {#opt-services.k3s.autoDeployCharts._name_.repo}

The repo of the Helm chart. Only has an effect if `package` is not set.
The Helm chart is fetched during build time and placed as a `.tgz` archive on the
filesystem.

*Type:* non-empty string

*Example:* `"https://kubernetes.github.io/ingress-nginx"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.autoDeployCharts.<name>.targetNamespace` {#opt-services.k3s.autoDeployCharts._name_.targetNamespace}

The namespace in which the Helm chart gets installed.

*Type:* non-empty string

*Default:* `"default"`

*Example:* `"kube-system"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.autoDeployCharts.<name>.values` {#opt-services.k3s.autoDeployCharts._name_.values}

Override default chart values via Nix expressions. This is equivalent to setting
values in a `values.yaml` file.

**WARNING**: The values (including secrets!) specified here are exposed unencrypted
in the world-readable nix store.

*Type:* absolute path or (attribute set)

*Default:* `{ }`

*Example:*

``` nix
{
  hostName = "my-host";
  replicaCount = 3;
  server = {
    name = "nginx";
    port = 80;
  };
}
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.autoDeployCharts.<name>.version` {#opt-services.k3s.autoDeployCharts._name_.version}

The version of the Helm chart. Only has an effect if `package` is not set.
The Helm chart is fetched during build time and placed as a `.tgz` archive on the
filesystem.

*Type:* non-empty string

*Example:* `"4.7.0"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.charts` {#opt-services.k3s.charts}

Packaged Helm charts that are linked to `/var/lib/rancher/k3s/server/static/charts` before k3s starts.
The attribute name will be used as the link target (relative to `/var/lib/rancher/k3s/server/static/charts`).
The specified charts will only be placed on the file system and made available via the Kubernetes APIServer from within the cluster. See the [services (K)](#opt-services.k3s.autoDeployCharts) option and the
[k3s Helm controller docs](https://docs.k3s.io/helm#using-the-helm-controller)
to deploy Helm charts. This option only makes sense on server nodes (`role = server`).

*Type:* attribute set of (absolute path or package)

*Default:* `{ }`

*Example:*

``` nix
nginx = ../charts/my-nginx-chart.tgz;
redis = ../charts/my-redis-chart.tgz;
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.clusterInit` {#opt-services.k3s.clusterInit}

Initialize HA cluster using an embedded etcd datastore.

If this option is `false` and `role` is `server`

On a server that was using the default embedded sqlite backend,
enabling this option will migrate to an embedded etcd DB.

If an HA cluster using the embedded etcd datastore was already initialized,
this option has no effect.

This option only makes sense in a server that is not connecting to another server.

If you are configuring an HA cluster with an embedded etcd,
the 1st server must have `clusterInit = true`
and other servers must connect to it using `serverAddr`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.configPath` {#opt-services.k3s.configPath}

File path containing the k3s YAML config. This is useful when the config is generated (for example on boot).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.containerdConfigTemplate` {#opt-services.k3s.containerdConfigTemplate}

Config template for containerd, to be placed at
`/var/lib/rancher/k3s/agent/etc/containerd/config.toml.tmpl`.
k3s renders this template as containerd's legacy version 2 configuration and ignores
it when [services (K)](#opt-services.k3s.containerdConfigTemplateV3) is set.
See the docs on [configuring containerd](https://docs.k3s.io/advanced#configuring-containerd).

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
# Base config
{{ template "base" . }}

# Add a custom runtime
[plugins."io.containerd.grpc.v1.cri".containerd.runtimes."custom"]
  runtime_type = "io.containerd.runc.v2"
[plugins."io.containerd.grpc.v1.cri".containerd.runtimes."custom".options]
  BinaryName = "/path/to/custom-container-runtime"
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.containerdConfigTemplateV3` {#opt-services.k3s.containerdConfigTemplateV3}

Config template for containerd in its version 3 configuration format, to be placed at
`/var/lib/rancher/k3s/agent/etc/containerd/config-v3.toml.tmpl`.
k3s uses this template instead of [services (K)](#opt-services.k3s.containerdConfigTemplate)
when both are set.
See the docs on [configuring containerd](https://docs.k3s.io/advanced#configuring-containerd).

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
# Base config
{{ template "base" . }}

# Add a custom runtime
[plugins.'io.containerd.cri.v1.runtime'.containerd.runtimes.custom]
  runtime_type = "io.containerd.runc.v2"
[plugins.'io.containerd.cri.v1.runtime'.containerd.runtimes.custom.options]
  BinaryName = "/path/to/custom-container-runtime"
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.disable` {#opt-services.k3s.disable}

Disable default components, see the [K3s documentation](https://docs.k3s.io/installation/packaged-components#using-the---disable-flag).

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.disableAgent` {#opt-services.k3s.disableAgent}

Only run the server. This option only makes sense for a server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.enable` {#opt-services.k3s.enable}

Whether to enable k3s.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.environmentFile` {#opt-services.k3s.environmentFile}

File path containing environment variables for configuring the k3s service in the format of an EnvironmentFile. See `systemd.exec(5)`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.extraFlags` {#opt-services.k3s.extraFlags}

Extra flags to pass to the k3s command.

*Type:* string or list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--etcd-expose-metrics"
  "--cluster-cidr 10.24.0.0/16"
]
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.extraKubeProxyConfig` {#opt-services.k3s.extraKubeProxyConfig}

Extra configuration to add to the kube-proxy's configuration file. The subset of the kube-proxy's
configuration that can be configured via a file is defined by the
[KubeProxyConfiguration](https://kubernetes.io/docs/reference/config-api/kube-proxy-config.v1alpha1/)
struct. Note that the kubeconfig param will be overriden by `clientConnection.kubeconfig`, so you must
set the `clientConnection.kubeconfig` option if you want to use `extraKubeProxyConfig`.

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  clientConnection = {
    kubeconfig = "/var/lib/rancher/k3s/agent/kubeproxy.kubeconfig";
  };
  mode = "nftables";
}
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.extraKubeletConfig` {#opt-services.k3s.extraKubeletConfig}

Extra configuration to add to the kubelet's configuration file. The subset of the kubelet's
configuration that can be configured via a file is defined by the
[KubeletConfiguration](https://kubernetes.io/docs/reference/config-api/kubelet-config.v1beta1/)
struct. See the
[documentation](https://kubernetes.io/docs/tasks/administer-cluster/kubelet-config-file/)
for further information.

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  containerLogMaxSize = "5Mi";
  memoryThrottlingFactor = 0.69;
  podsPerCore = 3;
}
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.gracefulNodeShutdown.enable` {#opt-services.k3s.gracefulNodeShutdown.enable}

Whether to enable graceful node shutdowns where the kubelet attempts to detect
node system shutdown and terminates pods running on the node. See the
[documentation](https://kubernetes.io/docs/concepts/cluster-administration/node-shutdown/#graceful-node-shutdown)
for further information.
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.gracefulNodeShutdown.shutdownGracePeriod` {#opt-services.k3s.gracefulNodeShutdown.shutdownGracePeriod}

Specifies the total duration that the node should delay the shutdown by. This is the total
grace period for pod termination for both regular and critical pods.

*Type:* non-empty string

*Default:* `"30s"`

*Example:* `"1m30s"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.gracefulNodeShutdown.shutdownGracePeriodCriticalPods` {#opt-services.k3s.gracefulNodeShutdown.shutdownGracePeriodCriticalPods}

Specifies the duration used to terminate critical pods during a node shutdown. This should be
less than `shutdownGracePeriod`.

*Type:* non-empty string

*Default:* `"10s"`

*Example:* `"15s"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.images` {#opt-services.k3s.images}

List of derivations that provide container images.
All images are linked into `/var/lib/rancher/k3s/agent/images/nixos/` before k3s starts and are consequently imported
by the k3s agent. Consider importing the k3s airgap images archive of the k3s package in
use, if you want to pre-provision this node with all k3s container images. This option
only makes sense on nodes with an enabled agent.

*Type:* list of package

*Default:* `[ ]`

*Example:*

``` nix
[
  (pkgs.dockerTools.pullImage {
    imageName = "docker.io/bitnami/keycloak";
    imageDigest = "sha256:714dfadc66a8e3adea6609bda350345bd3711657b7ef3cf2e8015b526bac2d6b";
    hash = "sha256-IM2BLZ0EdKIZcRWOtuFY9TogZJXCpKtPZnMnPsGlq0Y=";
    finalImageTag = "21.1.2-debian-11-r0";
  })

  config.services.k3s.package.airgap-images
]
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.manifests` {#opt-services.k3s.manifests}

Auto-deploying manifests that are linked to `/var/lib/rancher/k3s/server/manifests` before k3s starts.
Note that deleting manifest files will not remove or otherwise modify the resources
it created. Please use the the `--disable` flag or `.skip` files to delete/disable AddOns,
as mentioned in the [docs](https://docs.k3s.io/installation/packaged-components#disabling-manifests).
This option only makes sense on server nodes (`role = server`).
Read the [auto-deploying manifests docs](https://docs.k3s.io/installation/packaged-components#auto-deploying-manifests-addons)
for further information.

**WARNING**: If you have multiple server nodes, and set this option on more than one server,
it is your responsibility to ensure that files stay in sync across those nodes. AddOn content is
not synced between nodes, and k3s cannot guarantee correct behavior if different servers attempt
to deploy conflicting manifests.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  deployment.source = ../manifests/deployment.yaml;
  my-service = {
    enable = false;
    target = "app-service.yaml";
    content = {
      apiVersion = "v1";
      kind = "Service";
      metadata = {
        name = "app-service";
      };
      spec = {
        selector = {
          "app.kubernetes.io/name" = "MyApp";
        };
        ports = [
          {
            name = "name-of-service-port";
            protocol = "TCP";
            port = 80;
            targetPort = "http-web-svc";
          }
        ];
      };
    };
  };

  nginx.content = [
    {
      apiVersion = "v1";
      kind = "Pod";
      metadata = {
        name = "nginx";
        labels = {
          "app.kubernetes.io/name" = "MyApp";
        };
      };
      spec = {
        containers = [
          {
            name = "nginx";
            image = "nginx:1.14.2";
            ports = [
              {
                containerPort = 80;
                name = "http-web-svc";
              }
            ];
          }
        ];
      };
    }
    {
      apiVersion = "v1";
      kind = "Service";
      metadata = {
        name = "nginx-service";
      };
      spec = {
        selector = {
          "app.kubernetes.io/name" = "MyApp";
        };
        ports = [
          {
            name = "name-of-service-port";
            protocol = "TCP";
            port = 80;
            targetPort = "http-web-svc";
          }
        ];
      };
    }
  ];
};
```

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.manifests.<name>.content` {#opt-services.k3s.manifests._name_.content}

Content of the manifest file. A single attribute set will
generate a single document YAML file. A list of attribute sets
will generate multiple documents separated by `---` in a single
YAML file.

*Type:* null or (attribute set) or list of (attribute set)

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.manifests.<name>.enable` {#opt-services.k3s.manifests._name_.enable}

Whether this manifest file should be generated.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.manifests.<name>.source` {#opt-services.k3s.manifests._name_.source}

Path of the source `.yaml` file.

*Type:* absolute path

*Example:* `./manifests/app.yaml`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.manifests.<name>.target` {#opt-services.k3s.manifests._name_.target}

Name of the symlink (relative to `/var/lib/rancher/k3s/server/manifests`).
Defaults to the attribute name.

*Type:* non-empty string

*Example:* `"manifest.yaml"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.nodeExternalIP` {#opt-services.k3s.nodeExternalIP}

IPv4/IPv6 external addresses to advertise for node.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.nodeIP` {#opt-services.k3s.nodeIP}

IPv4/IPv6 addresses to advertise for node.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.nodeLabel` {#opt-services.k3s.nodeLabel}

Registering and starting kubelet with set of labels.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.nodeName` {#opt-services.k3s.nodeName}

Node name.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.nodeTaint` {#opt-services.k3s.nodeTaint}

Registering kubelet with set of taints.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.package` {#opt-services.k3s.package}

The k3s package to use.

*Type:* package

*Default:* `pkgs.k3s`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.role` {#opt-services.k3s.role}

Whether k3s should run as a server or agent.

If it's a server:

- By default it also runs workloads as an agent.
- Starts by default as a standalone server using an embedded sqlite datastore.
- Configure `clusterInit = true` to switch over to embedded etcd datastore and enable HA mode.
- Configure `serverAddr` to join an already-initialized HA cluster.

If it's an agent:

- `serverAddr` is required.

*Type:* one of "server", "agent"

*Default:* `"server"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.selinux` {#opt-services.k3s.selinux}

Enable SELinux in containerd.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.serverAddr` {#opt-services.k3s.serverAddr}

The k3s server to connect to.

Servers and agents need to communicate each other. Read
[the networking docs](https://rancher.com/docs/k3s/latest/en/installation/installation-requirements/#networking)
to know how to configure the firewall.

*Type:* string

*Default:* `""`

*Example:* `"https://10.0.0.10:6443"`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.token` {#opt-services.k3s.token}

The k3s token to use when connecting to a server.

**WARNING**: This option will expose your token unencrypted in the world-readable nix store.
If this is undesired use the tokenFile option instead.

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.k3s.tokenFile` {#opt-services.k3s.tokenFile}

File path containing the k3s token to use when connecting to a server.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/rancher/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/rancher/default.nix)

## `services.kanata-config-aekeynox.base` {#opt-services.kanata-config-aekeynox.base}

The `Base` layer can be either:

- the hardware layout (`base.kbd`)
  =\> your keyboard follows the host layout (= default behavior),
  which is defined in your system settings.

- an emulated layout (`base/*.kbd`)
  =\> your keyboard follows this emulated layout instead of the host layout.
  /!\\ This works perfectly with ASCII layout such as QWERTY ANSI,
  but has limitations with non-ASCII layouts.
  /!\\ Make sure that the expected host layout (e.g. QWERTY, AZERTY)
  has been selected in `hostLayout`.

- `base`: no emulation

- `base/colemak`: QWERTY to Colemak

- `base/colemak_dh`: QWERTY to Colemak-DH

- `base/dvorak`: QWERTY to Dvorak

- `base/ergol`: AZERTY to Ergo-L

- `base/lafayette`: AZERTY to QWERTY-Lafayette

*Type:* one of "base", "base/colemak", "base/colemak\_dh", "base/dvorak", "base/ergol", "base/lafayette"

*Default:* `"base"`

*Declared by:* [`nixos/modules/services/hardware/kanata-config-aekeynox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata-config-aekeynox.nix)

## `services.kanata-config-aekeynox.devices` {#opt-services.kanata-config-aekeynox.devices}

Paths to keyboard devices.

An empty list, the default value, lets kanata detect which
input devices are keyboards and intercept them all.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/dev/input/by-id/usb-0000_0000-event-kbd"
]
```

*Declared by:* [`nixos/modules/services/hardware/kanata-config-aekeynox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata-config-aekeynox.nix)

## `services.kanata-config-aekeynox.enable` {#opt-services.kanata-config-aekeynox.enable}

Whether to enable the Arsenik keymap, implemented with kanata.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/kanata-config-aekeynox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata-config-aekeynox.nix)

## `services.kanata-config-aekeynox.fingerAssignment` {#opt-services.kanata-config-aekeynox.fingerAssignment}

Angle-mods can be enabled here, i.e. ZXCVB can be shifted to the left.
More details here: [https://colemakmods.github.io/ergonomic-mods/angle.html](https://colemakmods.github.io/ergonomic-mods/angle.html)

- `layout`: standard finger assignment
- `layout_anglemod`: ZXCVB are shifted to the left
- `layout_wide_anglemod`: angle-mod + right hand shifted by one key

*Type:* one of "layout", "layout\_anglemod", "layout\_wide\_anglemod"

*Default:* `"layout"`

*Declared by:* [`nixos/modules/services/hardware/kanata-config-aekeynox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata-config-aekeynox.nix)

## `services.kanata-config-aekeynox.flavor` {#opt-services.kanata-config-aekeynox.flavor}

Dual keys can be enabled here:

- `EZ`: no dual keys
  = standard keyboard behavior

- `TT`: thumb-taps

  - the right thumb key brings the `Symbols` layer
  - a long press on the space bar brings the `Navigation` layer
  - a quick tap on the left/right thumb key makes Backspace/Enter

- `HRM`: thumb-taps + home row mods

  - the left thumb key becomes Shift
  - SDF/JKL become Meta/Ctrl/Alt when held

- `flavor_ez`: standard keyboard behavior

- `flavor_tt`: thumb taps

- `flavor_hrm`: thumb taps + home row mods

Note: the other layers are only reachable with `flavor_tt` or `flavor_hrm`.

*Type:* one of "flavor\_ez", "flavor\_tt", "flavor\_hrm"

*Default:* `"flavor_ez"`

*Declared by:* [`nixos/modules/services/hardware/kanata-config-aekeynox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata-config-aekeynox.nix)

## `services.kanata-config-aekeynox.geometry` {#opt-services.kanata-config-aekeynox.geometry}

Pick the configuration matching your keyboard:
ISO (a.k.a. 102/105 keys) or ANSI (a.k.a. 101/104 keys).
If the key next to the left Shift is `Z`, your keyboard is ANSI.

*Type:* one of "iso", "ansi"

*Default:* `"iso"`

*Declared by:* [`nixos/modules/services/hardware/kanata-config-aekeynox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata-config-aekeynox.nix)

## `services.kanata-config-aekeynox.holdingTerm` {#opt-services.kanata-config-aekeynox.holdingTerm}

Maximum press time (ms) for "hold-preferred" dual keys: Enter and Backspace.
Above this value, these keys just behave as modifiers (Shift and Symbols).
Keep this value low if you trigger Enter by mistake.

*Type:* positive integer, meaning \>0

*Default:* `150`

*Declared by:* [`nixos/modules/services/hardware/kanata-config-aekeynox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata-config-aekeynox.nix)

## `services.kanata-config-aekeynox.hostLayout` {#opt-services.kanata-config-aekeynox.hostLayout}

The whole `Symbols` layer and some `Navigation` shortcuts depend on the host
keyboard layout, i.e. the layout defined in your system settings.
Pick your aliases accordingly.

*Type:* one of "qwerty", "qwertz", "azerty", "lafayette", "ergol", "bepo"

*Default:* `"qwerty"`

*Declared by:* [`nixos/modules/services/hardware/kanata-config-aekeynox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata-config-aekeynox.nix)

## `services.kanata-config-aekeynox.navigation` {#opt-services.kanata-config-aekeynox.navigation}

Triggered by a long press on the spacebar.

- `navigation`: arrows on ESDF, NumPad under the right hand
- `navigation_vim`: arrows on HJKL, advanced keys under the left hand

*Type:* one of "navigation", "navigation\_vim"

*Default:* `"navigation"`

*Declared by:* [`nixos/modules/services/hardware/kanata-config-aekeynox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata-config-aekeynox.nix)

## `services.kanata-config-aekeynox.numbers` {#opt-services.kanata-config-aekeynox.numbers}

Triggered by Sym+Shift.

- `numpad`: right-hand numpad, like on the default Navigation layer
- `numrow`: numbers on the home row, Shift+numbers on the top row

*Type:* one of "numpad", "numrow"

*Default:* `"numpad"`

*Declared by:* [`nixos/modules/services/hardware/kanata-config-aekeynox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata-config-aekeynox.nix)

## `services.kanata-config-aekeynox.package` {#opt-services.kanata-config-aekeynox.package}

The kanata-config-aekeynox package to use.

*Type:* package

*Default:* `pkgs.kanata-config-aekeynox`

*Declared by:* [`nixos/modules/services/hardware/kanata-config-aekeynox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata-config-aekeynox.nix)

## `services.kanata-config-aekeynox.quickTap` {#opt-services.kanata-config-aekeynox.quickTap}

Maximum time (ms) for a double key press to enable repetitions.

*Type:* positive integer, meaning \>0

*Default:* `200`

*Declared by:* [`nixos/modules/services/hardware/kanata-config-aekeynox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata-config-aekeynox.nix)

## `services.kanata-config-aekeynox.symbols` {#opt-services.kanata-config-aekeynox.symbols}

Triggered by Sym (right thumb key).

- by default, brings a Symbols layer

- with the `altgr` variant, the right thumb key becomes AltGr/Option

- `symbols`: programming symbols

- `symbols_altgr`: AltGr/Option layer

*Type:* one of "symbols", "symbols\_altgr"

*Default:* `"symbols"`

*Declared by:* [`nixos/modules/services/hardware/kanata-config-aekeynox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata-config-aekeynox.nix)

## `services.kanata-config-aekeynox.tappingTerm` {#opt-services.kanata-config-aekeynox.tappingTerm}

Minimum press time (ms) for "tap-preferred" dual keys: Nav and homerow mods.
Below this value, these keys just produce Space or a homerow letter.
Keep this value high if you struggle with home row mods.

*Type:* positive integer, meaning \>0

*Default:* `300`

*Declared by:* [`nixos/modules/services/hardware/kanata-config-aekeynox.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata-config-aekeynox.nix)

## `services.kanata.enable` {#opt-services.kanata.enable}

Whether to enable kanata, a tool to improve keyboard comfort and usability with advanced customization.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/kanata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata.nix)

## `services.kanata.keyboards` {#opt-services.kanata.keyboards}

Keyboard configurations.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/kanata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata.nix)

## `services.kanata.keyboards.<name>.config` {#opt-services.kanata.keyboards._name_.config}

Configuration other than `defcfg`.

See [the upstream documentation](https://github.com/jtroo/kanata/blob/main/docs/config.adoc) and [example config files](https://github.com/jtroo/kanata/tree/main/cfg_samples) for more information.

*Type:* strings concatenated with "\\n"

*Example:*

``` nix
''
  (defsrc
    caps)
  
  (deflayermap (default-layer)
    ;; tap caps lock as caps lock, hold caps lock as left control
    caps (tap-hold 100 100 caps lctl))
''
```

*Declared by:* [`nixos/modules/services/hardware/kanata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata.nix)

## `services.kanata.keyboards.<name>.configFile` {#opt-services.kanata.keyboards._name_.configFile}

The config file.

By default, it is generated by values from other kanata
module options.

You can also set it to your own full config file which
overrides all other kanata module options.  See [the upstream documentation](https://github.com/jtroo/kanata/blob/main/docs/config.adoc) and [example config files](https://github.com/jtroo/kanata/tree/main/cfg_samples) for more information.

*Type:* absolute path

*Default:* `"A config file generated by values from other kanata module options."`

*Declared by:* [`nixos/modules/services/hardware/kanata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata.nix)

## `services.kanata.keyboards.<name>.devices` {#opt-services.kanata.keyboards._name_.devices}

Paths to keyboard devices.

An empty list, the default value, lets kanata detect which
input devices are keyboards and intercept them all.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/dev/input/by-id/usb-0000_0000-event-kbd"
]
```

*Declared by:* [`nixos/modules/services/hardware/kanata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata.nix)

## `services.kanata.keyboards.<name>.extraArgs` {#opt-services.kanata.keyboards._name_.extraArgs}

Extra command line arguments passed to kanata.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/kanata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata.nix)

## `services.kanata.keyboards.<name>.extraDefCfg` {#opt-services.kanata.keyboards._name_.extraDefCfg}

Configuration of `defcfg` other than `linux-dev` (generated
from the devices option) and
`linux-continue-if-no-devs-found` (hardcoded to be yes).

See [the upstream documentation](https://github.com/jtroo/kanata/blob/main/docs/config.adoc) and [example config files](https://github.com/jtroo/kanata/tree/main/cfg_samples) for more information.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:* `"danger-enable-cmd yes"`

*Declared by:* [`nixos/modules/services/hardware/kanata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata.nix)

## `services.kanata.keyboards.<name>.port` {#opt-services.kanata.keyboards._name_.port}

Port to run the TCP server on. `null` will not run the server.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Example:* `6666`

*Declared by:* [`nixos/modules/services/hardware/kanata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata.nix)

## `services.kanata.package` {#opt-services.kanata.package}

The kanata package to use. ::: {.note}
If `danger-enable-cmd` is enabled in any of the keyboards, the
`kanata-with-cmd` package should be used.
:::

*Type:* package

*Default:* `pkgs.kanata`

*Example:* `pkgs.kanata-with-cmd`

*Declared by:* [`nixos/modules/services/hardware/kanata.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kanata.nix)

## `services.kanboard.dataDir` {#opt-services.kanboard.dataDir}

Default data folder for Kanboard.

*Type:* string

*Default:* `"/var/lib/kanboard"`

*Example:* `"/mnt/kanboard"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.domain` {#opt-services.kanboard.domain}

FQDN for the Kanboard instance.

*Type:* string

*Default:* `"kanboard"`

*Example:* `"kanboard.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.enable` {#opt-services.kanboard.enable}

Whether to enable Kanboard.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.group` {#opt-services.kanboard.group}

Group under which Kanboard runs.

*Type:* string

*Default:* `"kanboard"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx` {#opt-services.kanboard.nginx}

With this option, you can customize an NGINX virtual host which already
has sensible defaults for Kanboard. Set to `{ }` if you do not need any
customization for the virtual host. If enabled, then by default, the
`serverName` is `${domain}`. If this is set to null (the
default), no NGINX virtual host will be configured.

*Type:* null or (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  enableACME = true;
  forceSSL = true;
}
```

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.acmeFallbackHost` {#opt-services.kanboard.nginx.acmeFallbackHost}

Host which to proxy requests to if ACME challenge is not found. Useful
if you want multiple hosts to be able to verify the same domain name.

With this option, you could request certificates for the present domain
with an ACME client that is running on another host, which you would
specify here.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.acmeRoot` {#opt-services.kanboard.nginx.acmeRoot}

Directory for the ACME challenge, which is **public**. Don't put certs or keys in here.
Set to null to inherit from config.security.acme.

*Type:* null or string

*Default:* `"/var/lib/acme/acme-challenge"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.addSSL` {#opt-services.kanboard.nginx.addSSL}

Whether to enable HTTPS in addition to plain HTTP. This will set defaults for
`listen` to listen on all interfaces on the respective default
ports (80, 443).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.basicAuth` {#opt-services.kanboard.nginx.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.basicAuthFile` {#opt-services.kanboard.nginx.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.default` {#opt-services.kanboard.nginx.default}

Makes this vhost the default.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.enableACME` {#opt-services.kanboard.nginx.enableACME}

Whether to ask Let's Encrypt to sign a certificate for this vhost.
Alternately, you can use an existing certificate through `useACMEHost`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.extraConfig` {#opt-services.kanboard.nginx.extraConfig}

These lines go to the end of the vhost verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.forceSSL` {#opt-services.kanboard.nginx.forceSSL}

Whether to add a separate nginx server block that redirects (defaults
to 301, configurable with `redirectCode`) all plain HTTP traffic to
HTTPS. This will set defaults for `listen` to listen on all interfaces
on the respective default ports (80, 443), where the non-SSL listens
are used for the redirect vhosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.globalRedirect` {#opt-services.kanboard.nginx.globalRedirect}

If set, all requests for this host are redirected (defaults to 301,
configurable with `redirectCode`) to the given hostname.

*Type:* null or string

*Default:* `null`

*Example:* `"newserver.example.org"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.http2` {#opt-services.kanboard.nginx.http2}

Whether to enable the HTTP/2 protocol.
Note that (as of writing) due to nginx's implementation, to disable
HTTP/2 you have to disable it on all vhosts that use a given
IP address / port.
If there is one server block configured to enable http2, then it is
enabled for all server blocks on this IP.
See [https://stackoverflow.com/a/39466948/263061](https://stackoverflow.com/a/39466948/263061).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.http3` {#opt-services.kanboard.nginx.http3}

Whether to enable the HTTP/3 protocol.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that HTTP/3 support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)
HTTP/3 availability must be manually advertised, preferably in each location block.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.http3_hq` {#opt-services.kanboard.nginx.http3_hq}

Whether to enable the HTTP/0.9 protocol negotiation used in QUIC interoperability tests.
This requires activating the QUIC transport protocol
`services.nginx.virtualHosts.<name>.quic = true;`.
Note that special application protocol support is experimental and *not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.kTLS` {#opt-services.kanboard.nginx.kTLS}

Whether to enable kTLS support.
Implementing TLS in the kernel (kTLS) improves performance by significantly
reducing the need for copying operations between user space and the kernel.
Required Nginx version 1.21.4 or later.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.listen` {#opt-services.kanboard.nginx.listen}

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

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.listen.*.addr` {#opt-services.kanboard.nginx.listen._.addr}

Listen address.

*Type:* string

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.listen.*.extraParameters` {#opt-services.kanboard.nginx.listen._.extraParameters}

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

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.listen.*.port` {#opt-services.kanboard.nginx.listen._.port}

Port number to listen on.
If unset and the listen address is not a socket then nginx defaults to 80.

*Type:* null or 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.listen.*.proxyProtocol` {#opt-services.kanboard.nginx.listen._.proxyProtocol}

Enable PROXY protocol.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.listen.*.ssl` {#opt-services.kanboard.nginx.listen._.ssl}

Enable SSL.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.listenAddresses` {#opt-services.kanboard.nginx.listenAddresses}

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

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations` {#opt-services.kanboard.nginx.locations}

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

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.alias` {#opt-services.kanboard.nginx.locations._name_.alias}

Alias directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/alias/directory"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.basicAuth` {#opt-services.kanboard.nginx.locations._name_.basicAuth}

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

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.basicAuthFile` {#opt-services.kanboard.nginx.locations._name_.basicAuthFile}

Basic Auth password file for a vhost.
Can be created by running `nix-shell --packages apacheHttpd --run 'htpasswd -B -c FILENAME USERNAME'`.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.extraConfig` {#opt-services.kanboard.nginx.locations._name_.extraConfig}

These lines go to the end of the location verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.fastcgiParams` {#opt-services.kanboard.nginx.locations._name_.fastcgiParams}

FastCGI parameters to override.  Unlike in the Nginx
configuration file, overriding only some default parameters
won't unset the default values for other parameters.

*Type:* attribute set of (string or absolute path)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.index` {#opt-services.kanboard.nginx.locations._name_.index}

Adds index directive.

*Type:* null or string

*Default:* `null`

*Example:* `"index.php index.html"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.priority` {#opt-services.kanboard.nginx.locations._name_.priority}

Order of this location block in relation to the others in the vhost.
The semantics are the same as with `lib.mkOrder`. Smaller values have
a greater priority.

*Type:* signed integer

*Default:* `1000`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.proxyPass` {#opt-services.kanboard.nginx.locations._name_.proxyPass}

Adds proxy\_pass directive and sets recommended proxy headers if
recommendedProxySettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"http://www.example.org/"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.proxyWebsockets` {#opt-services.kanboard.nginx.locations._name_.proxyWebsockets}

Whether to support proxying websocket connections with HTTP/1.1.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.recommendedProxySettings` {#opt-services.kanboard.nginx.locations._name_.recommendedProxySettings}

Enable recommended proxy settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedProxySettings`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.recommendedUwsgiSettings` {#opt-services.kanboard.nginx.locations._name_.recommendedUwsgiSettings}

Enable recommended uwsgi settings.

*Type:* boolean

*Default:* `config.services.nginx.recommendedUwsgiSettings`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.return` {#opt-services.kanboard.nginx.locations._name_.return}

Adds a return directive, for e.g. redirections.

*Type:* null or string or signed integer

*Default:* `null`

*Example:* `"301 http://example.com$request_uri"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.root` {#opt-services.kanboard.nginx.locations._name_.root}

Root directory for requests.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/your/root/directory"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.tryFiles` {#opt-services.kanboard.nginx.locations._name_.tryFiles}

Adds try\_files directive.

*Type:* null or string

*Default:* `null`

*Example:* `"$uri =404"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.useGrpcErrorPages` {#opt-services.kanboard.nginx.locations._name_.useGrpcErrorPages}

Whether to configure error codes to be emitted as gRPC-compatible errors.

Should be set when proxying gRPC, and returning responses from nginx (like when adding authentication).

This defines a few `@grpc-*` locations inside the containing vhost.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.locations.<name>.uwsgiPass` {#opt-services.kanboard.nginx.locations._name_.uwsgiPass}

Adds uwsgi\_pass directive and sets recommended proxy headers if
recommendedUwsgiSettings is enabled.

*Type:* null or string

*Default:* `null`

*Example:* `"unix:/run/example/example.sock"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.onlySSL` {#opt-services.kanboard.nginx.onlySSL}

Whether to enable HTTPS and reject plain HTTP connections. This will set
defaults for `listen` to listen on all interfaces on port 443.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.quic` {#opt-services.kanboard.nginx.quic}

Whether to enable the QUIC transport protocol.
Note that QUIC support is experimental and
*not* yet recommended for production.
Read more at [https://quic.nginx.org/](https://quic.nginx.org/)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.redirectCode` {#opt-services.kanboard.nginx.redirectCode}

HTTP status used by `globalRedirect` and `forceSSL`. Possible usecases
include temporary (302, 307) redirects, keeping the request method and
body (307, 308), or explicitly resetting the method to GET (303).
See [https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections).

*Type:* integer between 300 and 399 (both inclusive)

*Default:* `301`

*Example:* `308`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.rejectSSL` {#opt-services.kanboard.nginx.rejectSSL}

Whether to listen for and reject all HTTPS connections to this vhost. Useful in
[default](../../options/services-n/index.md#opt-services.nginx.virtualHosts._name_.default)
server blocks to avoid serving the certificate for another vhost. Uses the
`ssl_reject_handshake` directive available in nginx versions
1.19.4 and above.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.reuseport` {#opt-services.kanboard.nginx.reuseport}

Create an individual listening socket .
It is required to specify only once on one of the hosts.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.root` {#opt-services.kanboard.nginx.root}

The path of the web root directory.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/webserver/docs"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.serverAliases` {#opt-services.kanboard.nginx.serverAliases}

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

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.serverName` {#opt-services.kanboard.nginx.serverName}

Name of this virtual host. Defaults to attribute name in virtualHosts.

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.sslCertificate` {#opt-services.kanboard.nginx.sslCertificate}

Path to server SSL certificate.

*Type:* absolute path

*Example:* `"/var/host.cert"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.sslCertificateKey` {#opt-services.kanboard.nginx.sslCertificateKey}

Path to server SSL certificate key.

*Type:* absolute path

*Example:* `"/var/host.key"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.sslTrustedCertificate` {#opt-services.kanboard.nginx.sslTrustedCertificate}

Path to root SSL certificate for stapling and client certificates.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.nginx.useACMEHost` {#opt-services.kanboard.nginx.useACMEHost}

A host of an existing Let's Encrypt certificate to use.
This is useful if you have many subdomains and want to avoid hitting the
[rate limit](https://letsencrypt.org/docs/rate-limits).
Alternately, you can generate a certificate through `enableACME`.
*Note that this option does not create any certificates, nor it does add subdomains to existing ones – you will need to create them manually using [security](../../options/security/index.md#opt-security.acme.certs).*

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.package` {#opt-services.kanboard.package}

The kanboard package to use.

*Type:* package

*Default:* `pkgs.kanboard`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.phpfpm.settings` {#opt-services.kanboard.phpfpm.settings}

Options for kanboard's PHPFPM pool.

*Type:* attribute set of (signed integer or string or boolean)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.settings` {#opt-services.kanboard.settings}

Customize the default settings, refer to [https://github.com/kanboard/kanboard/blob/main/config.default.php](https://github.com/kanboard/kanboard/blob/main/config.default.php)
for details on supported values.

*Type:* attribute set of (string or signed integer or boolean)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanboard.user` {#opt-services.kanboard.user}

User under which Kanboard runs.

*Type:* string

*Default:* `"kanboard"`

*Declared by:* [`nixos/modules/services/web-apps/kanboard.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kanboard.nix)

## `services.kanidm.client.enable` {#opt-services.kanidm.client.enable}

Whether to enable the Kanidm client.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.client.settings` {#opt-services.kanidm.client.settings}

Configure Kanidm clients, needed for the PAM daemon. See
[the documentation](https://kanidm.github.io/kanidm/stable/client_tools.html#kanidm-configuration)
and [example configuration](https://github.com/kanidm/kanidm/blob/master/examples/config)
for possible values.

*Type:* open submodule of (TOML value)

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.client.settings.uri` {#opt-services.kanidm.client.settings.uri}

Address of the Kanidm server.

*Type:* string

*Example:* `"http://127.0.0.1:8080"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.package` {#opt-services.kanidm.package}

The kanidm package to use. Must be set to an explicit version.

*Type:* package

*Default:* `pkgs.kanidm`

*Example:* `kanidm_1_8`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.acceptInvalidCerts` {#opt-services.kanidm.provision.acceptInvalidCerts}

Whether to allow invalid certificates when provisioning the target instance.
By default this is only allowed when the instanceUrl is localhost. This is
dangerous when used with an external URL.

*Type:* boolean

*Default:* `"hasPrefix \"https://localhost:\" cfg.provision.instanceUrl"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.adminPasswordFile` {#opt-services.kanidm.provision.adminPasswordFile}

Path to a file containing the admin password for kanidm. Do NOT use a file from the nix store here!

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/kanidm-admin-password"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.autoRemove` {#opt-services.kanidm.provision.autoRemove}

Determines whether deleting an entity in this provisioning config should automatically
cause them to be removed from kanidm, too. This works because the provisioning tool tracks
all entities it has ever created. If this is set to false, you need to explicitly specify
`present = false` to delete an entity.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.enable` {#opt-services.kanidm.provision.enable}

Whether to enable provisioning of groups, users and oauth2 resource servers.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.extraJsonFile` {#opt-services.kanidm.provision.extraJsonFile}

A JSON file for provisioning persons, groups & systems.
Options set in this file take precedence over values set using the other options.
The files get deeply merged, and deduplicated.
The accepted JSON schema can be found at [https://github.com/oddlama/kanidm-provision#json-schema](https://github.com/oddlama/kanidm-provision#json-schema).

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.groups` {#opt-services.kanidm.provision.groups}

Provisioning of kanidm groups

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.groups.<name>.members` {#opt-services.kanidm.provision.groups._name_.members}

List of kanidm entities (persons, groups, ...) which are part of this group.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.groups.<name>.overwriteMembers` {#opt-services.kanidm.provision.groups._name_.overwriteMembers}

Whether the member list should be overwritten each time (true) or appended
(false). Append mode allows interactive group management in addition to the
declared members. Also, future member removals cannot be reflected
automatically in append mode.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.groups.<name>.present` {#opt-services.kanidm.provision.groups._name_.present}

Whether to ensure that this group is present or absent.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.idmAdminPasswordFile` {#opt-services.kanidm.provision.idmAdminPasswordFile}

Path to a file containing the idm admin password for kanidm. Do NOT use a file from the nix store here!
If this is not given but provisioning is enabled, the idm\_admin password will be reset on each restart.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/kanidm-idm-admin-password"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.instanceUrl` {#opt-services.kanidm.provision.instanceUrl}

The instance url to which the provisioning tool should connect.

*Type:* string

*Default:* `"https://localhost:<port from server.settings.bindaddress>"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.persons` {#opt-services.kanidm.provision.persons}

Provisioning of kanidm persons

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.persons.<name>.displayName` {#opt-services.kanidm.provision.persons._name_.displayName}

Display name

*Type:* string

*Example:* `"My User"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.persons.<name>.groups` {#opt-services.kanidm.provision.persons._name_.groups}

List of groups this person should belong to.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.persons.<name>.legalName` {#opt-services.kanidm.provision.persons._name_.legalName}

Full legal name

*Type:* null or string

*Default:* `null`

*Example:* `"Jane Doe"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.persons.<name>.mailAddresses` {#opt-services.kanidm.provision.persons._name_.mailAddresses}

Mail addresses. First given address is considered the primary address.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "jane.doe@example.com"
]
```

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.persons.<name>.present` {#opt-services.kanidm.provision.persons._name_.present}

Whether to ensure that this person is present or absent.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2` {#opt-services.kanidm.provision.systems.oauth2}

Provisioning of oauth2 resource servers

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.allowInsecureClientDisablePkce` {#opt-services.kanidm.provision.systems.oauth2._name_.allowInsecureClientDisablePkce}

Disable PKCE on this oauth2 resource server to work around insecure clients
that may not support it. You should request the client to enable PKCE!
Only for non-public clients.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.basicSecretFile` {#opt-services.kanidm.provision.systems.oauth2._name_.basicSecretFile}

The basic secret to use for this service. If null, the random secret generated
by kanidm will not be touched. Do NOT use a path from the nix store here!

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/some-oauth2-basic-secret"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.claimMaps` {#opt-services.kanidm.provision.systems.oauth2._name_.claimMaps}

Adds additional claims (and values) based on which kanidm groups an authenticating party belongs to.
See [Claim Maps](https://kanidm.github.io/kanidm/master/integrations/oauth2.html#custom-claim-maps) for more information.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.claimMaps.<name>.joinType` {#opt-services.kanidm.provision.systems.oauth2._name_.claimMaps._name_.joinType}

Determines how multiple values are joined to create the claim value.
See [Claim Maps](https://kanidm.github.io/kanidm/master/integrations/oauth2.html#custom-claim-maps) for more information.

*Type:* one of "array", "csv", "ssv"

*Default:* `"array"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.claimMaps.<name>.valuesByGroup` {#opt-services.kanidm.provision.systems.oauth2._name_.claimMaps._name_.valuesByGroup}

Maps kanidm groups to values for the claim.

*Type:* attribute set of list of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.displayName` {#opt-services.kanidm.provision.systems.oauth2._name_.displayName}

Display name

*Type:* string

*Example:* `"Some Service"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.enableLegacyCrypto` {#opt-services.kanidm.provision.systems.oauth2._name_.enableLegacyCrypto}

Enable legacy crypto on this client. Allows JWT signing algorthms like RS256.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.enableLocalhostRedirects` {#opt-services.kanidm.provision.systems.oauth2._name_.enableLocalhostRedirects}

Allow localhost redirects. Only for public clients.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.imageFile` {#opt-services.kanidm.provision.systems.oauth2._name_.imageFile}

Application image to display in the WebUI.
Kanidm supports "image/jpeg", "image/png", "image/gif", "image/svg+xml", and "image/webp".
The image will be uploaded each time kanidm-provision is run.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.originLanding` {#opt-services.kanidm.provision.systems.oauth2._name_.originLanding}

When redirecting from the Kanidm Apps Listing page, some linked applications may need to land on a specific page to trigger oauth2/oidc interactions.

*Type:* string

*Example:* `"https://someservice.example.com/home"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.originUrl` {#opt-services.kanidm.provision.systems.oauth2._name_.originUrl}

The redirect URL of the service. These need to exactly match the OAuth2 redirect target

*Type:* string matching the pattern .*://?.*$ or non-empty (list of string matching the pattern .*://?.*$)

*Example:* `"https://someservice.example.com/auth/login"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.preferShortUsername` {#opt-services.kanidm.provision.systems.oauth2._name_.preferShortUsername}

Use 'name' instead of 'spn' in the preferred\_username claim

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.present` {#opt-services.kanidm.provision.systems.oauth2._name_.present}

Whether to ensure that this oauth2 resource server is present or absent.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.public` {#opt-services.kanidm.provision.systems.oauth2._name_.public}

Whether this is a public client (enforces PKCE, doesn't use a basic secret)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.removeOrphanedClaimMaps` {#opt-services.kanidm.provision.systems.oauth2._name_.removeOrphanedClaimMaps}

Whether claim maps not specified here but present in kanidm should be removed from kanidm.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.scopeMaps` {#opt-services.kanidm.provision.systems.oauth2._name_.scopeMaps}

Maps kanidm groups to returned oauth scopes.
See [Scope Relations](https://kanidm.github.io/kanidm/stable/integrations/oauth2.html#scope-relationships) for more information.

*Type:* attribute set of list of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.provision.systems.oauth2.<name>.supplementaryScopeMaps` {#opt-services.kanidm.provision.systems.oauth2._name_.supplementaryScopeMaps}

Maps kanidm groups to additionally returned oauth scopes.
See [Scope Relations](https://kanidm.github.io/kanidm/stable/integrations/oauth2.html#scope-relationships) for more information.

*Type:* attribute set of list of string

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.server.enable` {#opt-services.kanidm.server.enable}

Whether to enable the Kanidm server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.server.entryManagement.migrations` {#opt-services.kanidm.server.entryManagement.migrations}

Entry management (migrations) to apply to the Kanidm database.
These are JSON formatted person and group records that are imported to the server on startup.
Keys of this attribute set should follow the pattern `xx-name` (e.g. `00-base`, `99-accounts`),
and values are the JSON representation of the migration.
See [the documentation](https://kanidm.github.io/kanidm/stable/entry_management.html)
for details on the record syntax.

*Type:* attribute set of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  "00-base" = {
    assertions = [
      {
        class = [
          "person"
          "account"
        ];
        displayname = "Tobias";
        id = "0ee875bd-408d-4ff9-85ca-c162f262493d";
        name = "tobias";
        state = "present";
      }
    ];
    id = "a2b58e97-0aaf-4b04-a4e4-7984616fe1df";
  };
}
```

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.server.settings` {#opt-services.kanidm.server.settings}

Settings for Kanidm, see
[the documentation](https://kanidm.github.io/kanidm/stable/server_configuration.html)
and [example configuration](https://github.com/kanidm/kanidm/blob/master/examples/server.toml)
for possible values.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.server.settings.bindaddress` {#opt-services.kanidm.server.settings.bindaddress}

Address/port combination the webserver binds to.

*Type:* string

*Default:* `"127.0.0.1:8443"`

*Example:* `"[::1]:8443"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.server.settings.db_path` {#opt-services.kanidm.server.settings.db_path}

Path to Kanidm database.

*Type:* absolute path

*Default:* `"/var/lib/kanidm/kanidm.db"`

*Read only*

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.server.settings.domain` {#opt-services.kanidm.server.settings.domain}

The `domain` that Kanidm manages. Must be below or equal to the domain
specified in `server.settings.origin`.
This can be left at `null`, only if your instance has the role `ReadOnlyReplica`.
While it is possible to change the domain later on, it requires extra steps!
Please consider the warnings and execute the steps described
[in the documentation](https://kanidm.github.io/kanidm/stable/domain_rename.html).

*Type:* null or string

*Default:* `null`

*Example:* `"example.org"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.server.settings.ldapbindaddress` {#opt-services.kanidm.server.settings.ldapbindaddress}

Address and port the LDAP server is bound to. Setting this to `null` disables the LDAP interface.

*Type:* null or string

*Default:* `null`

*Example:* `"[::1]:636"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.server.settings.log_level` {#opt-services.kanidm.server.settings.log_level}

Log level of the server.

*Type:* one of "info", "debug", "trace"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.server.settings.online_backup.path` {#opt-services.kanidm.server.settings.online_backup.path}

Path to the output directory for backups.

*Type:* absolute path

*Default:* `"/var/lib/kanidm/backups"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.server.settings.online_backup.schedule` {#opt-services.kanidm.server.settings.online_backup.schedule}

The schedule for backups in cron format.

*Type:* string

*Default:* `"00 22 * * *"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.server.settings.online_backup.versions` {#opt-services.kanidm.server.settings.online_backup.versions}

Number of backups to keep.

The default is set to `0`, in order to disable backups by default.

*Type:* unsigned integer, meaning \>=0

*Default:* `0`

*Example:* `7`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.server.settings.origin` {#opt-services.kanidm.server.settings.origin}

The origin of your Kanidm instance. Must have https as protocol.

*Type:* string matching the pattern ^https://.\*

*Example:* `"https://idm.example.org"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.server.settings.role` {#opt-services.kanidm.server.settings.role}

The role of this server. This affects the replication relationship and thereby available features.

*Type:* one of "WriteReplica", "WriteReplicaNoUI", "ReadOnlyReplica"

*Default:* `"WriteReplica"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.server.settings.tls_chain` {#opt-services.kanidm.server.settings.tls_chain}

TLS chain in pem format.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.server.settings.tls_key` {#opt-services.kanidm.server.settings.tls_key}

TLS key in pem format.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.unix.enable` {#opt-services.kanidm.unix.enable}

Whether to enable the Kanidm PAM and NSS integration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.unix.settings` {#opt-services.kanidm.unix.settings}

Configure Kanidm unix daemon.
See [the documentation](https://kanidm.github.io/kanidm/stable/integrations/pam_and_nsswitch.html#the-unix-daemon)
and [example configuration](https://github.com/kanidm/kanidm/blob/master/examples/unixd)
for possible values.

*Type:* open submodule of (TOML value)

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.unix.settings.hsm_pin_path` {#opt-services.kanidm.unix.settings.hsm_pin_path}

Path to a HSM pin.

*Type:* absolute path

*Default:* `"/var/cache/kanidm-unixd/hsm-pin"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.unix.settings.kanidm.pam_allowed_login_groups` {#opt-services.kanidm.unix.settings.kanidm.pam_allowed_login_groups}

Kanidm groups that are allowed to login using PAM.

*Type:* list of string

*Default:* `[ ]`

*Example:* `"my_pam_group"`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanidm.unix.sshIntegration` {#opt-services.kanidm.unix.sshIntegration}

Whether to enable Kanidm SSH keys login.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/security/kanidm.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/security/kanidm.nix)

## `services.kanshi.enable` {#opt-services.kanshi.enable}

Whether to enable kanshi, a Wayland daemon that automatically configures outputs.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/programs/wayland/kanshi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/kanshi.nix)

## `services.kanshi.package` {#opt-services.kanshi.package}

The kanshi package to use.

*Type:* package

*Default:* `pkgs.kanshi`

*Declared by:* [`nixos/modules/programs/wayland/kanshi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/kanshi.nix)

## `services.kanshi.systemd.target` {#opt-services.kanshi.systemd.target}

The systemd target that will automatically start the Kanshi service.

*Type:* string

*Default:* `"graphical-session.target"`

*Declared by:* [`nixos/modules/programs/wayland/kanshi.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/kanshi.nix)

## `services.kapacitor.alerta.enable` {#opt-services.kapacitor.alerta.enable}

Whether to enable kapacitor alerta integration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.alerta.environment` {#opt-services.kapacitor.alerta.environment}

Default Alerta environment

*Type:* string

*Default:* `"Production"`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.alerta.origin` {#opt-services.kapacitor.alerta.origin}

Default origin of alert

*Type:* string

*Default:* `"kapacitor"`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.alerta.token` {#opt-services.kapacitor.alerta.token}

Default Alerta authentication token

*Type:* string

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.alerta.url` {#opt-services.kapacitor.alerta.url}

The URL to the Alerta REST API

*Type:* string

*Default:* `"http://localhost:5000"`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.bind` {#opt-services.kapacitor.bind}

Address to bind to. The default is to bind to all addresses

*Type:* string

*Default:* `""`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.dataDir` {#opt-services.kapacitor.dataDir}

Location where Kapacitor stores its state

*Type:* absolute path

*Default:* `"/var/lib/kapacitor"`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.defaultDatabase.enable` {#opt-services.kapacitor.defaultDatabase.enable}

Whether to enable kapacitor.defaultDatabase.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.defaultDatabase.password` {#opt-services.kapacitor.defaultDatabase.password}

The password to connect to the remote InfluxDB server

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.defaultDatabase.url` {#opt-services.kapacitor.defaultDatabase.url}

The URL to an InfluxDB server that serves as the default database

*Type:* string

*Example:* `"http://localhost:8086"`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.defaultDatabase.username` {#opt-services.kapacitor.defaultDatabase.username}

The username to connect to the remote InfluxDB server

*Type:* string

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.enable` {#opt-services.kapacitor.enable}

Whether to enable kapacitor.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.extraConfig` {#opt-services.kapacitor.extraConfig}

These lines go into kapacitord.conf verbatim.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.group` {#opt-services.kapacitor.group}

Group under which Kapacitor runs

*Type:* string

*Default:* `"kapacitor"`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.loadDirectory` {#opt-services.kapacitor.loadDirectory}

Directory where to load services from, such as tasks, templates and handlers (or null to disable service loading on startup)

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.port` {#opt-services.kapacitor.port}

Port of Kapacitor

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9092`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.taskSnapshotInterval` {#opt-services.kapacitor.taskSnapshotInterval}

Specifies how often to snapshot the task state  (in InfluxDB time units)

*Type:* string

*Default:* `"1m0s"`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapacitor.user` {#opt-services.kapacitor.user}

User account under which Kapacitor runs

*Type:* string

*Default:* `"kapacitor"`

*Declared by:* [`nixos/modules/services/monitoring/kapacitor.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kapacitor.nix)

## `services.kapla.dataDirectory` {#opt-services.kapla.dataDirectory}

Directory where the ERIS blocks are stored.

*Type:* string

*Default:* `"/var/lib/kapla"`

*Example:* `"/var/lib/kapla"`

*Declared by:* [`nixos/modules/services/networking/kapla.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kapla.nix)

## `services.kapla.enable` {#opt-services.kapla.enable}

Whether to enable Kapla storage and transport service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/kapla.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kapla.nix)

## `services.kapla.erisSocket.path` {#opt-services.kapla.erisSocket.path}

The socket to listen for eris connections on.

*Type:* string

*Default:* `"/var/lib/kapla/eris.sock"`

*Example:* `"/var/lib/kapla/eris.sock"`

*Declared by:* [`nixos/modules/services/networking/kapla.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kapla.nix)

## `services.kapla.erisSocket.setSessionVariable` {#opt-services.kapla.erisSocket.setSessionVariable}

Whether to enable Expose the eris socket in ERIS\_UNIX\_SOCKET.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/kapla.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kapla.nix)

## `services.kapla.extraArgs` {#opt-services.kapla.extraArgs}

Extra arguments to pass to `kapla serve`.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/kapla.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kapla.nix)

## `services.kapla.group` {#opt-services.kapla.group}

Group required to access the kapla socket

*Type:* string

*Default:* `"kapla"`

*Example:* `"kapla"`

*Declared by:* [`nixos/modules/services/networking/kapla.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kapla.nix)

## `services.kapla.openFirewall` {#opt-services.kapla.openFirewall}

Whether to enable Open the UDP ports for CoAP peers to connect.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/kapla.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kapla.nix)

## `services.kapla.package` {#opt-services.kapla.package}

Package to use for Kapla.

*Type:* package

*Default:* `"pkgs.ocamlPackages.kapla"`

*Declared by:* [`nixos/modules/services/networking/kapla.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kapla.nix)

## `services.kapla.stateDirectory` {#opt-services.kapla.stateDirectory}

Directory for kapla's socket and lock files.

*Type:* string

*Default:* `"/var/lib/kapla"`

*Example:* `"/var/lib/kapla"`

*Declared by:* [`nixos/modules/services/networking/kapla.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kapla.nix)

## `services.kapla.user` {#opt-services.kapla.user}

User the kapla binary should execute under.

*Type:* string

*Default:* `"kapla"`

*Example:* `"kapla"`

*Declared by:* [`nixos/modules/services/networking/kapla.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kapla.nix)

## `services.karakeep.browser.enable` {#opt-services.karakeep.browser.enable}

Enable the karakeep-browser service that runs a chromium instance in
the background with debugging ports exposed. This is necessary for
certain features like screenshots.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/karakeep.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/karakeep.nix)

## `services.karakeep.browser.exe` {#opt-services.karakeep.browser.exe}

The browser executable (must be Chrome-like).

*Type:* string

*Default:* `${pkgs.chromium}/bin/chromium`

*Example:* `${pkgs.google-chrome}/bin/google-chrome-stable`

*Declared by:* [`nixos/modules/services/web-apps/karakeep.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/karakeep.nix)

## `services.karakeep.browser.port` {#opt-services.karakeep.browser.port}

The port the browser should run on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `9222`

*Declared by:* [`nixos/modules/services/web-apps/karakeep.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/karakeep.nix)

## `services.karakeep.enable` {#opt-services.karakeep.enable}

Whether to enable Enable the Karakeep service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/karakeep.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/karakeep.nix)

## `services.karakeep.environmentFile` {#opt-services.karakeep.environmentFile}

An optional path to an environment file that will be used in the web and workers
services. This is useful for loading private keys.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/karakeep/secrets.env"`

*Declared by:* [`nixos/modules/services/web-apps/karakeep.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/karakeep.nix)

## `services.karakeep.extraEnvironment` {#opt-services.karakeep.extraEnvironment}

Environment variables to pass to Karakaeep. This is how most settings
can be configured. Changing DATA\_DIR is possible but not supported.

See [https://docs.karakeep.app/configuration/environment-variables](https://docs.karakeep.app/configuration/environment-variables)

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  PORT = "1234";
  DISABLE_SIGNUPS = "true";
  DISABLE_NEW_RELEASE_CHECK = "true";
}
```

*Declared by:* [`nixos/modules/services/web-apps/karakeep.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/karakeep.nix)

## `services.karakeep.meilisearch.enable` {#opt-services.karakeep.meilisearch.enable}

Enable Meilisearch and configure Karakeep to use it. Meilisearch is
required for text search.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/karakeep.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/karakeep.nix)

## `services.karakeep.package` {#opt-services.karakeep.package}

The karakeep package to use.

*Type:* package

*Default:* `pkgs.karakeep`

*Declared by:* [`nixos/modules/services/web-apps/karakeep.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/karakeep.nix)

## `services.karma.configFile` {#opt-services.karma.configFile}

A YAML config file which can be used to configure karma instead of the nix-generated file.

*Type:* absolute path

*Default:* `"A configuration file generated from the provided nix attributes settings option."`

*Example:* `"/etc/karma/karma.conf"`

*Declared by:* [`nixos/modules/services/monitoring/karma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/karma.nix)

## `services.karma.enable` {#opt-services.karma.enable}

Whether to enable the Karma dashboard service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/karma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/karma.nix)

## `services.karma.environment` {#opt-services.karma.environment}

Additional environment variables to provide to karma.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  ALERTMANAGER_NAME = "single";
  ALERTMANAGER_URI = "https://alertmanager.example.com";
}
```

*Declared by:* [`nixos/modules/services/monitoring/karma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/karma.nix)

## `services.karma.extraOptions` {#opt-services.karma.extraOptions}

Extra command line options.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--alertmanager.timeout 10s"
]
```

*Declared by:* [`nixos/modules/services/monitoring/karma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/karma.nix)

## `services.karma.openFirewall` {#opt-services.karma.openFirewall}

Whether to open ports in the firewall needed for karma to function.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/karma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/karma.nix)

## `services.karma.package` {#opt-services.karma.package}

The karma package to use.

*Type:* package

*Default:* `pkgs.karma`

*Declared by:* [`nixos/modules/services/monitoring/karma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/karma.nix)

## `services.karma.settings` {#opt-services.karma.settings}

Karma dashboard configuration as nix attributes.

Reference: [https://github.com/prymitive/karma/blob/main/docs/CONFIGURATION.md](https://github.com/prymitive/karma/blob/main/docs/CONFIGURATION.md)

*Type:* open submodule of (YAML 1.1 value)

*Default:*

``` nix
{
  listen = {
    address = "127.0.0.1";
  };
}
```

*Example:*

``` nix
{
  alertmanager = {
    interval = "15s";
    servers = [
      {
        name = "prod";
        uri = "http://alertmanager.example.com";
      }
    ];
  };
  listen = {
    address = "192.168.1.4";
    port = "8000";
    prefix = "/dashboard";
  };
}
```

*Declared by:* [`nixos/modules/services/monitoring/karma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/karma.nix)

## `services.karma.settings.listen.address` {#opt-services.karma.settings.listen.address}

Hostname or IP to listen on.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"[::]"`

*Declared by:* [`nixos/modules/services/monitoring/karma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/karma.nix)

## `services.karma.settings.listen.port` {#opt-services.karma.settings.listen.port}

HTTP port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Example:* `8182`

*Declared by:* [`nixos/modules/services/monitoring/karma.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/karma.nix)

## `services.kasmweb.datastorePath` {#opt-services.kasmweb.datastorePath}

The directory used to store all data for kasmweb.

*Type:* string

*Default:* `"/var/lib/kasmweb"`

*Declared by:* [`nixos/modules/services/web-apps/kasmweb/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kasmweb/default.nix)

## `services.kasmweb.defaultAdminPassword` {#opt-services.kasmweb.defaultAdminPassword}

default admin password to use.

*Type:* string

*Default:* `"kasmweb"`

*Declared by:* [`nixos/modules/services/web-apps/kasmweb/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kasmweb/default.nix)

## `services.kasmweb.defaultGuacToken` {#opt-services.kasmweb.defaultGuacToken}

default guac token to use.

*Type:* string

*Default:* `"kasmweb"`

*Declared by:* [`nixos/modules/services/web-apps/kasmweb/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kasmweb/default.nix)

## `services.kasmweb.defaultManagerToken` {#opt-services.kasmweb.defaultManagerToken}

default manager token to use.

*Type:* string

*Default:* `"kasmweb"`

*Declared by:* [`nixos/modules/services/web-apps/kasmweb/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kasmweb/default.nix)

## `services.kasmweb.defaultRegistrationToken` {#opt-services.kasmweb.defaultRegistrationToken}

default registration token to use.

*Type:* string

*Default:* `"kasmweb"`

*Declared by:* [`nixos/modules/services/web-apps/kasmweb/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kasmweb/default.nix)

## `services.kasmweb.defaultUserPassword` {#opt-services.kasmweb.defaultUserPassword}

default user password to use.

*Type:* string

*Default:* `"kasmweb"`

*Declared by:* [`nixos/modules/services/web-apps/kasmweb/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kasmweb/default.nix)

## `services.kasmweb.enable` {#opt-services.kasmweb.enable}

Whether to enable kasmweb.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/kasmweb/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kasmweb/default.nix)

## `services.kasmweb.listenAddress` {#opt-services.kasmweb.listenAddress}

The address on which kasmweb should listen.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/kasmweb/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kasmweb/default.nix)

## `services.kasmweb.listenPort` {#opt-services.kasmweb.listenPort}

The port on which kasmweb should listen.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `443`

*Declared by:* [`nixos/modules/services/web-apps/kasmweb/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kasmweb/default.nix)

## `services.kasmweb.networkSubnet` {#opt-services.kasmweb.networkSubnet}

The network subnet to use for the containers.

*Type:* string

*Default:* `"172.20.0.0/16"`

*Declared by:* [`nixos/modules/services/web-apps/kasmweb/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kasmweb/default.nix)

## `services.kasmweb.postgres.password` {#opt-services.kasmweb.postgres.password}

password to use for the postgres database.

*Type:* string

*Default:* `"kasmweb"`

*Declared by:* [`nixos/modules/services/web-apps/kasmweb/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kasmweb/default.nix)

## `services.kasmweb.postgres.user` {#opt-services.kasmweb.postgres.user}

Username to use for the postgres database.

*Type:* string

*Default:* `"kasmweb"`

*Declared by:* [`nixos/modules/services/web-apps/kasmweb/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kasmweb/default.nix)

## `services.kasmweb.redisPassword` {#opt-services.kasmweb.redisPassword}

password to use for the redis cache.

*Type:* string

*Default:* `"kasmweb"`

*Declared by:* [`nixos/modules/services/web-apps/kasmweb/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kasmweb/default.nix)

## `services.kasmweb.sslCertificate` {#opt-services.kasmweb.sslCertificate}

The SSL certificate to be used for kasmweb.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/kasmweb/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kasmweb/default.nix)

## `services.kasmweb.sslCertificateKey` {#opt-services.kasmweb.sslCertificateKey}

The SSL certificate's key to be used for kasmweb. Make sure to specify
this as a string and not a literal path, so that it is not accidentally
included in your nixstore.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/kasmweb/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kasmweb/default.nix)

## `services.kavita.credentials` {#opt-services.kavita.credentials}

Secrets that will be passed to systemd service and subsequently all placeholders in `appsettings.json` will be replaced
prior to service startup.

It is not necessary to enclose the keys/placeholder values with `@` characters here.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  oidc_client_secret = "/run/secrets/kavita/client_secret";
  token_key = "/run/secrets/kavita/token_key";
}
```

*Declared by:* [`nixos/modules/services/web-apps/kavita.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kavita.nix)

## `services.kavita.dataDir` {#opt-services.kavita.dataDir}

The directory where Kavita stores its state.

*Type:* string

*Default:* `"/var/lib/kavita"`

*Declared by:* [`nixos/modules/services/web-apps/kavita.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kavita.nix)

## `services.kavita.enable` {#opt-services.kavita.enable}

Whether to enable Kavita reading server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/kavita.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kavita.nix)

## `services.kavita.package` {#opt-services.kavita.package}

The kavita package to use.

*Type:* package

*Default:* `pkgs.kavita`

*Declared by:* [`nixos/modules/services/web-apps/kavita.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kavita.nix)

## `services.kavita.settings` {#opt-services.kavita.settings}

Kavita configuration options, as configured in `appsettings.json`.

Any configuration option that contains sensitive data should use a placeholder
value (ie, `oidc_client_secret`) enclosed with an `@` character:

`services.kavita.settings.OpenIdConnectSettings.Secret = "@oidc_client_secret@";`

Then, use the placeholder as unique key and hydrate the secret using your
preferred secrets management (ie, `sops-nix`):

`services.kavita.credentials."oidc_client_secret" = config.sops.secrets."client_secret".path;`

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  IpAddresses = "::2,127.0.0.2";
  OpenIdConnectSettings = {
    Authority = "https://idp.example.com";
    ClientId = "kavita";
    Enabled = true;
    Secret = "@oidc_client_secret@";
  };
  Port = 5001;
  TokenKey = "@token_key@";
}
```

*Declared by:* [`nixos/modules/services/web-apps/kavita.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kavita.nix)

## `services.kavita.settings.IpAddresses` {#opt-services.kavita.settings.IpAddresses}

IP Addresses to bind to. The default is to bind to all IPv4 and IPv6 addresses.

*Type:* strings concatenated with ","

*Default:* `"0.0.0.0,::"`

*Declared by:* [`nixos/modules/services/web-apps/kavita.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kavita.nix)

## `services.kavita.settings.Port` {#opt-services.kavita.settings.Port}

Port to bind to.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `5000`

*Declared by:* [`nixos/modules/services/web-apps/kavita.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kavita.nix)

## `services.kavita.settings.TokenKey` {#opt-services.kavita.settings.TokenKey}

A secret with at least 512 bits. It may be generated with `head -c 64 /dev/urandom | base64 --wrap=0`.

Suggest using a placeholder value (eg, `token_key`) enclosed by `@` character (eg, `@tokey_key@`) to avoid writing
sensitive data to world readable nix store. Placeholder value will be defined as key in `services.kavita.credentials`
and the associated path containing the secret will be replaced at service startup.

*Type:* string

*Default:* `"@token_key@"`

*Declared by:* [`nixos/modules/services/web-apps/kavita.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kavita.nix)

## `services.kavita.user` {#opt-services.kavita.user}

User account under which Kavita runs.

*Type:* string

*Default:* `"kavita"`

*Declared by:* [`nixos/modules/services/web-apps/kavita.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kavita.nix)

## `services.kbfs.enable` {#opt-services.kbfs.enable}

Whether to mount the Keybase filesystem.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/kbfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kbfs.nix)

## `services.kbfs.enableRedirector` {#opt-services.kbfs.enableRedirector}

Whether to enable the Keybase root redirector service, allowing
any user to access KBFS files via `/keybase`,
which will show different contents depending on the requester.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/kbfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kbfs.nix)

## `services.kbfs.extraFlags` {#opt-services.kbfs.extraFlags}

Additional flags to pass to the Keybase filesystem on launch.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-label kbfs"
  "-mount-type normal"
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/kbfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kbfs.nix)

## `services.kbfs.mountPoint` {#opt-services.kbfs.mountPoint}

Mountpoint for the Keybase filesystem.

*Type:* string

*Default:* `"%h/keybase"`

*Example:* `"/keybase"`

*Declared by:* [`nixos/modules/services/network-filesystems/kbfs.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kbfs.nix)

## `services.kea.dhcp-ddns` {#opt-services.kea.dhcp-ddns}

Kea DHCP-DDNS configuration

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.kea.dhcp-ddns.configFile` {#opt-services.kea.dhcp-ddns.configFile}

Kea DHCP-DDNS configuration as a path, see [https://kea.readthedocs.io/en/kea-3.2.1/arm/ddns.html](https://kea.readthedocs.io/en/kea-3.2.1/arm/ddns.html).

Takes preference over [settings](#opt-services.kea.dhcp-ddns.settings).
Most users should prefer using [settings](#opt-services.kea.dhcp-ddns.settings) instead.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.kea.dhcp-ddns.enable` {#opt-services.kea.dhcp-ddns.enable}

Whether to enable Kea DDNS server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.kea.dhcp-ddns.extraArgs` {#opt-services.kea.dhcp-ddns.extraArgs}

List of additional arguments to pass to the daemon.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.kea.dhcp-ddns.settings` {#opt-services.kea.dhcp-ddns.settings}

Kea DHCP-DDNS configuration as an attribute set, see [https://kea.readthedocs.io/en/kea-3.2.1/arm/ddns.html](https://kea.readthedocs.io/en/kea-3.2.1/arm/ddns.html).

*Type:* JSON value

*Default:* `null`

*Example:*

``` nix
{
  dns-server-timeout = 100;
  forward-ddns = {
    ddns-domains = [ ];
  };
  ip-address = "127.0.0.1";
  ncr-format = "JSON";
  ncr-protocol = "UDP";
  port = 53001;
  reverse-ddns = {
    ddns-domains = [ ];
  };
  tsig-keys = [ ];
}
```

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.kea.dhcp4` {#opt-services.kea.dhcp4}

DHCP4 Server configuration

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.kea.dhcp4.configFile` {#opt-services.kea.dhcp4.configFile}

Kea DHCP4 configuration as a path, see [https://kea.readthedocs.io/en/kea-3.2.1/arm/dhcp4-srv.html](https://kea.readthedocs.io/en/kea-3.2.1/arm/dhcp4-srv.html).

Takes preference over [settings](#opt-services.kea.dhcp4.settings).
Most users should prefer using [settings](#opt-services.kea.dhcp4.settings) instead.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.kea.dhcp4.enable` {#opt-services.kea.dhcp4.enable}

Whether to enable Kea DHCP4 server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.kea.dhcp4.extraArgs` {#opt-services.kea.dhcp4.extraArgs}

List of additional arguments to pass to the daemon.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.kea.dhcp4.settings` {#opt-services.kea.dhcp4.settings}

Kea DHCP4 configuration as an attribute set, see [https://kea.readthedocs.io/en/kea-3.2.1/arm/dhcp4-srv.html](https://kea.readthedocs.io/en/kea-3.2.1/arm/dhcp4-srv.html).

*Type:* JSON value

*Default:* `null`

*Example:*

``` nix
{
  interfaces-config = {
    interfaces = [
      "eth0"
    ];
  };
  lease-database = {
    name = "/var/lib/kea/dhcp4.leases";
    persist = true;
    type = "memfile";
  };
  rebind-timer = 2000;
  renew-timer = 1000;
  subnet4 = [
    {
      id = 1;
      pools = [
        {
          pool = "192.0.2.100 - 192.0.2.240";
        }
      ];
      subnet = "192.0.2.0/24";
    }
  ];
  valid-lifetime = 4000;
}
```

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.kea.dhcp6` {#opt-services.kea.dhcp6}

DHCP6 Server configuration

*Type:* submodule

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.kea.dhcp6.configFile` {#opt-services.kea.dhcp6.configFile}

Kea DHCP6 configuration as a path, see [https://kea.readthedocs.io/en/kea-3.2.1/arm/dhcp6-srv.html](https://kea.readthedocs.io/en/kea-3.2.1/arm/dhcp6-srv.html).

Takes preference over [settings](#opt-services.kea.dhcp6.settings).
Most users should prefer using [settings](#opt-services.kea.dhcp6.settings) instead.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.kea.dhcp6.enable` {#opt-services.kea.dhcp6.enable}

Whether to enable Kea DHCP6 server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.kea.dhcp6.extraArgs` {#opt-services.kea.dhcp6.extraArgs}

List of additional arguments to pass to the daemon.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.kea.dhcp6.settings` {#opt-services.kea.dhcp6.settings}

Kea DHCP6 configuration as an attribute set, see [https://kea.readthedocs.io/en/kea-3.2.1/arm/dhcp6-srv.html](https://kea.readthedocs.io/en/kea-3.2.1/arm/dhcp6-srv.html).

*Type:* JSON value

*Default:* `null`

*Example:*

``` nix
{
  interfaces-config = {
    interfaces = [
      "eth0"
    ];
  };
  lease-database = {
    name = "/var/lib/kea/dhcp6.leases";
    persist = true;
    type = "memfile";
  };
  preferred-lifetime = 3000;
  rebind-timer = 2000;
  renew-timer = 1000;
  subnet6 = [
    {
      id = 1;
      pools = [
        {
          pool = "2001:db8:1::1-2001:db8:1::ffff";
        }
      ];
      subnet = "2001:db8:1::/64";
    }
  ];
  valid-lifetime = 4000;
}
```

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.kea.package` {#opt-services.kea.package}

The kea package to use.

*Type:* package

*Default:* `pkgs.kea`

*Declared by:* [`nixos/modules/services/networking/kea.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kea.nix)

## `services.keepalived.enable` {#opt-services.keepalived.enable}

Whether to enable Keepalived.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.enableScriptSecurity` {#opt-services.keepalived.enableScriptSecurity}

Don't run scripts configured to be run as root if any part of the path is writable by a non-root user.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.extraConfig` {#opt-services.keepalived.extraConfig}

Extra lines to be added verbatim to the configuration file.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.extraGlobalDefs` {#opt-services.keepalived.extraGlobalDefs}

Extra lines to be added verbatim to the 'global\_defs' block of the
configuration file

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.openFirewall` {#opt-services.keepalived.openFirewall}

Whether to automatically allow VRRP and AH packets in the firewall.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.package` {#opt-services.keepalived.package}

The keepalived package to use.

*Type:* package

*Default:* `pkgs.keepalived`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.secretFile` {#opt-services.keepalived.secretFile}

Environment variables from this file will be interpolated into the
final config file using envsubst with this syntax: `$ENVIRONMENT`
or `${VARIABLE}`.
The file should contain lines formatted as `SECRET_VAR=SECRET_VALUE`.
This is useful to avoid putting secrets into the nix store.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/keepalived.env"`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.snmp.enable` {#opt-services.keepalived.snmp.enable}

Whether to enable the builtin AgentX subagent.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.snmp.enableChecker` {#opt-services.keepalived.snmp.enableChecker}

Enable SNMP handling of checker element of KEEPALIVED MIB.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.snmp.enableKeepalived` {#opt-services.keepalived.snmp.enableKeepalived}

Enable SNMP handling of vrrp element of KEEPALIVED MIB.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.snmp.enableRfc` {#opt-services.keepalived.snmp.enableRfc}

Enable SNMP handling of RFC2787 and RFC6527 VRRP MIBs.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.snmp.enableRfcV2` {#opt-services.keepalived.snmp.enableRfcV2}

Enable SNMP handling of RFC2787 VRRP MIB.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.snmp.enableRfcV3` {#opt-services.keepalived.snmp.enableRfcV3}

Enable SNMP handling of RFC6527 VRRP MIB.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.snmp.enableTraps` {#opt-services.keepalived.snmp.enableTraps}

Enable SNMP traps.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.snmp.socket` {#opt-services.keepalived.snmp.socket}

Socket to use for connecting to SNMP master agent. If this value is
set to null, keepalived's default will be used, which is
unix:/var/agentx/master, unless using a network namespace, when the
default is udp:localhost:705.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances` {#opt-services.keepalived.vrrpInstances}

Declarative vhost config

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.extraConfig` {#opt-services.keepalived.vrrpInstances._name_.extraConfig}

Extra lines to be added verbatim to the vrrp\_instance section.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.interface` {#opt-services.keepalived.vrrpInstances._name_.interface}

Interface for inside\_network, bound by vrrp.

*Type:* string

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.noPreempt` {#opt-services.keepalived.vrrpInstances._name_.noPreempt}

VRRP will normally preempt a lower priority machine when a higher
priority machine comes online. "nopreempt" allows the lower priority
machine to maintain the master role, even when a higher priority machine
comes back online. NOTE: For this to work, the initial state of this
entry must be BACKUP.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.priority` {#opt-services.keepalived.vrrpInstances._name_.priority}

For electing MASTER, highest priority wins. To be MASTER, make 50 more
than other machines.

*Type:* signed integer

*Default:* `100`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.state` {#opt-services.keepalived.vrrpInstances._name_.state}

Initial state. As soon as the other machine(s) come up, an election will
be held and the machine with the highest "priority" will become MASTER.
So the entry here doesn't matter a whole lot.

*Type:* one of "MASTER", "BACKUP"

*Default:* `"BACKUP"`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.trackInterfaces` {#opt-services.keepalived.vrrpInstances._name_.trackInterfaces}

List of network interfaces to monitor for health tracking.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "eth0"
  "eth1"
]
```

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.trackScripts` {#opt-services.keepalived.vrrpInstances._name_.trackScripts}

List of script names to invoke for health tracking.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "chk_cmd1"
  "chk_cmd2"
]
```

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.unicastPeers` {#opt-services.keepalived.vrrpInstances._name_.unicastPeers}

Do not send VRRP adverts over VRRP multicast group. Instead it sends
adverts to the following list of ip addresses using unicast design
fashion. It can be cool to use VRRP FSM and features in a networking
environment where multicast is not supported! IP Addresses specified can
IPv4 as well as IPv6.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.unicastSrcIp` {#opt-services.keepalived.vrrpInstances._name_.unicastSrcIp}

Default IP for binding vrrpd is the primary IP on interface. If you
want to hide location of vrrpd, use this IP as src\_addr for unicast
vrrp packets.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.useVmac` {#opt-services.keepalived.vrrpInstances._name_.useVmac}

Use VRRP Virtual MAC.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.virtualIps` {#opt-services.keepalived.vrrpInstances._name_.virtualIps}

Declarative vhost config

*Type:* list of (submodule)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.virtualIps.*.addr` {#opt-services.keepalived.vrrpInstances._name_.virtualIps._.addr}

IP address, optionally with a netmask: IPADDR\[/MASK\]

*Type:* string

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.virtualIps.*.brd` {#opt-services.keepalived.vrrpInstances._name_.virtualIps._.brd}

The broadcast address on the interface.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.virtualIps.*.dev` {#opt-services.keepalived.vrrpInstances._name_.virtualIps._.dev}

The name of the device to add the address to.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.virtualIps.*.label` {#opt-services.keepalived.vrrpInstances._name_.virtualIps._.label}

Each address may be tagged with a label string. In order to preserve
compatibility with Linux-2.0 net aliases, this string must coincide with
the name of the device or must be prefixed with the device name followed
by colon.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.virtualIps.*.scope` {#opt-services.keepalived.vrrpInstances._name_.virtualIps._.scope}

The scope of the area where this address is valid.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.virtualRouterId` {#opt-services.keepalived.vrrpInstances._name_.virtualRouterId}

Arbitrary unique number 1..255. Used to differentiate multiple instances
of vrrpd running on the same NIC (and hence same socket).

*Type:* integer between 1 and 255 (both inclusive)

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.vmacInterface` {#opt-services.keepalived.vrrpInstances._name_.vmacInterface}

Name of the vmac interface to use. keepalived will come up with a name
if you don't specify one.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpInstances.<name>.vmacXmitBase` {#opt-services.keepalived.vrrpInstances._name_.vmacXmitBase}

Send/Recv VRRP messages from base interface instead of VMAC interface.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpScripts` {#opt-services.keepalived.vrrpScripts}

Declarative vrrp script config

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpScripts.<name>.extraConfig` {#opt-services.keepalived.vrrpScripts._name_.extraConfig}

Extra lines to be added verbatim to the vrrp\_script section.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpScripts.<name>.fall` {#opt-services.keepalived.vrrpScripts._name_.fall}

Required number of failures for KO transition.

*Type:* signed integer

*Default:* `3`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpScripts.<name>.group` {#opt-services.keepalived.vrrpScripts._name_.group}

Name of group to run the script under. Defaults to user group.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpScripts.<name>.interval` {#opt-services.keepalived.vrrpScripts._name_.interval}

Seconds between script invocations.

*Type:* signed integer

*Default:* `1`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpScripts.<name>.rise` {#opt-services.keepalived.vrrpScripts._name_.rise}

Required number of successes for OK transition.

*Type:* signed integer

*Default:* `5`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpScripts.<name>.script` {#opt-services.keepalived.vrrpScripts._name_.script}

(Path of) Script command to execute followed by args, i.e. cmd \[args\]...

*Type:* string

*Example:* `"${pkgs.curl} -f http://localhost:80"`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpScripts.<name>.timeout` {#opt-services.keepalived.vrrpScripts._name_.timeout}

Seconds after which script is considered to have failed.

*Type:* signed integer

*Default:* `5`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpScripts.<name>.user` {#opt-services.keepalived.vrrpScripts._name_.user}

Name of user to run the script under.

*Type:* string

*Default:* `"keepalived_script"`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.keepalived.vrrpScripts.<name>.weight` {#opt-services.keepalived.vrrpScripts._name_.weight}

Following a failure, adjust the priority by this weight.

*Type:* signed integer

*Default:* `0`

*Declared by:* [`nixos/modules/services/networking/keepalived/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keepalived/default.nix)

## `services.kener.enable` {#opt-services.kener.enable}

Whether to enable Kener, this assumes a reverse proxy to be set.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/kener.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kener.nix)

## `services.kener.environmentFile` {#opt-services.kener.environmentFile}

Environment file, to put KENER\_SECRET\_KEY and other sensible values.

*Type:* absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/monitoring/kener.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kener.nix)

## `services.kener.package` {#opt-services.kener.package}

The kener package to use.

*Type:* package

*Default:* `pkgs.kener`

*Declared by:* [`nixos/modules/services/monitoring/kener.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kener.nix)

## `services.kener.redis.createLocally` {#opt-services.kener.redis.createLocally}

Whether to configure a local Redis server for Kener.
The connection is performed via Unix sockets by default,
but that can be changed by disabling this option and
configuring [`services.kener.redis.host`](#opt-services.kener.redis.host) and [`services.kener.redis.port`](#opt-services.kener.redis.port).

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/monitoring/kener.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kener.nix)

## `services.kener.redis.host` {#opt-services.kener.redis.host}

The host that redis will listen on.

*Type:* string

*Default:* `config.services.redis.servers.kener.unixSocket`

*Declared by:* [`nixos/modules/services/monitoring/kener.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kener.nix)

## `services.kener.redis.port` {#opt-services.kener.redis.port}

The port that redis will listen on. Set to zero to disable TCP.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `0`

*Declared by:* [`nixos/modules/services/monitoring/kener.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kener.nix)

## `services.kener.settings` {#opt-services.kener.settings}

Additional configuration for Kener, see
[https://kener.ing/docs/v4/setup/environment-variables](https://kener.ing/docs/v4/setup/environment-variables)
for supported values.

*Type:* open submodule of attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  NODE_EXTRA_CA_CERTS = {
    _type = "literalExpression";
    text = "config.security.pki.caBundle";
  };
  PORT = "4000";
}
```

*Declared by:* [`nixos/modules/services/monitoring/kener.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kener.nix)

## `services.kerberos_server.enable` {#opt-services.kerberos_server.enable}

Whether to enable the kerberos authentication server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/system/kerberos/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/kerberos/default.nix)

## `services.kerberos_server.extraKDCArgs` {#opt-services.kerberos_server.extraKDCArgs}

Extra arguments to pass to the KDC process. See `kdc(8)`.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/system/kerberos/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/kerberos/default.nix)

## `services.kerberos_server.settings` {#opt-services.kerberos_server.settings}

Settings for the kerberos server of choice.

See the following documentation:

- Heimdal: `kdc.conf(5)`
- MIT Kerberos: [https://web.mit.edu/kerberos/krb5-1.21/doc/admin/conf\_files/kdc\_conf.html](https://web.mit.edu/kerberos/krb5-1.21/doc/admin/conf_files/kdc_conf.html)

*Type:* open submodule of attribute set of attribute set of ((list of attribute set of ((list of (signed integer or string or boolean)) or signed integer or string or boolean)) or attribute set of ((list of (signed integer or string or boolean)) or signed integer or string or boolean) or (list of (signed integer or string or boolean)) or signed integer or string or boolean)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/system/kerberos/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/kerberos/default.nix)

## `services.kerberos_server.settings.include` {#opt-services.kerberos_server.settings.include}

Files to include in the Kerberos configuration.

*Type:* (list of absolute path) or absolute path convertible to it

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/system/kerberos/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/kerberos/default.nix)

## `services.kerberos_server.settings.includedir` {#opt-services.kerberos_server.settings.includedir}

Directories containing files to include in the Kerberos configuration.

*Type:* (list of absolute path) or absolute path convertible to it

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/system/kerberos/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/kerberos/default.nix)

## `services.kerberos_server.settings.module` {#opt-services.kerberos_server.settings.module}

Modules to obtain Kerberos configuration from.

*Type:* (list of absolute path) or absolute path convertible to it

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/system/kerberos/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/kerberos/default.nix)

## `services.kerberos_server.settings.realms` {#opt-services.kerberos_server.settings.realms}

The realm(s) to serve keys for.

*Type:* attribute set of (open submodule of attribute set of ((list of attribute set of ((list of (signed integer or string or boolean)) or signed integer or string or boolean)) or attribute set of ((list of (signed integer or string or boolean)) or signed integer or string or boolean) or (list of (signed integer or string or boolean)) or signed integer or string or boolean))

*Declared by:* [`nixos/modules/services/system/kerberos/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/kerberos/default.nix)

## `services.kerberos_server.settings.realms.<name>.acl` {#opt-services.kerberos_server.settings.realms._name_.acl}

The privileges granted to a user.

*Type:* list of (submodule)

*Default:*

``` nix
[
  {
    access = "all";
    principal = "*/admin";
  }
  {
    access = "all";
    principal = "admin";
  }
]
```

*Declared by:* [`nixos/modules/services/system/kerberos/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/kerberos/default.nix)

## `services.kerberos_server.settings.realms.<name>.acl.*.access` {#opt-services.kerberos_server.settings.realms._name_.acl._.access}

The changes the principal is allowed to make.

::: important
The "all" permission does not imply the "get-keys" permission. This
is consistent with the behavior of both MIT Kerberos and Heimdal.
:::

::: warning
Value "all" is allowed as a list member only if it appears alone
or accompanied by "get-keys". Any other combination involving
"all" will raise an exception.
:::

*Type:* (list of (one of "all", "add", "cpw", "delete", "get-keys", "get", "list", "modify")) or string convertible to it

*Default:* `"all"`

*Declared by:* [`nixos/modules/services/system/kerberos/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/kerberos/default.nix)

## `services.kerberos_server.settings.realms.<name>.acl.*.principal` {#opt-services.kerberos_server.settings.realms._name_.acl._.principal}

Which principal the rule applies to

*Type:* string

*Declared by:* [`nixos/modules/services/system/kerberos/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/kerberos/default.nix)

## `services.kerberos_server.settings.realms.<name>.acl.*.target` {#opt-services.kerberos_server.settings.realms._name_.acl._.target}

The principals that 'access' applies to.

*Type:* string

*Default:* `"*"`

*Declared by:* [`nixos/modules/services/system/kerberos/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/system/kerberos/default.nix)

## `services.keter.bundle.appName` {#opt-services.keter.bundle.appName}

The name keter assigns to this bundle

*Type:* string

*Default:* `"myapp"`

*Declared by:* [`nixos/modules/services/web-servers/keter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/keter)

## `services.keter.bundle.domain` {#opt-services.keter.bundle.domain}

The domain keter will bind to

*Type:* string

*Default:* `"example.com"`

*Declared by:* [`nixos/modules/services/web-servers/keter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/keter)

## `services.keter.bundle.executable` {#opt-services.keter.bundle.executable}

The executable to be run

*Type:* absolute path

*Declared by:* [`nixos/modules/services/web-servers/keter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/keter)

## `services.keter.bundle.publicScript` {#opt-services.keter.bundle.publicScript}

Allows loading of public environment variables,
these are emitted to the log so it shouldn't contain secrets.

*Type:* string

*Default:* `""`

*Example:* `"ADMIN_EMAIL=hi@example.com"`

*Declared by:* [`nixos/modules/services/web-servers/keter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/keter)

## `services.keter.bundle.secretScript` {#opt-services.keter.bundle.secretScript}

Allows loading of private environment variables

*Type:* string

*Default:* `""`

*Example:* `"MY_AWS_KEY=$(cat /run/keys/AWS_ACCESS_KEY_ID)"`

*Declared by:* [`nixos/modules/services/web-servers/keter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/keter)

## `services.keter.enable` {#opt-services.keter.enable}

Whether to enable keter, a web app deployment manager.
Note that this module only support loading of webapps:
Keep an old app running and swap the ports when the new one is booted
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-servers/keter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/keter)

## `services.keter.globalKeterConfig` {#opt-services.keter.globalKeterConfig}

Global config for keter, see [https://github.com/snoyberg/keter/blob/master/etc/keter-config.yaml](https://github.com/snoyberg/keter/blob/master/etc/keter-config.yaml) for reference

*Type:* open submodule of (YAML 1.1 value)

*Declared by:* [`nixos/modules/services/web-servers/keter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/keter)

## `services.keter.globalKeterConfig.ip-from-header` {#opt-services.keter.globalKeterConfig.ip-from-header}

You want that ip-from-header in the nginx setup case. It allows nginx setting the original ip address rather then it being localhost (due to reverse proxying)

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-servers/keter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/keter)

## `services.keter.globalKeterConfig.listeners` {#opt-services.keter.globalKeterConfig.listeners}

You want that ip-from-header in
the nginx setup case.
It allows nginx setting the original ip address rather
then it being localhost (due to reverse proxying).
However if you configure keter to accept connections
directly you may want to set this to false.

*Type:* list of (submodule)

*Default:*

``` nix
[
  {
    host = "*";
    port = 6981;
  }
]
```

*Declared by:* [`nixos/modules/services/web-servers/keter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/keter)

## `services.keter.globalKeterConfig.listeners.*.host` {#opt-services.keter.globalKeterConfig.listeners._.host}

host

*Type:* string

*Declared by:* [`nixos/modules/services/web-servers/keter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/keter)

## `services.keter.globalKeterConfig.listeners.*.port` {#opt-services.keter.globalKeterConfig.listeners._.port}

port

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Declared by:* [`nixos/modules/services/web-servers/keter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/keter)

## `services.keter.globalKeterConfig.rotate-logs` {#opt-services.keter.globalKeterConfig.rotate-logs}

emits keter logs and it's applications to stderr.
which allows journald to capture them.
Set to true to let keter put the logs in files
(useful on non systemd systems, this is the old approach
where keter handled log management)

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-servers/keter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/keter)

## `services.keter.package` {#opt-services.keter.package}

The keter package to use.

*Type:* package

*Default:* `pkgs.haskellPackages.keter`

*Declared by:* [`nixos/modules/services/web-servers/keter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/keter)

## `services.keter.root` {#opt-services.keter.root}

Mutable state folder for keter

*Type:* string

*Default:* `"/var/lib/keter"`

*Declared by:* [`nixos/modules/services/web-servers/keter`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/keter)

## `services.keybase.enable` {#opt-services.keybase.enable}

Whether to start the Keybase service.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/keybase.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/keybase.nix)

## `services.keycloak.database.caCert` {#opt-services.keycloak.database.caCert}

The SSL / TLS CA certificate that verifies the identity of the
database server.

Required when PostgreSQL is used and SSL is turned on.

For MySQL, if left at `null`, the default
Java keystore is used, which should suffice if the server
certificate is issued by an official CA.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.database.createLocally` {#opt-services.keycloak.database.createLocally}

Whether to create the database and user on the local host. Set
this to `false` if you use an external database or provision a
local one yourself.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.database.host` {#opt-services.keycloak.database.host}

Hostname of the database to connect to, or the path of a Unix
socket to connect through using socket authentication.

For PostgreSQL, a socket path is the directory containing the
socket (e.g. `/run/postgresql`). For MySQL and MariaDB, it is the
socket file itself (e.g. `/run/mysqld/mysqld.sock`). The
`junixsocket` plugins needed for PostgreSQL and MySQL socket
connections are added automatically.

Must be a socket path if
[services (K)](#opt-services.keycloak.database.createLocally) is enabled.

*Type:* string

*Default:* `/run/postgresql` for PostgreSQL or `/run/mysqld/mysqld.sock` for
MySQL/MariaDB if [services (K)](#opt-services.keycloak.database.createLocally)
is enabled, otherwise `localhost`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.database.name` {#opt-services.keycloak.database.name}

Name of the database to connect to. Must be `keycloak` if
[services (K)](#opt-services.keycloak.database.createLocally) is enabled.

*Type:* string

*Default:* `"keycloak"`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.database.passwordFile` {#opt-services.keycloak.database.passwordFile}

The path to a file containing the database password.

Not required if [services (K)](#opt-services.keycloak.database.host) is a Unix
socket path.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/db_password"`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.database.port` {#opt-services.keycloak.database.port}

Port of the database to connect to.

For PostgreSQL socket connections, this selects the socket file
(`.s.PGSQL.<port>`) within the socket directory. It is unused for
MySQL and MariaDB socket connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* [services (P)](../../options/services-p/index.md#opt-services.postgresql.settings.port) for a locally created
PostgreSQL database, otherwise the default port of the selected database.

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.database.type` {#opt-services.keycloak.database.type}

The type of database Keycloak should connect to.

*Type:* one of "mysql", "mariadb", "postgresql"

*Default:* `"postgresql"`

*Example:* `"mariadb"`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.database.useSSL` {#opt-services.keycloak.database.useSSL}

Whether the database connection should be secured by SSL / TLS.

Defaults to `false` for localhost and Unix socket connections.

*Type:* boolean

*Default:* `config.services.keycloak.database.host != "localhost" && !lib.hasPrefix "/" config.services.keycloak.database.host`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.database.username` {#opt-services.keycloak.database.username}

Username to connect to the database with. Must be `keycloak` if
[services (K)](#opt-services.keycloak.database.createLocally) is enabled.

*Type:* string

*Default:* `"keycloak"`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.enable` {#opt-services.keycloak.enable}

Whether to enable the Keycloak identity and access management
server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.initialAdminPassword` {#opt-services.keycloak.initialAdminPassword}

Initial password set for the temporary `admin` user.
The password is not stored safely and should be changed
immediately in the admin panel.

See [Admin bootstrap and recovery](https://www.keycloak.org/server/bootstrap-admin-recovery) for details.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.package` {#opt-services.keycloak.package}

The keycloak package to use.

*Type:* package

*Default:* `pkgs.keycloak`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.plugins` {#opt-services.keycloak.plugins}

Keycloak plugin jar, ear files or derivations containing
them. Packaged plugins are available through
`pkgs.keycloak.plugins`.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.realmFiles` {#opt-services.keycloak.realmFiles}

Realm files that the server is going to import during startup.
If a realm already exists in the server, the import operation is
skipped. Importing the master realm is not supported. All files are
expected to be in `json` format. See the
[documentation](https://www.keycloak.org/server/importExport) for
further information.

*Type:* list of absolute path

*Default:* `[ ]`

*Example:*

``` nix
[
  ./some/realm.json
  ./another/realm.json
]
```

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.settings` {#opt-services.keycloak.settings}

Configuration options corresponding to parameters set in
`conf/keycloak.conf`.

Most available options are documented at [https://www.keycloak.org/server/all-config](https://www.keycloak.org/server/all-config).

Options containing secret data should be set to an attribute
set containing the attribute `_secret` - a
string pointing to a file containing the value the option
should be set to. See the example to get a better picture of
this: in the resulting
`conf/keycloak.conf` file, the
`https-key-store-password` key will be set
to the contents of the
`/run/keys/store_password` file.

*Type:* open submodule of attribute set of (null or string or signed integer or boolean or attribute set of absolute path)

*Example:*

``` nix
{
  hostname = "keycloak.example.com";
  https-key-store-file = "/path/to/file";
  https-key-store-password = { _secret = "/run/keys/store_password"; };
}
```

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.settings.hostname` {#opt-services.keycloak.settings.hostname}

The hostname part of the public URL used as base for
all frontend requests.

See [https://www.keycloak.org/server/hostname](https://www.keycloak.org/server/hostname)
for more information about hostname configuration.

*Type:* null or string

*Default:* `null`

*Example:* `"keycloak.example.com"`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.settings.hostname-backchannel-dynamic` {#opt-services.keycloak.settings.hostname-backchannel-dynamic}

Enables dynamic resolving of backchannel URLs,
including hostname, scheme, port and context path.

See [https://www.keycloak.org/server/hostname](https://www.keycloak.org/server/hostname)
for more information about hostname configuration.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.settings.http-host` {#opt-services.keycloak.settings.http-host}

On which address Keycloak should accept new connections.

*Type:* string

*Default:* `"::"`

*Example:* `"::1"`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.settings.http-port` {#opt-services.keycloak.settings.http-port}

On which port Keycloak should listen for new HTTP connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `80`

*Example:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.settings.http-relative-path` {#opt-services.keycloak.settings.http-relative-path}

The path relative to `/` for serving
resources.

::: note
In versions of Keycloak using Wildfly (\<17),
this defaulted to `/auth`. If
upgrading from the Wildfly version of Keycloak,
i.e. a NixOS version before 22.05, you'll likely
want to set this to `/auth` to
keep compatibility with your clients.

See [https://www.keycloak.org/migration/migrating-to-quarkus](https://www.keycloak.org/migration/migrating-to-quarkus)
for more information on migrating from Wildfly to Quarkus.
:::

*Type:* string

*Default:* `"/"`

*Example:* `"/auth"`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.settings.https-port` {#opt-services.keycloak.settings.https-port}

On which port Keycloak should listen for new HTTPS connections.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `443`

*Example:* `8443`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.sslCertificate` {#opt-services.keycloak.sslCertificate}

The path to a PEM formatted certificate to use for TLS/SSL
connections.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/ssl_cert"`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.sslCertificateKey` {#opt-services.keycloak.sslCertificateKey}

The path to a PEM formatted private key to use for TLS/SSL
connections.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/ssl_key"`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keycloak.themes` {#opt-services.keycloak.themes}

Additional theme packages for Keycloak. Each theme is linked into
subdirectory with a corresponding attribute name.

Theme packages consist of several subdirectories which provide
different theme types: for example, `account`,
`login` etc. After adding a theme to this option you
can select it by its name in Keycloak administration console.

*Type:* attribute set of package

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/keycloak.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/keycloak.nix)

## `services.keyd.enable` {#opt-services.keyd.enable}

Whether to enable keyd, a key remapping daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/keyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/keyd.nix)

## `services.keyd.keyboards` {#opt-services.keyd.keyboards}

Configuration for one or more device IDs. Corresponding files in the /etc/keyd/ directory are created according to the name of the keys (like `default` or `externalKeyboard`).

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  default = {
    ids = [ "*" ];
    settings = {
      main = {
        capslock = "overload(control, esc)";
      };
    };
  };
  externalKeyboard = {
    ids = [ "1ea7:0907" ];
    settings = {
      main = {
        esc = capslock;
      };
    };
  };
}
```

*Declared by:* [`nixos/modules/services/hardware/keyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/keyd.nix)

## `services.keyd.keyboards.<name>.extraConfig` {#opt-services.keyd.keyboards._name_.extraConfig}

Extra configuration that is appended to the end of the file.
**Do not** write `ids` section here, use a separate option for it.
You can use this option to define compound layers that must always be defined after the layer they are comprised.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Example:*

``` nix
''
  [control+shift]
  h = left
''
```

*Declared by:* [`nixos/modules/services/hardware/keyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/keyd.nix)

## `services.keyd.keyboards.<name>.ids` {#opt-services.keyd.keyboards._name_.ids}

Device identifiers, as shown by `keyd(1)`.

*Type:* list of string

*Default:*

``` nix
[
  "*"
]
```

*Example:*

``` nix
[
  "*"
  "-0123:0456"
]
```

*Declared by:* [`nixos/modules/services/hardware/keyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/keyd.nix)

## `services.keyd.keyboards.<name>.settings` {#opt-services.keyd.keyboards._name_.settings}

Configuration, except `ids` section, that is written to `/etc/keyd/<keyboard>.conf`.
Appropriate names can be used to write non-alpha keys, for example "equal" instead of "=" sign (see [https://github.com/NixOS/nixpkgs/issues/236622](https://github.com/NixOS/nixpkgs/issues/236622)).
See [https://github.com/rvaiya/keyd](https://github.com/rvaiya/keyd) how to configure.

*Type:* attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))

*Default:* `{ }`

*Example:*

``` nix
{
  main = {
    capslock = "overload(control, esc)";
    rightalt = "layer(rightalt)";
  };
  rightalt = {
    h = "left";
    j = "down";
    k = "up";
    l = "right";
  };
}
```

*Declared by:* [`nixos/modules/services/hardware/keyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/keyd.nix)

## `services.keyd.package` {#opt-services.keyd.package}

The keyd package to use.

*Type:* package

*Default:* `pkgs.keyd`

*Declared by:* [`nixos/modules/services/hardware/keyd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/keyd.nix)

## `services.kimai.sites` {#opt-services.kimai.sites}

Specification of one or more Kimai sites to serve

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/web-apps/kimai.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kimai.nix)

## `services.kimai.sites.<name>.database.charset` {#opt-services.kimai.sites._name_.database.charset}

Database charset.

*Type:* string

*Default:* `"utf8mb4"`

*Declared by:* [`nixos/modules/services/web-apps/kimai.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kimai.nix)

## `services.kimai.sites.<name>.database.createLocally` {#opt-services.kimai.sites._name_.database.createLocally}

Create the database and database user locally.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/web-apps/kimai.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kimai.nix)

## `services.kimai.sites.<name>.database.host` {#opt-services.kimai.sites._name_.database.host}

Database host address.

*Type:* string

*Default:* `"localhost"`

*Declared by:* [`nixos/modules/services/web-apps/kimai.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kimai.nix)

## `services.kimai.sites.<name>.database.name` {#opt-services.kimai.sites._name_.database.name}

Database name.

*Type:* string

*Default:* `"kimai"`

*Declared by:* [`nixos/modules/services/web-apps/kimai.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kimai.nix)

## `services.kimai.sites.<name>.database.passwordFile` {#opt-services.kimai.sites._name_.database.passwordFile}

A file containing the password corresponding to
`database.user`.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/keys/kimai-dbpassword"`

*Declared by:* [`nixos/modules/services/web-apps/kimai.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kimai.nix)

## `services.kimai.sites.<name>.database.port` {#opt-services.kimai.sites._name_.database.port}

Database host port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `3306`

*Declared by:* [`nixos/modules/services/web-apps/kimai.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kimai.nix)

## `services.kimai.sites.<name>.database.serverVersion` {#opt-services.kimai.sites._name_.database.serverVersion}

MySQL *exact* version string. Not used if `createdLocally` is set,
but must be set otherwise. See
[https://www.kimai.org/documentation/installation.html#column-table\_name-in-where-clause-is-ambiguous](https://www.kimai.org/documentation/installation.html#column-table_name-in-where-clause-is-ambiguous)
for how to set this value, especially if you're using MariaDB.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/web-apps/kimai.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kimai.nix)

## `services.kimai.sites.<name>.database.socket` {#opt-services.kimai.sites._name_.database.socket}

Path to the unix socket file to use for authentication.

*Type:* null or absolute path

*Default:* `/run/mysqld/mysqld.sock`

*Declared by:* [`nixos/modules/services/web-apps/kimai.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kimai.nix)

## `services.kimai.sites.<name>.database.user` {#opt-services.kimai.sites._name_.database.user}

Database user.

*Type:* string

*Default:* `"kimai"`

*Declared by:* [`nixos/modules/services/web-apps/kimai.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kimai.nix)

## `services.kimai.sites.<name>.environmentFile` {#opt-services.kimai.sites._name_.environmentFile}

Securely pass environment variabels to Kimai. This can be used to
set other environement variables such as MAILER\_URL.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/kimai.env"`

*Declared by:* [`nixos/modules/services/web-apps/kimai.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kimai.nix)

## `services.kimai.sites.<name>.package` {#opt-services.kimai.sites._name_.package}

The kimai package to use.

*Type:* package

*Default:* `pkgs.kimai`

*Declared by:* [`nixos/modules/services/web-apps/kimai.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kimai.nix)

## `services.kimai.sites.<name>.poolConfig` {#opt-services.kimai.sites._name_.poolConfig}

Options for the Kimai PHP pool. See the documentation on `php-fpm.conf`
for details on configuration directives.

*Type:* attribute set of (string or signed integer or boolean)

*Default:*

``` nix
{
  pm = "dynamic";
  "pm.max_children" = 32;
  "pm.max_requests" = 500;
  "pm.max_spare_servers" = 4;
  "pm.min_spare_servers" = 2;
  "pm.start_servers" = 2;
}
```

*Declared by:* [`nixos/modules/services/web-apps/kimai.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kimai.nix)

## `services.kimai.sites.<name>.settings` {#opt-services.kimai.sites._name_.settings}

Structural Kimai's local.yaml configuration.
Refer to [https://www.kimai.org/documentation/local-yaml.html#localyaml](https://www.kimai.org/documentation/local-yaml.html#localyaml)
for details.

*Type:* attribute set of anything

*Default:* `{ }`

*Example:*

``` nix
{
  kimai = {
    timesheet = {
      rounding = {
        default = {
          begin = 15;
          end = 15;
        };
      };
    };
  };
}
```

*Declared by:* [`nixos/modules/services/web-apps/kimai.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kimai.nix)

## `services.kimai.webserver` {#opt-services.kimai.webserver}

The webserver to configure for the PHP frontend.

At the moment, only `nginx` is supported. PRs are welcome for support
for other web servers.

*Type:* value "nginx" (singular enum)

*Default:* `"nginx"`

*Declared by:* [`nixos/modules/services/web-apps/kimai.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/kimai.nix)

## `services.kismet.dataDir` {#opt-services.kismet.dataDir}

The Kismet data directory.

*Type:* absolute path

*Default:* `"/var/lib/kismet"`

*Declared by:* [`nixos/modules/services/networking/kismet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kismet.nix)

## `services.kismet.enable` {#opt-services.kismet.enable}

Whether to enable kismet.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/kismet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kismet.nix)

## `services.kismet.extraConfig` {#opt-services.kismet.extraConfig}

Literal Kismet config lines appended to the site config.
Note that `services.kismet.settings` allows you to define
all options here using Nix attribute sets.

*Type:* string

*Default:* `""`

*Example:*

``` nix
''
  # Looks like the following in `services.kismet.settings`:
  # wepkey = [ "00:DE:AD:C0:DE:00" "FEEDFACE42" ];
  wepkey=00:DE:AD:C0:DE:00,FEEDFACE42
''
```

*Declared by:* [`nixos/modules/services/networking/kismet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kismet.nix)

## `services.kismet.group` {#opt-services.kismet.group}

The group to run Kismet as.

*Type:* string

*Default:* `"kismet"`

*Declared by:* [`nixos/modules/services/networking/kismet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kismet.nix)

## `services.kismet.httpd.address` {#opt-services.kismet.httpd.address}

The address to listen on. Note that this cannot be a hostname or Kismet will not start.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/networking/kismet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kismet.nix)

## `services.kismet.httpd.enable` {#opt-services.kismet.httpd.enable}

True to enable the HTTP server.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/kismet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kismet.nix)

## `services.kismet.httpd.port` {#opt-services.kismet.httpd.port}

The port to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `2501`

*Declared by:* [`nixos/modules/services/networking/kismet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kismet.nix)

## `services.kismet.logTypes` {#opt-services.kismet.logTypes}

The log types.

*Type:* list of string

*Default:*

``` nix
[
  "kismet"
]
```

*Declared by:* [`nixos/modules/services/networking/kismet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kismet.nix)

## `services.kismet.package` {#opt-services.kismet.package}

The kismet package to use.

*Type:* package

*Default:* `pkgs.kismet`

*Declared by:* [`nixos/modules/services/networking/kismet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kismet.nix)

## `services.kismet.serverDescription` {#opt-services.kismet.serverDescription}

The description of the server.

*Type:* string

*Default:* `"NixOS Kismet server"`

*Declared by:* [`nixos/modules/services/networking/kismet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kismet.nix)

## `services.kismet.serverName` {#opt-services.kismet.serverName}

The name of the server.

*Type:* string

*Default:* `"Kismet"`

*Declared by:* [`nixos/modules/services/networking/kismet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kismet.nix)

## `services.kismet.settings` {#opt-services.kismet.settings}

Options for Kismet. See:
https://www.kismetwireless.net/docs/readme/configuring/configfiles/

*Type:* Kismet config stanza

*Default:* `{ }`

*Example:*

``` nix
{
  /* Examples for atoms */
  # dot11_link_bssts=false
  dot11_link_bssts = false; # Boolean

  # dot11_related_bss_window=10000000
  dot11_related_bss_window = 10000000; # Integer

  # devicefound=00:11:22:33:44:55
  devicefound = "00:11:22:33:44:55"; # String

  # log_types+=wiglecsv
  log_types' = "wiglecsv";

  /* Examples for lists of atoms */
  # wepkey=00:DE:AD:C0:DE:00,FEEDFACE42
  wepkey = [ "00:DE:AD:C0:DE:00" "FEEDFACE42" ];

  # alert=ADHOCCONFLICT,5/min,1/sec
  # alert=ADVCRYPTCHANGE,5/min,1/sec
  alert = [
    [ "ADHOCCONFLICT"  "5/min" "1/sec" ]
    [ "ADVCRYPTCHANGE" "5/min" "1/sec" ]
  ];

  /* Examples for sets of atoms */
  # source=wlan0:name=ath11k
  source.wlan0 = { name = "ath11k"; };

  /* Examples with colon-suffixed headers */
  # gps=gpsd:host=localhost,port=2947
  gps.gpsd = {
    host = "localhost";
    port = 2947;
  };

  # apspoof=Foo1:ssid=Bar1,validmacs="00:11:22:33:44:55,aa:bb:cc:dd:ee:ff"
  # apspoof=Foo1:ssid=Bar2,validmacs="01:12:23:34:45:56,ab:bc:cd:de:ef:f0"
  # apspoof=Foo2:ssid=Baz1,validmacs="11:22:33:44:55:66,bb:cc:dd:ee:ff:00"
  apspoof.Foo1 = [
    { ssid = "Bar1"; validmacs = [ "00:11:22:33:44:55" "aa:bb:cc:dd:ee:ff" ]; }
    { ssid = "Bar2"; validmacs = [ "01:12:23:34:45:56" "ab:bc:cd:de:ef:f0" ]; }
  ];

  # because Foo1 is a list, Foo2 needs to be as well
  apspoof.Foo2 = [
    {
      ssid = "Bar2";
      validmacs = [ "00:11:22:33:44:55" "aa:bb:cc:dd:ee:ff" ];
    };
  ];
}
```

*Declared by:* [`nixos/modules/services/networking/kismet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kismet.nix)

## `services.kismet.user` {#opt-services.kismet.user}

The user to run Kismet as.

*Type:* string

*Default:* `"kismet"`

*Declared by:* [`nixos/modules/services/networking/kismet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kismet.nix)

## `services.kiwix-serve.address` {#opt-services.kiwix-serve.address}

Listen only on the specified IP address.
Specify "ipv4", "ipv6" or "all" to listen on all IPv4, IPv6, or both types of addresses, respectively.

*Type:* string

*Default:* `"all"`

*Example:* `"ipv4"`

*Declared by:* [`nixos/modules/services/misc/kiwix-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/kiwix-serve.nix)

## `services.kiwix-serve.enable` {#opt-services.kiwix-serve.enable}

Whether to enable the kiwix-serve server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/kiwix-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/kiwix-serve.nix)

## `services.kiwix-serve.extraArgs` {#opt-services.kiwix-serve.extraArgs}

Extra arguments to pass to kiwix-serve.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--verbose"
  "--skipInvalid"
]
```

*Declared by:* [`nixos/modules/services/misc/kiwix-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/kiwix-serve.nix)

## `services.kiwix-serve.library` {#opt-services.kiwix-serve.library}

A set of ZIM files to serve. The key is used as the name for the ZIM files
(e.g. in the example, the files will be served as `wikipedia.zim` and `nix.zim`).

Exclusive with [services.kiwix-serve.libraryPath](#opt-services.kiwix-serve.libraryPath).

*Type:* attribute set of absolute path

*Default:* `{ }`

*Example:*

``` nix
{
  wikipedia = "/data/wikipedia_en_all_maxi_2026-02.zim";
  nix = pkgs.fetchurl {
    url = "https://download.kiwix.org/zim/devdocs/devdocs_en_nix_2026-01.zim";
    hash = "sha256-QxB9qDKSzzEU8t4droI08BXdYn+HMVkgiJMO3SoGTqM=";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/kiwix-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/kiwix-serve.nix)

## `services.kiwix-serve.libraryPath` {#opt-services.kiwix-serve.libraryPath}

An XML library file listing ZIM files to serve.
For more information, see [https://wiki.kiwix.org/wiki/Kiwix-manage](https://wiki.kiwix.org/wiki/Kiwix-manage).

Exclusive with [services.kiwix-serve.library](#opt-services.kiwix-serve.library).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/data/library.xml"`

*Declared by:* [`nixos/modules/services/misc/kiwix-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/kiwix-serve.nix)

## `services.kiwix-serve.openFirewall` {#opt-services.kiwix-serve.openFirewall}

Whether to open the firewall for the configured port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/kiwix-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/kiwix-serve.nix)

## `services.kiwix-serve.package` {#opt-services.kiwix-serve.package}

The kiwix-tools package to use.

*Type:* package

*Default:* `pkgs.kiwix-tools`

*Declared by:* [`nixos/modules/services/misc/kiwix-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/kiwix-serve.nix)

## `services.kiwix-serve.port` {#opt-services.kiwix-serve.port}

The port on which to run kiwix-serve.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/misc/kiwix-serve.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/kiwix-serve.nix)

## `services.klipper.apiSocket` {#opt-services.klipper.apiSocket}

Path of the API socket to create.

*Type:* null or absolute path

*Default:* `"/run/klipper/api"`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.configDir` {#opt-services.klipper.configDir}

Path to Klipper config file.

*Type:* absolute path

*Default:* `"/var/lib/klipper"`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.configFile` {#opt-services.klipper.configFile}

Path to default Klipper config.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.enable` {#opt-services.klipper.enable}

Whether to enable Klipper, the 3D printer firmware.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.extraSettings` {#opt-services.klipper.extraSettings}

Extra lines to append to the generated Klipper configuration.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.firmwares` {#opt-services.klipper.firmwares}

Firmwares Klipper should manage

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Example:*

``` nix
{
  mcu = {
    configFile = {
      _type = "literalExpression";
      text = "./klipper-firmware.cfg";
    };
    enable = true;
    enableKlipperFlash = true;
    serial = "/dev/serial/by-id/usb-Klipper_123ABCDEF";
  };
}
```

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.firmwares.<name>.canbusNetwork` {#opt-services.klipper.firmwares._name_.canbusNetwork}

CAN bus network this mcu is connected to. Defaults to can0 if canbus\_uuid is set.

*Type:* null or string

*Default:* `if canbus_uuid != null then "can0" else null`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.firmwares.<name>.canbus_uuid` {#opt-services.klipper.firmwares._name_.canbus_uuid}

CAN bus uuid of this mcu. Derived from `service.klipper.settings` by default.

*Type:* null or string

*Default:* `config.services.klipper.settings.<name>.canbus_uuid`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.firmwares.<name>.configFile` {#opt-services.klipper.firmwares._name_.configFile}

Path to firmware config which is generated using `klipper-genconf`

*Type:* absolute path

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.firmwares.<name>.enable` {#opt-services.klipper.firmwares._name_.enable}

Whether to enable building of firmware for manual flashing
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.firmwares.<name>.enableKlipperFlash` {#opt-services.klipper.firmwares._name_.enableKlipperFlash}

Whether to enable flashings scripts for firmware. This will add `klipper-flash-$mcu` scripts to your environment which can be called to flash the firmware.
Please check the configs at [klipper](https://github.com/Klipper3d/klipper/tree/master/config) whether your board supports flashing via `make flash`
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.firmwares.<name>.klipperFlashPackage` {#opt-services.klipper.firmwares._name_.klipperFlashPackage}

Path to the built klipper-flash package.

*Type:* null or package

*Default:* `null`

*Read only*

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.firmwares.<name>.package` {#opt-services.klipper.firmwares._name_.package}

Path to the built firmware package.

*Type:* null or package

*Default:* `null`

*Read only*

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.firmwares.<name>.serial` {#opt-services.klipper.firmwares._name_.serial}

Path to serial port this mcu is connected to. Derived from `service.klipper.settings` by default.

*Type:* null or absolute path

*Default:* `config.services.klipper.settings.<name>.serial`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.group` {#opt-services.klipper.group}

Group account under which Klipper runs.

If null is specified (default), a temporary user will be created by systemd.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.inputTTY` {#opt-services.klipper.inputTTY}

Path of the virtual printer symlink to create.

*Type:* absolute path

*Default:* `"/run/klipper/tty"`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.logFile` {#opt-services.klipper.logFile}

Path of the file Klipper should log to.
If `null`, it logs to stdout, which is not recommended by upstream.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/var/lib/klipper/klipper.log"`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.mutableConfig` {#opt-services.klipper.mutableConfig}

Whether to manage the config outside of NixOS.

It will still be initialized with the defined NixOS config if the file doesn't already exist.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.octoprintIntegration` {#opt-services.klipper.octoprintIntegration}

Allows Octoprint to control Klipper.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.package` {#opt-services.klipper.package}

The klipper package to use.

*Type:* package

*Default:* `pkgs.klipper`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.settings` {#opt-services.klipper.settings}

Configuration for Klipper. See the [documentation](https://www.klipper3d.org/Overview.html#configuration-and-tuning-guides)
for supported values.

*Type:* null or (attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string) or a non-empty list of them))

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.klipper.user` {#opt-services.klipper.user}

User account under which Klipper runs.

If null is specified (default), a temporary user will be created by systemd.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/misc/klipper.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/misc/klipper.nix)

## `services.kmonad.enable` {#opt-services.kmonad.enable}

Whether to enable KMonad: an advanced keyboard manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/kmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kmonad.nix)

## `services.kmonad.extraArgs` {#opt-services.kmonad.extraArgs}

Extra arguments to pass to KMonad.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "--log-level"
  "debug"
]
```

*Declared by:* [`nixos/modules/services/hardware/kmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kmonad.nix)

## `services.kmonad.keyboards` {#opt-services.kmonad.keyboards}

Keyboard configuration.

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/hardware/kmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kmonad.nix)

## `services.kmonad.keyboards.<name>.config` {#opt-services.kmonad.keyboards._name_.config}

Keyboard configuration.

*Type:* strings concatenated with "\\n"

*Declared by:* [`nixos/modules/services/hardware/kmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kmonad.nix)

## `services.kmonad.keyboards.<name>.defcfg.allowCommands` {#opt-services.kmonad.keyboards._name_.defcfg.allowCommands}

Whether to enable keys to run shell commands.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/kmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kmonad.nix)

## `services.kmonad.keyboards.<name>.defcfg.compose.delay` {#opt-services.kmonad.keyboards._name_.defcfg.compose.delay}

The delay (in milliseconds) between compose key sequences.

*Type:* unsigned integer, meaning \>=0

*Default:* `5`

*Declared by:* [`nixos/modules/services/hardware/kmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kmonad.nix)

## `services.kmonad.keyboards.<name>.defcfg.compose.key` {#opt-services.kmonad.keyboards._name_.defcfg.compose.key}

The (optional) compose key to use.

*Type:* null or string

*Default:* `"ralt"`

*Declared by:* [`nixos/modules/services/hardware/kmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kmonad.nix)

## `services.kmonad.keyboards.<name>.defcfg.enable` {#opt-services.kmonad.keyboards._name_.defcfg.enable}

Whether to enable automatic generation of the defcfg block.

When this option is set to true, the config option for
this keyboard should not include a defcfg block
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/kmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kmonad.nix)

## `services.kmonad.keyboards.<name>.defcfg.fallthrough` {#opt-services.kmonad.keyboards._name_.defcfg.fallthrough}

Whether to enable re-emitting unhandled key events.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/hardware/kmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kmonad.nix)

## `services.kmonad.keyboards.<name>.device` {#opt-services.kmonad.keyboards._name_.device}

Path to the keyboard's device file.

*Type:* absolute path

*Example:* `"/dev/input/by-id/some-dev"`

*Declared by:* [`nixos/modules/services/hardware/kmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kmonad.nix)

## `services.kmonad.keyboards.<name>.enableHardening` {#opt-services.kmonad.keyboards._name_.enableHardening}

Whether to enable systemd hardening.

::: note
If KMonad is used to execute shell commands, hardening may make some of them fail.
:::

*Type:* boolean

*Default:* `true`

*Example:* `false`

*Declared by:* [`nixos/modules/services/hardware/kmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kmonad.nix)

## `services.kmonad.keyboards.<name>.extraGroups` {#opt-services.kmonad.keyboards._name_.extraGroups}

Extra permission groups to attach to the KMonad instance for
this keyboard.

Since KMonad runs as an unprivileged user, it may sometimes
need extra permissions in order to read the keyboard device
file.  If your keyboard's device file isn't in the input
group, you'll need to list its group in this option.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/hardware/kmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kmonad.nix)

## `services.kmonad.keyboards.<name>.name` {#opt-services.kmonad.keyboards._name_.name}

Keyboard name.

*Type:* string

*Default:* `"‹name›"`

*Example:* `"laptop-internal"`

*Declared by:* [`nixos/modules/services/hardware/kmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kmonad.nix)

## `services.kmonad.package` {#opt-services.kmonad.package}

The KMonad package to use.

*Type:* package

*Default:* `pkgs.kmonad`

*Declared by:* [`nixos/modules/services/hardware/kmonad.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/hardware/kmonad.nix)

## `services.kmscon.config` {#opt-services.kmscon.config}

Configuration for kmscon. See `kmscon.conf(5)`
for available options.

*Type:* open submodule of attribute set of (boolean or signed integer or string)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/ttys/kmscon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/kmscon.nix)

## `services.kmscon.config.hwaccel` {#opt-services.kmscon.config.hwaccel}

Whether to enable use hardware acceleration for rendering.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/ttys/kmscon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/kmscon.nix)

## `services.kmscon.config.libseat` {#opt-services.kmscon.config.libseat}

Whether to enable use libseat for seat management.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/ttys/kmscon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/kmscon.nix)

## `services.kmscon.enable` {#opt-services.kmscon.enable}

Whether to enable use kmscon instead of autovt.

Kmscon is a simple terminal emulator based on linux kernel mode setting (KMS).
It is an attempt to replace the in-kernel VT implementation with a userspace console
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/ttys/kmscon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/kmscon.nix)

## `services.kmscon.extraOptions` {#opt-services.kmscon.extraOptions}

Extra flags to pass to kmscon.

*Type:* strings concatenated with " "

*Default:* `""`

*Example:* `"--term xterm-256color"`

*Declared by:* [`nixos/modules/services/ttys/kmscon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/kmscon.nix)

## `services.kmscon.package` {#opt-services.kmscon.package}

The kmscon package to use.

*Type:* package

*Default:* `pkgs.kmscon`

*Declared by:* [`nixos/modules/services/ttys/kmscon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/kmscon.nix)

## `services.kmscon.useXkbConfig` {#opt-services.kmscon.useXkbConfig}

Whether to enable configure keymap from xserver keyboard settings.

If enabled, configurations under `services.xserver.xkb` will be injected into kmscon's configuration
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/ttys/kmscon.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/ttys/kmscon.nix)

## `services.knot-resolver.enable` {#opt-services.knot-resolver.enable}

Whether to enable knot-resolver (version 6) domain name server.
DNSSEC validation is turned on by default.
If you want to use knot-resolver 5, please use services.kresd.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/knot-resolver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/knot-resolver.nix)

## `services.knot-resolver.managerPackage` {#opt-services.knot-resolver.managerPackage}

The knot-resolver-manager\_6 package to use.

*Type:* package

*Default:* `pkgs.knot-resolver-manager_6`

*Example:* `pkgs.knot-resolver-manager_6.override { extraFeatures = true; }`

*Declared by:* [`nixos/modules/services/networking/knot-resolver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/knot-resolver.nix)

## `services.knot-resolver.settings` {#opt-services.knot-resolver.settings}

Nix-based (RFC 42) configuration for Knot Resolver.
For configuration reference (described as YAML) see
[https://www.knot-resolver.cz/documentation/latest/config-overview.html](https://www.knot-resolver.cz/documentation/latest/config-overview.html)

*Type:* open submodule of (YAML 1.1 value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/knot-resolver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/knot-resolver.nix)

## `services.knot-resolver.settings.network.listen` {#opt-services.knot-resolver.settings.network.listen}

List of interfaces to listen to and its configuration.

*Type:* list of (open submodule of (YAML 1.1 value))

*Default:*

``` nix
[
  {
    interface = [ "127.0.0.1" ];
    kind = "dns";
    freebind = false;
  }
]
++ lib.optionals config.networking.enableIPv6 [
  {
    interface = [ "::1" ];
    kind = "dns";
    freebind = false;
  }
 ];
```

*Declared by:* [`nixos/modules/services/networking/knot-resolver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/knot-resolver.nix)

## `services.knot-resolver.settings.workers` {#opt-services.knot-resolver.settings.workers}

The number of running kresd (Knot Resolver daemon) workers. If set to 'auto', it is equal to number of CPUs available.

*Type:* value "auto" (singular enum) or (unsigned integer, meaning \>=0)

*Default:* `1`

*Declared by:* [`nixos/modules/services/networking/knot-resolver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/knot-resolver.nix)

## `services.knot.checkConfig` {#opt-services.knot.checkConfig}

Toggles the configuration test at build time. It runs in a
sandbox, and therefore cannot be used in all scenarios.

*Type:* boolean

*Default:*

``` nix
''
  Disabled when the config uses `keyFiles` or `enableXDP`.
''
```

*Example:* `false`

*Declared by:* [`nixos/modules/services/networking/knot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/knot.nix)

## `services.knot.enable` {#opt-services.knot.enable}

Whether to enable Knot authoritative-only DNS server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/knot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/knot.nix)

## `services.knot.enableXDP` {#opt-services.knot.enableXDP}

Extends the systemd unit with permissions to allow for the use of
the eXpress Data Path (XDP).

::: note
Make sure to read up on functional [limitations](https://www.knot-dns.cz/docs/latest/singlehtml/index.html#mode-xdp-limitations)
when running in XDP mode.
:::

*Type:* boolean

*Default:*

``` nix
''
  Enabled when the `xdp.listen` setting is configured through `settings`.
''
```

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/knot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/knot.nix)

## `services.knot.extraArgs` {#opt-services.knot.extraArgs}

List of additional command line parameters for knotd

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/knot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/knot.nix)

## `services.knot.keyFiles` {#opt-services.knot.keyFiles}

A list of files containing additional configuration
to be included using the include directive. This option
allows to include configuration like TSIG keys without
exposing them to the nix store readable to any process.
Note that using this option will also disable configuration
checks at build time.

*Type:* list of absolute path

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/networking/knot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/knot.nix)

## `services.knot.package` {#opt-services.knot.package}

The knot-dns package to use.

*Type:* package

*Default:* `pkgs.knot-dns`

*Declared by:* [`nixos/modules/services/networking/knot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/knot.nix)

## `services.knot.settings` {#opt-services.knot.settings}

Extra configuration as nix values.

*Type:* YAML 1.1 value

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/knot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/knot.nix)

## `services.knot.settingsFile` {#opt-services.knot.settingsFile}

As alternative to `settings`, you can provide whole configuration
directly in the almost-YAML format of Knot DNS.
You might want to utilize `pkgs.writeText "knot.conf" "longConfigString"` for this.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/networking/knot.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/knot.nix)

## `services.koito.enable` {#opt-services.koito.enable}

Whether to enable koito.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/koito.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/koito.nix)

## `services.koito.environment` {#opt-services.koito.environment}

Environment variables to pass to the Koito service.
See [https://koito.io/reference/configuration/](https://koito.io/reference/configuration/) for available options.

*Type:* open submodule of attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  KOITO_DEFAULT_THEME = "black";
  KOITO_LOGIN_GATE = "true";
}
```

*Declared by:* [`nixos/modules/services/web-apps/koito.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/koito.nix)

## `services.koito.environment.KOITO_BIND_ADDR` {#opt-services.koito.environment.KOITO_BIND_ADDR}

The IP address to bind the Koito server to.

*Type:* string

*Default:* `"127.0.0.1"`

*Example:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/web-apps/koito.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/koito.nix)

## `services.koito.environment.KOITO_CONFIG_DIR` {#opt-services.koito.environment.KOITO_CONFIG_DIR}

Directory for Koito import folders and image caches.

*Type:* absolute path

*Default:* `"/var/lib/koito"`

*Declared by:* [`nixos/modules/services/web-apps/koito.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/koito.nix)

## `services.koito.environment.KOITO_LISTEN_PORT` {#opt-services.koito.environment.KOITO_LISTEN_PORT}

TCP port for the Koito server.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `4110`

*Declared by:* [`nixos/modules/services/web-apps/koito.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/koito.nix)

## `services.koito.environmentFile` {#opt-services.koito.environmentFile}

Path of a file with extra environment variables to be loaded from disk.
This file is not added to the nix store, so it can be used to pass secrets to Koito.
See [https://koito.io/reference/configuration/](https://koito.io/reference/configuration/) for available options.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/koito"`

*Declared by:* [`nixos/modules/services/web-apps/koito.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/koito.nix)

## `services.koito.openFirewall` {#opt-services.koito.openFirewall}

Open the appropriate ports in the firewall for Koito.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/koito.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/koito.nix)

## `services.koito.package` {#opt-services.koito.package}

The koito package to use.

*Type:* package

*Default:* `pkgs.koito`

*Declared by:* [`nixos/modules/services/web-apps/koito.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/koito.nix)

## `services.komga.enable` {#opt-services.komga.enable}

Whether to enable Komga, a free and open source comics/mangas media server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/web-apps/komga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/komga.nix)

## `services.komga.group` {#opt-services.komga.group}

Group under which Komga runs.

*Type:* string

*Default:* `"komga"`

*Declared by:* [`nixos/modules/services/web-apps/komga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/komga.nix)

## `services.komga.openFirewall` {#opt-services.komga.openFirewall}

Whether to open the firewall for the port in [`services.komga.settings.server.port`](#opt-services.komga.settings.server.port).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/web-apps/komga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/komga.nix)

## `services.komga.settings` {#opt-services.komga.settings}

Komga configuration.

See [documentation](https://komga.org/docs/installation/configuration).

*Type:* open submodule of (YAML 1.1 value)

*Declared by:* [`nixos/modules/services/web-apps/komga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/komga.nix)

## `services.komga.settings.server.port` {#opt-services.komga.settings.server.port}

The port that Komga will listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/web-apps/komga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/komga.nix)

## `services.komga.stateDir` {#opt-services.komga.stateDir}

State and configuration directory Komga will use.

*Type:* string

*Default:* `"/var/lib/komga"`

*Declared by:* [`nixos/modules/services/web-apps/komga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/komga.nix)

## `services.komga.user` {#opt-services.komga.user}

User account under which Komga runs.

*Type:* string

*Default:* `"komga"`

*Declared by:* [`nixos/modules/services/web-apps/komga.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/komga.nix)

## `services.komodo-periphery.auth.corePublicKeys` {#opt-services.komodo-periphery.auth.corePublicKeys}

(v2.0+) Accepted public keys to allow Core(s) to connect.
Accepts Spki base64 DER directly or can reference files using `file:/path/to/core.pub` prefix.
You can mix direct keys and file references.

For better security, use the `file:` prefix to reference secret files.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  # Direct key value
  "MCowBQYDK2VuAyEATZgrjGHeF0KJUe0+n77+qAWOg3YzEzXOmQWaRgO3OGQ="
  # Reference secret files
  "file:${config.age.secrets.komodo-core1-pub.path}"
  "file:${config.age.secrets.komodo-core2-pub.path}"
]
```

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.auth.privateKey` {#opt-services.komodo-periphery.auth.privateKey}

(v2.0+) Private key used with the Noise handshake.

Use `file:/path/to/file` prefix to load from a file. If the file doesn't exist,
Periphery will generate and write a new key to the path.

If empty, defaults to `file:${rootDirectory}/keys/periphery.key`.

*Type:* string

*Default:* `""`

*Example:*

``` nix
# Reference a secret file
"file:${config.age.secrets.komodo-private-key.path}"

# Or direct path
"file:/run/secrets/komodo-private-key"
```

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.buildDir` {#opt-services.komodo-periphery.buildDir}

Directory for Komodo Periphery to manage builds. If null, defaults to `${rootDirectory}/builds`.

*Type:* null or absolute path

*Default:* `"${config.services.komodo-periphery.rootDirectory}/builds"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.configFile` {#opt-services.komodo-periphery.configFile}

Path to the Periphery configuration file.

- If `null` (default), a configuration file will be automatically generated
  from the module options (recommended for most users).
- If set to a path, that file will be used directly as the configuration file.
- You can also use `pkgs.writeText` to write configuration inline in your NixOS configuration.

When using a custom config file, all other module options (except `package`, `user`, `group`,
`environment`, and `environmentFile`) will be ignored.

*Type:* null or absolute path

*Default:* `null`

*Example:*

``` nix
# Option 1: Use an existing config file
"/etc/komodo/periphery.toml"

# Option 2: Write config inline using pkgs.writeText
pkgs.writeText "periphery.toml" ''
  root_directory = "/var/lib/komodo-periphery"

  logging.level = "info"
  logging.stdio = "standard"
''
```

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.containerStatsPollingRate` {#opt-services.komodo-periphery.containerStatsPollingRate}

Container stats polling interval.

*Type:* string

*Default:* `"30-sec"`

*Example:* `"1-min"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.defaultTerminalCommand` {#opt-services.komodo-periphery.defaultTerminalCommand}

(v2.0+) Default terminal command used to initialize the shell.

*Type:* string

*Default:* `"bash"`

*Example:* `"zsh"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.disableContainerTerminals` {#opt-services.komodo-periphery.disableContainerTerminals}

(v2.0+) Disable remote container shell access through Periphery.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.disableTerminals` {#opt-services.komodo-periphery.disableTerminals}

Disable remote shell access through Periphery.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.dockerHost` {#opt-services.komodo-periphery.dockerHost}

Docker host socket URI to use for container operations.
If null, uses the default Docker socket and automatically enables Docker.
Set this to use alternative container runtimes like Podman or remote Docker hosts.

*Type:* null or string

*Default:* `null`

*Example:*

``` nix
# Podman rootless
"unix:///run/user/1000/podman/podman.sock"

# Podman rootful
"unix:///run/podman/podman.sock"

# Remote Docker
"tcp://192.168.1.100:2375"
```

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.enable` {#opt-services.komodo-periphery.enable}

Whether to enable Periphery, a multi-server Docker and Git deployment agent by Komodo.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.environment` {#opt-services.komodo-periphery.environment}

Environment variables to set for the service.

*Type:* attribute set of string

*Default:* `{ }`

*Example:*

``` nix
{
  DOCKER_HOST = "unix:///var/run/docker.sock";
  RUST_LOG = "komodo=debug";
}
```

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.environmentFile` {#opt-services.komodo-periphery.environmentFile}

Environment file for additional configuration via environment variables.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/komodo-periphery.env"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.excludeDiskMounts` {#opt-services.komodo-periphery.excludeDiskMounts}

Exclude these mount paths from disk reporting.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/tmp"
  "/boot"
]
```

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.extraSettings` {#opt-services.komodo-periphery.extraSettings}

Extra settings to add to the generated TOML config.

*Type:* TOML value

*Default:* `{ }`

*Example:*

``` nix
{
  secrets = {
    GITHUB_TOKEN = "ghp_xxxx";
  };
}
```

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.group` {#opt-services.komodo-periphery.group}

Group under which the Periphery agent runs.

*Type:* string

*Default:* `"komodo-periphery"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.inbound.allowedIps` {#opt-services.komodo-periphery.inbound.allowedIps}

Limit the IP addresses which can connect to Periphery.
Supports IPv4/IPv6 addresses and subnets.
Empty list allows all connections.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "::ffff:12.34.56.78"
  "10.0.10.0/24"
]
```

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.inbound.bindIp` {#opt-services.komodo-periphery.inbound.bindIp}

IP address the periphery server will bind to.
The default allows external IPv4 and IPv6 connections.

*Type:* string

*Default:* `"[::]"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.inbound.port` {#opt-services.komodo-periphery.inbound.port}

Port for the inbound Periphery server to listen on.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8120`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.inbound.serverEnabled` {#opt-services.komodo-periphery.inbound.serverEnabled}

Enable the inbound connection server for Core -\> Periphery connections.
If null, defaults to false when `outbound.coreAddress` is defined, otherwise true.

*Type:* null or boolean

*Default:* `null`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.inbound.ssl.certFile` {#opt-services.komodo-periphery.inbound.ssl.certFile}

Path to SSL certificate file.
If the file doesn't exist and SSL is enabled, self-signed certificate will be generated using openssl.

*Type:* absolute path

*Default:* `"${config.services.komodo-periphery.rootDirectory}/ssl/cert.pem"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.inbound.ssl.enable` {#opt-services.komodo-periphery.inbound.ssl.enable}

Whether to enable (v2.0+) SSL/TLS support for inbound connections.

*Type:* boolean

*Default:* `true`

*Example:* `true`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.inbound.ssl.keyFile` {#opt-services.komodo-periphery.inbound.ssl.keyFile}

Path to SSL key file.
If the file doesn't exist and SSL is enabled, self-signed keys will be generated using openssl.

*Type:* absolute path

*Default:* `"${config.services.komodo-periphery.rootDirectory}/ssl/key.pem"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.includeDiskMounts` {#opt-services.komodo-periphery.includeDiskMounts}

Only include these mount paths in disk reporting.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "/mnt/data"
  "/mnt/backup"
]
```

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.legacyComposeCli` {#opt-services.komodo-periphery.legacyComposeCli}

Use `docker-compose` instead of `docker compose`.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.logging.level` {#opt-services.komodo-periphery.logging.level}

Logging verbosity level.

*Type:* one of "off", "error", "warn", "info", "debug", "trace"

*Default:* `"info"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.logging.opentelemetryScopeName` {#opt-services.komodo-periphery.logging.opentelemetryScopeName}

(v2.0+) OpenTelemetry scope name attached to telemetry.

*Type:* string

*Default:* `"Komodo"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.logging.opentelemetryServiceName` {#opt-services.komodo-periphery.logging.opentelemetryServiceName}

(v2.0+) OpenTelemetry service name attached to telemetry.

*Type:* string

*Default:* `"Periphery"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.logging.otlpEndpoint` {#opt-services.komodo-periphery.logging.otlpEndpoint}

OpenTelemetry OTLP endpoint for traces.

*Type:* string

*Default:* `""`

*Example:* `"http://localhost:4317"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.logging.pretty` {#opt-services.komodo-periphery.logging.pretty}

(v2.0+) Enable human-readable logging (multi-line).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.logging.stdio` {#opt-services.komodo-periphery.logging.stdio}

Logging format for stdout/stderr.

*Type:* one of "standard", "json", "none"

*Default:* `"standard"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.outbound.connectAs` {#opt-services.komodo-periphery.outbound.connectAs}

(v2.0+) The Server this Periphery agent should connect as.
Must match an existing Server name or id.

*Type:* string

*Default:* `""`

*Example:* `"server-name"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.outbound.coreAddress` {#opt-services.komodo-periphery.outbound.coreAddress}

(v2.0+) The address of Komodo Core. Must be reachable from this host.
If provided, Periphery will operate in outbound mode.

*Type:* string

*Default:* `""`

*Example:* `"demo.komo.do"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.outbound.onboardingKeyFile` {#opt-services.komodo-periphery.outbound.onboardingKeyFile}

(v2.0+) Path to file containing the onboarding key.
This will be passed via `PERIPHERY_ONBOARDING_KEY_FILE` environment variable.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"${config.age.secrets.komodo-onboarding.path}"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.package` {#opt-services.komodo-periphery.package}

The komodo package to use.

*Type:* package

*Default:* `pkgs.komodo`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.passkeyFiles` {#opt-services.komodo-periphery.passkeyFiles}

Path to file containing passkeys (v1.X compatibility).
This will be passed via `PERIPHERY_PASSKEYS_FILE` environment variable.
Consider migrating to the new v2.0+ authentication mechanism.

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/komodo-passkey"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.prettyStartupConfig` {#opt-services.komodo-periphery.prettyStartupConfig}

(v2.0+) Enable human-readable startup config log (multi-line).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.repoDir` {#opt-services.komodo-periphery.repoDir}

Directory for Komodo Periphery to manage repos. If null, defaults to `${rootDirectory}/repos`.

*Type:* null or absolute path

*Default:* `"${config.services.komodo-periphery.rootDirectory}/repos"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.rootDirectory` {#opt-services.komodo-periphery.rootDirectory}

Root directory for Komodo Periphery data.

*Type:* absolute path

*Default:* `"/var/lib/komodo-periphery"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.stackDir` {#opt-services.komodo-periphery.stackDir}

Directory for Komodo Periphery to manage stacks. If null, defaults to `${rootDirectory}/stacks`.

*Type:* null or absolute path

*Default:* `"${config.services.komodo-periphery.rootDirectory}/stacks"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.statsPollingRate` {#opt-services.komodo-periphery.statsPollingRate}

System stats polling interval.

*Type:* string

*Default:* `"5-sec"`

*Example:* `"10-sec"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.komodo-periphery.user` {#opt-services.komodo-periphery.user}

User under which the Periphery agent runs.

*Type:* string

*Default:* `"komodo-periphery"`

*Declared by:* [`nixos/modules/services/admin/komodo-periphery.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/admin/komodo-periphery.nix)

## `services.kresd.enable` {#opt-services.kresd.enable}

Whether to enable knot-resolver (version 5) domain name server.
DNSSEC validation is turned on by default.
You can run `kresd-cli 1` and give commands interactively to kresd@1.service.
If you want to user knot-resolver 6, please use services.knot-resolver.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/networking/kresd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kresd.nix)

## `services.kresd.extraConfig` {#opt-services.kresd.extraConfig}

Extra lines to be added verbatim to the generated configuration file.
See upstream documentation [https://www.knot-resolver.cz/documentation/stable/config-overview.html](https://www.knot-resolver.cz/documentation/stable/config-overview.html) for more details.

*Type:* strings concatenated with "\\n"

*Default:* `""`

*Declared by:* [`nixos/modules/services/networking/kresd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kresd.nix)

## `services.kresd.instances` {#opt-services.kresd.instances}

The number of instances to start.  They will be called kresd@{1,2,...}.service.
Knot Resolver uses no threads, so this is the way to scale.
You can dynamically start/stop them at will, so this is just system default.

*Type:* unsigned integer, meaning \>=0

*Default:* `1`

*Declared by:* [`nixos/modules/services/networking/kresd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kresd.nix)

## `services.kresd.listenDoH` {#opt-services.kresd.listenDoH}

Addresses and ports on which kresd should provide DNS over HTTPS/2 (see RFC 8484).
For detailed syntax see ListenStream in `systemd.socket(5)`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "198.51.100.1:443"
  "[2001:db8::1]:443"
  "443"
]
```

*Declared by:* [`nixos/modules/services/networking/kresd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kresd.nix)

## `services.kresd.listenPlain` {#opt-services.kresd.listenPlain}

What addresses and ports the server should listen on.
For detailed syntax see ListenStream in `systemd.socket(5)`.

*Type:* list of string

*Default:*

``` nix
[
  "[::1]:53"
  "127.0.0.1:53"
]
```

*Example:*

``` nix
[
  "53"
]
```

*Declared by:* [`nixos/modules/services/networking/kresd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kresd.nix)

## `services.kresd.listenTLS` {#opt-services.kresd.listenTLS}

Addresses and ports on which kresd should provide DNS over TLS (see RFC 7858).
For detailed syntax see ListenStream in `systemd.socket(5)`.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "198.51.100.1:853"
  "[2001:db8::1]:853"
  "853"
]
```

*Declared by:* [`nixos/modules/services/networking/kresd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kresd.nix)

## `services.kresd.package` {#opt-services.kresd.package}

The knot-resolver\_5 package to use.

*Type:* package

*Default:* `pkgs.knot-resolver_5`

*Example:* `knot-resolver_5.override { extraFeatures = true; }`

*Declared by:* [`nixos/modules/services/networking/kresd.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/kresd.nix)

## `services.krill.enable` {#opt-services.krill.enable}

Whether to enable Krill, RPKI CA and Publication Server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/networking/krill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/krill.nix)

## `services.krill.environmentFile` {#opt-services.krill.environmentFile}

Environment file for krill.

Krill requires an admin token to start.
Use this file to provide `KRILL_ADMIN_TOKEN=...`
(e.g. via agenix or sops-nix).

*Type:* null or absolute path

*Default:* `null`

*Example:* `"/run/secrets/krill"`

*Declared by:* [`nixos/modules/services/networking/krill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/krill.nix)

## `services.krill.package` {#opt-services.krill.package}

The krill package to use.

*Type:* package

*Default:* `pkgs.krill`

*Declared by:* [`nixos/modules/services/networking/krill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/krill.nix)

## `services.krill.settings` {#opt-services.krill.settings}

Configuration written to `krill.conf`.
See [https://krill.docs.nlnetlabs.nl/en/stable/config.html](https://krill.docs.nlnetlabs.nl/en/stable/config.html) for available options.

*Type:* open submodule of (TOML value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/networking/krill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/krill.nix)

## `services.krill.settings.log_type` {#opt-services.krill.settings.log_type}

Where Krill logs to.

*Type:* one of "stderr", "file", "syslog"

*Default:* `"stderr"`

*Declared by:* [`nixos/modules/services/networking/krill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/krill.nix)

## `services.krill.settings.storage_uri` {#opt-services.krill.settings.storage_uri}

Where Krill stores its data e.g. CA keys and the publication repository.
The default keeps it inside service state directory.

*Type:* string

*Default:* `"/var/lib/krill/data"`

*Declared by:* [`nixos/modules/services/networking/krill.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/krill.nix)

## `services.kthxbye.alertmanager.timeout` {#opt-services.kthxbye.alertmanager.timeout}

Alertmanager request timeout duration in the [time.Duration](https://pkg.go.dev/time#ParseDuration) format.

*Type:* string

*Default:* `"1m0s"`

*Example:* `"30s"`

*Declared by:* [`nixos/modules/services/monitoring/kthxbye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kthxbye.nix)

## `services.kthxbye.alertmanager.uri` {#opt-services.kthxbye.alertmanager.uri}

Alertmanager URI to use.

*Type:* string

*Default:* `"http://localhost:9093"`

*Example:* `"https://alertmanager.example.com"`

*Declared by:* [`nixos/modules/services/monitoring/kthxbye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kthxbye.nix)

## `services.kthxbye.enable` {#opt-services.kthxbye.enable}

Whether to enable kthxbye alert acknowledgement management daemon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/monitoring/kthxbye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kthxbye.nix)

## `services.kthxbye.extendBy` {#opt-services.kthxbye.extendBy}

Extend silences by adding DURATION seconds.

DURATION should be provided in the [time.Duration](https://pkg.go.dev/time#ParseDuration) format.

*Type:* string

*Default:* `"15m0s"`

*Example:* `"6h0m0s"`

*Declared by:* [`nixos/modules/services/monitoring/kthxbye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kthxbye.nix)

## `services.kthxbye.extendIfExpiringIn` {#opt-services.kthxbye.extendIfExpiringIn}

Extend silences that are about to expire in the next DURATION seconds.

DURATION should be provided in the [time.Duration](https://pkg.go.dev/time#ParseDuration) format.

*Type:* string

*Default:* `"5m0s"`

*Example:* `"1m0s"`

*Declared by:* [`nixos/modules/services/monitoring/kthxbye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kthxbye.nix)

## `services.kthxbye.extendWithPrefix` {#opt-services.kthxbye.extendWithPrefix}

Extend silences with comment starting with PREFIX string.

*Type:* string

*Default:* `"ACK!"`

*Example:* `"!perma-silence"`

*Declared by:* [`nixos/modules/services/monitoring/kthxbye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kthxbye.nix)

## `services.kthxbye.extraOptions` {#opt-services.kthxbye.extraOptions}

Extra command line options.

Documentation can be found [here](https://github.com/prymitive/kthxbye/blob/main/README.md).

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "-extend-with-prefix 'ACK!'"
];
```

*Declared by:* [`nixos/modules/services/monitoring/kthxbye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kthxbye.nix)

## `services.kthxbye.interval` {#opt-services.kthxbye.interval}

Silence check interval duration in the [time.Duration](https://pkg.go.dev/time#ParseDuration) format.

*Type:* string

*Default:* `"45s"`

*Example:* `"30s"`

*Declared by:* [`nixos/modules/services/monitoring/kthxbye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kthxbye.nix)

## `services.kthxbye.listenAddress` {#opt-services.kthxbye.listenAddress}

The address to listen on for HTTP requests.

*Type:* string

*Default:* `"0.0.0.0"`

*Example:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/monitoring/kthxbye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kthxbye.nix)

## `services.kthxbye.logJSON` {#opt-services.kthxbye.logJSON}

Format logged messages as JSON.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/kthxbye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kthxbye.nix)

## `services.kthxbye.maxDuration` {#opt-services.kthxbye.maxDuration}

Maximum duration of a silence, it won't be extended anymore after reaching it.

Duration should be provided in the [time.Duration](https://pkg.go.dev/time#ParseDuration) format.

*Type:* null or string

*Default:* `null`

*Example:* `"30d"`

*Declared by:* [`nixos/modules/services/monitoring/kthxbye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kthxbye.nix)

## `services.kthxbye.openFirewall` {#opt-services.kthxbye.openFirewall}

Whether to open ports in the firewall needed for the daemon to function.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/monitoring/kthxbye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kthxbye.nix)

## `services.kthxbye.package` {#opt-services.kthxbye.package}

The kthxbye package to use.

*Type:* package

*Default:* `pkgs.kthxbye`

*Declared by:* [`nixos/modules/services/monitoring/kthxbye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kthxbye.nix)

## `services.kthxbye.port` {#opt-services.kthxbye.port}

The port to listen on for HTTP requests.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `8080`

*Declared by:* [`nixos/modules/services/monitoring/kthxbye.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/monitoring/kthxbye.nix)

## `services.kubernetes.addonManager.addons` {#opt-services.kubernetes.addonManager.addons}

Kubernetes addons (any kind of Kubernetes resource can be an addon).

*Type:* attribute set of ((attribute set) or list of (attribute set))

*Default:* `{ }`

*Example:*

``` nix
{
  "my-service" = {
    "apiVersion" = "v1";
    "kind" = "Service";
    "metadata" = {
      "name" = "my-service";
      "namespace" = "default";
    };
    "spec" = { ... };
  };
}
// import <nixpkgs/nixos/modules/services/cluster/kubernetes/dns.nix> { cfg = config.services.kubernetes; };
```

*Declared by:* [`nixos/modules/services/cluster/kubernetes/addon-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/addon-manager.nix)

## `services.kubernetes.addonManager.bootstrapAddons` {#opt-services.kubernetes.addonManager.bootstrapAddons}

Bootstrap addons are like regular addons, but they are applied with cluster-admin rights.
They are applied at addon-manager startup only.

*Type:* attribute set of (attribute set)

*Default:* `{ }`

*Example:*

``` nix
{
  "my-service" = {
    "apiVersion" = "v1";
    "kind" = "Service";
    "metadata" = {
      "name" = "my-service";
      "namespace" = "default";
    };
    "spec" = { ... };
  };
}
```

*Declared by:* [`nixos/modules/services/cluster/kubernetes/addon-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/addon-manager.nix)

## `services.kubernetes.addonManager.enable` {#opt-services.kubernetes.addonManager.enable}

Whether to enable Kubernetes addon manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/addon-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/addon-manager.nix)

## `services.kubernetes.addons.dns.clusterDomain` {#opt-services.kubernetes.addons.dns.clusterDomain}

Dns cluster domain

*Type:* string

*Default:* `"cluster.local"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/addons/dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/addons/dns.nix)

## `services.kubernetes.addons.dns.clusterIp` {#opt-services.kubernetes.addons.dns.clusterIp}

Dns addon clusterIP

*Type:* string

*Default:* The `x.y.z.254` IP of
`config.services.kubernetes.apiserver.serviceClusterIpRange`.

*Declared by:* [`nixos/modules/services/cluster/kubernetes/addons/dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/addons/dns.nix)

## `services.kubernetes.addons.dns.corednsImage` {#opt-services.kubernetes.addons.dns.corednsImage}

Docker image to seed for the CoreDNS container.

*Type:* package

*Default:* `<derivation docker-image-coredns.tar.gz>`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/addons/dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/addons/dns.nix)

## `services.kubernetes.addons.dns.corefile` {#opt-services.kubernetes.addons.dns.corefile}

Custom coredns corefile configuration.

See: [https://coredns.io/manual/toc/#configuration](https://coredns.io/manual/toc/#configuration).

*Type:* string

*Default:*

``` nix
''
  .:10053 {
    errors
    health :10054
    kubernetes ${config.services.kubernetes.addons.dns.clusterDomain} in-addr.arpa ip6.arpa {
      pods insecure
      fallthrough in-addr.arpa ip6.arpa
    }
    prometheus :10055
    forward . /etc/resolv.conf
    cache 30
    loop
    reload
    loadbalance
  }
''
```

*Declared by:* [`nixos/modules/services/cluster/kubernetes/addons/dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/addons/dns.nix)

## `services.kubernetes.addons.dns.enable` {#opt-services.kubernetes.addons.dns.enable}

Whether to enable kubernetes dns addon.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/addons/dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/addons/dns.nix)

## `services.kubernetes.addons.dns.reconcileMode` {#opt-services.kubernetes.addons.dns.reconcileMode}

Controls the addon manager reconciliation mode for the DNS addon.

Setting reconcile mode to EnsureExists makes it possible to tailor DNS behavior by editing the coredns ConfigMap.

See: [https://github.com/kubernetes/kubernetes/blob/master/cluster/addons/addon-manager/README.md](https://github.com/kubernetes/kubernetes/blob/master/cluster/addons/addon-manager/README.md).

*Type:* one of "Reconcile", "EnsureExists"

*Default:* `"Reconcile"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/addons/dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/addons/dns.nix)

## `services.kubernetes.addons.dns.replicas` {#opt-services.kubernetes.addons.dns.replicas}

Number of DNS pod replicas to deploy in the cluster.

*Type:* signed integer

*Default:* `2`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/addons/dns.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/addons/dns.nix)

## `services.kubernetes.apiserver.advertiseAddress` {#opt-services.kubernetes.apiserver.advertiseAddress}

Kubernetes apiserver IP address on which to advertise the apiserver
to members of the cluster. This address must be reachable by the rest
of the cluster.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.allowPrivileged` {#opt-services.kubernetes.apiserver.allowPrivileged}

Whether to allow privileged containers on Kubernetes.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.apiAudiences` {#opt-services.kubernetes.apiserver.apiAudiences}

Kubernetes apiserver ServiceAccount issuer.

*Type:* string

*Default:* `"api,https://kubernetes.default.svc"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.authorizationMode` {#opt-services.kubernetes.apiserver.authorizationMode}

Kubernetes apiserver authorization mode (AlwaysAllow/AlwaysDeny/ABAC/Webhook/RBAC/Node). See
[https://kubernetes.io/docs/reference/access-authn-authz/authorization/](https://kubernetes.io/docs/reference/access-authn-authz/authorization/)

*Type:* list of (one of "AlwaysAllow", "AlwaysDeny", "ABAC", "Webhook", "RBAC", "Node")

*Default:*

``` nix
[
  "RBAC"
  "Node"
]
```

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.authorizationPolicy` {#opt-services.kubernetes.apiserver.authorizationPolicy}

Kubernetes apiserver authorization policy file. See
[https://kubernetes.io/docs/reference/access-authn-authz/authorization/](https://kubernetes.io/docs/reference/access-authn-authz/authorization/)

*Type:* list of (attribute set)

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.basicAuthFile` {#opt-services.kubernetes.apiserver.basicAuthFile}

Kubernetes apiserver basic authentication file. See
[https://kubernetes.io/docs/reference/access-authn-authz/authentication](https://kubernetes.io/docs/reference/access-authn-authz/authentication)

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.bindAddress` {#opt-services.kubernetes.apiserver.bindAddress}

The IP address on which to listen for the --secure-port port.
The associated interface(s) must be reachable by the rest
of the cluster, and by CLI/web clients.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.clientCaFile` {#opt-services.kubernetes.apiserver.clientCaFile}

Kubernetes apiserver CA file for client auth.

*Type:* null or absolute path

*Default:* `config.services.kubernetes.caFile`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.disableAdmissionPlugins` {#opt-services.kubernetes.apiserver.disableAdmissionPlugins}

Kubernetes admission control plugins to disable. See
[https://kubernetes.io/docs/admin/admission-controllers/](https://kubernetes.io/docs/admin/admission-controllers/)

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.enable` {#opt-services.kubernetes.apiserver.enable}

Whether to enable Kubernetes apiserver.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.enableAdmissionPlugins` {#opt-services.kubernetes.apiserver.enableAdmissionPlugins}

Kubernetes admission control plugins to enable. See
[https://kubernetes.io/docs/admin/admission-controllers/](https://kubernetes.io/docs/admin/admission-controllers/)

*Type:* list of string

*Default:*

``` nix
[
  "NamespaceLifecycle"
  "LimitRanger"
  "ServiceAccount"
  "ResourceQuota"
  "DefaultStorageClass"
  "DefaultTolerationSeconds"
  "NodeRestriction"
]
```

*Example:*

``` nix
[
  "NamespaceLifecycle"
  "NamespaceExists"
  "LimitRanger"
  "SecurityContextDeny"
  "ServiceAccount"
  "ResourceQuota"
  "PodSecurityPolicy"
  "NodeRestriction"
  "DefaultStorageClass"
]
```

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.etcd.caFile` {#opt-services.kubernetes.apiserver.etcd.caFile}

Etcd ca file.

*Type:* null or absolute path

*Default:* `config.services.kubernetes.caFile`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.etcd.certFile` {#opt-services.kubernetes.apiserver.etcd.certFile}

Etcd cert file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.etcd.keyFile` {#opt-services.kubernetes.apiserver.etcd.keyFile}

Etcd key file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.etcd.servers` {#opt-services.kubernetes.apiserver.etcd.servers}

List of etcd servers.

*Type:* list of string

*Default:*

``` nix
[
  "http://127.0.0.1:2379"
]
```

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.extraOpts` {#opt-services.kubernetes.apiserver.extraOpts}

Kubernetes apiserver extra command line options.

*Type:* strings concatenated with " "

*Default:* `""`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.extraSANs` {#opt-services.kubernetes.apiserver.extraSANs}

Extra x509 Subject Alternative Names to be added to the kubernetes apiserver tls cert.

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.featureGates` {#opt-services.kubernetes.apiserver.featureGates}

Attribute set of feature gates.

*Type:* attribute set of boolean

*Default:* `config.services.kubernetes.featureGates`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.kubeletClientCaFile` {#opt-services.kubernetes.apiserver.kubeletClientCaFile}

Path to a cert file for connecting to kubelet.

*Type:* null or absolute path

*Default:* `config.services.kubernetes.caFile`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.kubeletClientCertFile` {#opt-services.kubernetes.apiserver.kubeletClientCertFile}

Client certificate to use for connections to kubelet.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.kubeletClientKeyFile` {#opt-services.kubernetes.apiserver.kubeletClientKeyFile}

Key to use for connections to kubelet.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.preferredAddressTypes` {#opt-services.kubernetes.apiserver.preferredAddressTypes}

List of the preferred NodeAddressTypes to use for kubelet connections.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.proxyClientCertFile` {#opt-services.kubernetes.apiserver.proxyClientCertFile}

Client certificate to use for connections to proxy.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.proxyClientKeyFile` {#opt-services.kubernetes.apiserver.proxyClientKeyFile}

Key to use for connections to proxy.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.runtimeConfig` {#opt-services.kubernetes.apiserver.runtimeConfig}

Api runtime configuration. See
[https://kubernetes.io/docs/tasks/administer-cluster/cluster-management/](https://kubernetes.io/docs/tasks/administer-cluster/cluster-management/)

*Type:* string

*Default:* `"authentication.k8s.io/v1beta1=true"`

*Example:* `"api/all=false,api/v1=true"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.securePort` {#opt-services.kubernetes.apiserver.securePort}

Kubernetes apiserver secure port.

*Type:* signed integer

*Default:* `6443`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.serviceAccountIssuer` {#opt-services.kubernetes.apiserver.serviceAccountIssuer}

Kubernetes apiserver ServiceAccount issuer.

*Type:* string

*Default:* `"https://kubernetes.default.svc"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.serviceAccountKeyFile` {#opt-services.kubernetes.apiserver.serviceAccountKeyFile}

File containing PEM-encoded x509 RSA or ECDSA private or public keys,
used to verify ServiceAccount tokens. The specified file can contain
multiple keys, and the flag can be specified multiple times with
different files. If unspecified, --tls-private-key-file is used.
Must be specified when --service-account-signing-key is provided

*Type:* absolute path

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.serviceAccountSigningKeyFile` {#opt-services.kubernetes.apiserver.serviceAccountSigningKeyFile}

Path to the file that contains the current private key of the service
account token issuer. The issuer will sign issued ID tokens with this
private key.

*Type:* absolute path

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.serviceClusterIpRange` {#opt-services.kubernetes.apiserver.serviceClusterIpRange}

A CIDR notation IP range from which to assign service cluster IPs.
This must not overlap with any IP ranges assigned to nodes for pods.

*Type:* string

*Default:* `"10.0.0.0/24"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.storageBackend` {#opt-services.kubernetes.apiserver.storageBackend}

Kubernetes apiserver storage backend.

*Type:* one of "etcd2", "etcd3"

*Default:* `"etcd3"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.tlsCertFile` {#opt-services.kubernetes.apiserver.tlsCertFile}

Kubernetes apiserver certificate file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.tlsKeyFile` {#opt-services.kubernetes.apiserver.tlsKeyFile}

Kubernetes apiserver private key file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.tokenAuthFile` {#opt-services.kubernetes.apiserver.tokenAuthFile}

Kubernetes apiserver token authentication file. See
[https://kubernetes.io/docs/reference/access-authn-authz/authentication](https://kubernetes.io/docs/reference/access-authn-authz/authentication)

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.verbosity` {#opt-services.kubernetes.apiserver.verbosity}

Optional glog verbosity level for logging statements. See
[https://github.com/kubernetes/community/blob/master/contributors/devel/logging.md](https://github.com/kubernetes/community/blob/master/contributors/devel/logging.md)

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserver.webhookConfig` {#opt-services.kubernetes.apiserver.webhookConfig}

Kubernetes apiserver Webhook config file. It uses the kubeconfig file format.
See [https://kubernetes.io/docs/reference/access-authn-authz/webhook/](https://kubernetes.io/docs/reference/access-authn-authz/webhook/)

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/apiserver.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/apiserver.nix)

## `services.kubernetes.apiserverAddress` {#opt-services.kubernetes.apiserverAddress}

Clusterwide accessible address for the kubernetes apiserver,
including protocol and optional port.

*Type:* string

*Example:* `"https://kubernetes-apiserver.example.com:6443"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubernetes.caFile` {#opt-services.kubernetes.caFile}

Default kubernetes certificate authority

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubernetes.clusterCidr` {#opt-services.kubernetes.clusterCidr}

Kubernetes controller manager and proxy CIDR Range for Pods in cluster.

*Type:* null or string

*Default:* `"10.1.0.0/16"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubernetes.controllerManager.allocateNodeCIDRs` {#opt-services.kubernetes.controllerManager.allocateNodeCIDRs}

Whether to automatically allocate CIDR ranges for cluster nodes.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.bindAddress` {#opt-services.kubernetes.controllerManager.bindAddress}

Kubernetes controller manager listening address.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.clusterCidr` {#opt-services.kubernetes.controllerManager.clusterCidr}

Kubernetes CIDR Range for Pods in cluster.

*Type:* string

*Default:* `config.services.kubernetes.clusterCidr`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.enable` {#opt-services.kubernetes.controllerManager.enable}

Whether to enable Kubernetes controller manager.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.extraOpts` {#opt-services.kubernetes.controllerManager.extraOpts}

Kubernetes controller manager extra command line options.

*Type:* strings concatenated with " "

*Default:* `""`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.featureGates` {#opt-services.kubernetes.controllerManager.featureGates}

Attribute set of feature gates.

*Type:* attribute set of boolean

*Default:* `config.services.kubernetes.featureGates`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.kubeconfig.caFile` {#opt-services.kubernetes.controllerManager.kubeconfig.caFile}

Kubernetes controller manager certificate authority file used to connect to kube-apiserver.

*Type:* null or absolute path

*Default:* `config.services.kubernetes.caFile`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.kubeconfig.certFile` {#opt-services.kubernetes.controllerManager.kubeconfig.certFile}

Kubernetes controller manager client certificate file used to connect to kube-apiserver.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.kubeconfig.keyFile` {#opt-services.kubernetes.controllerManager.kubeconfig.keyFile}

Kubernetes controller manager client key file used to connect to kube-apiserver.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.kubeconfig.server` {#opt-services.kubernetes.controllerManager.kubeconfig.server}

Kubernetes controller manager kube-apiserver server address.

*Type:* string

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.leaderElect` {#opt-services.kubernetes.controllerManager.leaderElect}

Whether to start leader election before executing main loop.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.rootCaFile` {#opt-services.kubernetes.controllerManager.rootCaFile}

Kubernetes controller manager certificate authority file included in
service account's token secret.

*Type:* null or absolute path

*Default:* `config.services.kubernetes.caFile`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.securePort` {#opt-services.kubernetes.controllerManager.securePort}

Kubernetes controller manager secure listening port.

*Type:* signed integer

*Default:* `10252`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.serviceAccountKeyFile` {#opt-services.kubernetes.controllerManager.serviceAccountKeyFile}

Kubernetes controller manager PEM-encoded private RSA key file used to
sign service account tokens

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.tlsCertFile` {#opt-services.kubernetes.controllerManager.tlsCertFile}

Kubernetes controller-manager certificate file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.tlsKeyFile` {#opt-services.kubernetes.controllerManager.tlsKeyFile}

Kubernetes controller-manager private key file.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.controllerManager.verbosity` {#opt-services.kubernetes.controllerManager.verbosity}

Optional glog verbosity level for logging statements. See
[https://github.com/kubernetes/community/blob/master/contributors/devel/logging.md](https://github.com/kubernetes/community/blob/master/contributors/devel/logging.md)

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/controller-manager.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/controller-manager.nix)

## `services.kubernetes.dataDir` {#opt-services.kubernetes.dataDir}

Kubernetes root directory for managing kubelet files.

*Type:* absolute path

*Default:* `"/var/lib/kubernetes"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubernetes.easyCerts` {#opt-services.kubernetes.easyCerts}

Automatically setup x509 certificates and keys for the entire cluster.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubernetes.featureGates` {#opt-services.kubernetes.featureGates}

List set of feature gates.

*Type:* attribute set of boolean

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubernetes.flannel.enable` {#opt-services.kubernetes.flannel.enable}

Whether to enable flannel networking.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/flannel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/flannel.nix)

## `services.kubernetes.flannel.openFirewallPorts` {#opt-services.kubernetes.flannel.openFirewallPorts}

Whether to open the Flannel UDP ports in the firewall on all interfaces.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/flannel.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/flannel.nix)

## `services.kubernetes.kubeconfig.caFile` {#opt-services.kubernetes.kubeconfig.caFile}

Default kubeconfig certificate authority file used to connect to kube-apiserver.

*Type:* null or absolute path

*Default:* `config.services.kubernetes.caFile`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubernetes.kubeconfig.certFile` {#opt-services.kubernetes.kubeconfig.certFile}

Default kubeconfig client certificate file used to connect to kube-apiserver.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubernetes.kubeconfig.keyFile` {#opt-services.kubernetes.kubeconfig.keyFile}

Default kubeconfig client key file used to connect to kube-apiserver.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubernetes.kubeconfig.server` {#opt-services.kubernetes.kubeconfig.server}

Default kubeconfig kube-apiserver server address.

*Type:* string

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubernetes.kubelet.address` {#opt-services.kubernetes.kubelet.address}

Kubernetes kubelet info server listening address.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.clientCaFile` {#opt-services.kubernetes.kubelet.clientCaFile}

Kubernetes apiserver CA file for client authentication.

*Type:* null or absolute path

*Default:* `config.services.kubernetes.caFile`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.clusterDns` {#opt-services.kubernetes.kubelet.clusterDns}

List of DNS resolvers (IP addresses) used inside containers.

Defaulted to [`services.kubernetes.addons.dns.clusterIp`](#opt-services.kubernetes.addons.dns.clusterIp)
when [`services.kubernetes.addons.dns.enable`](#opt-services.kubernetes.addons.dns.enable) is `true`.

Refer to the list of configuration attributes for [KubeletConfiguration](https://kubernetes.io/docs/reference/config-api/kubelet-config.v1beta1/#kubelet-config-k8s-io-v1beta1-KubeletConfiguration).

*Type:* list of string

*Default:*

``` nix
[
  "10.1.0.1"
]
```

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.clusterDomain` {#opt-services.kubernetes.kubelet.clusterDomain}

Search DNS domain used inside containers.

Refer to the list of configuration attributes for [KubeletConfiguration](https://kubernetes.io/docs/reference/config-api/kubelet-config.v1beta1/#kubelet-config-k8s-io-v1beta1-KubeletConfiguration).

*Type:* string

*Default:* `config.services.kubernetes.addons.dns.clusterDomain`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.cni.config` {#opt-services.kubernetes.kubelet.cni.config}

Kubernetes CNI configuration.

*Type:* list of (attribute set)

*Default:* `[ ]`

*Example:*

``` nix
[{
  "cniVersion": "0.3.1",
  "name": "mynet",
  "type": "bridge",
  "bridge": "cni0",
  "isGateway": true,
  "ipMasq": true,
  "ipam": {
      "type": "host-local",
      "subnet": "10.22.0.0/16",
      "routes": [
          { "dst": "0.0.0.0/0" }
      ]
  }
} {
  "cniVersion": "0.3.1",
  "type": "loopback"
}]
```

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.cni.configDir` {#opt-services.kubernetes.kubelet.cni.configDir}

Path to Kubernetes CNI configuration directory.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.cni.packages` {#opt-services.kubernetes.kubelet.cni.packages}

List of network plugin packages to install.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.containerRuntimeEndpoint` {#opt-services.kubernetes.kubelet.containerRuntimeEndpoint}

Endpoint at which to find the container runtime api interface/socket

*Type:* string

*Default:* `"unix:///run/containerd/containerd.sock"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.enable` {#opt-services.kubernetes.kubelet.enable}

Whether to enable Kubernetes kubelet.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.extraConfig` {#opt-services.kubernetes.kubelet.extraConfig}

Kubernetes kubelet extra configuration file entries.

See also [Set Kubelet Parameters Via A Configuration File](https://kubernetes.io/docs/tasks/administer-cluster/kubelet-config-file/)
and [Kubelet Configuration](https://kubernetes.io/docs/reference/config-api/kubelet-config.v1beta1/).

*Type:* attribute set of (JSON value)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.extraOpts` {#opt-services.kubernetes.kubelet.extraOpts}

Kubernetes kubelet extra command line options.

*Type:* strings concatenated with " "

*Default:* `""`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.featureGates` {#opt-services.kubernetes.kubelet.featureGates}

Attribute set of feature gate

*Type:* attribute set of boolean

*Default:* `config.services.kubernetes.featureGates`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.healthz.bind` {#opt-services.kubernetes.kubelet.healthz.bind}

Kubernetes kubelet healthz listening address.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.healthz.port` {#opt-services.kubernetes.kubelet.healthz.port}

Kubernetes kubelet healthz port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `10248`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.hostname` {#opt-services.kubernetes.kubelet.hostname}

Kubernetes kubelet hostname override.

*Type:* string

*Default:* `config.networking.fqdnOrHostName`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.kubeconfig.caFile` {#opt-services.kubernetes.kubelet.kubeconfig.caFile}

Kubelet certificate authority file used to connect to kube-apiserver.

*Type:* null or absolute path

*Default:* `config.services.kubernetes.caFile`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.kubeconfig.certFile` {#opt-services.kubernetes.kubelet.kubeconfig.certFile}

Kubelet client certificate file used to connect to kube-apiserver.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.kubeconfig.keyFile` {#opt-services.kubernetes.kubelet.kubeconfig.keyFile}

Kubelet client key file used to connect to kube-apiserver.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.kubeconfig.server` {#opt-services.kubernetes.kubelet.kubeconfig.server}

Kubelet kube-apiserver server address.

*Type:* string

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.manifests` {#opt-services.kubernetes.kubelet.manifests}

List of manifests to bootstrap with kubelet (only pods can be created as manifest entry)

*Type:* attribute set of (attribute set)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.nodeIp` {#opt-services.kubernetes.kubelet.nodeIp}

IP address of the node. If set, kubelet will use this IP address for the node.

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.port` {#opt-services.kubernetes.kubelet.port}

Kubernetes kubelet info server listening port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `10250`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.registerNode` {#opt-services.kubernetes.kubelet.registerNode}

Whether to auto register kubelet with API server.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.seedDockerImages` {#opt-services.kubernetes.kubelet.seedDockerImages}

List of docker images to preload on system

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.taints` {#opt-services.kubernetes.kubelet.taints}

Node taints (https://kubernetes.io/docs/concepts/configuration/assign-pod-node/).

*Type:* attribute set of (submodule)

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.taints.<name>.effect` {#opt-services.kubernetes.kubelet.taints._name_.effect}

Effect of taint.

*Type:* one of "NoSchedule", "PreferNoSchedule", "NoExecute"

*Example:* `"NoSchedule"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.taints.<name>.key` {#opt-services.kubernetes.kubelet.taints._name_.key}

Key of taint.

*Type:* string

*Default:* Name of this submodule.

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.taints.<name>.value` {#opt-services.kubernetes.kubelet.taints._name_.value}

Value of taint.

*Type:* string

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.tlsCertFile` {#opt-services.kubernetes.kubelet.tlsCertFile}

File containing x509 Certificate for HTTPS.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.tlsKeyFile` {#opt-services.kubernetes.kubelet.tlsKeyFile}

File containing x509 private key matching tlsCertFile.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.unschedulable` {#opt-services.kubernetes.kubelet.unschedulable}

Whether to set node taint to unschedulable=true as it is the case of node that has only master role.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.kubelet.verbosity` {#opt-services.kubernetes.kubelet.verbosity}

Optional glog verbosity level for logging statements. See
[https://github.com/kubernetes/community/blob/master/contributors/devel/logging.md](https://github.com/kubernetes/community/blob/master/contributors/devel/logging.md)

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/kubelet.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/kubelet.nix)

## `services.kubernetes.lib` {#opt-services.kubernetes.lib}

Common functions for the kubernetes modules.

*Type:* attribute set

*Default:*

``` nix
{
  mkCert = <function, args: {CN, action?, fields?, hosts?, name, privateKeyGroup?, privateKeyOwner?}>;
  mkKubeConfig = <function>;
  mkKubeConfigOptions = <function>;
}
```

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubernetes.masterAddress` {#opt-services.kubernetes.masterAddress}

Clusterwide available network address or hostname for the kubernetes master server.

*Type:* string

*Example:* `"master.example.com"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubernetes.package` {#opt-services.kubernetes.package}

The kubernetes package to use.

*Type:* package

*Default:* `pkgs.kubernetes`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubernetes.path` {#opt-services.kubernetes.path}

Packages added to the services' PATH environment variable. Both the bin and sbin subdirectories of each package are added.

*Type:* list of package

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubernetes.pki.caCertPathPrefix` {#opt-services.kubernetes.pki.caCertPathPrefix}

Path-prefrix for the CA-certificate to be used for cfssl signing.
Suffixes ".pem" and "-key.pem" will be automatically appended for
the public and private keys respectively.

*Type:* string

*Default:* `"${config.services.cfssl.dataDir}/ca"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/pki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/pki.nix)

## `services.kubernetes.pki.caSpec` {#opt-services.kubernetes.pki.caSpec}

Certificate specification for the auto-generated CAcert.

*Type:* attribute set

*Default:*

``` nix
{
  CN = "kubernetes-cluster-ca";
  L = "auto-generated";
  O = "NixOS";
  OU = "services.kubernetes.pki.caSpec";
}
```

*Declared by:* [`nixos/modules/services/cluster/kubernetes/pki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/pki.nix)

## `services.kubernetes.pki.certs` {#opt-services.kubernetes.pki.certs}

List of certificate specs to feed to cert generator.

*Type:* attribute set

*Default:* `{ }`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/pki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/pki.nix)

## `services.kubernetes.pki.cfsslAPIExtraSANs` {#opt-services.kubernetes.pki.cfsslAPIExtraSANs}

Extra x509 Subject Alternative Names to be added to the cfssl API webserver TLS cert.

*Type:* list of string

*Default:* `[ ]`

*Example:*

``` nix
[
  "subdomain.example.com"
]
```

*Declared by:* [`nixos/modules/services/cluster/kubernetes/pki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/pki.nix)

## `services.kubernetes.pki.enable` {#opt-services.kubernetes.pki.enable}

Whether to enable easyCert issuer service.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/pki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/pki.nix)

## `services.kubernetes.pki.etcClusterAdminKubeconfig` {#opt-services.kubernetes.pki.etcClusterAdminKubeconfig}

Symlink a kubeconfig with cluster-admin privileges to environment path
(/etc/\<path\>).

*Type:* null or string

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/pki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/pki.nix)

## `services.kubernetes.pki.genCfsslAPICerts` {#opt-services.kubernetes.pki.genCfsslAPICerts}

Whether to automatically generate cfssl API webserver TLS cert and key,
if they don't exist.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/pki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/pki.nix)

## `services.kubernetes.pki.genCfsslAPIToken` {#opt-services.kubernetes.pki.genCfsslAPIToken}

Whether to automatically generate cfssl API-token secret,
if they doesn't exist.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/pki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/pki.nix)

## `services.kubernetes.pki.genCfsslCACert` {#opt-services.kubernetes.pki.genCfsslCACert}

Whether to automatically generate cfssl CA certificate and key,
if they don't exist.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/pki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/pki.nix)

## `services.kubernetes.pki.pkiTrustOnBootstrap` {#opt-services.kubernetes.pki.pkiTrustOnBootstrap}

Whether to always trust remote cfssl server upon initial PKI bootstrap.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/pki.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/pki.nix)

## `services.kubernetes.proxy.bindAddress` {#opt-services.kubernetes.proxy.bindAddress}

Kubernetes proxy listening address.

*Type:* string

*Default:* `"0.0.0.0"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/proxy.nix)

## `services.kubernetes.proxy.enable` {#opt-services.kubernetes.proxy.enable}

Whether to enable Kubernetes proxy.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/proxy.nix)

## `services.kubernetes.proxy.extraOpts` {#opt-services.kubernetes.proxy.extraOpts}

Kubernetes proxy extra command line options.

*Type:* strings concatenated with " "

*Default:* `""`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/proxy.nix)

## `services.kubernetes.proxy.featureGates` {#opt-services.kubernetes.proxy.featureGates}

Attribute set of feature gates.

*Type:* attribute set of boolean

*Default:* `config.services.kubernetes.featureGates`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/proxy.nix)

## `services.kubernetes.proxy.hostname` {#opt-services.kubernetes.proxy.hostname}

Kubernetes proxy hostname override.

*Type:* string

*Default:* `config.networking.hostName`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/proxy.nix)

## `services.kubernetes.proxy.kubeconfig.caFile` {#opt-services.kubernetes.proxy.kubeconfig.caFile}

Kubernetes proxy certificate authority file used to connect to kube-apiserver.

*Type:* null or absolute path

*Default:* `config.services.kubernetes.caFile`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/proxy.nix)

## `services.kubernetes.proxy.kubeconfig.certFile` {#opt-services.kubernetes.proxy.kubeconfig.certFile}

Kubernetes proxy client certificate file used to connect to kube-apiserver.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/proxy.nix)

## `services.kubernetes.proxy.kubeconfig.keyFile` {#opt-services.kubernetes.proxy.kubeconfig.keyFile}

Kubernetes proxy client key file used to connect to kube-apiserver.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/proxy.nix)

## `services.kubernetes.proxy.kubeconfig.server` {#opt-services.kubernetes.proxy.kubeconfig.server}

Kubernetes proxy kube-apiserver server address.

*Type:* string

*Declared by:* [`nixos/modules/services/cluster/kubernetes/proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/proxy.nix)

## `services.kubernetes.proxy.verbosity` {#opt-services.kubernetes.proxy.verbosity}

Optional glog verbosity level for logging statements. See
[https://github.com/kubernetes/community/blob/master/contributors/devel/logging.md](https://github.com/kubernetes/community/blob/master/contributors/devel/logging.md)

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/proxy.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/proxy.nix)

## `services.kubernetes.roles` {#opt-services.kubernetes.roles}

Kubernetes role that this machine should take.

Master role will enable etcd, apiserver, scheduler, controller manager
addon manager, flannel and proxy services.
Node role will enable flannel, docker, kubelet and proxy services.

*Type:* list of (one of "master", "node")

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubernetes.scheduler.address` {#opt-services.kubernetes.scheduler.address}

Kubernetes scheduler listening address.

*Type:* string

*Default:* `"127.0.0.1"`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/scheduler.nix)

## `services.kubernetes.scheduler.enable` {#opt-services.kubernetes.scheduler.enable}

Whether to enable Kubernetes scheduler.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/scheduler.nix)

## `services.kubernetes.scheduler.extraOpts` {#opt-services.kubernetes.scheduler.extraOpts}

Kubernetes scheduler extra command line options.

*Type:* strings concatenated with " "

*Default:* `""`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/scheduler.nix)

## `services.kubernetes.scheduler.featureGates` {#opt-services.kubernetes.scheduler.featureGates}

Attribute set of feature gates.

*Type:* attribute set of boolean

*Default:* `config.services.kubernetes.featureGates`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/scheduler.nix)

## `services.kubernetes.scheduler.kubeconfig.caFile` {#opt-services.kubernetes.scheduler.kubeconfig.caFile}

Kubernetes scheduler certificate authority file used to connect to kube-apiserver.

*Type:* null or absolute path

*Default:* `config.services.kubernetes.caFile`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/scheduler.nix)

## `services.kubernetes.scheduler.kubeconfig.certFile` {#opt-services.kubernetes.scheduler.kubeconfig.certFile}

Kubernetes scheduler client certificate file used to connect to kube-apiserver.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/scheduler.nix)

## `services.kubernetes.scheduler.kubeconfig.keyFile` {#opt-services.kubernetes.scheduler.kubeconfig.keyFile}

Kubernetes scheduler client key file used to connect to kube-apiserver.

*Type:* null or absolute path

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/scheduler.nix)

## `services.kubernetes.scheduler.kubeconfig.server` {#opt-services.kubernetes.scheduler.kubeconfig.server}

Kubernetes scheduler kube-apiserver server address.

*Type:* string

*Declared by:* [`nixos/modules/services/cluster/kubernetes/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/scheduler.nix)

## `services.kubernetes.scheduler.leaderElect` {#opt-services.kubernetes.scheduler.leaderElect}

Whether to start leader election before executing main loop.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/scheduler.nix)

## `services.kubernetes.scheduler.port` {#opt-services.kubernetes.scheduler.port}

Kubernetes scheduler listening port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `10251`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/scheduler.nix)

## `services.kubernetes.scheduler.verbosity` {#opt-services.kubernetes.scheduler.verbosity}

Optional glog verbosity level for logging statements. See
[https://github.com/kubernetes/community/blob/master/contributors/devel/logging.md](https://github.com/kubernetes/community/blob/master/contributors/devel/logging.md)

*Type:* null or signed integer

*Default:* `null`

*Declared by:* [`nixos/modules/services/cluster/kubernetes/scheduler.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/scheduler.nix)

## `services.kubernetes.secretsPath` {#opt-services.kubernetes.secretsPath}

Default location for kubernetes secrets. Not a store location.

*Type:* absolute path

*Default:*

``` nix
config.services.kubernetes.dataDir + "/secrets"
```

*Declared by:* [`nixos/modules/services/cluster/kubernetes/default.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/cluster/kubernetes/default.nix)

## `services.kubo.autoMigrate` {#opt-services.kubo.autoMigrate}

Whether Kubo should try to migrate its filesystem repository automatically.

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.autoMount` {#opt-services.kubo.autoMount}

Whether Kubo should try to mount /ipfs, /ipns and /mfs at startup.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.dataDir` {#opt-services.kubo.dataDir}

The data dir for Kubo

*Type:* string

*Default:*

``` nix
if lib.versionAtLeast config.system.stateVersion "17.09"
then "/var/lib/ipfs"
else "/var/lib/ipfs/.ipfs"
```

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.defaultMode` {#opt-services.kubo.defaultMode}

systemd service that is enabled by default

*Type:* one of "online", "offline", "norouting"

*Default:* `"online"`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.emptyRepo` {#opt-services.kubo.emptyRepo}

If set to false, the repo will be initialized with help files

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.enable` {#opt-services.kubo.enable}

Whether to enable the Interplanetary File System (WARNING: may cause severe network degradation).
NOTE: after enabling this option and rebuilding your system, you need to log out
and back in for the `IPFS_PATH` environment variable to be present in your shell.
Until you do that, the CLI tools won't be able to talk to the daemon by default
.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.enableGC` {#opt-services.kubo.enableGC}

Whether to enable automatic garbage collection

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.extraFlags` {#opt-services.kubo.extraFlags}

Extra flags passed to the Kubo daemon

*Type:* list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.group` {#opt-services.kubo.group}

Group under which the Kubo daemon runs

*Type:* string

*Default:* `"ipfs"`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.localDiscovery` {#opt-services.kubo.localDiscovery}

Whether to enable local discovery for the Kubo daemon.
This will allow Kubo to scan ports on your local network. Some hosting services will ban you if you do this.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.package` {#opt-services.kubo.package}

The kubo package to use.

*Type:* package

*Default:* `pkgs.kubo`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.serviceFdlimit` {#opt-services.kubo.serviceFdlimit}

The fdlimit for the Kubo systemd unit or `null` to have the daemon attempt to manage it

*Type:* null or signed integer

*Default:* `null`

*Example:* `65536`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.settings` {#opt-services.kubo.settings}

Attrset of daemon configuration.
See [https://github.com/ipfs/kubo/blob/master/docs/config.md](https://github.com/ipfs/kubo/blob/master/docs/config.md) for reference.
You can't set `Identity` or `Pinning`.

*Type:* open submodule of (JSON value)

*Default:* `{ }`

*Example:*

``` nix
{
  Bootstrap = [
    "/ip4/128.199.219.111/tcp/4001/ipfs/QmSoLSafTMBsPKadTEgaXctDQVcqN88CNLHXMkTNwMKPnu"
    "/ip4/162.243.248.213/tcp/4001/ipfs/QmSoLueR4xBeUbY9WZ9xGUUxunbKWcrNFTDAadQJmocnWm"
  ];
  Datastore = {
    StorageMax = "100GB";
  };
  Discovery = {
    MDNS = {
      Enabled = false;
    };
  };
  Swarm = {
    AddrFilters = null;
  };
}
```

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.settings.Addresses.API` {#opt-services.kubo.settings.Addresses.API}

Multiaddr or array of multiaddrs describing the address to serve the local HTTP API on.
In addition to the multiaddrs listed here, the daemon will also listen on a Unix domain socket.
To allow the ipfs CLI tools to communicate with the daemon over that socket,
add your user to the correct group, e.g. `users.users.alice.extraGroups = [ config.services.kubo.group ];`

*Type:* string or list of string

*Default:* `[ ]`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.settings.Addresses.Gateway` {#opt-services.kubo.settings.Addresses.Gateway}

Where the IPFS Gateway can be reached

*Type:* string or list of string

*Default:* `"/ip4/127.0.0.1/tcp/8080"`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.settings.Addresses.Swarm` {#opt-services.kubo.settings.Addresses.Swarm}

Where Kubo listens for incoming p2p connections

*Type:* list of string

*Default:*

``` nix
[
  "/ip4/0.0.0.0/tcp/4001"
  "/ip6/::/tcp/4001"
  "/ip4/0.0.0.0/udp/4001/quic-v1"
  "/ip4/0.0.0.0/udp/4001/quic-v1/webtransport"
  "/ip4/0.0.0.0/udp/4001/webrtc-direct"
  "/ip6/::/udp/4001/quic-v1"
  "/ip6/::/udp/4001/quic-v1/webtransport"
  "/ip6/::/udp/4001/webrtc-direct"
]
```

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.settings.Mounts.FuseAllowOther` {#opt-services.kubo.settings.Mounts.FuseAllowOther}

Allow all users to access the FUSE mount points

*Type:* boolean

*Default:* `true`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.settings.Mounts.IPFS` {#opt-services.kubo.settings.Mounts.IPFS}

Where to mount the IPFS namespace to

*Type:* string

*Default:* `"/ipfs"`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.settings.Mounts.IPNS` {#opt-services.kubo.settings.Mounts.IPNS}

Where to mount the IPNS namespace to

*Type:* string

*Default:* `"/ipns"`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.settings.Mounts.MFS` {#opt-services.kubo.settings.Mounts.MFS}

Where to mount the MFS namespace to

*Type:* string

*Default:* `"/mfs"`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.startWhenNeeded` {#opt-services.kubo.startWhenNeeded}

Whether to use socket activation to start Kubo when needed.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kubo.user` {#opt-services.kubo.user}

User under which the Kubo daemon runs

*Type:* string

*Default:* `"ipfs"`

*Declared by:* [`nixos/modules/services/network-filesystems/kubo.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/network-filesystems/kubo.nix)

## `services.kvrocks.enable` {#opt-services.kvrocks.enable}

Whether to enable the Kvrocks server.

*Type:* boolean

*Default:* `false`

*Example:* `true`

*Declared by:* [`nixos/modules/services/databases/kvrocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/kvrocks.nix)

## `services.kvrocks.group` {#opt-services.kvrocks.group}

Group under which Kvrocks runs.

*Type:* string

*Default:* `"kvrocks"`

*Declared by:* [`nixos/modules/services/databases/kvrocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/kvrocks.nix)

## `services.kvrocks.openFirewall` {#opt-services.kvrocks.openFirewall}

Whether to open the firewall for the kvrocks port.

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/kvrocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/kvrocks.nix)

## `services.kvrocks.package` {#opt-services.kvrocks.package}

The kvrocks package to use.

*Type:* package

*Default:* `pkgs.kvrocks`

*Declared by:* [`nixos/modules/services/databases/kvrocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/kvrocks.nix)

## `services.kvrocks.settings` {#opt-services.kvrocks.settings}

Configuration for kvrocks.
See [https://github.com/apache/kvrocks/blob/unstable/kvrocks.conf](https://github.com/apache/kvrocks/blob/unstable/kvrocks.conf) for supported options.

List values are emitted as repeated keys (for example `rename-command`),
except [`services.kvrocks.settings.bind`](#opt-services.kvrocks.settings.bind) which is space-separated
on a single line.

*Type:* open submodule of attribute set of (atom (null, bool, int, float or string) or a list of them for duplicate keys)

*Default:* `{ }`

*Example:*

``` nix
{
  maxclients = 10000;
  rename-command = [
    "KEYS \"\""
    "FLUSHDB \"\""
  ];
  workers = 8;
}
```

*Declared by:* [`nixos/modules/services/databases/kvrocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/kvrocks.nix)

## `services.kvrocks.settings.bind` {#opt-services.kvrocks.settings.bind}

The addresses to bind to.

*Type:* list of string

*Default:*

``` nix
[
  "127.0.0.1"
  "::1"
]
```

*Declared by:* [`nixos/modules/services/databases/kvrocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/kvrocks.nix)

## `services.kvrocks.settings.dir` {#opt-services.kvrocks.settings.dir}

Directory for database files.

*Type:* string

*Default:* `"/var/lib/kvrocks"`

*Declared by:* [`nixos/modules/services/databases/kvrocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/kvrocks.nix)

## `services.kvrocks.settings.port` {#opt-services.kvrocks.settings.port}

Accept connections on the specified port.

*Type:* 16 bit unsigned integer; between 0 and 65535 (both inclusive)

*Default:* `6666`

*Declared by:* [`nixos/modules/services/databases/kvrocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/kvrocks.nix)

## `services.kvrocks.settings.unixsocket` {#opt-services.kvrocks.settings.unixsocket}

Unix socket path.

*Type:* string

*Default:* `""`

*Example:* `"/run/kvrocks/kvrocks.sock"`

*Declared by:* [`nixos/modules/services/databases/kvrocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/kvrocks.nix)

## `services.kvrocks.socketActivation` {#opt-services.kvrocks.socketActivation}

Enable systemd socket activation for TCP.
Requires exactly one address in [`services.kvrocks.settings.bind`](#opt-services.kvrocks.settings.bind).

*Type:* boolean

*Default:* `false`

*Declared by:* [`nixos/modules/services/databases/kvrocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/kvrocks.nix)

## `services.kvrocks.user` {#opt-services.kvrocks.user}

User account under which Kvrocks runs.

*Type:* string

*Default:* `"kvrocks"`

*Declared by:* [`nixos/modules/services/databases/kvrocks.nix`](https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/databases/kvrocks.nix)
