Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30500C433E6
	for <phone-devel@archiver.kernel.org>; Fri, 15 Jan 2021 05:38:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF19923A5E
	for <phone-devel@archiver.kernel.org>; Fri, 15 Jan 2021 05:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732927AbhAOFia (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 15 Jan 2021 00:38:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732855AbhAOFi2 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 15 Jan 2021 00:38:28 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB4EC0613C1
        for <phone-devel@vger.kernel.org>; Thu, 14 Jan 2021 21:37:48 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id o11so7537285ote.4
        for <phone-devel@vger.kernel.org>; Thu, 14 Jan 2021 21:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HoK0L94tAvaQsC8IbUSCSznvz7aY6ZUAuuiO3QdSeTo=;
        b=qL1N45lPrp9WXaKR7CLMyFVlaUtrQs71X2pYQnQ6zL5m07fj2CHGPdAXOBy4Oc3+fF
         b59G5XHPLIjDH0oKAJozjVrnCmqq0iz/f1WKWQL7koPZ0UIroSuYGU3tyRL58o63o5es
         3VoQaB4eUSukDECwOHkSkSSeOynLQiWSzCZyEn6vpwdv3DpvbV+FUOqszb/nCjePLOsp
         +wE3QnjvZ46aHej8J/j/fvP8xWuxti/S/NDJ4jCol1ITySOVPCIRGQIxOrq4M60TDM8l
         NJo/6fMzZNV52ewBpjlcZyhWV1wamWksumAi+M31igqQWfZCYskvNnfbNWWsFDUDzgXx
         qIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HoK0L94tAvaQsC8IbUSCSznvz7aY6ZUAuuiO3QdSeTo=;
        b=Qyn+JUKXNzba6aV0GHjoDYhvDG9r3gFpTEKU+giYB0vMkDoshw2nwXEru1sIu41/vH
         ISpPK9qQz7nbt87DO2nn1anpNjsl2bI/GP7hqgRrMZMF6Uo6lnKwvVKHCliHTQerbWBF
         OnKu7jGYyQvo+PjXSAuNNfZFvYvXizNvs5WKwX6kva/0gt4gSh2Ekkp812klBHgEQR0V
         ofsRKh4WXwllvZMByuZLi0xoHqzzCdcFdXH3vntzP9+LO+poccbRHXUdh+u7znvAlaPs
         2kyWmhBien49V1JHyfAVANvUaR6aTPKciH9A+/+wGOTXbsddYEimAeOMEDG0v+A3QzWf
         exMw==
X-Gm-Message-State: AOAM531+tMZjob8CFGDhe9K0iLv5a6dvMnuqPWdhmhiV6m+7Pw68go9J
        nrpFhpExL4gdniLpRCxgwyX+Bw==
X-Google-Smtp-Source: ABdhPJzMl0myBJ7Bn9w2oT979MZhSkUQEZbpeYNzD4GeDLRYtKbq7kLuPVeDXaFMYZFwW7IImwf8IA==
X-Received: by 2002:a05:6830:1587:: with SMTP id i7mr6975631otr.301.1610689067662;
        Thu, 14 Jan 2021 21:37:47 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t13sm1503195oih.26.2021.01.14.21.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 21:37:46 -0800 (PST)
Date:   Thu, 14 Jan 2021 23:37:45 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        sumit.semwal@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
Subject: Re: [PATCH v2 7/7] arm64: dts: pmi8998: Add the right interrupts for
 LAB/IBB SCP and OCP
Message-ID: <YAEqKZknkKT8/KSJ@builder.lan>
References: <20210113194214.522238-1-angelogioacchino.delregno@somainline.org>
 <20210113194214.522238-8-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113194214.522238-8-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed 13 Jan 13:42 CST 2021, AngeloGioacchino Del Regno wrote:

> In commit 208921bae696 ("arm64: dts: qcom: pmi8998: Add nodes for
> LAB and IBB regulators") bindings for the lab/ibb regulators were
> added to the pmi8998 dt, but the original committer has never
> specified what the interrupts were for.
> LAB and IBB regulators provide two interrupts, SC-ERR (short
> circuit error) and VREG-OK but, in that commit, the regulators
> were provided with two different types of interrupts;
> specifically, IBB had the SC-ERR interrupt, while LAB had the
> VREG-OK one, none of which were (luckily) used, since the driver
> didn't actually use these at all.
> Assuming that the original intention was to have the SC IRQ in
> both LAB and IBB, as per the names appearing in documentation,
> fix the SCP interrupt.
> 
> While at it, also add the OCP interrupt in order to be able to
> enable the Over-Current Protection feature, if requested.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index d016b12967eb..d230c510d4b7 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -30,11 +30,15 @@ labibb {
>  			compatible = "qcom,pmi8998-lab-ibb";
>  
>  			ibb: ibb {
> -				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>;
> +				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>,
> +					     <0x3 0xdc 0x0 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "sc-err", "ocp";
>  			};
>  
>  			lab: lab {
> -				interrupts = <0x3 0xde 0x0 IRQ_TYPE_EDGE_RISING>;
> +				interrupts = <0x3 0xde 0x1 IRQ_TYPE_EDGE_RISING>,
> +					     <0x3 0xde 0x0 IRQ_TYPE_LEVEL_LOW>;
> +				interrupt-names = "sc-err", "ocp";
>  			};
>  		};
>  	};
> -- 
> 2.29.2
> 
