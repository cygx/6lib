NAME := App-SixLib
VERSION := $(file < VERSION)
FULLNAME := $(NAME)-$(VERSION)
TARBALL := $(FULLNAME).tar.gz

dist: $(TARBALL)

upload: $(TARBALL)
	@perl6 -MCPAN::Uploader::Tiny -e 'CPAN::Uploader::Tiny.new(:user(prompt "user: "), :password(prompt "pass: ")).upload("$(TARBALL)")'

$(TARBALL): VERSION
	tar -T DIST.list --transform 's,^,$(FULLNAME)/,' -czf $@
