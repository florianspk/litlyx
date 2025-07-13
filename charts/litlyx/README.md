# litlyx Helm Chart

![Artifact Hub](https://img.shields.io/badge/ArtifactHub-litlyx-blue)

## ⚠️ Warning

> **Important:**
> Ce projet est toujours en développement et n'est pas encore prêt pour une utilisation en production


## Description

Une Chart pour déployer **Litlyx**, cette application permet d'analyser les interactions des utilisateurs sur vos sites web.

---

## Installation

### Ajouter le repository:

```bash
helm repo add florianspk-charts https://florianspk.github.io/helm-charts
helm repo update
```

### Installer litlyx :

```bash
helm install litlyx florianspk-charts/litlyx --version 0.1.0
```

## Parameters

### Global configuration

Global settings applied to all components in the stack.

| Name                      | Description                                               | Value |
| ------------------------- | --------------------------------------------------------- | ----- |
| `global.imageRegistry`    | string - Default Docker image registry                    | `""`  |
| `global.imagePullSecrets` | array - List of image pull secrets for private registries | `[]`  |
| `global.storageClass`     | string - Default storage class for persistent volumes     | `""`  |

### Common metadata

Common labels and annotations applied to all Kubernetes resources.

| Name                | Description                                             | Value |
| ------------------- | ------------------------------------------------------- | ----- |
| `commonLabels`      | object - Kubernetes labels shared by all resources      | `{}`  |
| `commonAnnotations` | object - Kubernetes annotations shared by all resources | `{}`  |

### Producer service

Configuration for the Producer service, responsible for sending data to the stream.

| Name                                                     | Description                                          | Value                    |
| -------------------------------------------------------- | ---------------------------------------------------- | ------------------------ |
| `producer.enabled`                                       | bool - Enable or disable the Producer service        | `true`                   |
| `producer.image.registry`                                | string - Docker registry for Producer                | `docker.io`              |
| `producer.image.repository`                              | string - Image name for Producer                     | `litlyx/litlyx-producer` |
| `producer.image.tag`                                     | string - Image tag for Producer                      | `latest`                 |
| `producer.image.pullPolicy`                              | string - Kubernetes image pull policy                | `Always`                 |
| `producer.replicaCount`                                  | int - Number of replicas for Producer pods           | `1`                      |
| `producer.service.type`                                  | string - Service type (ClusterIP, NodePort, etc.)    | `ClusterIP`              |
| `producer.service.port`                                  | int - Service port for Producer                      | `3099`                   |
| `producer.service.targetPort`                            | int - Container port for Producer                    | `3099`                   |
| `producer.service.annotations`                           | object - Annotations for the Producer service        | `{}`                     |
| `producer.resources.limits.cpu`                          | string - CPU limit for Producer                      | `500m`                   |
| `producer.resources.limits.memory`                       | string - Memory limit for Producer                   | `512Mi`                  |
| `producer.resources.requests.cpu`                        | string - CPU request for Producer                    | `250m`                   |
| `producer.resources.requests.memory`                     | string - Memory request for Producer                 | `256Mi`                  |
| `producer.nodeSelector`                                  | object - Node selector rules                         | `{}`                     |
| `producer.tolerations`                                   | array - Toleration rules for scheduling              | `[]`                     |
| `producer.affinity`                                      | object - Affinity rules for pod scheduling           | `{}`                     |
| `producer.podAnnotations`                                | object - Annotations on the Producer pod             | `{}`                     |
| `producer.podSecurityContext`                            | object - Security context at pod level               | `{}`                     |
| `producer.securityContext`                               | object - Security context at container level         | `{}`                     |
| `producer.env.PORT`                                      | string - Environment variable for the listening port | `3099`                   |
| `producer.env.STREAM_NAME`                               | string - Kafka stream name                           | `LITLYX`                 |
| `producer.autoscaling.enabled`                           | bool - Enable autoscaling for Producer               | `false`                  |
| `producer.autoscaling.minReplicas`                       | int - Minimum number of replicas                     | `1`                      |
| `producer.autoscaling.maxReplicas`                       | int - Maximum number of replicas                     | `10`                     |
| `producer.autoscaling.targetCPUUtilizationPercentage`    | int - CPU target %                                   | `80`                     |
| `producer.autoscaling.targetMemoryUtilizationPercentage` | int - Memory target %                                | `80`                     |

### Consumer service

Configuration for the Consumer service, which reads and processes data from the stream.

| Name                                                     | Description                                          | Value                    |
| -------------------------------------------------------- | ---------------------------------------------------- | ------------------------ |
| `consumer.enabled`                                       | bool - Enable or disable the Consumer service        | `true`                   |
| `consumer.image.registry`                                | string - Docker registry for Consumer                | `docker.io`              |
| `consumer.image.repository`                              | string - Image name for Consumer                     | `litlyx/litlyx-consumer` |
| `consumer.image.tag`                                     | string - Image tag for Consumer                      | `latest`                 |
| `consumer.image.pullPolicy`                              | string - Kubernetes image pull policy                | `Always`                 |
| `consumer.replicaCount`                                  | int - Number of replicas for Consumer pods           | `1`                      |
| `consumer.service.type`                                  | string - Service type (ClusterIP, NodePort, etc.)    | `ClusterIP`              |
| `consumer.service.port`                                  | int - Service port for Consumer                      | `3031`                   |
| `consumer.service.targetPort`                            | int - Container port for Consumer                    | `3031`                   |
| `consumer.service.annotations`                           | object - Annotations for the Consumer service        | `{}`                     |
| `consumer.resources.limits.cpu`                          | string - CPU limit for Consumer                      | `500m`                   |
| `consumer.resources.limits.memory`                       | string - Memory limit for Consumer                   | `512Mi`                  |
| `consumer.resources.requests.cpu`                        | string - CPU request for Consumer                    | `250m`                   |
| `consumer.resources.requests.memory`                     | string - Memory request for Consumer                 | `256Mi`                  |
| `consumer.nodeSelector`                                  | object - Node selector rules                         | `{}`                     |
| `consumer.tolerations`                                   | array - Toleration rules for scheduling              | `[]`                     |
| `consumer.affinity`                                      | object - Affinity rules for pod scheduling           | `{}`                     |
| `consumer.podAnnotations`                                | object - Annotations on the Consumer pod             | `{}`                     |
| `consumer.podSecurityContext`                            | object - Security context at pod level               | `{}`                     |
| `consumer.securityContext`                               | object - Security context at container level         | `{}`                     |
| `consumer.env.PORT`                                      | string - Environment variable for the listening port | `3031`                   |
| `consumer.env.STREAM_NAME`                               | string - Kafka stream name                           | `LITLYX`                 |
| `consumer.env.GROUP_NAME`                                | string - Kafka consumer group name                   | `DATABASE`               |
| `consumer.email.enabled`                                 | bool - Enable email alerts in Consumer               | `false`                  |
| `consumer.email.service`                                 | string - Email provider service name                 | `Brevo`                  |
| `consumer.email.brevoApiKey`                             | string - API key for Brevo email service             | `""`                     |
| `consumer.autoscaling.enabled`                           | bool - Enable autoscaling for Consumer               | `false`                  |
| `consumer.autoscaling.minReplicas`                       | int - Minimum number of replicas                     | `1`                      |
| `consumer.autoscaling.maxReplicas`                       | int - Maximum number of replicas                     | `10`                     |
| `consumer.autoscaling.targetCPUUtilizationPercentage`    | int - CPU target %                                   | `80`                     |
| `consumer.autoscaling.targetMemoryUtilizationPercentage` | int - Memory target %                                | `80`                     |

### Dashboard

Configuration for the Litlyx dashboard component.

| Name                                                      | Description                                        | Value                     |
| --------------------------------------------------------- | -------------------------------------------------- | ------------------------- |
| `dashboard.enabled`                                       | bool - Enable the dashboard deployment             | `true`                    |
| `dashboard.image.registry`                                | string - Docker registry for the dashboard image   | `docker.io`               |
| `dashboard.image.repository`                              | string - Docker image repository for the dashboard | `litlyx/litlyx-dashboard` |
| `dashboard.image.tag`                                     | string - Image tag for the dashboard               | `latest`                  |
| `dashboard.image.pullPolicy`                              | string - Image pull policy                         | `Always`                  |
| `dashboard.replicaCount`                                  | int - Number of dashboard replicas                 | `1`                       |
| `dashboard.service.type`                                  | string - Service type (e.g., ClusterIP)            | `ClusterIP`               |
| `dashboard.service.port`                                  | int - Service port to expose                       | `3000`                    |
| `dashboard.service.targetPort`                            | int - Container port for dashboard                 | `3000`                    |
| `dashboard.service.annotations`                           | object - Service annotations                       | `{}`                      |
| `dashboard.resources.limits.cpu`                          | string - CPU limit for dashboard                   | `1000m`                   |
| `dashboard.resources.limits.memory`                       | string - Memory limit for dashboard                | `1Gi`                     |
| `dashboard.resources.requests.cpu`                        | string - CPU request for dashboard                 | `500m`                    |
| `dashboard.resources.requests.memory`                     | string - Memory request for dashboard              | `512Mi`                   |
| `dashboard.nodeSelector`                                  | object - Node selector for dashboard pods          | `{}`                      |
| `dashboard.tolerations`                                   | list - Tolerations for dashboard pods              | `[]`                      |
| `dashboard.affinity`                                      | object - Affinity rules for dashboard pods         | `{}`                      |
| `dashboard.podAnnotations`                                | object - Annotations for dashboard pods            | `{}`                      |
| `dashboard.podSecurityContext`                            | object - Security context for dashboard pod        | `{}`                      |
| `dashboard.securityContext`                               | object - Container security context for dashboard  | `{}`                      |
| `dashboard.env.NUXT_PORT`                                 | string - Nuxt server port                          | `3000`                    |
| `dashboard.env.NUXT_SELFHOSTED`                           | string - Self-hosted mode flag                     | `true`                    |
| `dashboard.env.NUXT_PUBLIC_SELFHOSTED`                    | string - Public self-hosted mode flag              | `true`                    |
| `dashboard.auth.mode`                                     | string - Authentication mode (NO_AUTH or GOOGLE)   | `NO_AUTH`                 |
| `dashboard.auth.jwtSecret`                                | string - JWT secret for auth                       | `litlyx_jwt_secret`       |
| `dashboard.auth.noAuthUser.email`                         | string - Email for no-auth default user            | `default@user.com`        |
| `dashboard.auth.noAuthUser.password`                      | string - Password for no-auth default user         | `litlyx123`               |
| `dashboard.auth.google.clientId`                          | string - Google OAuth client ID                    | `""`                      |
| `dashboard.auth.google.clientSecret`                      | string - Google OAuth client secret                | `""`                      |
| `dashboard.ai.enabled`                                    | bool - Enable AI features                          | `false`                   |
| `dashboard.ai.openai.organization`                        | string - OpenAI organization ID                    | `""`                      |
| `dashboard.ai.openai.project`                             | string - OpenAI project name                       | `""`                      |
| `dashboard.ai.openai.apiKey`                              | string - OpenAI API key                            | `""`                      |
| `dashboard.email.enabled`                                 | bool - Enable email notifications                  | `false`                   |
| `dashboard.email.service`                                 | string - Email service provider                    | `Brevo`                   |
| `dashboard.email.brevoApiKey`                             | string - API key for Brevo service                 | `""`                      |
| `dashboard.stripe.enabled`                                | bool - Enable Stripe integration                   | `false`                   |
| `dashboard.stripe.secretKey`                              | string - Stripe secret key for live mode           | `""`                      |
| `dashboard.stripe.webhookSecret`                          | string - Stripe webhook secret for live mode       | `""`                      |
| `dashboard.stripe.testMode`                               | bool - Enable test mode for Stripe                 | `false`                   |
| `dashboard.stripe.testSecretKey`                          | string - Stripe secret key for test mode           | `""`                      |
| `dashboard.stripe.testWebhookSecret`                      | string - Stripe webhook secret for test mode       | `""`                      |
| `dashboard.autoscaling.enabled`                           | bool - Enable horizontal pod autoscaler            | `false`                   |
| `dashboard.autoscaling.minReplicas`                       | int - Minimum number of replicas                   | `1`                       |
| `dashboard.autoscaling.maxReplicas`                       | int - Maximum number of replicas                   | `10`                      |
| `dashboard.autoscaling.targetCPUUtilizationPercentage`    | int - Target CPU utilization for autoscaling       | `80`                      |
| `dashboard.autoscaling.targetMemoryUtilizationPercentage` | int - Target memory utilization for autoscaling    | `80`                      |

### Ingress

Ingress settings for exposing services outside the cluster.

| Name                  | Description                               | Value   |
| --------------------- | ----------------------------------------- | ------- |
| `ingress.enabled`     | bool - Enable ingress controller          | `false` |
| `ingress.className`   | string - Ingress class name (e.g., nginx) | `""`    |
| `ingress.annotations` | object - Ingress annotations              | `{}`    |

### Service Monitor

ServiceMonitor configuration for Prometheus integration.

| Name                           | Description                                             | Value   |
| ------------------------------ | ------------------------------------------------------- | ------- |
| `serviceMonitor.enabled`       | bool - Enable Prometheus ServiceMonitor                 | `false` |
| `serviceMonitor.namespace`     | string - Namespace where ServiceMonitor will be created | `""`    |
| `serviceMonitor.interval`      | string - Scrape interval for Prometheus                 | `30s`   |
| `serviceMonitor.scrapeTimeout` | string - Timeout for scrape requests                    | `10s`   |
| `serviceMonitor.labels`        | object - Labels to add to ServiceMonitor                | `{}`    |

### MongoDB (internal)

MongoDB configuration using the Bitnami Helm chart.

| Name                                | Description                                           | Value                |
| ----------------------------------- | ----------------------------------------------------- | -------------------- |
| `mongodb.enabled`                   | bool - Enable internal MongoDB                        | `true`               |
| `mongodb.architecture`              | string - MongoDB architecture (standalone/replicaSet) | `standalone`         |
| `mongodb.auth.enabled`              | bool - Enable MongoDB authentication                  | `true`               |
| `mongodb.auth.rootUser`             | string - Root username                                | `root`               |
| `mongodb.auth.rootPassword`         | string - Root password                                | `root-password`      |
| `mongodb.auth.databases`            | array - Default database names                        | `["litlyx-metrics"]` |
| `mongodb.auth.usernames`            | array - Default usernames                             | `["litlyx-user"]`    |
| `mongodb.persistence.enabled`       | bool - Enable persistence for MongoDB                 | `true`               |
| `mongodb.persistence.size`          | string - Size of the persistent volume                | `8Gi`                |
| `mongodb.persistence.storageClass`  | string - StorageClass for PVC                         | `""`                 |
| `mongodb.resources.limits.cpu`      | string - CPU limit                                    | `1000m`              |
| `mongodb.resources.limits.memory`   | string - Memory limit                                 | `1Gi`                |
| `mongodb.resources.requests.cpu`    | string - CPU request                                  | `500m`               |
| `mongodb.resources.requests.memory` | string - Memory request                               | `512Mi`              |
| `mongodb.service.type`              | string - Service type (e.g., ClusterIP)               | `ClusterIP`          |
| `mongodb.service.ports.mongodb`     | int - MongoDB service port                            | `27017`              |

### Redis (internal)

| Name                                     | Description                                      | Value        |
| ---------------------------------------- | ------------------------------------------------ | ------------ |
| `redis.enabled`                          | bool - Enable internal Redis                     | `true`       |
| `redis.architecture`                     | string - Redis architecture (standalone/replica) | `standalone` |
| `redis.auth.enabled`                     | bool - Enable Redis authentication               | `true`       |
| `redis.auth.password`                    | string - Redis password                          | `litlyx`     |
| `redis.master.persistence.enabled`       | bool - Enable Redis persistence                  | `true`       |
| `redis.master.persistence.size`          | string - Size of the Redis volume                | `8Gi`        |
| `redis.master.persistence.storageClass`  | string - StorageClass for Redis PVC              | `""`         |
| `redis.master.resources.limits.cpu`      | string - CPU limit for Redis master              | `500m`       |
| `redis.master.resources.limits.memory`   | string - Memory limit for Redis master           | `512Mi`      |
| `redis.master.resources.requests.cpu`    | string - CPU request for Redis master            | `250m`       |
| `redis.master.resources.requests.memory` | string - Memory request for Redis master         | `256Mi`      |
| `redis.service.type`                     | string - Redis service type                      | `ClusterIP`  |
| `redis.service.ports.redis`              | int - Redis port                                 | `6379`       |

### External MongoDB

| Name                               | Description                                     | Value           |
| ---------------------------------- | ----------------------------------------------- | --------------- |
| `externalMongodb.enabled`          | bool - Use external MongoDB instead of internal | `false`         |
| `externalMongodb.connectionString` | string - Full MongoDB URI (overrides host/port) | `""`            |
| `externalMongodb.host`             | string - External MongoDB host                  | `""`            |
| `externalMongodb.port`             | int - External MongoDB port                     | `27017`         |
| `externalMongodb.database`         | string - Database name to use                   | `SimpleMetrics` |
| `externalMongodb.username`         | string - Username for authentication            | `""`            |
| `externalMongodb.password`         | string - Password for authentication            | `""`            |
| `externalMongodb.authSource`       | string - Authentication source (e.g., admin)    | `admin`         |

### External Redis

| Name                     | Description                                             | Value     |
| ------------------------ | ------------------------------------------------------- | --------- |
| `externalRedis.enabled`  | bool - Use external Redis instead of internal           | `false`   |
| `externalRedis.url`      | string - Redis connection URI (e.g., redis://host:port) | `""`      |
| `externalRedis.host`     | string - External Redis host                            | `""`      |
| `externalRedis.port`     | int - External Redis port                               | `6379`    |
| `externalRedis.username` | string - Username for Redis (default is "default")      | `default` |
| `externalRedis.password` | string - Redis password                                 | `""`      |

### Network Policies

| Name                                      | Description                             | Value   |
| ----------------------------------------- | --------------------------------------- | ------- |
| `networkPolicy.enabled`                   | bool - Enable network policies          | `false` |
| `networkPolicy.ingress.enabled`           | bool - Enable ingress rules             | `true`  |
| `networkPolicy.ingress.namespaceSelector` | object - Namespace selector for ingress | `{}`    |
| `networkPolicy.ingress.podSelector`       | object - Pod selector for ingress       | `{}`    |
| `networkPolicy.egress.enabled`            | bool - Enable egress rules              | `true`  |
| `networkPolicy.egress.rules`              | list - List of egress rules             | `[]`    |

### Pod Disruption Budget

| Name                               | Description                                     | Value   |
| ---------------------------------- | ----------------------------------------------- | ------- |
| `podDisruptionBudget.enabled`      | bool - Enable PDB                               | `false` |
| `podDisruptionBudget.minAvailable` | int - Minimum available pods during disruptions | `1`     |

### Security Context

| Name                           | Description                               | Value  |
| ------------------------------ | ----------------------------------------- | ------ |
| `securityContext.enabled`      | bool - Enable custom security context     | `true` |
| `securityContext.fsGroup`      | int - fsGroup ID for shared volume access | `1001` |
| `securityContext.runAsUser`    | int - UID to run the container            | `1001` |
| `securityContext.runAsGroup`   | int - GID to run the container            | `1001` |
| `securityContext.runAsNonRoot` | bool - Force non-root execution           | `true` |

### RBAC and Service Account

| Name                         | Description                                        | Value  |
| ---------------------------- | -------------------------------------------------- | ------ |
| `rbac.create`                | bool - Create necessary RBAC roles and bindings    | `true` |
| `serviceAccount.create`      | bool - Create a service account                    | `true` |
| `serviceAccount.name`        | string - Override the name of the service account  | `""`   |
| `serviceAccount.annotations` | object - Annotations to add to the service account | `{}`   |

### Init Containers

| Name                        | Description                         | Value   |
| --------------------------- | ----------------------------------- | ------- |
| `initContainers.enabled`    | bool - Enable init containers       | `false` |
| `initContainers.containers` | list - List of init container specs | `[]`    |

### Sidecars

| Name                  | Description                            | Value   |
| --------------------- | -------------------------------------- | ------- |
| `sidecars.enabled`    | bool - Enable sidecar containers       | `false` |
| `sidecars.containers` | list - List of sidecar container specs | `[]`    |

### Extra Volumes and Mounts

| Name                | Description                         | Value |
| ------------------- | ----------------------------------- | ----- |
| `extraVolumes`      | list - Extra volumes to mount       | `[]`  |
| `extraVolumeMounts` | list - Extra volume mounts for pods | `[]`  |

### Secrets

| Name                  | Description                                    | Value  |
| --------------------- | ---------------------------------------------- | ------ |
| `secrets.create`      | bool - Create secret resources from values     | `true` |
| `secrets.annotations` | object - Annotations to add to created secrets | `{}`   |
| `secrets.data`        | object - Key-value pairs of secret data        | `{}`   |

### Config Maps

| Name                     | Description                                        | Value  |
| ------------------------ | -------------------------------------------------- | ------ |
| `configMaps.create`      | bool - Create config maps from values              | `true` |
| `configMaps.annotations` | object - Annotations to add to created config maps | `{}`   |
| `configMaps.data`        | object - Key-value pairs of config data            | `{}`   |
