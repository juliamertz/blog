+++
title = "Continious deployment with nix on your own hardware"
date = 2025-01-10

[taxonomies]
tags = ["Rust", "Nix", "Javascript", "Websocket", "Git"]
kind = ["Open source"]
+++

I'm a big fan of self-hosting applications/websites that i make.
Though this comes with some challenges especially when you're quickly iterating and deploying.

previously i was using ansible scripts to automate large parts of this process but this had some major flaws:
1. This still required some manual action to trigger a rebuild
2. If dependencies changed the build could fail, which could be very bad since these operations aren't atomic.
3. Building software on a production server isn't the greatest of idea's

After previously having used platforms like Vercel and Netlify i wanted to try and make the same experience, 
but keep it fully local and language/framework agnostic

Since most of my projects already include a `flake.nix` and these describe how that software should be built
a large part of this problem is already solved by simply building the software with nix.

To keep software deployments declarative there is a minimal amount of state stored on the host system, all of which only serves as a cache to speed up re-starts. 
if the state is found to have changed in any way, it'll be considered invalid and will be regenerated.
