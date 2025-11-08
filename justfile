alias d := deploy
alias u := update
alias f := fetch

deploy:
    nh os switch .

fetch: && deploy
    git pull

update:
    nh os switch . --update

history:
    nix profile history --profile /nix/var/nix/profiles/system

clean:
    sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
    sudo nix-collect-garbage --delete-old
