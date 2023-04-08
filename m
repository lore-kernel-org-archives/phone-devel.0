Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00ED5C7619A
	for <phone-devel@archiver.kernel.org>; Sat,  8 Apr 2023 13:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjDHNE7 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 8 Apr 2023 09:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbjDHNE5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 8 Apr 2023 09:04:57 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61982C141
        for <phone-devel@vger.kernel.org>; Sat,  8 Apr 2023 06:04:56 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id g18so14025652ejj.5
        for <phone-devel@vger.kernel.org>; Sat, 08 Apr 2023 06:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680959095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xh6bkPStbSQ1dpU7KkzU52JsHTt879N0HimG72vQ3b8=;
        b=nC2gVPZl249RFf3lqlnEwLwWaSnSBhNAAtAGz51eClGxhAosm6fjUWZPeTiE8fQAcN
         onc0QiQ86NbO04Ch6QpqEmeAa4xq2it6BIgeVTutKtZbQO7L5+fHcbBaHl1yI5ZW0TSY
         VbT/ntcEB21JGFm7srOvxNoqHU/DcHZlMu1hfYbExArDiLDB6DYMlB5YH0uFXkVCykFV
         QLJtz87vdQvGne7zLWLfOJ1LmMpYiWR9X9LvfqxgZSdeN49ARPnZ/cDzxLhmRF5Sy7yk
         66k4XbOQDgpQP1hQ8yzswguZYWQkV2SGe7IVN+c6VCWRXWYv5LMlqxzLagN1olSjk4Cy
         yyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680959095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xh6bkPStbSQ1dpU7KkzU52JsHTt879N0HimG72vQ3b8=;
        b=1n79Ly9sELYN66ZV9z/ms7tPeVojzl1LSuhnx4OmTYfh94LYFXMvBWap7nQXY1JU6R
         59GY2Lbmkt1si62pkKRSBOr8CUKPDNxaAN7iIX4dpdn4Etgg4hiGw5PQWoVEuw9x2lM9
         kHTQc/KIxs5zGYQg5ynI5wnVjHUcUwKlMqb6/ujYcI0MrDttjHNttK9WA4+jGBrnsB0e
         ZOs+SuR0YtwZk4N0UZHRfQF3Akw7uwK0MjMbt39i4C96jI4Pp4F7AAOxX/oA5Efl60wF
         9gTuFHmftQs/KODbUyKWfEGadCz066sTQyZ4NiNdGfh2+uacQX5MKzR9HR0IZw02HjL9
         io5A==
X-Gm-Message-State: AAQBX9eytN1XhuVbZO4THN9T09DG5R5xE70F9PrwfmRHOO3qsCOXJNEJ
        C5n4AlpRxfpNSqLaF6ZEITZX3A==
X-Google-Smtp-Source: AKy350boyGnKqw7hqq5JoG0wMx75lTrgQ0trInMINpWhZDplgYwWd4Yao3TWoUpRzku1t20dTYUkNw==
X-Received: by 2002:a17:906:4b14:b0:94a:52bf:b820 with SMTP id y20-20020a1709064b1400b0094a52bfb820mr458098eju.46.1680959094876;
        Sat, 08 Apr 2023 06:04:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ecc:a9b7:a95b:bbea? ([2a02:810d:15c0:828:7ecc:a9b7:a95b:bbea])
        by smtp.gmail.com with ESMTPSA id xa16-20020a170907b9d000b00948aae5e3d3sm3104065ejc.184.2023.04.08.06.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Apr 2023 06:04:53 -0700 (PDT)
Message-ID: <0a5729a8-9fd8-a084-3932-cf8ebf00860b@linaro.org>
Date:   Sat, 8 Apr 2023 15:04:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm8250-xiaomi-elish-boe: Add
 mdss and dsi panel
To:     Jianhua Lu <lujianhua000@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230323005925.23179-1-lujianhua000@gmail.com>
 <20230323005925.23179-2-lujianhua000@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323005925.23179-2-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 23/03/2023 01:59, Jianhua Lu wrote:
> Add nodes for BOE NT36523 panel found in xiaomi-elish. This panel
> is a dual dsi mode panel and the dsi phy type is cphy.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v2:
>   - Include missing <dt-bindings/phy/phy.h> for phy-type property.
> 
> Changes in v3:
>   - Sort include header.
>   - Move qcom,sync-dual-dsi to the front of qcom,master-dsi 
>   - Add newline before subnode.
> 
>  .../boot/dts/qcom/sm8250-xiaomi-elish-boe.dts |  5 ++
>  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 75 +++++++++++++++++++
>  2 files changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
> index bd9ad109daf9..8b2ae39950ff 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts
> @@ -11,3 +11,8 @@ / {
>  	model = "Xiaomi Mi Pad 5 Pro (BOE)";
>  	compatible = "xiaomi,elish", "qcom,sm8250";
>  };
> +
> +&display_panel {
> +	compatible = "xiaomi,elish-boe-nt36523";

If you add new bindings and new nodes using these - in this case this
panel - please test it. This is why we have DT schema, so you can verify
your DTS. Sending DTS which is entirely different than the bindings you
sent, is adding quite an effort for us later to fix it.

Best regards,
Krzysztof

