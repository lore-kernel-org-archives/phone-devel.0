Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759DEC4332B
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 17:54:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41C3823A5C
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 17:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbhANRyX (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 14 Jan 2021 12:54:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728075AbhANRyV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 14 Jan 2021 12:54:21 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26A7C061794
        for <phone-devel@vger.kernel.org>; Thu, 14 Jan 2021 09:53:30 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id x13so6780483oic.5
        for <phone-devel@vger.kernel.org>; Thu, 14 Jan 2021 09:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SAQ20xRQL/NbqgMnrMeM6ds4nRHdebpusaxXVvq+8jY=;
        b=n8Uke2ZrV7AW1F1Ibb0Lns8VJdLcfms60B+gCZkAxTz9kKDLISScw/4qa+V1H2Bn0R
         dyFI4n0pcYfx9YJKTlaBC9nZwdUAyGydFyrE2js9KDjMwCpV1jwPjzYNXrEvpWuut3Cb
         aFcS2Suh19jmZNGnzPm6FS84A4tmkF+xkEyDhiCjJN9aZqCMq4j+hSaCi45AgWSHf/yQ
         00H4OxfTvvoqoxhyZ8pmIqzCUikq/Vgx5BNvU1Jl4Sy3W624d5NWBaB+V950Z/RrvHr5
         JDJPy7oo9lYNgFoJTuMV2nf2IEK5D/hLe4qFka0C57EbdBFEf8OcS26LYEZbptLWpII+
         xgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SAQ20xRQL/NbqgMnrMeM6ds4nRHdebpusaxXVvq+8jY=;
        b=J3XGrXAK5mYOKRQ4p6aVJJgYDmbvWm205+htMR5ERYtILUneU7tJBlyC5s1Z9EGb8s
         ZuA70No8U7CO+7bGY3AvcktecjluM17KNgGZk/JxOs8pM8kePeqTHWC+EiLAgpwFkZm+
         PizpmLDOCbtv2y467VB/52Yh3Sqhd9QTCSYP5caqTK6uwOI56A/RB1Olt99lsZLQvVnS
         t+ZLlGbyVSFuAFDbMYcjJPL6KpxgwyS/aVEGfKrvnpzWJ2/hxBHi/2gv4kd5ldASihlz
         bOe83Ohk8xcpPZw+pdMG1/KiG0BmyDi2N75XWTqvPq83vpmWVNCEpbStPdXE/k3JTFOP
         aMAQ==
X-Gm-Message-State: AOAM5305ZLUAzJiuQyG40Xa8NxFikbU0WEOp3ncXmei4D2fZhnamaXnD
        NleoVRqyQr3khWoT5VEffgpZ3g==
X-Google-Smtp-Source: ABdhPJz9FKoRxMERTXm0FbMjFq5wFy1ttaVQGS0dKuRhJTxl5a4EHgsNh/n2iKUv31SHjn1qqmi0wQ==
X-Received: by 2002:aca:54d8:: with SMTP id i207mr3221322oib.101.1610646810307;
        Thu, 14 Jan 2021 09:53:30 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u76sm1161164oia.48.2021.01.14.09.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 09:53:29 -0800 (PST)
Date:   Thu, 14 Jan 2021 11:53:27 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     agross@kernel.org, kishon@ti.com, vkoul@kernel.org,
        robh+dt@kernel.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, konrad.dybcio@somainline.org,
        martin.botka@somainline.org, marijn.suijten@somainline.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: phy: qcom-qusb2: Document SDM660
 compatible
Message-ID: <YACFF+Pj/L7ZWt8N@builder.lan>
References: <20210114174718.398638-1-angelogioacchino.delregno@somainline.org>
 <20210114174718.398638-3-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114174718.398638-3-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu 14 Jan 11:47 CST 2021, AngeloGioacchino Del Regno wrote:

> Support for the SDM630/660 series of SoCs was added to the driver:
> document the qcom,sdm660-qusb2-phy compatible here.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index d457fb6a4779..582abbbd8b32 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -21,6 +21,7 @@ properties:
>                - qcom,ipq8074-qusb2-phy
>                - qcom,msm8996-qusb2-phy
>                - qcom,msm8998-qusb2-phy
> +              - qcom,sdm660-qusb2-phy
>        - items:
>            - enum:
>                - qcom,sc7180-qusb2-phy
> -- 
> 2.29.2
> 
