Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3ACC54EAA
	for <phone-devel@archiver.kernel.org>; Tue, 24 Jan 2023 14:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234881AbjAXO1q (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 24 Jan 2023 09:27:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234840AbjAXO1n (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 24 Jan 2023 09:27:43 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75F346702
        for <phone-devel@vger.kernel.org>; Tue, 24 Jan 2023 06:27:37 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id j17so11602619wms.0
        for <phone-devel@vger.kernel.org>; Tue, 24 Jan 2023 06:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ih/T3+fE5KUNeucJG+54LWbOG3GZygM+d+54jjzk9hE=;
        b=FPnGGmxkm6sxBclrNmB5yhxrik2jqrYeqam8kwEWXT9oiUeZOdKyCdOFTUt0bpXqx3
         68c6vtSpAx5L2d7Pmr1q+ayfjPQUkeWB6E4lIx1JtwrZ1k8Fus2cuHoud3LbvfOVO3SP
         o7sBIZDhr1LdFwD5d+FXG3BLTUNIKe03Nh44niOHwJFQ18R6sVGEoJI8xk12EcW4JGLO
         mgh7dps3sIS2AtQMFoTtewTiSIsnCe/XPDxQE7qKK4P5KIQt0kVvuC6ZRtw5frgpuyxG
         Y+3sMlEtfKommoGkiszSlc/2vgQYxtDRKp6+9RZ181c3DTi/M0BJRnJF9Adli/waEHFa
         E42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ih/T3+fE5KUNeucJG+54LWbOG3GZygM+d+54jjzk9hE=;
        b=HoMfoyZbG1705rxacHkF13bM0DMi5GZlT+9Iyh5qOd0x758bIB93AndS/wDtDBp+Gg
         G6Kei1HgqAoJu88h8e4Qe8CaKeHoqxj3iqIapu0Dp6rvcFcIyQ4Fx4UHPBfXPIog4G6r
         MMAmbU2tyYsb5Q7ShOfXO+Jv+NRy6/tgx2Ha/0/izVtnmBvE+Q78RM15lzQAySiudCH0
         GUnJmCQy6W9seCpDasrfW5XGkNiY5XSIjC8g8n/2peWOUtSL9NhR2uJgtOdiywV5jZXi
         tkakmnp7PzgureFQby9okPmZHpn9/gkYP+jtJhSylTnT66d3L4kNaYX2LiXwJm72sc7o
         adeA==
X-Gm-Message-State: AFqh2kqvm2ygBBDZnTKx2duGXBVwgFbAlQy5uI9GV1tf58aFk15IiNrg
        KgLY06oFwwB+BGXge65E8474/A==
X-Google-Smtp-Source: AMrXdXucT9VgZdYEYX8b4F6onwRJuVez8e638q9+QZ0SzAoR2soR2zqDhz7sCxfvzsqnOKV1E7DMcA==
X-Received: by 2002:a05:600c:5409:b0:3da:f66a:e866 with SMTP id he9-20020a05600c540900b003daf66ae866mr28100113wmb.10.1674570456290;
        Tue, 24 Jan 2023 06:27:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bg24-20020a05600c3c9800b003d9ed40a512sm18815472wmb.45.2023.01.24.06.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 06:27:35 -0800 (PST)
Message-ID: <3b4bd60c-84f3-f545-80ce-8ebe974557eb@linaro.org>
Date:   Tue, 24 Jan 2023 15:27:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Xiaomi Mi Pad 5 Pro
 (xiaomi-elish)
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230124135318.10023-1-lujianhua000@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124135318.10023-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 24/01/2023 14:53, Jianhua Lu wrote:
> Add a compatible for Xiaomi Mi Pad 5 Pro.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 22553637c519..c5fe81fba5b1 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -873,6 +873,7 @@ properties:
>                - qcom,qrb5165-rb5
>                - qcom,sm8250-hdk
>                - qcom,sm8250-mtp
> +              - xiaomi,elish
>                - sony,pdx203-generic
>                - sony,pdx206-generic

Not a correct order.

>            - const: qcom,sm8250

Best regards,
Krzysztof

