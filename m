Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAED0C433E0
	for <phone-devel@archiver.kernel.org>; Fri, 15 Jan 2021 04:55:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F3BB2339E
	for <phone-devel@archiver.kernel.org>; Fri, 15 Jan 2021 04:55:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731581AbhAOEzN (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 14 Jan 2021 23:55:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731481AbhAOEzM (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 14 Jan 2021 23:55:12 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 948A8C061575
        for <phone-devel@vger.kernel.org>; Thu, 14 Jan 2021 20:54:32 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id 9so8417592oiq.3
        for <phone-devel@vger.kernel.org>; Thu, 14 Jan 2021 20:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8sHhymJrSWt5CXH4/Dx0MEn5JjVcd+yxHhCUHMR6BGM=;
        b=YAqpdVnh/kYolZAA2AMFHqqGRZ07t2zhWujMvwJXuuGSwZwYzfnQIJESKhhK92eQVu
         UetNWAecoL+ak/25lAzbZJJU1uxIjspu1QUzKVkmxAuZxpX68d9/9CmrqjqKwjTbCb5Z
         qEBQ4GYVgc7kAW+1SstnrCWpxMneTswJQOpvRQbGLd1UKzLuJuOeZ6kinKxwDfhLHEHF
         U/FPkTOcI1C5CxmucIaJo7zzOZk2u7EqX9tvQYWzYDcnGeWCcP2kJdQqvNXTEMLQNJzL
         ir7OwV8YUr9UKxzKR/lt8VcoUcXbkl43PqK9hjPxoxvlqARhZv0PNvKbFfGVsV6IeE+V
         70RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8sHhymJrSWt5CXH4/Dx0MEn5JjVcd+yxHhCUHMR6BGM=;
        b=IJb4fK7nANeX3liNYXOy7ggLw2I5pzEH6ccSICX+0d8hIgTNEl1dVs9+POTj/i9n/6
         39TY1jasN306nh/zi+xUmMAxrdU6idvENlFmq70ji6il7EvsAhSrRIOX3ovL+fGN/+iN
         +YLI00pasR+eFN+3EKhqgILM5xj0hWe2XjZwpcFWKB4DN17kZwbRLiKyMwKqUh5Hlxyd
         FOas/QfxKCdrh5w0y9PD3HF0vSnrBjKr/z3KHh52D4QJgs5SVzoDMgVIyKvrD5LzNSbq
         C4iUcNJiNPRPIDd/XgBNJVxGfLyYmVXPMaEuiKWeoQVSKTF1L0pThFyRH0r3v0xqC5z5
         /Pbw==
X-Gm-Message-State: AOAM533R+p9jxDCocnMnNdFH8JhwdcIHvcr963kz6v+hsWMvEiZANhe9
        m+hVdR7HsgL2Sfz9aJY9FmHs0g==
X-Google-Smtp-Source: ABdhPJyC3b9dFE1UBeJ0/GRy+E7LnpNmnQ2LfcPgWY2QkzrCD049MOeNXFOq9bA7rvRzYb+zimBPpw==
X-Received: by 2002:aca:e107:: with SMTP id y7mr4666746oig.57.1610686472036;
        Thu, 14 Jan 2021 20:54:32 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 94sm1592411otw.41.2021.01.14.20.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 20:54:31 -0800 (PST)
Date:   Thu, 14 Jan 2021 22:54:29 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        sumit.semwal@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
Subject: Re: [PATCH v2 4/7] dt-bindings: regulator: qcom-labibb: Document
 soft start properties
Message-ID: <YAEgBXwyRAwuPWZ2@builder.lan>
References: <20210113194214.522238-1-angelogioacchino.delregno@somainline.org>
 <20210113194214.522238-5-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113194214.522238-5-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed 13 Jan 13:42 CST 2021, AngeloGioacchino Del Regno wrote:

> Document properties to configure soft start and discharge resistor
> for LAB and IBB respectively.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../bindings/regulator/qcom-labibb-regulator.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> index 53853ec20fe2..7a507692f1ba 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> @@ -22,6 +22,11 @@ properties:
>      type: object
>  
>      properties:
> +      qcom,soft-start-us:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Regulator soft start time in microseconds.
> +        enum: [200, 400, 600, 800]
> +        default: 200
>  
>        interrupts:
>          maxItems: 1
> @@ -35,6 +40,11 @@ properties:
>      type: object
>  
>      properties:
> +      qcom,discharge-resistor-kohms:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Discharge resistor value in KiloOhms.
> +        enum: [300, 64, 32, 16]
> +        default: 300
>  
>        interrupts:
>          maxItems: 1
> -- 
> 2.29.2
> 
