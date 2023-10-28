Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32527C27C47
	for <phone-devel@archiver.kernel.org>; Sat, 28 Oct 2023 10:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjJ1Kje (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 28 Oct 2023 06:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjJ1Kje (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 28 Oct 2023 06:39:34 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D228F2;
        Sat, 28 Oct 2023 03:39:31 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id D707C1C007C; Sat, 28 Oct 2023 12:39:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1698489568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YXbQJwvtANscaIAeF/IlPVvDQ0S7sSN8cPn0pshFltY=;
        b=selF0ELpndESgbl6BrmFQRFj6mWRWRXbbD+T5e5sEilTl7sjj9R4ioCK+K0M3az60gG4e1
        UiCAcLFYDc1FxyijG3F7Z23AoFBKiOPPopwYTF6BBh3s/8kqv7joLzAS9N35etViALgzjn
        ebMkG7OpuWcyVTZjq8uGnPZ69XIF4LM=
Date:   Sat, 28 Oct 2023 12:39:27 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-oneplus: enable flash LED
Message-ID: <ZTzk39tQlYlpo2rU@localhost>
References: <20231001-b4-sdm845-flash-dts-v1-0-275a3abb0b10@linaro.org>
 <20231001-b4-sdm845-flash-dts-v1-1-275a3abb0b10@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231001-b4-sdm845-flash-dts-v1-1-275a3abb0b10@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi!

> +	led-1 {
> +		function = LED_FUNCTION_FLASH;
> +		color = <LED_COLOR_ID_YELLOW>;

That's warm white, not yellow. We should likely create a define for
that.

BR,
								Pavel
-- 
