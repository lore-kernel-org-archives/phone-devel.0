Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93547C43461
	for <phone-devel@archiver.kernel.org>; Thu, 29 Apr 2021 14:49:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 602FE6143B
	for <phone-devel@archiver.kernel.org>; Thu, 29 Apr 2021 14:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240705AbhD2OuZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 29 Apr 2021 10:50:25 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:58719 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240747AbhD2OuU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 29 Apr 2021 10:50:20 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id E549F1669;
        Thu, 29 Apr 2021 10:49:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 29 Apr 2021 10:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=talbothome.com;
         h=message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
        UOVr/CP+oyCEFQEwJlS4r0KaHNE/GcKazKNKb7L00ss=; b=V4GoYC/8INBAcYWQ
        BUXz0sgj0pNdIUWJYM4CZJlBzqlnwHSoE26PZObU/EEdw00G/wO2t1LHAT239pFE
        Xp3ede6lXNjzpfirB3RkznXUh5KO/XvuFaOMSUgdEFbAXaLWyUtXK0qPHGESKMaT
        vTTDO7ktGjqwlGZYat5pxNDsTZEcWVqAO/VbIvdHswNrhYazWNM1d5N1MVD0mFfU
        TvWcUoh4rNdbqMFSrAqFvlO/exGzgXPeRVH/aA3/7XdTr5HmpShxYaKZOR8NYhde
        hlsJAkCgWfS3mqj2MHMzXbN7CTIdCY+10UvZR2wOnCXY2I8+jt//AofVS6sgR9hl
        q/fKGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=UOVr/CP+oyCEFQEwJlS4r0KaHNE/GcKazKNKb7L00
        ss=; b=HylGPyybSCnIglSM7NhWPGEu6cYh76YVzP7FC2q1X52wRB57s06IR4YJI
        E7mhR+X08PG5+Yp9iUavSanWaenS8DrN+fqEZSI/dhgRZk+zyw7JEn2JlT2dHDNG
        gJCBuJoZHkVzQqJ9b1sXc76Hjhu6SNN39xPAPhfPDe0LWKdMwKn854vOCdKq1rVH
        n6VGMyKtIdGOAC5o5xzPVK6+7IYPOhmOExGdUfDXKIkCC2OPJO7sc1tQ6+JEgAHA
        EtCWVhJkuZ1aaEKIAikNpf0/CIwz2MeYhnYQjGcUsKvCDVRwZNQryoFJ/tXIVSca
        A2VqhwEb8es1LHAyK0FBgnzwYjBaA==
X-ME-Sender: <xms:e8eKYPbZPvLq8JKSGMHaLWoKIY-BF-OtQMgvUJImpivN7liYCUfxKg>
    <xme:e8eKYObtUydSKQQuDIJ2noNG6M5arix8GtOGMqhE1iDXWgkmfFdHMJorMc-WNaRHY
    Z86dxQWkmby3wdUrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthekredttderjeenucfhrhhomhepvehhrhhi
    shcuvfgrlhgsohhtuceotghhrhhishesthgrlhgsohhthhhomhgvrdgtohhmqeenucggtf
    frrghtthgvrhhnpeduvdegheduveefhfdtffevkeeugfekhfefhedtleelleeuueeffedu
    leehtdetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdekrddvrd
    ehiedruddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpegthhhrihhssehtrghlsghothhhohhmvgdrtghomh
X-ME-Proxy: <xmx:e8eKYB9H4eEDxzSBCWHlCh3aF7l-awxcq6SNLebsnLNLJffOIEoWjw>
    <xmx:e8eKYFqOSEqe6jdYMRWsCsxbzWUEmnUzakJRIpYmkcIBLYN5c7u89w>
    <xmx:e8eKYKo8BVTHPxcp_X6Pi_-8yUNb3lDegZhhQQ_-4yxAGmFUQ0QIGw>
    <xmx:fMeKYBSJ_rmUiAifUhdKUOvMoi5F_3nMElxK50oPGY5MR9n1unGkFA>
Received: from CMU-974457.ANDREW.CMU.EDU (cmu-974457.andrew.cmu.edu [128.2.56.129])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Thu, 29 Apr 2021 10:49:31 -0400 (EDT)
Message-ID: <76828cf0e5273113ff165c4dabbf989fb05cbf3f.camel@talbothome.com>
Subject: Re: Forking on MMSD
From:   Chris Talbot <chris@talbothome.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     phone-devel@vger.kernel.org, ofono@ofono.org
Date:   Thu, 29 Apr 2021 10:49:30 -0400
In-Reply-To: <20210427091556.GA9745@amd>
References: <051ae8ae27f5288d64ec6ef2bd9f77c06b829b52.camel@talbothome.com>
         <634e0debea558b90af2cebfc99518071f1d630e9.camel@talbothome.com>
         <20210414192958.GA4539@duo.ucw.cz>
         <c7ffd7e4d62e5d5ed397f69be180d81588a4cfd1.camel@talbothome.com>
         <20210414225848.GA28307@amd>
         <a18323cb5f1bfc154826fe250a20a1023e0713f4.camel@talbothome.com>
         <20210427091556.GA9745@amd>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hello,

On Tue, 2021-04-27 at 11:15 +0200, Pavel Machek wrote:
> Hi!
> 
> > > > This is not ofono I am forking, merely MMSD.
> > > 
> > > So first, sorry, I was confused, I assumed mmsd is part of ofono.
> > 
> > No worries! To the best of my knowledge, mmsd is a part of ofono?
> > That
> > is why I have tried to submit my patches on the Ofono Mailing list
> > several times. However, for the purposes of getting MMS to work in
> > Mobian/PostmarketOS/Fedora, I have only been working on mmsd.
> > 
> > The "Open Source Telephony Group" is listed as the maintainers of
> > it on
> > kernel.org, which I assumed to be the Ofono group.
> > 
> > > I guess Marcel Holtmann is right person to talk to. I put him in
> > > Cc
> > > list. I'm also Ccing Denis and phone-devel list.
> > > 
> > > > and asking about how to contact the ofono maintainers in
> > > > kernelnewbies
> > > > in IRC. 
> > > 
> > > Well, kernelnewbies and netdev mailing list are not really right
> > > places to ask.
> > > 
> > 
> > I have attempted to contact Mr. Holtmann and Mr. Kenzior
> > individually
> > (as they are listed as Authors on mmsd). However, I do know at
> > least
> > Mr. Kenzior is on the Ofono Mailing list. I believe both are on the
> > Ofono IRC (guessing by the screen names). I really did not want to
> > spam
> > their personal email addresses multiple times, as I feel that is
> > rude.
> > 
> > I contacted the netdev mailing list at the advice of another
> > developer.
> > 
> > kernelnewbies was a guess from myself, as I had no idea who else to
> > contact to talk to folks on kernel.org and that seemed like a
> > reasonable starting point.
> 
> It increasingly looks like you did right.
> 
> You still may want to contact linuxfoundations admins -- for example
> Konstantin Ryabitsev <konstantin@linuxfoundation.org> .
> 

While I am not opposed to doing this, I feel that me cold emailling
them will not result in a lot, mainly because they have no idea who I
am (which I feel is understandable, as they are getting someone they
don't know asking for commit access).

From your email, it seems that you may possibly know them? I feel if
there was a third party introduction, the chances of my success at this
is much higher. Would this be something you would be willing to do? 

If not, I also understand, as I said above, I'm someone you haven't
really met or know.

Thank you!

Respectfully,
Chris Talbot




> Best regards,
>                                                                 Pavel
> 




