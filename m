Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A65ECAAD5
	for <phone-devel@archiver.kernel.org>; Mon,  5 Sep 2022 03:35:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235396AbiIEDfc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 4 Sep 2022 23:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbiIEDf3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 4 Sep 2022 23:35:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B0627DCE;
        Sun,  4 Sep 2022 20:35:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 97AC26105C;
        Mon,  5 Sep 2022 03:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25FCC433C1;
        Mon,  5 Sep 2022 03:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662348927;
        bh=fmefzqVbxhqHdi7vNQ24OE/BPCKIRozuajtVqOFLM/c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bBM4zrfGxTjTV0hXTsHXbVfilcbeNQBEazPuaEpy4TfOM6Gh+2/KCA/T0g/sT5144
         0szcnO/8ERmhVzjfnlwlwBPp6DJqsLB9olHxT2lYnwZ0uopEN6DVPQYJjEJlInlze5
         NbsFV2fcJ1ggULORZnKoSPZhDYaEIN2Ul27SoWzfmp63KSdNorpzZa6rgJSdfOnzSx
         tSerO9lZEcytynq3ZON2jahS5glTuNCmo/4DP3xX/jmuHTJEmgoI1fliKBVM/RoInr
         6+W0Tv+NOAPiFxE4ime10vZE0JG4rE/bcImjzOJx+fH6T2IQo2QxfGCHukdpbK1xDz
         i4j5pTkr1EkOg==
Date:   Mon, 5 Sep 2022 11:35:20 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     festevam@gmail.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, kernel@puri.sm, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v2 0/6] arm64: dts: imx8mq-librem5: phone DT updates
Message-ID: <20220905033520.GJ1728671@dragon>
References: <20220902084216.1259202-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220902084216.1259202-1-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Sep 02, 2022 at 10:42:10AM +0200, Martin Kepplinger wrote:
> hi Shawn and all interested,
> 
> This is another small number of patches that enables more devices
> or features found on the Librem 5 phone.
> 
> thank you,
> 
>                                martin
> 
> revision history
> ----------------
> v2: (thank you Krzysztof)
> * make led node names generic
> * add a mipi-csi syntax fix
> 
> v1:
> https://lore.kernel.org/phone-devel/20220831080301.1092737-1-martin.kepplinger@puri.sm/
> 
> 
> 
> Angus Ainslie (2):
>   arm64: dts: imx8mq-librem5: add USB type-c properties for role
>     switching
>   arm64: dts: imx8mq-librem5: add usb-role-switch property to dwc3
> 
> Guido Günther (1):
>   arm64: dts: imx8mq-librem5: add RGB pwm notification leds
> 
> Martin Kepplinger (2):
>   arm64: dts: imx8mq-librem5: describe the voice coil motor for focus
>     control
>   arm64: dts: imx8mq-librem5: fix mipi_csi description
> 
> Sebastian Krzyszkowiak (1):
>   arm64: dts: imx8mq-librem5: Add bq25895 as max17055's power supply

Applied all, thanks!
