Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C909C433EF
	for <phone-devel@archiver.kernel.org>; Sat, 25 Jun 2022 20:30:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233472AbiFYUaz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 25 Jun 2022 16:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233348AbiFYUaz (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 25 Jun 2022 16:30:55 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A28C13F30
        for <phone-devel@vger.kernel.org>; Sat, 25 Jun 2022 13:30:54 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id c13so7840119eds.10
        for <phone-devel@vger.kernel.org>; Sat, 25 Jun 2022 13:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VLrefeAKt/Dq3outV5iV9u0MgIc7/N/yAidOvpVDbJc=;
        b=KZc5XUfSTB6d18qR5A6cE7D0tWCGwMhGBMo1UKJN3/LXHkcy4U4HMmrIYkoGCUKSvn
         ezA6v3kzloZnpdhm942xQb9LfpJKG+Oa2CMf9t7VNHTPZdzCAMPaAvs4N6+u0r0aZyjZ
         10VdRnOie5ay0w9fyvYizWAVz7CCeGEFVhlLNHFXhY/NdduAL8M6Rqw7pEztmPaxn//m
         RIB86JHvKpjEVPXOCmL9gxXJYptwhU0KNouN6/1aNTAZf2Y83lkLUTIFAiRgQjkI83Jf
         J3kOGpraHqgfI16zYOgB50cc1t0HBLZ2iFU0FzlDDtPIftaYfsBzzoT7a0jeey7wm07E
         kiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VLrefeAKt/Dq3outV5iV9u0MgIc7/N/yAidOvpVDbJc=;
        b=qMOr1VBXSRDg0lMF8/4UGlIkRIZ4AQrnByn3Mq2Y2vJwN/sWQtBCeAAW7zDTfCepKX
         xd7AkcNSSpWt2hMtlgRWL+TUyLsspj1+REk1zgkNQa4gJZUQ/mmtuKjtu8ltV0dgJlyw
         gRX3dJ+sLB6DQ+Ri/4tv/JJZtbBRfGBhVzRyOPuLgtnl5WyjZoSwye3jhMp9WdzudZZY
         swPgY3K0fY0y+9feiPLOz+xrkQEMJNtCPLOUo+eOGO51NTvjiSLxNHCPuKEiQiRI5WJp
         +bymtfdToYHP34tZsuCyaj+2/JlXXKTeDLD76k7TsHQ7jUzaRoyafast3742XwJGH4MV
         Ae3w==
X-Gm-Message-State: AJIora98G2QILmr7GhL0nKq2Syl1BTtbAVUuym4MUwcSuKcMMycL8fiL
        UFsq4rqsDeMX6Uz+wBwzOVa4IA==
X-Google-Smtp-Source: AGRyM1uVxpf9B5TTl1Z7wyKfg1MYoKCGhLn+4rU1ejsUCnvE/XzJ6gdXqNQmFz45WmrjdZukZZqU9Q==
X-Received: by 2002:aa7:d353:0:b0:435:6a15:139f with SMTP id m19-20020aa7d353000000b004356a15139fmr7110700edr.19.1656189052795;
        Sat, 25 Jun 2022 13:30:52 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f9-20020a17090660c900b007262a5e2204sm2971200ejk.153.2022.06.25.13.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jun 2022 13:30:52 -0700 (PDT)
Message-ID: <de5a0e6f-411f-0c7b-ae1e-1117a4126d2d@linaro.org>
Date:   Sat, 25 Jun 2022 22:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: Add MediaTek Helio X10 MT6795
 clock bindings
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, robh+dt@kernel.org
Cc:     krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        y.oudjana@protonmail.com, jason-jh.lin@mediatek.com,
        ck.hu@mediatek.com, fparent@baylibre.com, rex-bc.chen@mediatek.com,
        tinghan.shen@mediatek.com, chun-jie.chen@mediatek.com,
        weiyi.lu@mediatek.com, ikjn@chromium.org, miles.chen@mediatek.com,
        sam.shih@mediatek.com, wenst@chromium.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
        kernel@collabora.com, Rob Herring <robh@kernel.org>
References: <20220624093525.243077-1-angelogioacchino.delregno@collabora.com>
 <20220624093525.243077-3-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624093525.243077-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 24/06/2022 11:35, AngeloGioacchino Del Regno wrote:
> Add the bindings for MT6795's clock controller.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  include/dt-bindings/clock/mt6795-clk.h | 275 +++++++++++++++++++++++++
>  1 file changed, 275 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt6795-clk.h
> 
> diff --git a/include/dt-bindings/clock/mt6795-clk.h b/include/dt-bindings/clock/mt6795-clk.h
> new file mode 100644
> index 000000000000..9902906ac902
> --- /dev/null
> +++ b/include/dt-bindings/clock/mt6795-clk.h

Vendor prefix.

Best regards,
Krzysztof
