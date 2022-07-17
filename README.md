# version-control

This project exists to manage version control systems (Github, Gitlab, etc) used to
support our applications. If you need to add a repo or make a change to its config,
this is the place to do it. 


## Naming Convention

* repo-$org-$repo.tf
* all-lower-kebab-case

## Quick-Start

1. Any *.tf file in the terraform/ folder will auto deploy when merged to main.
2. Copy one of the *.example files in the root.
3. Paste it into the terraform/ folder, providing a valid name ending in `.tf`.
4. Follow the comment instructions in your new file. 
5. Push to a feature branch and create a PR targeting `main`. 


### Examples

Example 1: `zbmowrey/mail-handler` becomes `repo-zbmowrey-mail-handler.tf`.

Example 2: `zbmowrey/zbmowrey-com` becomes `repo-zbmowrey-zbmowrey-com.tf`.

### Reasoning

Beginning each with "repo-" will ensure that they sort together, and make finding the various
terraform files a little easier. 

I'm aware that the file names look redundant, but this will avoid collision in larger
projects, where the possibility of having repositories with the same names is higher.

`zbmowrey/mail-handler` vs `repsales/mail-handler` for example. Thus, the org name becomes
important and should be retained to avoid issues as the projects grow.

## Deeper Dive - Adding a Repo

1. Copy the nearest neighbor in terms of desired functionality. 
2. Modify to your needs. 
3. Add secrets to terraform.auto.tfvars.
4. Add secrets to version-control.tf (this will load secrets into the version-control repo).
5. Add secrets to version-control/.github/workflows/deploy.yml (this will push secrets to your new repo).
6. Add secrets to your new repo. 
7. Commit & push changes to main branch. 
8. Monitor github for success. 
9. Update Github OIDC (aws-org or cloud-admin depending on project) so the new repo can deploy. 