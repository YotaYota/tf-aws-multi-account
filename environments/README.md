# Environments

Represent the sub-accounts which is per deploy environment.

Things that are created per environment goes in here.

## Differences between environments

The terraform function `count` is used to separate blocks per environments.

The code below would create the resource for "dev" but no other terraform
workspace.

```
count = terraform.workspace == "dev" ? 1 : 0
```
