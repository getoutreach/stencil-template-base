version: 2.1

orbs:
  shared: getoutreach/shared@dev:v1.55.1

jobs:
  ###Block(circleJobs)
{{ file.Block "circleJobs" }}
  ###EndBlock(circleJobs)

  release-dryrun:
    executor:
      name: shared/testbed-machine
    resource_class: xlarge
    steps:
      - shared/setup_environment:
          machine: true
      - shared/with_go_cache
      - shared/with_node_cache:
          save: true
      - run:
          name: Release (Dry-run)
          command: ./scripts/shell-wrapper.sh ci/release/dryrun.sh
      - shared/save_go_cache

  release:
    executor:
      name: shared/testbed-machine
    resource_class: xlarge
    steps:
      - shared/setup_environment:
          machine: true
      - shared/with_go_cache
      - shared/with_node_cache:
          save: true
      - run:
          name: Release
          command: GH_TOKEN=$OUTREACH_GITHUB_TOKEN yarn --frozen-lockfile semantic-release
      - shared/save_go_cache

workflows:
  version: 2
  ###Block(circleWorkflows)
{{ file.Block "circleWorkflows" }}
  ###EndBlock(circleWorkflows)
  build_and_test:
    jobs:
      - release-dryrun:
          ###Block(releaseDryrunConfig)
          {{- if file.Block "releaseDryrunConfig" }}
{{ file.Block "releaseDryrunConfig" }}
          {{- else }}
          filters:
            branches:
              ignore: main
          {{- end }}
          ###EndBlock(releaseDryrunConfig)
      - release:
          ###Block(releaseConfig)
          {{- if file.Block "releaseConfig" }}
{{ file.Block "releaseConfig" }}
          {{- else }}
          filters:
            branches:
              only: main
          {{- end }}
          ###EndBlock(releaseConfig)
