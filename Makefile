.PHONY: help
help: 
	@echo 'Usage: make [target]'
	@echo 'Available targets:'
	@echo
	@grep -Eo '^[-a-z/]+' Makefile | sort

.PHONY: prepare
prepare: 
	if test ! -d ~/.config; then mkdir -v ~/.config; fi

.PHONY: link
link: prepare
	stow -v -t ~ git
	stow -v -t ~ tmux

.PHONY: clean
clean:
	for i in $$(find . -type d -maxdepth 1); do stow -v -t ~ -D $$(basename $$i); done
