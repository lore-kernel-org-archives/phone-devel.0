Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67494C07E96
	for <phone-devel@archiver.kernel.org>; Thu,  8 Jul 2021 14:48:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 446DB6109D
	for <phone-devel@archiver.kernel.org>; Thu,  8 Jul 2021 14:48:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhGHOvk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 8 Jul 2021 10:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbhGHOvk (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 8 Jul 2021 10:51:40 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B92C061574
        for <phone-devel@vger.kernel.org>; Thu,  8 Jul 2021 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=eUNuUzJxpWQ9/7mhxGOd+5A5iY6PGJl9Jgs7NRna4RM=; b=VMv6q7UYnm6a1cXRWzTHkrQknJ
        oMtqroVaoqygowG+iXOnK+LO4V8tdV4SgRi9T+JQkI+dudLqn5cdYQEAhSw7Ceq4OxDFUTNXFb7sp
        ayYKVY72Kr2qXY6NFQ8XqmU9oYNFQ+IWr3MIg1wuN3Wabzd8Oj5kUeNB7Cutg/ll2JmANtBjaCKfE
        wRCKeGI5BYVVyNRPpliP7eIqEvdWlWgi8qwcezQf8c+K4uVaUaEvyGpFE2ONdbg7mUzDCigtUXmWk
        cLfg9paSochPgwvY7r8WaA4ROD2xu1wIiImN7JksvpRjbiPaqOl+yKrBc+BWT43MuooUd7xjRpFcF
        Kqoq9dAg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56397 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1m1VKg-0002qY-KM; Thu, 08 Jul 2021 16:48:54 +0200
Subject: Re: [PATCH 2/2 v3] drm/panel: ws2401: Add driver for WideChips WS2401
To:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org
Cc:     phone-devel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
References: <20210707234315.242663-1-linus.walleij@linaro.org>
 <20210707234315.242663-2-linus.walleij@linaro.org>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <9d1c0730-af71-c0fa-09c1-37dea40edc44@tronnes.org>
Date:   Thu, 8 Jul 2021 16:48:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707234315.242663-2-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



Den 08.07.2021 01.43, skrev Linus Walleij:
> This adds a driver for panels based on the WideChips WS2401 display
> controller. This display controller is used in the Samsung LMS380KF01
> display found in the Samsung GT-I8160 (Codina) mobile phone and
> possibly others.
> 
> As is common with Samsung displays manufacturer commands are necessary
> to configure the display to a working state.
> 
> The display optionally supports internal backlight control, but can
> also use an external backlight.
> 
> This driver re-uses the DBI infrastructure to communicate with the
> display.
> 
> Cc: phone-devel@vger.kernel.org
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
