---
layout: default
---

# Domingus, J. and Arundel, J. (2022). Cloud Native DevOps with Kubernetes, 2nd ed.

## 2024-06-12 (2024-06-10). Revolution in the Cloud. pp. 1–19.

Three revolutions:

1. Cloud services
2. The DevOps movement
3. Containerization

DevOps pillars:

1. Culture.
2. Automation
3. Measurement
4. Sharing

DevOps trinity:

1. People and culture
2. Process and practice
3. Tools and technology

Kubernetes is inspired by Borg (now Omega).

## 2024-06-16 (2024-06-12). First Steps with Kubernetes. pp. 21–31.

Local Kubernetes:

1. [Minikube](https://minikube.sigs.k8s.io/docs/)
2. [Docker Desktop](https://www.docker.com/products/docker-desktop/)

The most minimal `Dockerfile` can be built with `FROM scratch`.

## 2024-06-18 (2024-16-16). Getting Kubernetes. pp. 33–50.

Cluster architecture:

1. `kube-apiserver` handles API requests.
2. `etcd` is the database where Kubernetes stores its information.
3. `kube-scheduler` decides where to run new Pods.
4. `kube-controller-manager` runs resources controllers, eg.: Deployments.
5. `cloud-controller-manager` interacts wth the cloud provider and manages resources such as load balancers and disk volumes.

`worker nodes` are cluster members that run user-defined workloads.

Each `worker node` runs several generic components:

1. `kubelet` handles and monitors containers.
2. `kube-proxy` routes requests between Pods, Nodes, and the Internet.

Figure our whether to **buy or build** when deciding on installing Kubernetes or using a managed Kubernetes service. Self-hosted Kubernetes servers are cheaper but need more time investment to be set up.

Advanced setup for learning purposes: [Kubernetes the Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way).

Managed service providers (managed service option):

1. Google Kubernetes Engine (incl. Terraform)
2. Amazon Elastic Kubernetes Service
3. Azure Kubernetes Service
4. IBM Cloud Kubernetes Service
5. DigitalOcean Kubernetes
6. [Civo Cloud Computing Service](https://www.civo.com/)

Kubernetes installers (self-hosted option):

1. kops
2. Kubespray
3. kubeadm
4. Ranger Kubernetes Engine
5. Puppet Kubernetes Module

Run less software (Rich Archbold):

1. Choose standard technologies
2. Outsource undifferentiated heavy lifting
3. Create enduring competitive advantage

It's easy to switch between providers and self-hosted solutions since Kubernetes interfaces are standardized across the board.

Multicloud Kubernetes clusters (for managing mixed-infrastructure clusters):

1. WMware Tanzu
2. OpenShift
3. Anthos

Clusterless container services (one step beyond managed service providers):

1. AWS Fargate
2. Azure Container Instances
3. Google Cloud Run

## 2024-06-19 (2024-06-18). Working with Kubernetes Objects. pp. 53–67.

A _Deployment_ is a declarative specification which creates a _ReplicaSet_ which request _Pods_ to be created by Kubernetes controllers.

The Kubernetes `scheduler` is responsible for managing _Pods_.

All Kubernetes resources are represented by records in its internal database.

A _Service_ acts as a web proxy or load balancer.

Helm is a Kubernetes package manager which simplifies the boilerplate for manifests:

1. A Helm chart is a collection of manifests.
2. A Helm repository is a collection of Helm charts.
3. A Helm release is a specific instance of a Helm chart running in a Kubernetes cluster.

Each Helm release creates a _Secret_ with the release metadata.

It is possible to rollback Helm releases.

## 2024-06-24 (2024-06-19). Managing Resources. pp. 69–94.

Resource requests specify the minimum amount of resources that a _Pod_ needs to run.

1. CPU (or vCPU)
2. Memory (RAM)

Resource limits specify the maximum amount of resources that a _Pod_ is allowed to use.

_Pods_ are categorized under different Quality of Service classes:

1. `Guaranteed`—the most important _Pod_ to schedule.
2. `Burstable`—allowed to "burst" above their request up to their limit if capacity is available.
3. `BestEffort`—lowest priority which use whatever resources are available.

Probes:

1. `livenessProbe`—a health check which determines whether or not the container is alive via an endpoint (traditionally `.../healthz`).
2. `readinessProbe`—signals when the _Pod_ is ready to accept connections.
3. `startupProbe`—called before a `readinessProbe` to determine when readiness can be checked.

Why `.../healthz`? This naming convention originates from Google's internal _z-pages_ practice. _z-pages_ endpoints are set up to reduce collisions with real application endpoints.

Services such as [Prometheus](https://prometheus.io) use _z-pages_ to expose and collect metrics.

Similar endpoints such as `.../statusz` or `.../varz` may also be set up for application diagnostics. A more thorough answer can be found in Stack Overflow: <https://stackoverflow.com/a/43381061>. Additionally, see this Vimeo video for the rationale behind _z-pages_: <https://vimeo.com/173610242>.

[ChatGPT](https://chatgpt.com) provides some more context:

A `readinessProbe` is useful when a container takes a long time to start serving traffic or has known downtime from time to time. The container is in a `running` state but does not receive traffic until the `readinessProbe` succeeds.

It is useful when it is known that liveness checks will always fail on startup, such as when a [Dockerfile `CMD`](https://docs.docker.com/reference/dockerfile/#cmd) command runs migrations or compiles files before they can be served. It runs throughout the lifecyle of the container. When it fails the pod stops receiving traffic but is brought back when it is ready again.

A `startupProbe` is run before any other checks. It is useful when the container takes a long time to initialize which may fool Kubernetes into thinking it has failed when in fact it is slow to start.

Google Remote Procedure Call (gRPC) has standard health-checking protocols.

There are also file-based readiness probes: exec readiness probes.

`PodDisruptionBudgets` manage how many Pods can be descheduled when necessary.

`Namespaces` organize _Pods_ and other resources into logical units, eg.: for production, demo, testing purposes.

_Service_ DNS names follow this pattern: `[SERVICE].[NAMESPACE].svc.cluster.local`.

`ResourceQuotas` restrict resources and impose various limits on a specific _Namespace_.

`LimitRange` specify default resource limits for all containers.

Kubecost tracks costs.

The Vertical Pod Autoscaler adjusts resource requests based on what Pods use in practice.

It is recommended to add human-readable annotations on resources to provide information, eg.: `metadata.annotations.example.com/owner: "Customer Apps Team"`. The domain name prevents collisions with other annotations that share the same name.

`spec.ttlSecondsAfterFinished` cleans up _Jobs_ which have been completed but not removed, saving resources.

Reserved instances save money if you can plan long-term (i.e.: +2 years) usage.

`nodeAffinities` ensure that _Pods_ wich can't tolerate failure are not scheduled on preemtible nodes.

A Descheduler rebalances clusters when they are unbalanced.

## 2024-06-30 (2024-06-29). Operating Clusters. pp. 97–111.

High availability requires at least three nodes running the control plane components with two worker nodes.

Federated clusters synchronize workloads.

A single cluster is usually more than enough.

Use a single production and a single staging cluster.

Cloud Native Computing Foundation is the official owner of Kubernetes which provides various certifications for products, engineers, and vendors.

[Sonobuoy](https://sonobuoy.io/) is a diagnostic command-line tool which offers conformance testing for Kubernetes clusters.

Trust, but verify—use chaos testing to assert whethet the production cluster can handle unexpected faults:

1. [Netflix's](https://www.netflix.com/) [Chaos Monkey](https://github.com/Netflix/chaosmonkey)
2. chaoskube
3. kube-monke
4. PowerfulSeal

## 2024-06-30 (2024-06-29). Kubernetes Power Tools. pp. 113–133.

`kubectl` has many short flags for common arguments.

Resource types can be abbreviated.

Any Kubernetes resource can be transformed into a manifest file: `kubectl get ... -o yaml`. It is also possible to export to JSON with `... -o json`.

Watching logs or the state of various resources with `kubectl` is possible with the `-w` option.

Imperative commands should be used for testing and debugging, not for configuring production clusters.

Manage resources using manifests or Helm charts.

[BusyBox](https://www.busybox.net/) can be injected as a binary through a [Dockerfile](https://docs.docker.com/reference/dockerfile/) for easier debugging when building containers from [`scratch`](https://hub.docker.com/_/scratch/).

`kubectx` aliases several `kubectl` context commands and arguments for simpler contex switching.

`kubens` allows for easier namespace manipulation.

`kube-ps1` prints the current Kubernetes context in the command-line.

`kube-shell` is a wrapper for `kubectl` with a pop-up command auto-completion menu.

Click is an interactive version of `kubectl`.

`kubed-sh` runs containers which execute code on the current cluster.

Stern provides easier log management.

[Lens](https://k8slens.dev/) is an advanced visualizer and IDE for Kubernetes. It is a GUI application.

## 2024-07-02 (2024-06-30). Running Containers. pp. 135–152.

_Pods_ contain several related containers, such as microservices.

A container is an isolated process running on the host system.

Kubernetes employs the Container Runtime Interface which is implemented by Docker and other handlers.

Each container should run a single process.

A _Pod_ groups containers together which rely on each other for the program to work correctly.

Image identifiers may be versioned, a Git SHA, an environment, etc.

The default Kubernetes container registry is docker.io.

Avoid using the `latest` tag as it introduces uncertainty in the program.

Container tags are nondeterministic (their contents are updateable by pushing the same tag). Container digests are deterministic. A digest is a cryptographic hash of the image contents which immutably tags the image. It is recommended to keep container digests.

Specific tags (eg.: `python:3.9.7`) require maintenance while nonspecific tags (eg.: `python:3`) introduce uncertainity.

`spec.template.spec.containers[...].imagePullPolicy` sets the image pull policy:

1. `Always` pulls the image every time the container is started. Not recommended as it wastes time and bandwidth
2. `IfNotPresent` pulls the image if it is not already present. It is the default and is generally recommended.
3. `Never` will never update the image.

Environment variables are set in `spec.template.spec.containers[...].env`. A more flexible approach uses _ConfigMaps_ or _Secrets_.

`spec.template.spec.containers[...].securityContext` configures the container security:

1. `runAsUser: 1000` sets the UID with which to run the container. For maximum security a different UID should be set for each container of the _Pod_.
2. `runAsNonRoot: true` blocks running the container as the root user.
3. `readOnlyRootFilesystem: true` blocks the container from writing to its own filesystem.
4. `allowPrivilegeEscalation: false` blocks the container from promoting the user to root. Linux also has capabilities which achieves the same thing.
5. `capabilities` allow a program to gain specific capabilities which are more finely-grained compared to regular/root user. `drop` and `add` sets container capabilities.

`spec.securityContext` can set the security context for the _Pod_ rather than the container.

`spec.serviceAccountName` grants additional permissions to the _Pod_ by linking the service account by its name.

Containers are ephemeral. Volumes persist throughout deployments:

1. The simplest volume type is `emptyDir: {}` which does not persist across deployments.
2. `PersistentVolumes` and `PersistentVolumeClaims` create persistent volumes across deployments and _Pods_.

`spec.restartPolicy` configures the restart policy for _Pods_:

1. `Always` is the default.
2. `OnFailure` restarts if the container exits with a nonzero status.
3. `Never` does not restart the _Pod_.

`spec.imagePullSecrets` selects the _Secret_ to authenticate with the image registry if the image is private.

`spec.initContainers` loads sidecar containers which should start and exit successfully before the _Pod_ starts. Useful for running database migrations, bootstrap scripts, or other pre-flight checks.

## 2024-07-04 (2024-07-01). Managing Pods. pp. 155–178.

Labels (`metadata.labels`) help with identifying _Pods_ and for connecting resources together.

Labels are selected with `spec.selector`, matching `metadata.labels`.

Labels can also be directly connected with the `--selector` flag.

Labels can be combined, as well as selected with expressions.

Labels are performance-critical therefore limited to 63 characters.

Annotations are used for non-identifying information outside of Kubernetes.

Node affinities allow _Pods_ to be scheduled on certain nodes:

1. `requiredDuringSchedulingIgnoredDuringExecution` tag hard affinities.
2. `preferredDuringSchedulingIgnoredDuringExecution` tag soft affinities. They have a weight associated with them.

`podAntiAffinity` does the opposite effect. The spec is identical to regular affinities.

Affinities are a fine-tuning mechanism and are usually not needed. They allow to schedule Pods on the same cluser based on some criteria.

Taints allow a node to repel a set of Pods based on node properties: `kubectl taint nodes ...:NoSchedule`.

Taints can be removed with a trailing minus sign after the name of the taint: `...:NoSchedule-`.

Tolerations are Pod properties that describe the taints they're compatible with: `spec.tolerations`.

A _Pod_ that is unable to run due to tainted nodes will stay in Pending status: `FailedScheduling`.

Taints and tolerations help with marking nodes with specialized hardware such as GPUs which should only be compatible with specific Pods.

_Pod_ controllers help with managing Pods:

1. _ReplicaSets_ are the standard controllers scheduled by `Deployments`.
2. _DaemonSets_ are long-running controllers which help with running one copy of a Pod on each node in the cluster, such as for logging. This is the sidecar pattern.
3. _StatefulSets_ provide _Pods_ which start and stop in a specific sequence with specific names, allowing for the management of a cluster leader based on the _Pod_ names. Databases should be deployed as `StatefulSets`.
4. _Jobs_ are run a specified number of times until they are completed. `completions` determines the number of times the _Pod_ needs to run successfully and `parallelism` determines how many Pods should be run at the same time. `ttlSecondsAfterFinished: 0` will delete the _Pod_ as soon as it is complete.
5. _CronJobs_ run at regular intervals as specified by `spec.schedule`. `spec.jobTemplate` is the same as a normal `Job` manifest.
6. _HorizontalPodAutoscalers_ adjusts the number of replicas automatically based on a specified criteria, for example increasing replicas during peak hours and reducing replicas at night to save on computation costs.

[Custom Resource Definitions (CRDs)](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/) are objects not created by Kubernetes itself. Custom Operators can be found at https://operatorhub.io.

_Ingress_ exposes _Pods_ using _Service_ objects to the world.

_Ingress_ controllers are reponsible for managing _Ingress_ resources in a cluster:

1. `nginx-ingress` is a popular load balancer tool.
2. NGINX Ingress Controller.
3. Contour (Envoy) proxies requests between clients and _Pods_.
4. [Traefik](https://traefik.io/) is a lightweight proxy that can automatically manage TLS certificates such as those provided by [Let's Encrypt](https://letsencrypt.org/).
5. Kong hosts the Kong Plugin Hub which features OAuth authentication, LetsEncrypt certificates, IP restriction, metrics, and other useful features for load balancers.
6. HAProxy is another popular tool for load balancers.

_Ingress_ can proxy to different microservices based on the address.
_Ingress_ controllers can usually manage Transport Layer Security by themselves.

Service Meshes are responsible or managing more complex network operations suc as rate-limiting and encrypting network traffic between microservices:

1. Istio
2. Linkerd
3. Consul Connect
4. NGINX Service Mesh

## 2024-06-15 (2024-06-14). Configuration and Secrets. pp. 181–198.

_ConfigMaps_ and _Secrets_ store configuration details.

_ConfigMaps_ are transparent. _Secrets_ are obfuscated and encoded in base64 to prevent accidental exposure.

_Secrets_ are stored in the etcd Kubernetes database. These are encrypted at rest if properly configured.

_Secrets_ are managed by the Kubernetes access control mechanism—RBAC.

Dedicated _Secrets_ management tools:

1.  HashiCorp's Vault
2.  Square's Keywhiz
3.  AWS Secrets Manager
4.  Azure's Key Vault
5.  Google's Secret Manager

Helm uses a `helm-secrets` plugin to manage secrets.

Sops can securely encrypt secret files for storage in a version control repository.

Sops backends:

1.  [age](https://github.com/FiloSottile/age)
2.  Amazon's KMS
3.  Google Cloud's KMS

Bitnami's Sealed Secrets is an alternative to Sops. It generates `SealedSecrets` which can be stored in a version control repository.

## 2024-07-07. Security, Backups, and Cluster Health. pp. 199–219.

Role-Based Access Control is a Kubernetes system for controlling resource access.

RBAC works with _users_, _roles_, and _role bindings_.

`Role` and `ClusterRole` objects allow for administering access based on provided criteria. `RoleBinding` objects associate specific users with predefined roles.

Permissions are _additive_ in Kubernetes—users start with no permissions—additional permissions are added with `Roles` and `RoleBindings`.

Predefined roles `cluster-admin`, `edit`, and `view` cover most common use-cases.

All Pods run the _default_ service account in their namespace which have no associated roles.

Best practice is to enable RBAC for all clusters.

RBAC violations return a `Forbidden` (`RBAC DENY`) response when attempting to run unauthorized Pods.

There are automated tools which scan for security issues:

1. CNCF's Gatekeeper/OPA
2. kube-bench
3. Kubescape

There are tools which check for security problems and malware in third-party tools:

1. CoreOS' Clair
2. Aqua's Container Security Platform, kube-hunter, and Trivy
3. Anchore Engine—open source tool for scanning container images for security issues which include user-defined policies.
4. Docker's Synk—run with `docker scan`.

It is recommended to keep backups of current Kubernetes manifests in case of user errors or mistakes, such as accidentally deleting a namespace. Replication is not backup.

Velero is a free and open source tool that can back up and restore cluster state and persistent data.

Backups should be automated. Velero offers automation with `velero schedule create`.

There should be a detailed, step-by-step guide somewhere in the version control repository describing how to restore data in case of catastrophic failure. Each month should have a day dedicated to security testing by following the procedures and seeing if they work as described by different people.

Cluster status can be monitored through several tools:

1. With kubectl itself.
2. A cloud provider console.
3. A proxied Kubernetes Dashboard; it should never be exposed via HTTP.
4. Weave Scope
5. kube-ops-view
6. node-problem-detector—a Kubernetes add-on that can detect and report several kinds of node-level issues starting from the hardware.

## 2024-07-04 (2024-07-03). Deploying Kubernetes Applications. pp. 221–238.

[Helm](https://helm.sh/) is a Kubernetes package manager which helps in reducing the redundant boilerplate when reusing Kubernetes manifests.

Helm charts contain Go template language used to interpolate values from a values YAML file.

Values an be specified with a `--values` flag.

`helm inspect values ...` help in seeing available configuration values.

`helm rollback ...` rolls back to a previous Helm version, `--atomic` automatically rolls back a release if Pods enter a failed state.

[Helm chart repositories](https://helm.sh/docs/topics/chart_repository/) are an organized way to maintain reusable charts. They can be kept at https://chartmuseum.com, Artifactory, GitHub Pages, or in an existing web server.

Helm charts which contain secret values can be used with SOPS for easier management, placing environmental variables in a VCR and decrypting them right before a new release.

[Helmfiles](https://github.com/helmfile/helmfile) manages multiple Helm charts and dependencies with its own `helmfile.yaml` manifest, enabling deployments with a single command: `helmfile sync`.

Helm dependencies are used to release other Helm charts before release.

Other manifest management tools:

1.  kustomize allows for modifying of existing manifest files without altering them directly with a kustomization.
2.  Tanka uses Jsonnet for manifest management.
3.  Kapitan cofuses on sharing configuration values across multiple applications or clusters. Manifests are generated using either Jsonnet or Python-based Kadet engines.
4.  kompose converts `docker-compose.yml` files into Kubernetes manifests.
5.  Ansible can template Kubernetes manifests using its standard templating language Jinja.
6.  kubeval validates Kubernetes manifests to check if they are deployable.

## 2024-07-07 (2024-07-06). Development Workflow. pp. 239–250.

Development tools:

1. Google's [Skaffold](https://skaffold.dev/) is an open source tool designed to provide a quick local development workflow for Kubernetes. [Skaffold](https://skaffold.dev/) watches for changes, rebuilds containers, and deploys automatically to a designated cluster. A local development stack for [Skaffold](https://skaffold.dev/) may include [minikube](https://minikube.sigs.k8s.io/docs/) and [Docker](https://www.docker.com/), but there are also more options.
2. [Telepresence](https://www.telepresence.io/) runs in a real cluster as a placeholder for your application. Changes in application code is reflected in the live cluster without a new container having to be deployed.
3. HashiCorp's Waypoint allows you to define, build, deploy, config, and release steps for your application regardless of the runtime or platform it uses with a `waypoint.hcl` file.
4. Knative provides a standard mechanism for deploying all kinds of workloads to Kubernetes.
5. OpenFaaS includes a CLI tool for building and deploying functions to your clusters, and can trigger on HTTP events, a cron schedule, MQTT, Kafka, RabbitMQ messages, and other event-driven systems and message queues.
6. Crossplane is a tool that standardizes non-Kubernetes cloud resources.
7. [Octopus Deploy](https://octopus.com) is a hybrid environment CI/CD tool with a reputable clientele. Used for rolling out deployments in multiple environments across Windows machines and cloud servers. However, the pricing is on the higher end, there is no free tier, and the trial last for thirty days.

Deployment strategies:

1. `spec.strategy.type: RollingUpdate` is the default which upgrades Pods one at a time until all replicas are replaced with the new version. No downtime but more resource hungry.
2. `spec.strategy.type: Recreate` terminates all running replicas at once and creates new ones. Less resource hungry but introduces downtime.
3. Blue/Green deployments runs both versions at once, and with a _Service_ `spec.selector` changes the previous (blue) version t the new (green) version through labels. Very resource hungry, but ensures easy rollback back to the previous version if the new version does not work as expected.
4. Rainbow deployments runs many versions of Pods at once and iterates them using the same strategy as Blue/Green deployments.
5. Canary deployments runs a small handful of Pods to test whether they work under real-world requirements before full rollout.

`maxSurge` sets the maximum number of excess Pods. Can be set as a whole number or as a percentage.

`maxUnavailable` sets the maximum number of unavailable _Pods_. Can be set as a whole number or as a percentage.

`initContainers`, `Jobs`, and Helm hooks can handle database migrations as well as various other pre-flight checks before _Pods_ are run. Helm hooks are handled with `metadata.annotations.helm\.sh/hook: ...` and `metadata.annotations.helm\.sh/hook-delete-policy: ...`.

Failed hooks can be debugged by looking at their logs since they are not deleted by default.

Helm hooks can be chained with `metadata.annotation.helm\.sh/hook-weight: ...`.

Kubernetes `Operators` can also handle more complex deployment situations by building a custom set of tasks.

## 2024-07-07 (2024-07-06). Continuous Deployment in Kubernetes. pp. 253–269.

Continuous deployment is the automatic deployment of successful builds to production. Continuous integration is the automatic integration and testing of code changes against the head branch.

A typical CI/CD pipeline:

1. Changes are pushed.
2. The build system builds the current version of the code and runs tests.
3. Once all tests pass the container image is published into the container registry.
4. The built container is automatically deployed to a staging environment.
5. The staging environment undergoes some automated or manual acceptance tests.
6. The verified container image is deployed to production.

The key point of the pipeline is it's built around the container and not the code.

Hosted CI/CD tools:

1. Azure Pipelines
2. Google Cloud Build
3. Codefresh—is able to deploy temporary staging environments for feature branches.
4. GitHub Actions—built into GitHub itself. Can use runners outside of GitHub.
5. GitLab CI

Self-hosted CI/CD tools:

1. Jenkins—most mature and popular option.
2. Drone
3. Tekton
4. Concourse
5. Netflix's [Spinnaker](https://spinnaker.io/)—excels at large-scale and complex deployments.
6. Argo
7. Keel

GitOps involves using source control to track and manage infrastructure automatically.

Weaveworks' Flux is a popular GitOps tool which deployes changes to Kubernetes by polling a Git repository, watching for changes, and applying changes from the Flux Pods running inside the cluster.

## 2024-07-07 (2024-07-06). Observability and Monitoring. pp. 271–284.

Observability is the union between monitors, metrics, logs, and traces.

Closed-box monitoring ensures the program works as expected from a user's perspective, not from an internals perspective.

_Three nines_ means the system experiences about nine hours of downtime a year, which is a common standard for web appliations.

Cloud applications are always in a state of partial degradation.

Gray failures are cloud-based problems that are hard to detect by traditional observability methods.

Logs should be set in a standardized format such as JSON. Log aggregators help in querying logs:

1. Elasticsearch
2. Logstash
3. Kibana
4. Splunk
5. Loggly

Logs are hard to scale. Too many logs risk a poor signal-to-noise ratio, while too little logs don't let the developer know what _normal_ looks like.

Metrics give numerical information about what is happening in the application and help predict problems and potential bottlenecks.

Traces follow a single user request through its entire lifecyle and help with discovering bottlenecks:

1. Zipkin
2. Jaeger
3. Lightstep
4. Pixie

The OpenTracing framework aims to provide a standard set of APIs and libraries for distributed tracing.

Software is opaque by default. It is the developer's job to demistify software from the inside.

An observability pipeline decouples data sources from the destinations and provides a buffer.

Monitoring should mimic human behavior.

Building monitoring infrastructure is often costlier than using a third-party service.

The circuit breaker pattern makes the service take itself out if it detects a problem downstream to prevent requests being sent to it before the probem is fixed. This should be paired with a closed-box monitoring alert system.

Graceful degradation means a service takes down only a part of itself so the program can continue functioning except the parts which can not.

## 2024-06-08 (2024-06-07). Metrics in Kubernetes. pp. 285–311.

Requests-Errors-Duration pattern for each service.

Utilization-Saturation-Errors pattern for each resource.

Check the medians and percentiles and avoid the means.

Standard dashboard layout:

1.  One row per service.
2.  Request and error rate on the left with errors as a precentage of requests.
3.  Latency on the right.

Tools and services for gathering metrics:

4.  [Prometheus](https://prometheus.io/) and [Grafana](https://grafana.com/)
5.  Google Operations Suite
6.  AWS CloudWatch
7.  Azure Monitor
8.  [Datadog](https://www.datadoghq.com). No free plan.
9.  [New Relic](https://newrelic.com/). Free for up to certain tresholds. Application-focused.
