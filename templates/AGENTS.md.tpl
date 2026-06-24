{{- file.Skip "Virtual file for AGENTS.md module hooks" }}

{{- define "templateDirectoryStructure" }}
* `templates/`: Templates for generating project files, such as `AGENTS.md.tpl` for the AGENTS.md file. Used in stencil-modules to define the structure and content of generated files.
{{- end }}

{{ stencil.AddToModuleHook "github.com/getoutreach/stencil-base" "agentsDirectoryStructure" (list (stencil.ApplyTemplate "templateDirectoryStructure")) }}

{{- define "templateAgentsReferences" }}
{{- end }}

{{ stencil.AddToModuleHook "github.com/getoutreach/stencil-base" "agentsReferencesTable" (list (stencil.ApplyTemplate "templateAgentsReferences")) }}

{{- define "templateAgentsOther" }}
{{- end }}

{{ stencil.AddToModuleHook "github.com/getoutreach/stencil-base" "agentsOther" (list (stencil.ApplyTemplate "templateAgentsOther")) }}
