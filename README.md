# brannt-deleeuw-personal
## 1. git add
Stages changes for the next commit.
- `git add .` : Adds all changes in the current directory.
- `git add -A` : Adds all changes including deletions.
- `git add -p` : Interactively choose hunks of changes to add.

## 2. git push
Uploads local repository content to a remote repository.
- `git push origin main` : Pushes changes to the main branch.
- `git push -u origin branch_name` : Sets upstream for the branch.
- `git push --force` : Forces the push even if it results in a non-fast-forward merge.

## 3. git pull
Fetches from and integrates with another repository or a local branch.
- `git pull` : Pulls changes from the default remote and branch.
- `git pull --rebase` : Rebase the current branch on top of the upstream branch after fetching.

## 4. Changing the origin URL
Updates the remote repository URL.
- `git remote set-url origin <new_url>` : Changes the URL of the origin remote.
- `git remote -v` : Verifies the current remote URLs.

## 5. git stash
Temporarily shelves changes made to the working directory.
- `git stash` : Stashes current changes.
- `git stash list` : Lists all stashes.
- `git stash apply` : Applies the most recent stash.
- `git stash drop` : Removes a stash from the list.

## 6. git revert
Creates a new commit that undoes the changes from a previous commit.
- `git revert <commit>` : Reverts the specified commit.
- `git revert --no-commit <commit>` : Reverts without committing immediately.

## 7. git reset
Resets current HEAD to the specified state.
- `git reset --soft <commit>` : Keeps changes in the working directory and staging area.
- `git reset --mixed <commit>` : Keeps changes in the working directory but unstages them.
- `git reset --hard <commit>` : Discards all changes and resets to the specified commit.

## 8. git log
Shows the commit logs.
- `git log` : Displays the commit history.
- `git log --oneline` : Shows each commit on a single line.
- `git log --graph` : Visualizes the branch structure.

## 9. git diff
Shows changes between commits, commit and working tree, etc.
- `git diff` : Shows unstaged changes.
- `git diff --cached` : Shows staged changes.
- `git diff <commit1> <commit2>` : Shows differences between two commits.

## 10. git show
Displays information about a commit.
- `git show <commit>` : Shows details of the specified commit.
- `git show --stat` : Shows statistics of changes in the commit.
