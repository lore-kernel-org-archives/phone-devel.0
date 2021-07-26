Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B783C4320A
	for <phone-devel@archiver.kernel.org>; Mon, 26 Jul 2021 07:51:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60FDD60C51
	for <phone-devel@archiver.kernel.org>; Mon, 26 Jul 2021 07:51:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbhGZHLY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Jul 2021 03:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231891AbhGZHLX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Jul 2021 03:11:23 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2DFEC061757
        for <phone-devel@vger.kernel.org>; Mon, 26 Jul 2021 00:51:52 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a26so13798359lfr.11
        for <phone-devel@vger.kernel.org>; Mon, 26 Jul 2021 00:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tl2Qb0EKguXyf5h8TxK4SArC6xikKxHnxlhb/8NDBjU=;
        b=SJHjCQuZMhGwfSeBQR4L3rLs4VKbZBIccH4gbeOpHW/BVx9udpZqj3o5j4DamFiThs
         bL3DoUZ+QIe+BBc8VIGzcnq9VL9tZwhOFjJQ0ct/oBnk6IBt2m8uNn3ij/V4uVTCbB/I
         a2oKvN6mtEMrrv7I6NDBFPxM6M0GYo6j1AidMxfK/PI2ZHyQ9YTLjQpjb/rVju8Jzlm5
         o4LcynEEzM6JW4JdO7q869QoR6NlATPMYcx+0ry/dEm2tp4+dFJm3XbbuTvudA3x4OoT
         il/ybokPAQM1uspu1uQHrT8Ey5CTSZd6Qy4HULrad+F3jUw7XtoAZOZmlmTuuZzCkzlQ
         pbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tl2Qb0EKguXyf5h8TxK4SArC6xikKxHnxlhb/8NDBjU=;
        b=PWBKTrpX34DdssEapoerhSjIM9rGqCNFdSk7Ky22iJghF0bN92EnSqK3xbuOg2kPwn
         CY7bolLfoFdKnLUK5UlTdoktN7rt0vcmoAXsW4UEuC0I0pNpH3Btvct6Jgc4id36Xpyb
         25Ws1DS8tVK8dvzsu+OmrJaUbYkeDt/Bfzni1Rd34YMY55gjNiMovUGQNX3TMWzohwt2
         OGyb+VMPkp3Rww24KAABt5tTpJU3XhS6dubMjS6zmNRAXe9wIo9NgougCFSfmZl9gNiX
         rsxP8Wc5sQGq13qIXU5y1dTbqQ/crmkNCrVTLuvZvK5OPpUruq7qVzpPU19O84TH3iDP
         IWpA==
X-Gm-Message-State: AOAM533wLOzV+nQnxzSW4B+AozLqMkVhoZrqRuZdEOKwa91RmNm4Xox3
        SCwLr2aECFn8zbxGUduNHpruQOaa4qJlIR5xXeIBjA==
X-Google-Smtp-Source: ABdhPJwFuU0c5xqlk1yTtibDz1IgPDEmmXCYuw65z4qIHjRgBY4Kzw60Mk8OvTtY2M2qeI14uN2CY31KocEm2fVHUis=
X-Received: by 2002:a05:6512:3696:: with SMTP id d22mr12343175lfs.586.1627285910999;
 Mon, 26 Jul 2021 00:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210725140339.2465677-1-alexeymin@postmarketos.org>
In-Reply-To: <20210725140339.2465677-1-alexeymin@postmarketos.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 26 Jul 2021 09:51:40 +0200
Message-ID: <CACRpkdaaQeuVqJbczHndsgmmMv0NycwRDdzFTDwM=BJnc7SseQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: panel: Add Samsung S6E3FA2 panel
To:     Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, Jul 25, 2021 at 4:04 PM Alexey Minnekhanov
<alexeymin@postmarketos.org> wrote:

> The Samsung S6E3FA2 AMOLED cmd LCD panel is used on Samsung Galaxy
> S5 (klte) phone.
>
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

Grr gmail put this in my spam folder, sorry for confused mails.

With Sam's comments addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
