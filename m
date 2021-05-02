Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0A0C433ED
	for <phone-devel@archiver.kernel.org>; Sun,  2 May 2021 01:42:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E58D61459
	for <phone-devel@archiver.kernel.org>; Sun,  2 May 2021 01:42:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbhEBBnh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 1 May 2021 21:43:37 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:46222 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbhEBBng (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 1 May 2021 21:43:36 -0400
Date:   Sun, 02 May 2021 01:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1619919764;
        bh=3SxLseZTkFZ7tfPTsDwVPySMmxAXj/CfZ7wDf13aMR4=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=JqFWsVaeFByWFs4qKkz3Ydm8T2ZZxXpIT/8x2Mp+QYsfhZpc8HYltcHrmlD2vX23L
         WNEe5zRBnLH9lweQCe8q4yY3GxuM6RIslMINHfUtXUP53u/z0Raud2J0L87IwC1iBZ
         SLxFT+u6PZK1uEZasDKWqlrUSn7QWWYkgSgwkOnM=
To:     caleb@connolly.tech
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: OnePlus 6 fixups
Message-ID: <20210502014146.85642-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This series contains a few fixes for the OnePlus 6 and 6T.

The display panel driver for the devices currently implements
support for the reset pin.
This behaviour is fine on the 6 but on the 6T it seems to break the
panel. This suggests an issue with the initialisation sequence however
we haven't been able to find a way to bring up the panel without this.
In the mean time, removing the reset capabilities solves the issues for
us and doesn't introduce any other problems.

We also add a guard around the RMTFS memory region, this is implemented
by the msm_sharedmem driver in the vendor kernel, but not a feature
supported by mainline just yet. This is to workaround limitations in
Qualcomms XPU hardware which can trigger false violations and crash the
device if memory is allocated close to the RMTFS region.

Finally, enable the IPA node, modemmanager is gaining support for QRTR
modems and with that we can have mobile data working on the device!

=09^Caleb



