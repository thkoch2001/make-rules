# make-rules - Makefiles for doing non-recursive builds with GNU Make
# Copyright (C) <2014-2015> Eelco Dolstra <edolstra@gmail.com>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
# USA

# Run program $1 as part of ‘make installcheck’.
define run-install-test

  installcheck: $1

  _installcheck-list += $1

endef

installcheck:
	@total=0; failed=0; for i in $(_installcheck-list); do \
	  total=$$((total + 1)); \
	  echo "running test $$i"; \
	  if (cd $$(dirname $$i) && $(tests-environment) $$(basename $$i)); then \
	    echo "PASS: $$i"; \
	  else \
	    echo "FAIL: $$i"; \
	    failed=$$((failed + 1)); \
	  fi; \
	done; \
	if [ "$$failed" != 0 ]; then \
	  echo "$$failed out of $$total tests failed "; \
	  exit 1; \
	fi

.PHONY: check installcheck
