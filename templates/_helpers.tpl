{{ file.Skip "Helper function" }}
{{- define "goModules" }}
- name: github.com/getoutreach/stencil
  version: {{ .Runtime.GeneratorVersion }}
{{- end }}

# Registers our versions w/ stencil-golang
{{ stencil.AddToModuleHook "github.com/getoutreach/stencil-golang" "go_modules" (stencil.ApplyTemplate "goModules" | fromYaml) }}
