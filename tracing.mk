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

V ?= 0

ifeq ($(V), 0)

  trace-gen     = @echo "  GEN   " $@;
  trace-cc      = @echo "  CC    " $@;
  trace-cxx     = @echo "  CXX   " $@;
  trace-ld      = @echo "  LD    " $@;
  trace-ar      = @echo "  AR    " $@;
  trace-install = @echo "  INST  " $@;
  trace-javac   = @echo "  JAVAC " $@;
  trace-jar     = @echo "  JAR   " $@;
  trace-mkdir   = @echo "  MKDIR " $@;

  suppress  = @

endif
