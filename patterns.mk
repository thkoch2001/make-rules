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

$(buildprefix)%.o: %.cc
	@mkdir -p "$(dir $@)"
	$(trace-cxx) $(CXX) -o $@ -c $< $(GLOBAL_CXXFLAGS) $(GLOBAL_CXXFLAGS_PCH) $(CXXFLAGS) $($@_CXXFLAGS) -MMD -MF $(call filename-to-dep, $@) -MP

$(buildprefix)%.o: %.cpp
	@mkdir -p "$(dir $@)"
	$(trace-cxx) $(CXX) -o $@ -c $< $(GLOBAL_CXXFLAGS) $(GLOBAL_CXXFLAGS_PCH) $(CXXFLAGS) $($@_CXXFLAGS) -MMD -MF $(call filename-to-dep, $@) -MP

$(buildprefix)%.o: %.c
	@mkdir -p "$(dir $@)"
	$(trace-cc) $(CC) -o $@ -c $< $(GLOBAL_CFLAGS) $(CFLAGS) $($@_CFLAGS) -MMD -MF $(call filename-to-dep, $@) -MP
