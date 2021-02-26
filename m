Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8D4C433DB
	for <phone-devel@archiver.kernel.org>; Fri, 26 Feb 2021 21:42:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65D9564F1F
	for <phone-devel@archiver.kernel.org>; Fri, 26 Feb 2021 21:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBZVmE (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 26 Feb 2021 16:42:04 -0500
Received: from relay08.th.seeweb.it ([5.144.164.169]:46175 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbhBZVmE (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 26 Feb 2021 16:42:04 -0500
Received: from [192.168.1.101] (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A2A293EE66;
        Fri, 26 Feb 2021 22:41:07 +0100 (CET)
Subject: Re: [PATCH] arm64: dts: qcom: Add support for OnePlus 5/5T
To:     Jami Kettunen <jamipkettunen@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210226213132.400729-1-jamipkettunen@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <22bf85a4-d5d0-d9ad-32c4-26d23b3ed714@somainline.org>
Date:   Fri, 26 Feb 2021 22:41:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226213132.400729-1-jamipkettunen@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


On 26.02.2021 22:31, Jami Kettunen wrote:
> Add device trees for OnePlus 5 (cheeseburger) and 5T (dumpling)
> MSM8998 SoC smartphones with initial support included for:
>
> - UFS internal storage
> - USB peripheral mode
> - Display
> - Touch
> - Bluetooth
> - Hall effect sensor
> - Power and volume buttons
> - Capacitive keypad button backlight (on cheeseburger)
>
> Signed-off-by: Jami Kettunen <jamipkettunen@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../dts/qcom/msm8998-oneplus-cheeseburger.dts |  42 ++
>  .../boot/dts/qcom/msm8998-oneplus-common.dtsi | 519 ++++++++++++++++++
>  .../dts/qcom/msm8998-oneplus-dumpling.dts     |  25 +
>  4 files changed, 588 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad

