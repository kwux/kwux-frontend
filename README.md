# Kwux

Kwux is a source-available Application Model and Management Platform (AMMP),
helping technical teams
use the right tool for the job in all of their environments, no matter which
cloud or orchestration platform you choose.

## Status

Kwux is in `pre-alpha`, and not ready for use in production.

If you'd like early access to a preview version, sign up for the waitlist
at https://www.kwux.com !

## Quick start

1. Describe your application in the UI or YAML directly. Select templates like `Ruby on Rails - Postgres` to start with an opinionated stack, with components like an `Application`, a `Database (PostgreSQL)`, and an `In-memory database (Redis)`.
2. Create an `environment`, and select a default target platform (_e.g._ Docker or AWS)
   - Currently supported targets:
     - Local/Development:
       - [x] Docker / Docker Compose
     - Orchestration Platforms:
       -  [x] Hashicorp Nomad (`>= v1.4.1`)
       -  [x] Kubernetes (`>= 1.18`)
     - Cloud "Native" (using managed cloud services)
       - [x] Amazon Web Services (AWS)
         - [x] EC2 (via Docker/Docker-Compose)
         - [x] ECS
3. [Optional] Set a target platform override per component (_e.g._ AWS default, CloudFlare for external DNS).
   ```bash
   kwux set dev rails --target=AWS
   ```
4. [Optional] Define additional secrets either (via CLI and/or Web)
5. Transpile your `environment` to an intermediary Infrastructure as Code (IaC) representation
    - [Optional] for Web Interface; it'll handle this step for you!
    - Currently supported IaC targets and their supported platform/runtimes:
        - [x] Open Application Model (KubeVela)
            - [x] Kubernetes
        - [x] Terraform
            - Amazon Web Services (AWS)
        - [x] Terragrunt
            - Amazon Web Services (AWS)
        - [x] Docker Compose
            - Docker / Docker Compose

   ```bash
   kwux transpile dev
   ```

5. `deploy` the {Application, Environment} resources!
   ```bash
   kwux deploy dev
   ```

## Kwux Front-End (this project)

This project serves as the front-end interface to the application development platform,
providing a web-based UI/UX for users to interact with and
configure/define applications in the Kwux Platform.

## License

"Kwux", "KWUX", "kwux", the brand, term, logo, organization, its projects, and associated 
trademarks are owned by uMKR, Inc.

This repository uses multiple licenses.

Some files in this repository stem from original works which are licensed by 
their particular work's license. 
[`vendor/README.md`](https://github.com/kwux/kwux-frontend/blob/main/vendor/README.md) lists the repository for such cases, if
a license is not directly present in the file itself.
All modifications to these particular works are covered, to what extent applicable,
by the terms in this repository's [**LICENSE**](https://github.com/kwux/kwux-frontend/blob/main/LICENSE.md) file.

All other files and modifications are fair-code distributed under the 
[**Sustainable Use License**](https://github.com/kwux/kwux-frontend/blob/main/LICENSE.md)
and the [**Kwux Enterprise License**](https://github.com/kwux/kwux-frontend/blob/main/LICENSE_EE.md).

Additional information about the license model can be found at the n8n
the [documentation website](https://docs.n8n.io/reference/license/).