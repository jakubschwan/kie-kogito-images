#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

@docker.io/apache/incubator-kie-kogito-data-index-ephemeral
@openshift-serverless-1/logic-data-index-ephemeral-rhel8
@docker.io/apache/incubator-kie-kogito-data-index-postgresql
@openshift-serverless-1/logic-data-index-postgresql-rhel8
@docker.io/apache/incubator-kie-kogito-jit-runner
@docker.io/apache/incubator-kie-kogito-jobs-service-ephemeral
@openshift-serverless-1/logic-jobs-service-ephemeral-rhel8
@docker.io/apache/incubator-kie-kogito-jobs-service-postgresql
@openshift-serverless-1/logic-jobs-service-postgresql-rhel8
@docker.io/apache/incubator-kie-sonataflow-builder
@openshift-serverless-1/logic-swf-builder-rhel8
@docker.io/apache/incubator-kie-kogito-base-builder
Feature: Common tests for Kogito images

  Scenario: Verify if Kogito user is correctly configured
    When container is started with command sh
    Then run sh -c 'echo $USER' in container and check its output for kogito
     And run sh -c 'echo $HOME' in container and check its output for /home/kogito
     And run sh -c 'id' in container and check its output for uid=1001(kogito) gid=1001(kogito) groups=1001(kogito),0(root)

