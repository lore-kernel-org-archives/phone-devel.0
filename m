Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46033C4361A
	for <phone-devel@archiver.kernel.org>; Sat,  5 Dec 2020 05:15:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D4E822D0B
	for <phone-devel@archiver.kernel.org>; Sat,  5 Dec 2020 05:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbgLEFPZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 5 Dec 2020 00:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgLEFPZ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 5 Dec 2020 00:15:25 -0500
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58900C0613D1
        for <phone-devel@vger.kernel.org>; Fri,  4 Dec 2020 21:14:45 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id l10so1929645oom.6
        for <phone-devel@vger.kernel.org>; Fri, 04 Dec 2020 21:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wEizxSeMcZyrnpBQoSJZLM1AFiDunhDSj13iuZIM0TY=;
        b=EvlDpLKFCFv5U5IOXD8THSqcmKQKFV/7mI2hVZCuec47kqdhrRfiWfOxzjsFB2Ch1x
         AkVWzZ+Nmo7GHm0SS4ar1UIbVyYqoFGiSvRHLTyz44zokPWwhRewXHfW87VQWqsvTKxm
         IrduAt4A3nYEgA+FoJZR18aK392a2VDoeIkUfJ9bLw1h6bZDhB8Iizu3X48HnJEGLBqy
         zYy3kyCflfveuGWOtOvIPdXpvq6Mq5NKkL9YuNVi+1gxgT4LGU83YgikaZ73n2t5AhV9
         ER4ZAdeQF5KG5+j680aAtJwzeAwrgTbfr31ThY9WW+IirhNYqZdDmEbWTJVR3hfraC7T
         cpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wEizxSeMcZyrnpBQoSJZLM1AFiDunhDSj13iuZIM0TY=;
        b=c+tuEJwglUhLTjlkSsi7HgMbfuqZg5DsMwVqfVqzHW6ltK9gFjgEjQd8H27KlzpLMz
         ZcbuUaEiagH0w95BdGUw/xSXtRB+QxVPBUPwKbOBbDhlyZ0zNPpLZ4sIuvzfWzsIpSKg
         8JX8pZL+UICCbRj4uc/mOaPI5Y+2EagNCruYEMWB3GKHmZxdPBmI7hGD6UP8lNj7LQDW
         jESZzixs+FaWpChxkG0Q+zZZZRfOu7zW10K8CNtKEA6U0CVTgMMH/+UBpvx2r8YaV38M
         USpgYz3qboqqu6WqbeYkCTf4ozQByYD7xueYuc68n6iMNfj1/3ATb92/suaJ0jMqBidV
         Ksxw==
X-Gm-Message-State: AOAM533T06vO4J/qTeIQIsTSoqVYJRRJvAh3nF8sb0B/YTAaBoLeyWEK
        UFtCQ8CaiL4DeKwolzvXH13YEA==
X-Google-Smtp-Source: ABdhPJyBlKG8wLUPqQv7CTfPD0lt5KWKVvALwb3i5xDahhi/7QBODRmFBo/LNwLQ36eVQ75hWJrxyg==
X-Received: by 2002:a4a:a8c8:: with SMTP id r8mr5901369oom.9.1607145284084;
        Fri, 04 Dec 2020 21:14:44 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n21sm1186149oie.15.2020.12.04.21.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 21:14:43 -0800 (PST)
Date:   Fri, 4 Dec 2020 23:14:41 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     kholk11@gmail.com
Cc:     agross@kernel.org, sboyd@kernel.org, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] dt-bindings: clock: Add QCOM SDM630 and SDM660
 graphics clock bindings
Message-ID: <X8sXQZHsYl8qUTbc@builder.lan>
References: <20200926130306.13843-1-kholk11@gmail.com>
 <20200926130306.13843-6-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926130306.13843-6-kholk11@gmail.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sat 26 Sep 08:03 CDT 2020, kholk11@gmail.com wrote:

> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Add device tree bindings for graphics clock controller for
> Qualcomm Technology Inc's SDM630 and SDM660 SoCs.
> ---
>  .../bindings/clock/qcom,sdm660-gpucc.yaml     | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdm660-gpucc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm660-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm660-gpucc.yaml
> new file mode 100644
> index 000000000000..dbb14b274d5b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sdm660-gpucc.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sdm660-gpucc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics Clock & Reset Controller Binding for SDM630 and SDM660
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm graphics clock control module which supports the clocks, resets and
> +  power domains on SDM630 and SDM660.
> +
> +  See also dt-bindings/clock/qcom,gpucc-sdm660.h.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sdm630-gpucc
> +      - qcom,sdm660-gpucc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: GPLL0 main gpu branch
> +      - description: GPLL0 divider gpu branch
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: gcc_gpu_gpll0_clk
> +      - const: gcc_gpu_gpll0_div_clk
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sdm660.h>
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +
> +    clock-controller@5065000 {
> +      compatible = "qcom,sdm660-gpucc";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +      reg = <0x05065000 0x9038>;
> +      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +               <&gcc GCC_GPU_GPLL0_CLK>,
> +               <&gcc GCC_GPU_GPLL0_DIV_CLK>;
> +      clock-names = "xo", "gpll0";

You need 3 clock-names, and they need to match what the binding defines.

Other than that I think it looks good.

Regards,
Bjorn

> +    };
> +...
> -- 
> 2.28.0
> 
