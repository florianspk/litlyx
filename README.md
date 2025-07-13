# Litlyx Helm Repository

This repository hosts **Helm chart** for deploying **Litlyx**.

## Usage


### Install Litlyx with Helm

```bash
helm template -f <values-demo.yaml> oci://ghcr.io/florianspk/helm-charts/litlyx | k apply -f -
```
or
```bash
helm install oci://ghcr.io/florianspk/helm-charts/litlyx --version <version>
```

### Upgrade Litlyx
```bash
helm upgrade oci://ghcr.io/florianspk/helm-charts/litlyx --version <version>
```

---

## OCI Registry (GitHub Container Registry)

You can also pull the chart from **GHCR (OCI)**:

```bash
helm install litlyx oci://ghcr.io/florianspk/helm-charts/litlyx --version <version>
```

---

## Repository Structure
- This repo contains only the source Helm chart (`charts/litlyx/`).
- Built `.tgz` charts and the `index.yaml` are published separately on [https://florianspk.github.io/helm-charts](https://florianspk.github.io/helm-charts).

---

## License
Apache-2.0
