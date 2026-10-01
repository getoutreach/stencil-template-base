{{- file.Skip "Virtual file for AGENTS.md module hooks" }}

{{- define "templateDirectoryStructure" }}
* `templates/`: Templates for generating project files, such as `AGENTS.md.tpl` for the AGENTS.md file. Used in stencil-modules to define the structure and content of generated files.
* `.snapshots/`: Contains snapshot files for testing template rendering outputs.
{{- end }}

{{ stencil.AddToModuleHook "github.com/getoutreach/stencil-base" "agentsDirectoryStructure" (list (stencil.ApplyTemplate "templateDirectoryStructure")) }}

{{- define "templateBoundariesAlways" }}
- run `make test` before push to remote to regenerate snapshots
{{- end }}

{{ stencil.AddToModuleHook "github.com/getoutreach/stencil-base" "agentsBoundariesAlways" (list (stencil.ApplyTemplate "templateBoundariesAlways")) }}
