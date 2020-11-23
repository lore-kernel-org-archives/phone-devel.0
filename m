Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E562BC388F9
	for <phone-devel@archiver.kernel.org>; Mon, 23 Nov 2020 21:59:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80DDF206E3
	for <phone-devel@archiver.kernel.org>; Mon, 23 Nov 2020 21:59:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729501AbgKWV7I (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 23 Nov 2020 16:59:08 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:42452 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729481AbgKWV7I (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 23 Nov 2020 16:59:08 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 203A920060;
        Mon, 23 Nov 2020 22:59:06 +0100 (CET)
Date:   Mon, 23 Nov 2020 22:59:04 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/mcde: Fix RGB/BGR bug
Message-ID: <20201123215904.GA676783@ravnborg.org>
References: <20201117175413.869871-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117175413.869871-1-linus.walleij@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=j8Cu_9a8AAAA:8 a=KKAkSRfTAAAA:8
        a=7gkXJVJtAAAA:8 a=sngfz7gVtQOnW0fYQYUA:9 a=CjuIK1q_8ugA:10
        a=AjGcO6oz07-iQ99wixmX:22 a=A2jcf3dkIZPIRbEE90CI:22
        a=cvBusfyB2V15izCimMoJ:22 a=E9Po1WZjFZOl8hwRPBS3:22
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Linus.

On Tue, Nov 17, 2020 at 06:54:13PM +0100, Linus Walleij wrote:
> I was confused when the graphics came out with blue
> penguins on the DPI panel.
> 
> It turns out that the so-called "packed RGB666" mode
> on the DSI formatter is incorrect: this mode is the
> actual RGB888 mode, and the mode called RGB888 is
> BGR888.
> 
> The claims that the MCDE had inverse RGB/BGR buffer
> formats was wrong, so correct this and the buggy
> register and everything is much more consistent, and
> graphics look good on all targets, both DPI and
> DSI.
> 
> Cc: phone-devel@vger.kernel.org
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Looks fine and seems to do what you write it should do.

I do not understand why this part:
>       case DRM_FORMAT_BGR888:
>               val |= MCDE_EXTSRCXCONF_BPP_RGB888 <<
>                       MCDE_EXTSRCXCONF_BPP_SHIFT;
> +             val |= MCDE_EXTSRCXCONF_BGR;
>               break;

does not use MCDE_EXTSRCXCONF_BPP_BGR888
But maybe there is no counterpart to MCDE_DSICONF0_PACKING_BGR888?

Assuming all is good despite my confusion:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
