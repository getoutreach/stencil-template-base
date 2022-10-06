{{- if not (stencil.Arg "plugin") }}
# TODO: Merge this with stencil-golang's
{{ file.Skip "not a plugin, no need to build go assets" }}
{{- end }}
before:
  hooks:
    - make dep
builds:
  - main: ./plugin
    id: &name {{ .Config.Name }}
    binary: *name
    goos:
      - linux
      - darwin
    goarch:
      - amd64
      - arm64
    ldflags:
      - '-w -s -X "github.com/getoutreach/gobox/pkg/app.Version=v{{`{{ .Version }}`}}"'
      - '-X "main.HoneycombTracingKey={{`{{ .Env.HONEYCOMB_APIKEY }}`}}"'
    env:
      - CGO_ENABLED=0
archives: []
checksum:
  name_template: "checksums.txt"
release:
  # We handle releasing via semantic-release
  disable: true
