+++
title = "Glassi"
date = 2023-01-01
[taxonomies]
tags = ["Typescript", "React", "NextJS", "PostgreSQL", "TRPC", "i18n"]
kind = ["work"]
+++

Check it out [here](/preview/glassi)

## Generating window shape previews with SVG

For various places in our UI we needed to include user friendly previews of the glass they were ordering,
To keep it portable I opted to generate svg paths which could later also be exported as an actual image.

I still have a small prototype i made for this (although the rulers appear to be a bit broken atm)

<script type="module" crossorigin src="/embeds/glas-vormen/glasvormen.js"></script>
<link rel="stylesheet" href="/embeds/glas-vormen/glasvormen.css">
<div id="root"></div>
