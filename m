Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02342C433E0
	for <phone-devel@archiver.kernel.org>; Sat, 20 Feb 2021 20:52:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6AE464EC0
	for <phone-devel@archiver.kernel.org>; Sat, 20 Feb 2021 20:52:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhBTUvr (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 20 Feb 2021 15:51:47 -0500
Received: from vm6.ganeti.dyne.org ([195.169.149.119]:54664 "EHLO
        vm6.ganeti.dyne.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhBTUvo (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 20 Feb 2021 15:51:44 -0500
X-Greylist: delayed 533 seconds by postgrey-1.27 at vger.kernel.org; Sat, 20 Feb 2021 15:51:43 EST
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: parazyd@dyne.org)
        with ESMTPSA id E8D06F60E01
Date:   Sat, 20 Feb 2021 21:41:10 +0100
From:   "Ivan J." <parazyd@dyne.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     tony@atomide.com, sre@kernel.org, merlijn@wizzup.org,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org
Subject: Re: [maemo-leste] Droid4: USB host works in Leste
Message-ID: <20210220204110.h54nvx4mwkx3wrhz@fq>
User-Agent: rp
References: <20201207223323.GA322@amd>
 <20201209171528.GB11203@duo.ucw.cz>
 <20210220170845.GA11787@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210220170845.GA11787@amd>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sat, Feb 20, 2021 at 06:08:45PM +0100, Pavel Machek wrote:
> Hi!
> 
> I played with USB host and Maemo Leste, and it works with recently
> packaged kernel:
> 
> devuan-droid4 5.10.4 #1 SMP PREEMPT Mon Jan 18 21:56:35 UTC 2021
> 
> USB devices are only detected when you plug them in. If you plug
> dongle first, then device to the dongle, it does not work.
> 
> Mouse, keyboard and mass storage seems to work.
> 
> It is probably possible to charge the battery and use USB host at the
> same time. Good.
> 
> DisplayLink and USB ethernet does not, as the modules are missing.
> 
> Could I get Leste to build neccessary modules? Turning phone into
> usable desktop computer sounds like fun.
> 
> I'd need:
> 
> CONFIG_USB_NET_AX8817X=m
> CONFIG_DRM_UDL=m

hmm, I thought usbnet was fine in Leste.

I will check this soon and add these modules. By the way, for -devel
I recently built 5.11, but I haven't changed anything in the kernel
config.

Best regards,
Ivan
