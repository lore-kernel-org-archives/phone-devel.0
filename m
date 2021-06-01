Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77327C4708F
	for <phone-devel@archiver.kernel.org>; Tue,  1 Jun 2021 09:16:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 598E9613AF
	for <phone-devel@archiver.kernel.org>; Tue,  1 Jun 2021 09:16:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233514AbhFAJRz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 1 Jun 2021 05:17:55 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:47997 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231139AbhFAJRy (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 1 Jun 2021 05:17:54 -0400
Date:   Tue, 01 Jun 2021 09:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1622538970;
        bh=zEBoQZuXbcl3vg0AJIfdTRqG2/JwXZI7r5xWwCgFELM=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=aj8sw0MJvu7B7j34QaU2xex28JPvliA57kkKQuZ0mp38/shxMqPZj1oLtKjBdpsFx
         5pqBSKkhgIV4doqk8drQHzY8EBZ4/nTozFeSSqBxouKHkgXW3n95kwORJodqSXL4dU
         mb+VEmWv7ageYdxf9jzPDW+IZiz38Z3KA4ya1lhs=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>,
        "~postmarketos/upstreaming@lists.sr.ht" 
        <~postmarketos/upstreaming@lists.sr.ht>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH 1/2] Input: cypress-sf - Add Cypress StreetFighter touchkey driver
Message-ID: <bj_bmlxlyRbM5zdpsUEqvPyby_NWhFH95Y9wn9b7EIpvi2N48e6x6dBFY9EpyS4mxJhuRRJeC4ReVM3YMawD44RBZDHdSKftdbV6E8AMuoo=@protonmail.com>
In-Reply-To: <ocb1SNCqWH2dOajA4VYTx5jo9jZ67pS6FTejJN82OnPIUdmqBXL62kjGDQ-ZIMPnmhm3C16FCJz94cs82kGFmFBq7mERwqtHhwr7BgZC_w0=@protonmail.com>
References: <ocb1SNCqWH2dOajA4VYTx5jo9jZ67pS6FTejJN82OnPIUdmqBXL62kjGDQ-ZIMPnmhm3C16FCJz94cs82kGFmFBq7mERwqtHhwr7BgZC_w0=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Any comments on this patch?

Yassine
