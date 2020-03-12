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

# Utility function for recursively finding files, e.g.
# ‘$(call rwildcard, path/to/dir, *.c *.h)’.
rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))

# Given a file name, produce the corresponding dependency file
# (e.g. ‘foo/bar.o’ becomes ‘foo/.bar.o.dep’).
filename-to-dep = $(dir $1).$(notdir $1).dep

# Return the full path to a program by looking it up in $PATH, or the
# empty string if not found.
find-program = $(shell for i in $$(IFS=: ; echo $$PATH); do p=$$i/$(strip $1); if [ -e $$p ]; then echo $$p; break; fi; done)

# Ensure that the given string ends in a single slash.
add-trailing-slash = $(patsubst %/,%,$(1))/
