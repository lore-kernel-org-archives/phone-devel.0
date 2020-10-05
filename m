Return-Path: <SRS0=vNnj=DM=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5F2C46466
	for <phone-devel@archiver.kernel.org>; Mon,  5 Oct 2020 15:41:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9956320E65
	for <phone-devel@archiver.kernel.org>; Mon,  5 Oct 2020 15:41:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWbxr7g2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbgJEPlj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 5 Oct 2020 11:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbgJEP2y (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 5 Oct 2020 11:28:54 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D80C0613A7;
        Mon,  5 Oct 2020 08:28:52 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id b12so9796176edz.11;
        Mon, 05 Oct 2020 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cenGKJzkLKJNDoOLw4v3WNu1rdhsMcz91gS2ZObX+fE=;
        b=HWbxr7g218E/jgD/+3VtUzYLXTq9LiHkq9FQIOpDCcL3MbGRW/XjhYgC9dLzVBW1UG
         JYevzJ37I+usd6wJA06EKErrcAojBLVxWq8GEBiyv2HW9ZSmcyfQxdYYuedpJ5L0zAer
         HmWKJhXMIdL3yR8P6uXlxQlMSrh7yVyPzR+cwWIpB220d1sKVID4azq8XXB0lVmtfZVO
         2CIQT3ZUT+ph14mt8sg8FSqdpMDDs05Kmk264J+uEpsVni5+uNCiQ+2kTtjuAv6ghu3I
         7yIll7ZK+E72YXJ7+SCCL+PBLyCtTIxQjTx+kiIjuOLzkqeNw/N2XvM6d/1qN9QI6Wto
         ZOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cenGKJzkLKJNDoOLw4v3WNu1rdhsMcz91gS2ZObX+fE=;
        b=B5AHOxaxfzbjRdLP2RTM429AVo3dAfBojns3CNBLPo6QYuxBAMJgjS0M8Wdt/DTU7H
         GQ8ac5vKn5RWT2go29GDbWJyQ4KK9bqNFULqqC1TQ6xFjPory4UUe0yzka23PDjx1n+1
         3xKdIxjvkdCrKL2ZBbt9VpOajNQOS53oqEJs+85g64hIV3fLENP4i6sBThA+IuNUGgIK
         OAQILZHOgAp7UDaTUJW0FO6b9qOP+MOpG856f3iKHIWAgSRCnx/JmekpNgwzjiKBZ+5R
         ygn8oUpDcba7pp7qzWH8N2VmaHy2Z1WBN8qCnDtjGT8CjKDXDUi61PFihzNx9IqGPHew
         h/Nw==
X-Gm-Message-State: AOAM531MmyGfG+p+z4cs+fPt6GzPTdoyhyehNXt8hxMUNr83PdZm4Z6x
        o+/z0zMiT2kdqwp+P22qb8y9z28fMWi8jIiz9LA=
X-Google-Smtp-Source: ABdhPJzR/+JcgozZaRVsiD5h30TjNMV/X/qN/nhWubBMpVT8nvxNFVNUQ/eZNBuDiofxzGginvn+g6ps0WTKzHYh6UM=
X-Received: by 2002:a05:6402:3c1:: with SMTP id t1mr126673edw.231.1601911731452;
 Mon, 05 Oct 2020 08:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201005150313.149754-1-konradybcio@gmail.com>
 <20201005150313.149754-4-konradybcio@gmail.com> <c03ace9d-d983-c1f8-ab74-ed585aeb2364@linaro.org>
In-Reply-To: <c03ace9d-d983-c1f8-ab74-ed585aeb2364@linaro.org>
From:   Konrad Dybcio <konradybcio@gmail.com>
Date:   Mon, 5 Oct 2020 17:28:15 +0200
Message-ID: <CAMS8qEXBrF-j5ObahFVcJFMuC7=ucz+y7XBzTyuJAqejsE0F+g@mail.gmail.com>
Subject: Re: [PATCH 03/11] arm64: dts: qcom: pm8994: Add thermal-zones for
 temp alarm
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

>Don't you want to add a 'hot' trip point, so userspace can get the
>notification and have an opportunity to do some action like unplugging
>some CPU before a wild shutdown happens ?

PM8998 doesn't do that and so I followed.

Anyway, msm8992/4 will never have all CPUs online at once, unless
it's put in a freezer, so unplugging isn't much of an argument :D

If you want though, I can resend this patch AND add a hot point to pm8998.

Konrad
