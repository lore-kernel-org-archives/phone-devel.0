Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB86BC0032E
	for <phone-devel@archiver.kernel.org>; Sat, 28 Oct 2023 10:39:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjJ1Kjq (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 28 Oct 2023 06:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjJ1Kjp (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 28 Oct 2023 06:39:45 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB745F1;
        Sat, 28 Oct 2023 03:39:43 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9ECBE1C007C; Sat, 28 Oct 2023 12:39:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1698489582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=v8GRunWXkz2EhpYIjMx6s+mZlAVkZ08YcCPCZSlxpBg=;
        b=SW2cpvuUcKZSXMhvvuuxlm/i9jPTzcMmda0cWak6ny1mD29a8a8IpBXjsYa1WK3xc7xnFO
        xS3FuD96N+gYPA6OAawwsek45oOuRd1BUOQy4uDZ5vL3cCIH/5aV1B4lxwALTBbLat06vT
        ylVAq+Y92pkHieG+eYCklekWFnLqsoU=
Date:   Sat, 28 Oct 2023 12:39:41 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: longcheer l8910 and l9100: Enable
 RGB LED
Message-ID: <ZTzk7cNJd4iPsd3B@localhost>
References: <20231013-bq_leds-v1-0-cc374369fc56@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013-bq_leds-v1-0-cc374369fc56@apitzsch.eu>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi!

> With the driver for ktd2026 recently applied to linux-leds[1], the LED
> can be enabled on longcheer l8910 and l9100.

Please make sure sysfs name is consistent with notification LED on
other phones, as documented by well-known-leds.txt.

Best regards,
								Pavel
-- 
