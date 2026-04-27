{{/*
MaaS environment variables — injected into every agent Deployment and the workbench.
Reads from the maas-credentials Secret when litemaas is enabled; uses empty strings otherwise.
*/}}
{{- define "agentops.maasEnv" -}}
- name: MAAS_API_BASE
  valueFrom:
    secretKeyRef:
      name: maas-credentials
      key: MAAS_API_BASE
      optional: true
- name: MAAS_API_KEY
  valueFrom:
    secretKeyRef:
      name: maas-credentials
      key: MAAS_API_KEY
      optional: true
- name: MAAS_MODEL_ID
  valueFrom:
    secretKeyRef:
      name: maas-credentials
      key: MAAS_MODEL_ID
      optional: true
{{- end }}

{{/*
MLflow tracking URI — in-cluster DNS, same for all agents and workbench.
*/}}
{{- define "agentops.mlflowUri" -}}
http://mlflow.{{ .Values.namespace }}.svc.cluster.local:5000
{{- end }}

{{/*
ChromaDB URL — in-cluster DNS.
*/}}
{{- define "agentops.chromadbUrl" -}}
http://chromadb.{{ .Values.namespace }}.svc.cluster.local:8000
{{- end }}
