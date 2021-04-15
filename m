Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2371C433B4
	for <phone-devel@archiver.kernel.org>; Thu, 15 Apr 2021 00:01:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AC7461220
	for <phone-devel@archiver.kernel.org>; Thu, 15 Apr 2021 00:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhDOABg (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 14 Apr 2021 20:01:36 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:33307 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230363AbhDOABf (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 14 Apr 2021 20:01:35 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 98C425C005D;
        Wed, 14 Apr 2021 20:01:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 14 Apr 2021 20:01:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=talbothome.com;
         h=message-id:subject:from:to:cc:date:in-reply-to:references
        :content-type:mime-version:content-transfer-encoding; s=fm2; bh=
        wtVbuoGlrtFV/uBpZaxPn7pFYEAuCOKHSarDjvlmPAE=; b=RWxz1M33O8qOtK1V
        tOVM6nPzMnmg9WUBy74zTWADzc0XzSjGLVkH+B/T6MWEh7YLXsyPv/I4b3eySWse
        HaKSGje3Zo6Vq57GtlFBf2alAmiGyGeYc+GILLel5GwcV/o2ZZ0cBqpaHNLbxsAx
        M5lAFi6OcEtn90DYqKhVISExjktLv/JUpDxt52HhES4lZqndf8CpoMPKhxNsLTuA
        Ect5854fiPUB1VTI+KBX3PWqf7s031EtwMu+qzp5DkTgmtNamRYVpha7lPUTdd25
        8kBWGWpq8W4BuW1eVLoXcOFVVHi/gnwgMMsF6HRiw+m+YxAl/PuexdHRNHdPxrfm
        WXDEfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=wtVbuoGlrtFV/uBpZaxPn7pFYEAuCOKHSarDjvlmP
        AE=; b=JjBn7qVBYVHqLwIRAH0mkita7MgQ2Zaz4Zrhx0qRecjzisTNWxcn3o8tp
        /Uo9Ekw+2cg/NW8xLpzlWE4mCEr24oKnqbO3qwDw7F4phN0rrs9HgDrht1t+4P9W
        Db+GAg5yrUzodDzSXdyiW5W3NKotck9dwhCcTCJmBa3fsnNRxvRkUOSgr9BrR+7g
        MsaRHSQry8Cd4HZd2gs7fBC9rhPb6q3671SxnRl//E0dwWxzWJR2b6tpJWfnu+Q7
        xKm0m+kQikymCj2b66/ISQD+JRrsFJaxM3pQRRFneTThBuL2E99NopjcGyjk/YZh
        vJqNcvAnV3kBtu3q6BwKISjPhoLxA==
X-ME-Sender: <xms:R4J3YO0dtz7PL7i8km_ZMW9HkL7rpc4BFoNLxWiuyivHD8rOtZjPMQ>
    <xme:R4J3YBHITJ0C7B1rf8zVSflWtRae0smXiLWwvwpdOOwbRBTJZr9F_JQpTEvgig6aI
    8U38wF5zfce9zLP7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelvddgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthekredttderjeenucfhrhhomhepvehhrhhi
    shcuvfgrlhgsohhtuceotghhrhhishesthgrlhgsohhthhhomhgvrdgtohhmqeenucggtf
    frrghtthgvrhhnpeduvdegheduveefhfdtffevkeeugfekhfefhedtleelleeuueeffedu
    leehtdetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeejvddrleehrd
    dvgeefrdduheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheptghhrhhishesthgrlhgsohhthhhomhgvrdgtohhm
X-ME-Proxy: <xmx:R4J3YG7NfBpRPgeRHUCwegeSN08Mz9-AbHUZeSfc5Cw1OtgR-nfpCA>
    <xmx:R4J3YP23_3HLSOLLPqZpwzMA728DNU9PsLDgW9otrLDVr3fuKLaERg>
    <xmx:R4J3YBFproiiZcv-ULJjDurvc0jWN-Sa3ErfWUSG0PhS08nFacdU-w>
    <xmx:SIJ3YGQn_WzJjRMzUhXwWu-KA0YK3H9W3VsLaEchM771KqZQcTu9hQ>
Received: from SpaceballstheLaptop.talbothome.com (unknown [72.95.243.156])
        by mail.messagingengine.com (Postfix) with ESMTPA id EC012240054;
        Wed, 14 Apr 2021 20:01:10 -0400 (EDT)
Message-ID: <a18323cb5f1bfc154826fe250a20a1023e0713f4.camel@talbothome.com>
Subject: Re: Forking on MMSD
From:   Chris Talbot <chris@talbothome.com>
To:     Pavel Machek <pavel@ucw.cz>, marcel@holtmann.org,
        denkenz@gmail.com, phone-devel@vger.kernel.org
Cc:     ofono@ofono.org
Date:   Wed, 14 Apr 2021 20:01:09 -0400
In-Reply-To: <20210414225848.GA28307@amd>
References: <051ae8ae27f5288d64ec6ef2bd9f77c06b829b52.camel@talbothome.com>
         <634e0debea558b90af2cebfc99518071f1d630e9.camel@talbothome.com>
         <20210414192958.GA4539@duo.ucw.cz>
         <c7ffd7e4d62e5d5ed397f69be180d81588a4cfd1.camel@talbothome.com>
         <20210414225848.GA28307@amd>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hello!

On Thu, 2021-04-15 at 00:58 +0200, Pavel Machek wrote:
> Hi!
> 
> > This is not ofono I am forking, merely MMSD.
> 
> So first, sorry, I was confused, I assumed mmsd is part of ofono.
> 

No worries! To the best of my knowledge, mmsd is a part of ofono? That
is why I have tried to submit my patches on the Ofono Mailing list
several times. However, for the purposes of getting MMS to work in
Mobian/PostmarketOS/Fedora, I have only been working on mmsd.

The "Open Source Telephony Group" is listed as the maintainers of it on
kernel.org, which I assumed to be the Ofono group.

> I guess Marcel Holtmann is right person to talk to. I put him in Cc
> list. I'm also Ccing Denis and phone-devel list.
> 
> > and asking about how to contact the ofono maintainers in
> > kernelnewbies
> > in IRC. 
> 
> Well, kernelnewbies and netdev mailing list are not really right
> places to ask.
> 

I have attempted to contact Mr. Holtmann and Mr. Kenzior individually
(as they are listed as Authors on mmsd). However, I do know at least
Mr. Kenzior is on the Ofono Mailing list. I believe both are on the
Ofono IRC (guessing by the screen names). I really did not want to spam
their personal email addresses multiple times, as I feel that is rude.

I contacted the netdev mailing list at the advice of another developer.

kernelnewbies was a guess from myself, as I had no idea who else to
contact to talk to folks on kernel.org and that seemed like a
reasonable starting point.

> > I have attempted to individually email the mmsd Authors as well as
> > anyone within the past 5 years who contributed to mmsd. I simply do
> > not
> > know of any other way to contact the mmsd maintainers.
> 
> Ok, so you did quite a good job.
> 
> I still hope Marcel will reply. If not, I believe it makes sense to
> ask kernel.org admins (perhaps konstantin@linuxfoundation.org ?) who
> is maintainer of mmsd repository and how to reach them, or perhaps
> how
> to take over, as it is not exactly active.
> 
> 2019-07-24      ofono: Read Firmware version (Revision) for Device
> 2019-07-24              ofono: Read IMEI SV for Device Management
> 2019-07-24              ofono: Read IMEI for Device Management  Ankit
> 2017-07-22      wsputil: Fix fall through comment       Marcel
> 2017-07-22      build: Use AM_CPPFLAGS instead of
> INCLUDES      Marcel
> 2015-04-20      gdbus: Close private connection if setup fails  Luiz
> 
> Best regards and good luck,
> 
>                                                                 Pavel

Thank you! I hope so as well. If not, Perhaps the kernel.org admin is
the right place to go.

-- 
Respectfully,
Chris Talbot


