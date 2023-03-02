Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115DDC678D4
	for <phone-devel@archiver.kernel.org>; Thu,  2 Mar 2023 16:39:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjCBQjb (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 2 Mar 2023 11:39:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjCBQjW (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 2 Mar 2023 11:39:22 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4843555BA
        for <phone-devel@vger.kernel.org>; Thu,  2 Mar 2023 08:39:01 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-536bbef1c5eso436777487b3.9
        for <phone-devel@vger.kernel.org>; Thu, 02 Mar 2023 08:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PGC7FexSUDuE13biGFJ/Du9EMRxwYtWt7jLQYTTJIb0=;
        b=JcpthHHzlczfHnEAWweKijtEL5eu+oR2yGMUKX4OU1/+JQS3ANQD3h7dAOp5V7TWV7
         6Fw2vL5hy0DkeNBZ2DE0BrPiCTVwTrLZ/qCLVemHL/RZwHTnjPSXppBQ1NzFDZhbaFjg
         ORDfPLvR3Bjnj0qPbMtCcHX1rZlM8P+rxekiSLKQa4XrGzp1e0k/Z9joOGIWuVdjNCln
         4uy0JRmrdJCslGA/9taRcxMrX+2ox2CQi5pqTf0n++buftwlhEa71sGkaaxEhs2PYW1s
         DqB/a658rixzYbTLSNW14o2keAYrAamjHFnR9/rkYXBGP8YWrjNZYSpulyOZ/92xkHep
         5W1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGC7FexSUDuE13biGFJ/Du9EMRxwYtWt7jLQYTTJIb0=;
        b=SYi4maco5jH8V7/tMi+9qeHSMrp5OFQ6wURWKE1uljnSLgyIP4YLDH3jntn/yfCQwS
         KEsvFXOHTiDReutDCmEsbbbKluQsBKim21/Kb7jKXhtuVK+c2hZ0kEUVJh67YdKPyWAQ
         9c0JIIUyhUNKm1UJGXhRRzYp/y5VJLxCUOds2l73VgNBoeFWbTiceAXLDpRcbmeDo8Xp
         R/G/qnAAkJ0e+agJkTthgbLKHhvamyZlB4ygAnR1pwFjOKTcTG11uhQaNBVqH8XnLmEJ
         Bt3cW5Y8oWuXvEVvKTJbOaHHNtZF0Eu74mSr/2gjAIVAvgLw0S3lrbppINkoTIFwkOvo
         cOnA==
X-Gm-Message-State: AO0yUKXlRV02kojVGXOpHMJhcWyM9Jv2MrYIxOohH8Sj4y7wUZcYZIOE
        7UW+Xac6swbfNpXk9SzXNCnoMGqe8O7hhBykAIL9PXuk1RxjiQ==
X-Google-Smtp-Source: AK7set9K8jJPZUlDxy83PEHgBkdtZZCQuBT0j69TZkB7pMGcFEQExvBE0Z6nzo20Xj2S+Muoxl0GE46SntlTIf4bzFM=
X-Received: by 2002:a81:b71b:0:b0:536:7529:55b4 with SMTP id
 v27-20020a81b71b000000b00536752955b4mr6642631ywh.3.1677775140455; Thu, 02 Mar
 2023 08:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20230302123051.12440-1-a39.skl@gmail.com> <20230302123051.12440-2-a39.skl@gmail.com>
In-Reply-To: <20230302123051.12440-2-a39.skl@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 2 Mar 2023 18:38:49 +0200
Message-ID: <CAA8EJpoxtKQfmdbX+CGmri6RUf3YauxNUc1z62Xn1TczcsWhDw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8956-loire: Provide rate for
 xo_board clock
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 2 Mar 2023 at 14:31, Adam Skladowski <a39.skl@gmail.com> wrote:
>
> As xo_board is part of board not soc we define rates per device tree,
> assign common 19.2Mhz rate to make consumers happy.
>
> Fixes: ff7f6d34ca07 ("arm64: dts: qcom: Add support for SONY Xperia X/X Compact")
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
> index 67baced639c9..085d79542e1b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
> @@ -280,3 +280,7 @@ &usb_hs_phy {
>         vdda3p3-supply = <&pm8950_l13>;
>         status = "okay";
>  };
> +
> +&xo_board {
> +       clock-frequency = <19200000>;

This doesn't seem to be board-specific. Please move it to msm8976.dtsi.

> +};
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
