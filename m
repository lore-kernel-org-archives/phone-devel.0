Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7152BC433F5
	for <phone-devel@archiver.kernel.org>; Fri, 11 Feb 2022 00:09:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346147AbiBKAJH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 10 Feb 2022 19:09:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346109AbiBKAJH (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 10 Feb 2022 19:09:07 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E600E58
        for <phone-devel@vger.kernel.org>; Thu, 10 Feb 2022 16:09:07 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id 192so20151724ybd.10
        for <phone-devel@vger.kernel.org>; Thu, 10 Feb 2022 16:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WATbzyWdcGRXO+H4n4TlwQvCVpXdxX99IfXSiHQaJb8=;
        b=b93jgUrYF0dCu5NDWSgMtP+vbQVBJLCf2aDT0Y+lRcokF2jyM/+FsfjtgOWYM7sVOQ
         L9y/4hQbn4XsDH7gPrMUlQX/y1OXsEVkupawI9IdgVDDMt7uxy8eMA/1x+Np64t6LGUk
         idOsCmm0IUWK6WwyHBejLs6AD0KrBg4N267nadMePCzx04nbSlQWVrCKG++oslg4sWFr
         8wgXwCikb9leFKQOhADIqtXmSdyYwAgLVJm8h0IuQ+XuraZLObxgzoasCt8k/SIgRjhI
         xtWdlnbvsPHSX3XQw4cfSgtsltsN7IFduqFmrGAzndg5R/FE/iqN2Pxgg5LvYdrdzwx/
         UfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WATbzyWdcGRXO+H4n4TlwQvCVpXdxX99IfXSiHQaJb8=;
        b=fjlsbbKqyjO7JFm2vUzuCBHzC6Gh5p+Thbrw/YkDinQV6TrNDAVeL4s0/laCkver4+
         xLNGsS8gpMQZf/wNjUgJA7l4wub2Ms+ymGdh3YrTLT/jVNmGKtf0JSqeoKNexhL/waCp
         0m9Pk80ra759AFmtSiBPd37swVda65UlTil/orknzK7Hj/bRd/tv+JUOgmm+66G3sAUg
         SvPxqcGdQzKCSzT4ONn5LbDUox0dce//fRns4b0EQZ5NOoXaVbZBU9ygkKCoW433pLxN
         L6Kg5vMHBMsCG4NyduZDm/rLMRywCr2efei6JaWB6zrByt1k266sg5Sn14rzsY1oYsUG
         QEjw==
X-Gm-Message-State: AOAM533zV1A29u8AyZx2DlFzih3wIysdguDBadDOaEcyyJ8XnlD6hl5M
        nB3IRG9ynpRaLLwAUcpb4cQ6MTi8N/G3ThX5r6/vxw==
X-Google-Smtp-Source: ABdhPJzA9Zv+yu6ytLAOkKNwkbWM153MDa+UA7mEboGjwCS3aoQIkbG/Y7olNbzcU4lHkbC3e0tUmgUpsn7HEFRbjfE=
X-Received: by 2002:a81:4402:: with SMTP id r2mr10071843ywa.126.1644538146951;
 Thu, 10 Feb 2022 16:09:06 -0800 (PST)
MIME-Version: 1.0
References: <20220124171538.18088-1-rayyan@ansari.sh>
In-Reply-To: <20220124171538.18088-1-rayyan@ansari.sh>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Feb 2022 01:08:56 +0100
Message-ID: <CACRpkdZ+R6vcQTf2t+WRhd1+0owbOTyuyNWurzhukn_aABL1JQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: qcom,pmic-mpp: Document PM8226 compatible
To:     Rayyan Ansari <rayyan@ansari.sh>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Jan 24, 2022 at 6:17 PM Rayyan Ansari <rayyan@ansari.sh> wrote:

> Document the Device Tree binding for PM8226 MPPs.
>
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>

This patch and patch 2 applied to the pinctrl tree!

I suppose Bjorn will handle patch 3.

Yours,
Linus Walleij
