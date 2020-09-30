Return-Path: <SRS0=RqZf=DH=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61636C47420
	for <phone-devel@archiver.kernel.org>; Wed, 30 Sep 2020 09:39:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2127720BED
	for <phone-devel@archiver.kernel.org>; Wed, 30 Sep 2020 09:39:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728126AbgI3Jjt (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Sep 2020 05:39:49 -0400
Received: from vps5.brixit.nl ([192.81.221.234]:49554 "EHLO vps5.brixit.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbgI3Jjt (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Sep 2020 05:39:49 -0400
X-Greylist: delayed 528 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Sep 2020 05:39:47 EDT
Received: from [192.168.20.102] (unknown [77.239.252.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by vps5.brixit.nl (Postfix) with ESMTPSA id 6B64060733;
        Wed, 30 Sep 2020 09:30:55 +0000 (UTC)
Subject: Re: [PATCH] phy: qcom-qusb2: Add support for SDM630/660
To:     kholk11@gmail.com, agross@kernel.org
Cc:     bjorn.andersson@linaro.org, kishon@ti.com, robh+dt@kernel.org,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200926131157.14633-1-kholk11@gmail.com>
From:   Alexey Minekhanov <alexeymin@postmarketos.org>
Message-ID: <fdb90253-a9ff-518c-5138-1a20fc03facd@postmarketos.org>
Date:   Wed, 30 Sep 2020 12:31:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200926131157.14633-1-kholk11@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Tested on Xiaomi Redmi Note 7 (lavender), SDM660

Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

On 9/26/20 4:11 PM, kholk11@gmail.com wrote:
> From: Konrad Dybcio <konradybcio@gmail.com>
>
> QUSB on these SoCs actually uses *almost* the same
> configuration that msm8996 does, so we can reuse
> the phy_cfg from there with just a single change
> (se clock scheme).
>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  drivers/phy/qualcomm/phy-qcom-qusb2.c                     | 7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
