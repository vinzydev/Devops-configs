{{/*
    _helpers.tpl
    This file contains template helper definitions for the frontend Helm chart.
    These helpers can be used throughout your chart templates for consistency and reuse.
*/}}

{{/*
    Expand the name of the chart.
    Usage: {{ include "frontend.name" . }}
*/}}
{{- define "frontend.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
    Create a full name for resources.
    Usage: {{ include "frontend.fullname" . }}
*/}}
{{- define "frontend.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
    Create a common labels block.
    Usage: {{ include "frontend.labels" . }}
*/}}
{{- define "frontend.labels" -}}
app.kubernetes.io/name: {{ include "frontend.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
    Selector labels for resources.
    Usage: {{ include "frontend.selectorLabels" . }}
*/}}
{{- define "frontend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "frontend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
    Helper to get the chart version.
    Usage: {{ include "frontend.chartVersion" . }}
*/}}
{{- define "frontend.chartVersion" -}}
{{ .Chart.Version | replace "+" "_" }}
{{- end -}}