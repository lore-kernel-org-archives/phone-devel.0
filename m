Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F328C7619A
	for <phone-devel@archiver.kernel.org>; Mon, 27 Mar 2023 01:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjC0BtH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 26 Mar 2023 21:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjC0BtG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 26 Mar 2023 21:49:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B1E4EFD;
        Sun, 26 Mar 2023 18:49:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2878FB80D81;
        Mon, 27 Mar 2023 01:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80712C433D2;
        Mon, 27 Mar 2023 01:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679881742;
        bh=X++yYE3ZBYBleqD/IBa+ZEo3Zil0amsIq66sdi/MS8s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aB1PHJ4kD4oNyYCGK5YSAvlWlyWVaXBqfFhAOYaBXUUGM4+/UlvDXElvYbRmvJ2dj
         59efBV6aBlGHWul0klZ/xn4y1kX0lL/MWMoJGIYaYgqwnjlLOrwT7CUXYHPrtyBZua
         cCL7D8av8niAiAA1DULlhnB54YD2XMQ/gOqiZXCaK9rEPNHY0slhx2LAv3wiQsYBeg
         PuDxs+ZAKOPlplh9peDHGliMohgnRql219UxZvy7EylIFfXqV4k3nWtiYxhNBJrq/J
         K1dvYrC2XMDfHvtmlejngOA8UZhhzPmuTf/38uzwJMrEssWmwpfB4lk+Q66/n8gBcf
         8sHavjXxH4ywg==
Date:   Mon, 27 Mar 2023 09:48:55 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     robh@kernel.org, krzysztof.kozlowski@linaro.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        kernel@puri.sm, linux-imx@nxp.com, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/14] arm64: dts: imx8mq-librem5: updates and fixes
 until march 2023
Message-ID: <20230327014855.GA3364759@dragon>
References: <20230309204608.237605-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309204608.237605-1-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, Mar 09, 2023 at 09:45:54PM +0100, Martin Kepplinger wrote:
> hi Shawn and all interested in the Librem 5 phone,
> 
> This is another round of updates to the phone DT description. Some are
> clear fixes, but some are important updates like the CSI changes
> that make the selfie cam work or the powersaving related things like
> the ddrc opp table entry and voltage changes.
> 
> As previously this is all mixed together because the changes are small.
> If you prefer separate, small "topic-patchsets", please say so.
> 
> thanks,
>                            martin
> 
> 
> Angus Ainslie (1):
>   arm64: dts: imx8mq-librem5: add the magnetometer mount matrix
> 
> Martin Kepplinger (4):
>   arm64: dts: imx8mq-librem5: lower the mipi csi 1 frequencies
>   arm64: dts: imx8mq-librem5: describe the clock for the csi sensors
>   arm64: dts: imx8mq-librem5: fix audio-1v8 regulator name
>   arm64: dts: imx8mq-librem5: add brightness levels to led-backlight
> 
> Sebastian Krzyszkowiak (9):
>   arm64: dts: imx8mq-librem5: Describe MIC_2V4 regulator
>   arm64: dts: imx8mq-librem5: Set charger parameters for each batch
>   arm64: dts: imx8mq-librem5: Set the DVS voltages lower
>   arm64: dts: imx8mq-librem5: Bump usdhc2 frequency to 100MHz
>   arm64: dts: imx8mq-librem5: Adjust proximity sensor's near levels
>   arm64: dts: imx8mq-librem5: Remove dis_u3_susphy_quirk from usb_dwc3_0
>   arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage to 0.81V
>   arm64: dts: imx8mq-librem5: Reduce I2C frequency to 384kHz
>   arm64: dts: imx8mq-librem5: Add 166MHz to DDRC OPP table

Applied all, thanks!
