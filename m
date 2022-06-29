Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBC7C43334
	for <phone-devel@archiver.kernel.org>; Wed, 29 Jun 2022 10:49:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbiF2KtX (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 29 Jun 2022 06:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbiF2KtW (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 29 Jun 2022 06:49:22 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD10A1E3FA
        for <phone-devel@vger.kernel.org>; Wed, 29 Jun 2022 03:49:21 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id pk21so31791254ejb.2
        for <phone-devel@vger.kernel.org>; Wed, 29 Jun 2022 03:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=baA9UVReBlJ4gVnrDyz4dAqxk2LXffGXuw2131Io+Xs=;
        b=Xbs715B9STAbNQ0EwSFISsyIdQQ4LuTgVzpCuaPuzRZ4m129IjIXf3DRAPdaKEjYsm
         JIDFhlVnAbe1RyL7xEGFf2fItbxHRPeukYBYU4T+tuhdZLbATg7v8I2CUi+0O/Am7saX
         XhNmxqPoqylhbQXtRiAuTcwCT1Ko3vKEDfZEDmSYJxOozzEZXjKJnk89SV2ybwzFvPgq
         lJknVRn4ZcMadGp5TOdSX8xfdhP1eLe6psqov8T/avJbEqdHGsNsEMkI1C4Qj2yF6quf
         dqeyvpks+jdVhLSMPh7rL3I8KGA5fTDRhqCnCvfLKpt/synchRPUtJFNRQBF8WJLrxaW
         k3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=baA9UVReBlJ4gVnrDyz4dAqxk2LXffGXuw2131Io+Xs=;
        b=CDAQ+g+OrYnj7Nbk79aSd7CrYmtrqa+dQ8M46Q4JQTgaahGDCGWLlKic+Cc2vmNBC4
         v+ZmuznaLC1qfMZcswLNimZXytg58W9P7x7EuAJYpCVGMPV4MRJ1df5Sbra/a3mxIjag
         1LWIpLbaBvpy+iaAwZwPjbIOqRL+yLot+BGEw/fUiDl6o7h8lQVbqz62zd2Ne2jnBdLb
         graNUn8j0iNuB33ZMDstd67VqfyYuHcEUGTYugpk2VMjYjHBvdzI0Jig/VNzRlmD5sGh
         HjJGSK/PwCyGxZNgWA/3ZbrNP2EAmsUZH+XfOsZjvlYVy5GSL+8Qr20/pwFYntjarOZC
         971A==
X-Gm-Message-State: AJIora/Do3TN/aJK3IVpRM2dP1w4IV/Al+4953VtzvLqdRbkaHGXkPWz
        YKwiQLtuk85lpCi8nnm23d8zfg==
X-Google-Smtp-Source: AGRyM1sBR1woO9PSRLRDGfi43ztmS22+sCcHwwD1BkKikBN/g7jU5/KGldrmQEy3hRirXoLPpmSyag==
X-Received: by 2002:a17:907:2814:b0:72a:3758:e948 with SMTP id eb20-20020a170907281400b0072a3758e948mr1713964ejc.8.1656499760309;
        Wed, 29 Jun 2022 03:49:20 -0700 (PDT)
Received: from [192.168.0.184] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q18-20020a17090609b200b006feaa22e367sm7527140eje.165.2022.06.29.03.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 03:49:19 -0700 (PDT)
Message-ID: <51748cbc-e895-13cc-6b8e-8c62b211aa4e@linaro.org>
Date:   Wed, 29 Jun 2022 12:49:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 3/7] dt-bindings: reset: Add bindings for MT6795 Helio
 X10 reset controllers
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
References: <20220627085632.23797-1-angelogioacchino.delregno@collabora.com>
 <20220627085632.23797-4-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627085632.23797-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 27/06/2022 10:56, AngeloGioacchino Del Regno wrote:
> Add the reset controller bindings for MT6795.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  include/dt-bindings/reset/mt6795-resets.h | 50 +++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mt6795-resets.h
> 
> diff --git a/include/dt-bindings/reset/mt6795-resets.h b/include/dt-bindings/reset/mt6795-resets.h
> new file mode 100644
> index 000000000000..0a6514884eae
> --- /dev/null
> +++ b/include/dt-bindings/reset/mt6795-resets.h

You still need vendor prefix.


Best regards,
Krzysztof
