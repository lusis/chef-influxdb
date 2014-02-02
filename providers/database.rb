# providers/database.rb
#
# Author: Simple Finance <ops@simple.com>
# License: Apache License, Version 2.0
# 
# Copyright 2013 Simple Finance Technology Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Creates or deletes an InfluxDB database

include InfluxDB::Helpers

def initialize(new_resource, run_context)
  super
  @name    = new_resource.name
  @admin_username = new_resource.admin_username
  @admin_password = new_resource.admin_password
  @client  = InfluxDB::Helpers.client(@admin_username, @admin_password)
end

action :create do
  @client.create_database(@name)
end

action :delete do
  @client.delete_database(@name)
end

