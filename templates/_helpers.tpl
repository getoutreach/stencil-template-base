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

# Register plugin w/ stencil-golang goreleaser to build plugin
{{- if (stencil.Arg "plugin") }}
{{- define "goreleaser_builds" }}
- main: ./plugin
  id: {{ .Config.Name }}
  goos:
    - linux
    - darwin
  goarch:
    - amd64
    - arm64
  ldflags:
    - '-w -s -X "github.com/getoutreach/gobox/pkg/app.Version=v{{ .Version }}"'
    - '-X "main.HoneycombTracingKey={{ .Env.HONEYCOMB_APIKEY }}"'
  env:
    - CGO_ENABLED=0
{{- end }}

{{ stencil.AddToModuleHook "github.com/getoutreach/stencil-golang" "goreleaser_builds" (stencil.ApplyTemplate "goreleaser_builds" | fromYaml) }}
{{- end }}
