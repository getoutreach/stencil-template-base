{{- define "devbase.version" }}
{{- "1.55.1" }}
{{- end }}
versions:
  # HACK(jaredallard): Remove when stencil-base is cleaned up and bootstrap
  # is dead.
  devbase: v{{ stencil.ApplyTemplate "devbase.version" }}