// This file is used for testing templates

module github.com/{{ stencil.Arg "org" | default .Runtime.Box.Org  }}/{{ .Config.Name }}

go 1.17

require github.com/getoutreach/stencil {{ .Runtime.GeneratorVersion }}
