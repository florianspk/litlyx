{{/*
Expand the name of the chart.
*/}}
{{- define "litlyx.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "litlyx.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "litlyx.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "litlyx.labels" -}}
helm.sh/chart: {{ include "litlyx.chart" . }}
{{ include "litlyx.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Values.commonLabels }}
{{ toYaml . }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "litlyx.selectorLabels" -}}
app.kubernetes.io/name: {{ include "litlyx.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "litlyx.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "litlyx.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the secret to use
*/}}
{{- define "litlyx.secretName" -}}
{{- if .Values.secrets.create }}
{{- printf "%s-secrets" (include "litlyx.fullname" .) }}
{{- else }}
{{- printf "%s-secrets" (include "litlyx.fullname" .) }}
{{- end }}
{{- end }}

{{/*
Create MongoDB connection string
*/}}
{{- define "litlyx.mongoConnectionString" -}}
{{- if .Values.mongodb.enabled }}
{{- $host := printf "%s-mongodb" (include "litlyx.fullname" .) }}
{{- $port := .Values.mongodb.service.ports.mongodb }}
{{- $username := .Values.mongodb.auth.rootUser }}
{{- $password := .Values.mongodb.auth.rootPassword }}
{{- $database := .Values.mongodb.auth.database }}
{{- printf "mongodb://%s:%s@%s:%d/%s?readPreference=primaryPreferred&authSource=admin" $username $password $host (int $port) $database }}
{{- else if .Values.externalMongodb.enabled }}
{{- if .Values.externalMongodb.connectionString }}
{{- .Values.externalMongodb.connectionString }}
{{- else }}
{{- $host := .Values.externalMongodb.host }}
{{- $port := .Values.externalMongodb.port }}
{{- $username := .Values.externalMongodb.username }}
{{- $password := .Values.externalMongodb.password }}
{{- $database := .Values.externalMongodb.database }}
{{- $authSource := .Values.externalMongodb.authSource }}
{{- printf "mongodb://%s:%s@%s:%d/%s?readPreference=primaryPreferred&authSource=%s" $username $password $host (int $port) $database $authSource }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create Redis URL
*/}}
{{- define "litlyx.redisUrl" -}}
{{- if .Values.redis.enabled }}
{{- $host := printf "%s-redis-master" (include "litlyx.fullname" .) }}
{{- $port := .Values.redis.service.ports.redis }}
{{- printf "redis://%s:%d" $host (int $port) }}
{{- else if .Values.externalRedis.enabled }}
{{- if .Values.externalRedis.url }}
{{- .Values.externalRedis.url }}
{{- else }}
{{- $host := .Values.externalRedis.host }}
{{- $port := .Values.externalRedis.port }}
{{- printf "redis://%s:%d" $host (int $port) }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create Redis username
*/}}
{{- define "litlyx.redisUsername" -}}
{{- if .Values.redis.enabled }}
{{- "default" }}
{{- else if .Values.externalRedis.enabled }}
{{- .Values.externalRedis.username | default "default" }}
{{- end }}
{{- end }}

{{/*
Create MongoDB host for init containers
*/}}
{{- define "litlyx.mongoHost" -}}
{{- if .Values.mongodb.enabled }}
{{- printf "%s-mongodb" (include "litlyx.fullname" .) }}
{{- else if .Values.externalMongodb.enabled }}
{{- .Values.externalMongodb.host }}
{{- end }}
{{- end }}

{{/*
Create Redis host for init containers
*/}}
{{- define "litlyx.redisHost" -}}
{{- if .Values.redis.enabled }}
{{- printf "%s-redis-master" (include "litlyx.fullname" .) }}
{{- else if .Values.externalRedis.enabled }}
{{- .Values.externalRedis.host }}
{{- end }}
{{- end }}
