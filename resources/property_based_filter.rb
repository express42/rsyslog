#
# Cookbook Name:: rsyslog
# Resource:: property_based_filter
#
# Author:: LLC Express 42 (info@express42.com)
#
# Copyright (C) 2015 LLC Express 42
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#

actions :create
default_action :create

attribute :name, kind_of: String, name_attribute: true
attribute :property, kind_of: String, required: true
attribute :operator, kind_of: String, required: true
attribute :match_string, kind_of: String, required: true
attribute :log_file, kind_of: String, required: true
attribute :priority, kind_of: Integer, default: 20
