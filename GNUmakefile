################################################################################
PREFIX ?= $(HOME)
DOT    ?= .

################################################################################
LIBS = $(shell find func lib os wids -type f)
DOTS = $(shell find dot -type f)

################################################################################
.PHONEY: install uninstall

################################################################################
# $1: Source file.
# $2: Destination name.
define INSTALL_FILE
install: $(PREFIX)/$(2)
$(PREFIX)/$(2): $(1)
	@ echo "==> $$@"
	@ mkdir -p `dirname $$@`
	@ sed "s|@prefix@|$(PREFIX)/$(DOT)|g" < $$< > $$@
endef

################################################################################
$(foreach f,$(LIBS),$(eval $(call INSTALL_FILE,$(f),$(DOT)zsh/$(f))))
$(foreach f,$(DOTS),$(eval $(call INSTALL_FILE,$(f),$(DOT)$(notdir $(f)))))

################################################################################
uninstall:
	rm -rf $(PREFIX)/$(DOT)zsh $(PREFIX)/$(DOT)zshenv $(PREFIX)/$(DOT)zshrc
