# HACK(jaredallard): Remove when stencil-base is cleaned up
APP := {{ .Config.Name }}
OSS := true

_ := $(shell ./scripts/devbase.sh) 

include .bootstrap/root/Makefile