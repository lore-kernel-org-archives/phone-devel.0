Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DF4C4361B
	for <phone-devel@archiver.kernel.org>; Tue,  8 Dec 2020 11:56:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AA4923AAA
	for <phone-devel@archiver.kernel.org>; Tue,  8 Dec 2020 11:56:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgLHL4v (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 8 Dec 2020 06:56:51 -0500
Received: from vm6.ganeti.dyne.org ([195.169.149.119]:52042 "EHLO
        vm6.ganeti.dyne.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgLHL4v (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 8 Dec 2020 06:56:51 -0500
X-Greylist: delayed 359 seconds by postgrey-1.27 at vger.kernel.org; Tue, 08 Dec 2020 06:56:51 EST
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: parazyd@dyne.org)
        with ESMTPSA id 06CF1F60B28
Date:   Tue, 8 Dec 2020 12:50:05 +0100
From:   "Ivan J." <parazyd@dyne.org>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     Pavel Machek <pavel@ucw.cz>, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, martin_rysavy@centrum.cz,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org
Subject: Re: D4 after leste update: rotated touchscreen
Message-ID: <20201208115005.zdnbolq7r6m7zqcd@fq>
User-Agent: rp
References: <20201207223323.GA322@amd>
 <54ee7625-1407-ce50-19a8-6ca844c08932@wizzup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <54ee7625-1407-ce50-19a8-6ca844c08932@wizzup.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Dec 07, 2020 at 11:48:46PM +0100, Merlijn Wajer wrote:
> Hi,
>
> On 07/12/2020 23:33, Pavel Machek wrote:
> > Hi!
> >
> > I did apt-get update/upgrade on Leste, and results are not good.
> >
> > It still boots, but it looks like touchscreen is "rotated" 90 degrees
> > or so, so touches are registered at wrong places.
> >
> > If someone knows how to fix that, let me know.
>
> Hrm, I thought this problem was resolved now. Does the problem persist
> after reboot?
>
> Parazyd, any idea what's up here?

On some "older" images, an `apt upgrade` isn't enough, and `apt
dist-upgrade` is preferred. I see that it was resolved though.

fwiw, I will soon also set up cpio archives that can just be extracted
on prepartitioned cards. We used to have tarballs of these, but for
different reasons they were unable to boot. With cpio, attrs and similar
things should be better preserved than tar(1).
