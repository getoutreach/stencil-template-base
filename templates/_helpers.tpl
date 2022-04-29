{{ file.Skip "Helper function" }}
{{- define "toolVersions" }}
- name: golang
  version: 1.18.1
# Not used for gRPC clients
- name: nodejs
  version: 16.14.2
{{- end }}

# Registers our versions w/ stencil-base
{{ stencil.AddToModuleHook "github.com/getoutreach/stencil-base" "toolVersions" (stencil.ApplyTemplate "toolVersions" | fromYaml) }}
