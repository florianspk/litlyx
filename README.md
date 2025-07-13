# Litlyx Helm Repository

This repository hosts **Helm chart** for deploying **Litlyx**.

## Usage

### Add the Helm repository
```bash
helm repo add litlyx https://florianspk.github.io/helm-charts
helm repo update
```

### Install Litlyx with Helm
```bash
helm install litlyx litlyx/litlyx
```

### Upgrade Litlyx
```bash
helm upgrade litlyx litlyx/litlyx
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
