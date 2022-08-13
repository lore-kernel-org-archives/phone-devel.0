Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305E9C25B08
	for <phone-devel@archiver.kernel.org>; Sat, 13 Aug 2022 19:58:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237248AbiHMT6T (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 13 Aug 2022 15:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbiHMT6S (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 13 Aug 2022 15:58:18 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D6E13CD0
        for <phone-devel@vger.kernel.org>; Sat, 13 Aug 2022 12:58:17 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id gb36so7245162ejc.10
        for <phone-devel@vger.kernel.org>; Sat, 13 Aug 2022 12:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=prDaPxbuhI2YkS3ImxvqrOYZkOiTsYLmxAEmCgtIlts=;
        b=sLfwXyQmojly/syV1/M+nIbRRfI+bvzJqfp15h7L2rghxQrWmiCPufxl8HX5WjOkJv
         ycW0hSQG6nqui8O5W7njuGHpg/+O0N3unv8qeb7vQxDThEfe3uYElyLhkWxeZ0/iIzLC
         2TbZzbzsH6onix6hw/OnpGviccv0xGSISZ+kw2m7Fg+1m4F7pRt7yT7SBA6POkVCoR2D
         QKQHi4aQT/rHGVMEC8o4P19mF1HpHUo51hC5PE01P7lBQhyLm/86j9r1C8dUEwIORS97
         y0pxW/NZXAQkI10j0y6sK16vBGseD+JzvHXpBb/X6uLxX4LtMZMpCGr+MYT1Bn8jF4Hu
         rHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=prDaPxbuhI2YkS3ImxvqrOYZkOiTsYLmxAEmCgtIlts=;
        b=cxH03lsiuqNah2lil+vbvdqWBcws1NsQw2TCzUjT6vnsl1U4PFBDzd93qN/zgZjvKJ
         I08wWvk2DlvAxM5BnD0Qg0omUTe/ckvrP9TIEE2yDHk9uIy9QMl0OiAnMWVr3or274s+
         mK6Rge0Q2LMAJxMxLG1nVmA0igHljRgB7mHQSkmZ1MKXO5wkn2Dv6hOjaRQnZOVpcRkI
         5OVPodw0g/ietb5+x5GFGbR+Dqz7jvJcdX8jmP7Aml8UkjJXpHqjPQDgUT2UrtTLyAL0
         JffIER9Ee8EL3f1/F5VFV6kDqHN8moy4PfsEUGwi8MWqtKlfs24saOycUBztGbXWfYaf
         NdYw==
X-Gm-Message-State: ACgBeo0nlg9U5r4ZSBCQivNnrHUIf1gSS8YFb9z3RIqdQlVcBCotxu5X
        alS1aKZ7cxnI+LCNAyR4+AC8QD7gG2Fr3vDuRWrEtw==
X-Google-Smtp-Source: AA6agR6IfXdCivSE5cewvCGmPnQIwg1jOepXajVT2A87FTuCTWHbrrpeT53Y4tfWF+it90w56+o77Ec5RRPGCJwQ7AE=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr6312577ejs.190.1660420696554; Sat, 13
 Aug 2022 12:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660337264.git.jahau@rocketmail.com> <57236545107286771d351b95091bf56815d3717d.1660337264.git.jahau@rocketmail.com>
In-Reply-To: <57236545107286771d351b95091bf56815d3717d.1660337264.git.jahau@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 13 Aug 2022 21:58:05 +0200
Message-ID: <CACRpkdZB_JLJcCNAop-bnRG85Nid8MpJDui=RDNaxbebZuD=Wg@mail.gmail.com>
Subject: Re: [PATCH v6 09/14] iio: magnetometer: yas530: Introduce "chip_info" structure
To:     Jakob Hauser <jahau@rocketmail.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Aug 12, 2022 at 11:59 PM Jakob Hauser <jahau@rocketmail.com> wrote:

> Introduce the "chip_info" structure approach for better variant handling.
>
> The variant to be used is now chosen by the Device Tree (enum "chip_ids"),
> not by the chip ID in the register. However, there is a check to make sure
> they match (using integer "id_check").
>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
