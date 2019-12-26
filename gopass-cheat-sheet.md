# GOPASS CHEAT SHEET

Secure passwords with [gopass][gopass]. It creates a folder tree, where encrypted files are the leaves.

```bash
gopass
├── my-company
│   └── pepe@my-company.com
└── personal
    └── pepe@personal.com
```

## GPG Keys

### List secret keys

```bash
gpg -k
```

### Create new key (required)

```bash
gpg --full-generate-key
```

## Initialize gopass

### Autocomplete

```bash
echo "source <(gopass completion bash)" >> ~/.bashrc
```

### Initialize new password store (required)

```bash
gopass init
```

Note: backup your private key in an encrypted disk.

## Using gopass

### List passwords

```bash
gopass ls
```

### Creating passwords

Default store location `~/.password-store/`

```bash
gopass insert my-company/willy@email.com
```

### Generate random pass

```bash
gopass generate my-company/anothername@rmail.com
```

### Search secrets

```bash
gopass search @email.com
```

### Show password in console

```bash
gopass my-company/willy@email.com
```

### Copy password to clipboard

```bash
gopass -c my-company/willy@email.com
```

## Using stores

Stores (AKA mounts) let you group your passwords. Example: `personal`, `company`.
Each one can live in a different repository, and you could share `company` with your peers.

### Initialize new store

Creates a new store located at `~/.password-store-my-company`.

```bash
gopass init --store my-company
```

### Add git remote to store

```bash
gopass git remote add --store my-company origin git@gh.com/Woile/keys.git
```

### Clone existing store

```bash
gopass clone git@gh.com/Woile/keys.git my-company --sync gitcli
```

## Synchronization

### Synchronize with remotes

```bash
gopass sync
```

### Synchronzing a single store

```bash
gopass sync --store my-company
```

## Team sharing

### Export public key

```bash
gpg -a --export willy@email.com > willy.pub.asc
```

### Check current recipients

```bash
gopass recipients
```

### Add public key into gopass

```bash
gpg --import < willy.pub.asc
```

```bash
gpg --list-keys
```

```bash
gopass recipients add willy@email.com
```

<div class="source">
[source][source] | [presentation][presentation] | [santiwilly][santiwilly]
</div>

[gopass]: https://gopass.pw
[source]: https://github.com/Woile/gopass-cheat-sheet
[presentation]: https://woile.github.io/gopass-presentation/
[santiwilly]: https://twitter.com/santiwilly
