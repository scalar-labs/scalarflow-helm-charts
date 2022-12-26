{{/*
Expand the name of the chart.
*/}}
{{- define "scalar-workflow-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "scalar-workflow-schema-loader.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}-schema-loader
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "scalar-workflow-api.fullname" -}}
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

{{- define "scalar-workflow-schema-loader.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- printf "%s-schema-loader" .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}-schema-loader
{{- else }}
{{- printf "%s-%s-schema-loader" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "scalar-workflow-api.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "scalar-workflow-api.labels" -}}
helm.sh/chart: {{ include "scalar-workflow-api.chart" . }}
{{ include "scalar-workflow-api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "scalar-workflow-schema-loader.labels" -}}
helm.sh/chart: {{ include "scalar-workflow-api.chart" . }}
{{ include "scalar-workflow-schema-loader.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "scalar-workflow-api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "scalar-workflow-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "scalar-workflow-schema-loader.selectorLabels" -}}
app.kubernetes.io/name: {{ include "scalar-workflow-schema-loader.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}-schema-loader
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "scalar-workflow-api.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "scalar-workflow-api.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
