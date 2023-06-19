# Scalar Helm Charts Repository

[![Release Charts](https://github.com/scalar-labs/scalarflow-helm-charts/actions/workflows/release.yml/badge.svg)](https://github.com/scalar-labs/scalarflow-helm-charts/actions/workflows/release.yml)


This directory contains the following helm charts.
* [ScalarFlow API](./scalarflow/charts/api/)
* [ScalarFlow Web](./scalarflow/charts/web/)


## Prerequisites

* Helm 3.5+

## Usage

### Helm

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```console
helm repo add scalarflow https://scalar-labs.github.io/scalarflow-helm-charts
```

You can then run `helm search repo scalarflow` to see the ScalarFlow charts.  
Also, you can see all the versions by `helm search repo scalarflow --versions` command.


## Contributing

This repo is mainly maintained by the Scalar Engineering Team, but of course we appreciate any help.
