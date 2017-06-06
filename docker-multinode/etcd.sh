#!/bin/bash

# Copyright 2016 The Kubernetes Authors All rights reserved.
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

# Source common.sh
source $(dirname "${BASH_SOURCE}")/common.sh

kube::multinode::main

kube::multinode::log_variables

# TODO: turndown causing docker-daemon not to start
# kube::multinode::turndown

# We're running etcd in the bootstrap daemon, just
# to make minimal changes to docker-multinode. It's
# not necessary though, and we could remove that. 
kube::bootstrap::bootstrap_daemon
kube::multinode::start_etcd

kube::log::status "Done."
