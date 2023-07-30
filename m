Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C709EB64DD
	for <phone-devel@archiver.kernel.org>; Sun, 30 Jul 2023 05:58:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjG3F6f (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 30 Jul 2023 01:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjG3F6e (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 30 Jul 2023 01:58:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2003E54;
        Sat, 29 Jul 2023 22:58:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7778A60B94;
        Sun, 30 Jul 2023 05:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113FDC433C7;
        Sun, 30 Jul 2023 05:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690696712;
        bh=BYFB0o2Oy4njxqSbjsRDEiL3hDbe6BYOk76QKE2aJ/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hODyUmU3bpdQytWVZi8LfHwjSRrz3nhDFYM26gEwsHZkHTUtYSUtn88BlFk/qU2H5
         EQJfs9Zk9Vl2T7CXyalyCTEi/5DHkbJfPLRo+ijmp8CHq03wBEHDLD9nUZRageGbet
         9puubxPhT3PDrd/RyI50qrO0rujV+IQcx0qxN9QC7AlV/kBRsMNWfYN+S3c/lLBRlt
         WyQmN6sR5MGOq1ftpWRh7PfTunkcSN+mMfeYor+AemEqjvNWKHxq+eUkBTk04tGLJ9
         jhA2j8eni+E50071TnnjGDukbLhNgu995fXAbSwu1aa7Vf9iLwmwYedM6m/FuUQXaA
         v+x4/nO5MRQYQ==
Date:   Sun, 30 Jul 2023 13:58:18 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, festevam@gmail.com, kernel@pengutronix.de,
        linux-imx@nxp.com, kernel@puri.sm, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [PATCH v1 0/4] arm64: dts: imx8mq-librem5: description updates
Message-ID: <20230730055818.GW151430@dragon>
References: <20230717100056.4047292-1-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717100056.4047292-1-martink@posteo.de>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Jul 17, 2023 at 10:00:52AM +0000, Martin Kepplinger wrote:
> From: Martin Kepplinger <martin.kepplinger@puri.sm>
> 
> hi Shaw and all interested,
> 
> This is another small but important round of hardware description updates
> for the Librem 5 phone. The first allows to use the display stack in
> the first place. The other 3 patches improve diplay-blanking when talking,
> enable fast charging when system-suspended, and faster system-resume.
> 
> thanks,
> 
>                          martin
> 
> Martin Kepplinger (1):
>   arm64: dts: imx8mq-librem5: set audio-1v8 always-on
> 
> Sebastian Krzyszkowiak (3):
>   arm64: dts: imx8mq-librem5-r4: Bump up proximity sensor's near level
>   arm64: dts: imx8mq-librem5: Mark tps65982 as wakeup source
>   arm64: dts: imx8mq-librem5: Reduce usdhc2's post-power-on-delay-ms to
>     20ms

Applied all, thanks!
