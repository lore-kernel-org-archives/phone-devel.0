Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F794EB64D9
	for <phone-devel@archiver.kernel.org>; Mon, 26 Jun 2023 18:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbjFZSzT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Jun 2023 14:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjFZSzT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Jun 2023 14:55:19 -0400
X-Greylist: delayed 174 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 26 Jun 2023 11:55:17 PDT
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1511497
        for <phone-devel@vger.kernel.org>; Mon, 26 Jun 2023 11:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687805358; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gTvlPaFFkUqMjLEsN7T2t++0A0/4lG5JxbsW8gugtKpTzKMWMseI/C7fERjtzS2e+O
    5QNZR/HbdyGEIjQjgnug7h1oChs25qh7R5b0mj5HCij+iJU2s1m/USbZMwRi50dSomOJ
    lXz7fztCuIs/pcgcLpZB+YtzT3MakxTrZrY7uYv5E8S4CasPUZ/Dk0VJ8X5VSJZrm+zx
    4jFvLzo6Ej0p3AdeaHYRgsTRRZN5VjYyZHxBxag+3DBXfamAc9SP1elOvJp6f9PprA6R
    LHwqHCEanqisydGc7sUx6dwFw+ohFSqvpC9tauIMF7R8ndA3/J9WN8oS2yHLbYAbwd4g
    F0ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1687805358;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=YR72hcQKmYRFAb3nq232zB+KiPXieSkk7Rrtf/OoNG0=;
    b=gwdeasnnLH1v1YHJ1ZMNub0WD0QUxpfJm/RYPalDMk4MU9KnAzxVlO+t3bIsua1jVd
    XgL3Q7DPTSRvedV0+QXAvkyFHaazDJMqZax1AXcf3dIOTWv7PP+3iEWoeFi8VM9/H7qz
    SXSmY/BBYh2cNjk641sR+uEs9BaLgMhG7GaIg7wT0fiETmGtCN3VoBar0A/n3ciUDvJE
    DMdAOV14dc6OkXuMzUA3d88t3roz6wundA8PevsJ/veDR+/XloicvkQV7axlzsCaDZuR
    g6EM2JbwqjwziNt29eT8JvrjXTUnsseCsDRB/gGshdo9ZLZNQU5zGAGU12TLn5YyXQVU
    +AnA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1687805358;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=YR72hcQKmYRFAb3nq232zB+KiPXieSkk7Rrtf/OoNG0=;
    b=JJflF0ZtYBsav7OBlToowM22CqXPzNocl4/VOZCB0yWlGvU9sAtNO+T4kNNi5rD4N0
    +NqTfzBStHAnN5utEgSA6l4pU0/3pORK/8XgS04tdgkFi0ibyMvvDk278qLVkmjovWEO
    9yDtbkYwaVsLVcQZpyoFtky7+a/XBxfBPJHsWnURtgSPxnCoVCe+2NHGRJPykMJad27b
    bjpcA5Ju3NOi/ZvaMTk7rwymIcSUA2WP33vyqsdrYJNPun6rHOCPRXL8bH8RvzZ+6lc6
    M2A0fgOjzYyN+w28h9XCkIxjj0LbmpGw5JQS59d2lxZ0IRsm5YcZAQ21OSkqa9CVxAdb
    CMSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1687805358;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=YR72hcQKmYRFAb3nq232zB+KiPXieSkk7Rrtf/OoNG0=;
    b=Y6gWWyM+PyH56EGN65Phm1vbkenhtTK9pHd+shiwapJptJA6ouQTlPwcKCPWSUC6eB
    QiB2QD/fzkaX3EkkMnBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGZhzY="
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 49.6.0 DYNA|AUTH)
    with ESMTPSA id jaf17fz5QInEmfj
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 26 Jun 2023 20:49:14 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v3 00/17] Imagination Technologies PowerVR DRM driver
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <e4ec5cff0044ca307cfa71a20bc0a07c6a8123a2.camel@imgtec.com>
Date:   Mon, 26 Jun 2023 20:48:13 +0200
Cc:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
        Donald Robson <Donald.Robson@imgtec.com>,
        "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "matthew.brost@intel.com" <matthew.brost@intel.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "dakr@redhat.com" <dakr@redhat.com>,
        "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
        Sarah Walker <Sarah.Walker@imgtec.com>,
        openpvrsgx-devgroup@letux.org,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        kernel@pyra-handheld.com, merlijn@wizzup.org,
        phone-devel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <208D596A-5F22-479B-9125-81E8A6A3D90B@goldelico.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <CACRpkdYAAxvHLfEGFwaHQYvZRNhySNo7gSVEBSgGP-pusBwBnQ@mail.gmail.com>
 <CC39D823-AAE1-4D23-8BFE-70823E737DC2@goldelico.com>
 <e4ec5cff0044ca307cfa71a20bc0a07c6a8123a2.camel@imgtec.com>
To:     Frank Binns <Frank.Binns@imgtec.com>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Frank,
I have added Merlijn who is doing a lot with PVRSGX for Maemo-Leste and =
the
phone-devel list since most SoC we find using a PVRSGX are smartphone =
processors.

> Am 26.06.2023 um 15:45 schrieb Frank Binns <Frank.Binns@imgtec.com>:
>=20
> Hi Nikolaus,
>=20
>>=20
>> Some questions to the author of the new driver:
>> - are there plans to support SGX5 (the predecessor of Rogue6)?
>=20
> We don't currently have any plans to support SGX. Our main focus is =
currently on
> Rogue and then we'll move onto Volcanic.

Okay, that's completely understandable from a commercial perspective.

>=20
>> - will this be able to run the existing firmware and user-space code =
of pvrsrvkm?
>=20
> I'm afraid not. The interface for existing firmware and userspace code =
were
> designed with different requirements in mind and don't cater to the =
kernel's
> strict compatibility guarantees. As such, the uapi for this new driver =
is
> very different to pvrsrvkm's, although naturally there are =
similarities:
> =
https://gitlab.freedesktop.org/sarah-walker-imgtec/powervr/-/blob/dev/v3/i=
nclude/uapi/drm/pvr_drm.h

This makes sense. So the new Rogue/Volcanic and the older PVRSGX drivers =
should
be able to coexist (at least in source code as there is no hardware =
having both).

> We've also worked with our firmware team to make changes to the =
firmware
> interface to better support this new driver. Specifically, parts of =
the firmware
> interface are no longer conditional on the GPU feature set / hardware
> workarounds, meaning we now have a single interface which can work =
across all
> existing Rogue GPUs, which makes things a lot easier for this new =
kernel driver.

That is what I have dreamed of for SGX as well.

We could have replaced all the #if for specific versions and errata by =
some code
to runtime check with the device tree for the specific SGX version.

But this was never done because it is complex, difficult to automate and =
our means
for testing things are limited. And we could not decide which DDK =
version we
should build on as there is no common denominator for all SoC.

>=20
>> - or will it have new firmware and user-space code for these older =
chips?
>> - or will there be open user-space code for SGX (and Rogue)?
>=20
> We're using the same Rogue firmware as our closed source driver, just =
with
> modifications to the interface to cater for this new kernel driver. In =
terms of

Ok. Well, it was to be expected that SGX and Rogue firmware are quite =
different.

> userspace, we already have a Vulkan driver upstreamed to Mesa:
> =
https://gitlab.freedesktop.org/mesa/mesa/-/tree/main/src/imagination/vulka=
n

Nice!

>=20
> and will be working to enable GLES support via Mesa's Zink =
GL(ES)-to-Vulkan
> translation layer. This naturally limits support to Series 6 onwards, =
as
> anything older isn't capable of supporting Vulkan.

I see.

>=20
>>=20
>>> Specifically I would ask that the DT bindings include all old and =
new PowerVR
>>> hardware in one go, unless they have very specific hardware =
definition needs,
>>> which I doubt.
>>=20
>> Our current bindings for all SoC with a SGX5 GPU inside and which =
have at least
>> some official Linux support are here:
>>=20
>> =
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/blob/letux/omap-pv=
r-soc-glue-v8/Documentation/devicetree/bindings/gpu/img%2Cpvrsgx.yaml
>>=20
>> There was an attempt to upstream at least this plus glue code (i.e. =
device tree
>> sources) some years ago but there was no consensus about the number =
and names of
>> clocks that should be included in such a bindings document.
>=20
> I've taken a look and your bindings look very similar to the ones =
we've come up
> with. If you decide to attempt to upstream these again, please feel =
free to CC
> me, Sarah and Donald (all on this email chain) so we can provide some =
feedback.

That is good!

It would be a good moment to give it another try as we can have even =
more
reviewers than before...

>=20
>>=20
>>> Also I think they could use your help to get the proper firmware for =
the older
>>> hardware licensed properly from Imagination and included into =
linux-firmware
>>> so they do not need to ship files on the side.
>>=20
>> Indeed, this and some "universal" user-space code would help a lot. =
Currently
>> we have collected a lot of binaries for several architectures (e.g. =
Intel, OMAP, JZ4780),
>> but all from different DDK versions and very different assumptions =
about system
>> library versions.
>=20
> The way the SGX driver was designed means that it has to be built for =
a specific
> GPU, the version of the firmware, userspace driver(s) & kernel driver =
have to
> exactly match and the build configuration has to match as well. =
Essentially, we
> don't have "universal" userspace code ourselves. With our focus being =
on Rogue
> and beyond, we don't currently have any plans to work on this.

Hm. This makes me wonder if it could be possible to open source the SGX =
code
since it is a different architecture than Rogue, is no longer your focus =
and
AFAIK the last SoC with SGX hit market almost a decade ago. This would =
enable
the community to make driver, firmware and user-space more generic (and =
more
compatible to modern distributions e.g. libc and other versions).

Perhaps others interested in PVRSGX can chime in.

>=20
> Thanks
> Frank

Thanks as well,
Nikolaus

