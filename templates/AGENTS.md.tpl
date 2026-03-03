{{- file.Skip "Virtual file for AGENTS.md module hooks" }}

{{- define "templateQuickStart" }}
{{- end }}

{{ stencil.AddToModuleHook "github.com/getoutreach/stencil-base" "projectQuickStart" (list (stencil.ApplyTemplate "templateQuickStart")) }}

{{- define "templateProjectDirectories" }}
* `templates/`: Templates for generating project files, such as `AGENTS.md.tpl` for the AGENTS.md file.
{{- end }}

{{ stencil.AddToModuleHook "github.com/getoutreach/stencil-base" "projectDirectories" (list (stencil.ApplyTemplate "templateProjectDirectories")) }}

{{- define "templateProjectCommands" }}
{{- end }}

{{ stencil.AddToModuleHook "github.com/getoutreach/stencil-base" "projectCommands" (list (stencil.ApplyTemplate "templateProjectCommands")) }}

{{- define "templateProjectCodeStyle" }}
{{- end }}

{{ stencil.AddToModuleHook "github.com/getoutreach/stencil-base" "projectCodeStyle" (list (stencil.ApplyTemplate "templateProjectCodeStyle")) }}
