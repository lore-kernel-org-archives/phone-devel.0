Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325F0C7EE26
	for <phone-devel@archiver.kernel.org>; Mon, 22 May 2023 06:42:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbjEVGmB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 22 May 2023 02:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjEVGl7 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 22 May 2023 02:41:59 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CFE9103
        for <phone-devel@vger.kernel.org>; Sun, 21 May 2023 23:41:55 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-965ac4dd11bso1125027366b.2
        for <phone-devel@vger.kernel.org>; Sun, 21 May 2023 23:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1684737713; x=1687329713;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJchVhVXH9Pf5bh8o3X5e0MaNqDm51aU4pHZLRBh/rY=;
        b=kVpTRRWGT8/kR5rq5l+1tj8tRbHVbcbOY43GPRrEz/3+jvFN03mEhiYBzdumHr19/m
         thDKxvBRKoe4AVhhXmFn8e45GNFQMsoCg8FiXam2IdlWsH+Qjs70VQogzVJYCFiTNPED
         RlFPMXobgftiq5AhziO413H9tHO3BZPf2CzwJJZarEpDI0f/LfivagNY6+9Y9if1OuD5
         tDYQCGXBIBjyZGFsmBf2HI7/EGowdeRpDWr68JxVpfju+SWi5qhkL5is2Iut09J3Tosv
         zHYMpyAxfL653C10gG54Z1FtngnARUgw8/OD6j7VlIxkdbeThAb1Et9WsX3QMqnAcpUW
         MWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684737713; x=1687329713;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yJchVhVXH9Pf5bh8o3X5e0MaNqDm51aU4pHZLRBh/rY=;
        b=AGXTvXjTYgsRv+BYvIKL0sDhJRmDZDySuPSX/ZKLsMI+mK9gyHGJVvVhcj81lRqKH5
         GmGtb9kKUIrUi31fjEv8QWBPGs5doxM2/akc6W3eX9by1A7huZ3g1fB+g9lu1D+x3dph
         I+ZW23P4UlxRnSp/NbJV6d2MsQ54S8XISQbUu7Z+2pB5iVPJ+PFGu7T5VysAsYSkW8om
         I1Wu8bm52LKz5aFLE+HsnRu0NE3rbHtZInDkPUUb7hBs84lDpjejDApoB7yz1VOhEZWH
         djjj7qi1oNblQg4P6j2fxo2vCO2cKZR3fYxOtwKkAeY5LAAz2S+BlGnY3tQOXwK11luf
         JOew==
X-Gm-Message-State: AC+VfDzvvDRw6x92pNixZqrnFitHR3TYF/sIM7IMf5tHxFEbxazh+Btn
        7xrMceQAuI5Yss3qj6s/4H+a5A==
X-Google-Smtp-Source: ACHHUZ5AsJHZlgYjQ+r41PLZ3kgOLmnY3ldyRb6lRs48EHoxQ970/CCsXl5nSXAJur/0g4HRNW5B/g==
X-Received: by 2002:a17:907:3f29:b0:966:63ac:3706 with SMTP id hq41-20020a1709073f2900b0096663ac3706mr10075942ejc.26.1684737713543;
        Sun, 21 May 2023 23:41:53 -0700 (PDT)
Received: from localhost (84-115-214-73.cable.dynamic.surfer.at. [84.115.214.73])
        by smtp.gmail.com with ESMTPSA id my19-20020a1709065a5300b0094f3d700868sm2673332ejc.80.2023.05.21.23.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 May 2023 23:41:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 22 May 2023 08:41:51 +0200
Message-Id: <CSSLOC8WDIPE.1WO9BXZQA7A12@otso>
Cc:     "Petr Mladek" <pmladek@suse.com>,
        "Steven Rostedt" <rostedt@goodmis.org>,
        "Sergey Senozhatsky" <senozhatsky@chromium.org>,
        "Rasmus Villemoes" <linux@rasmusvillemoes.dk>,
        "Jonathan Corbet" <corbet@lwn.net>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: printk-formats: Clarify %*pb format parameters
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
X-Mailer: aerc 0.15.1
References: <20230516-printk-bitmap-v1-1-d5f810192a10@fairphone.com>
 <ZGT+lJasWhZ0TPRi@smile.fi.intel.com>
In-Reply-To: <ZGT+lJasWhZ0TPRi@smile.fi.intel.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed May 17, 2023 at 6:19 PM CEST, Andy Shevchenko wrote:
> On Tue, May 16, 2023 at 08:52:43AM +0200, Luca Weiss wrote:
> > Since it's rather unusual for printk formats to require two parameters,
>
> I don't think this is "unusual".

Well, unusual for me at least. I've never really used anything except
the standard integer types and %px. And I've been contributing to the
kernel since 2017.

> The %*... is very well described in the printf(3) (the meaning of *).
> It applies here for %*p... as well.

The printf(3) man page is never mentioned on this docs page. And even if
it would be mentioned somewhere, I doubt anyone is reading most of the
page when they're just looking for a format specifier for e.g. bitmap.
At least I am not.

>
> > expand the documentation to clearly mention that in the printk format
> > for bitmaps.
> >=20
> > As an extra example, for example from include/net/bluetooth/hci_core.h
> > we have a bitmap DECLARE_BITMAP(dev_flags, __HCI_NUM_FLAGS);
> > This can be printed with ("%*pb", __HCI_NUM_FLAGS, hdev->dev_flags)
>
> I think this change is not needed. But try to convince PRINTK maintainers=
.
> Maybe they will be okay with it if it covers all %*p... cases (like %*ph)=
.

Cannot say I haven't tried :) As I wrote in the initial email I'd be
happy also if someone who knows more about the formats to include some
text for all the %* options so users know what's up.

Regards
Luca
