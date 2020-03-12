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

clean-files :=

clean:
	$(suppress) rm -fv -- $(clean-files)

dryclean:
	@for i in $(clean-files); do if [ -e $$i ]; then echo $$i; fi; done | sort

print-top-help += \
  echo "  clean: Delete generated files"; \
  echo "  dryclean: Show what files would be deleted by 'make clean'";
