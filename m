Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5F6C48BCF
	for <phone-devel@archiver.kernel.org>; Sat, 12 Jun 2021 20:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB3E561186
	for <phone-devel@archiver.kernel.org>; Sat, 12 Jun 2021 20:54:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhFLU43 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 12 Jun 2021 16:56:29 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:20647 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbhFLU43 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 12 Jun 2021 16:56:29 -0400
Date:   Sat, 12 Jun 2021 20:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1623531268;
        bh=vM4PAnRTUa2TlxEjYrPkd185UGx9iXx4BFl/sNcY/Zg=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=qpkwQr+8Sv6Gl0wYh+6y9ybvhYIKUqpWboqv3ocY61C9Sl9NGLOx+P1CQHV0/3DPt
         OKTpANUor6CpST6LUCIkTKjXMHcu7+XBG0P7rOmiDZCJyn6hNVM2bGTd6GeEyToVCk
         w0vZnJENX/RaEAofkuceDp6MJzVWGNxWVv+HrZ2s=
To:     caleb@connolly.tech
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: input: Introduce QPNP (Qualcomm Plug n Play) haptics found on qcom PMICs
Message-ID: <20210612205405.1233588-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This series introduces a driver for the QPNP haptics hardware block
found in Qualcomm PMICs. QPNP haptics support LRA (Linear Resonant
Actuator) style haptics, as well as ERM (Eccentric Rotating Mass).
It also supports several modes of driving the haptics, e.g. by loading
the pattern to play into an internal buffer, or using PWM.

More information about the hardware can be found here:
        https://gitlab.com/sdm845-mainline/linux/-/wikis/PMI8998-QPNP-Hapti=
cs

This driver has been written based on downstream sources as no public
documentation is available. It includes initial support for LRA haptics
in buffer mode, this combination seems to be the most common and will
enable haptics on the OnePlus 6 and 6T, PocoPhone F1, OnePlus 5 and
several other Qualcomm devices with mainline kernel support.

The driver is implemented using the ff-memless (forcefeedback) input
framework and makes an attempt to control the strength of vibration relativ=
e
to the magnitude set from userspace.

 ~ Caleb



