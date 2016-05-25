all: $(CONTEXT_ACCOUNT)_env
	@rm -rf .terraform
	wtf get
	wtf plan

apply:
	wtf apply

$(CONTEXT_ACCOUNT)_env:
	@true

_env:
	@echo This command needs a context.
	@false

