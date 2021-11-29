# version-control

This project exists to manage version control systems (Github, Gitlab, etc) used to
support our applications. If you need to add a repo or make a change to its config,
this is the place to do it. 

## Naming Convention

* repo-$org-$repo.tf
* all-lower-kebab-case

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