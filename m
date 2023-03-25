Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBD4C6FD1C
	for <phone-devel@archiver.kernel.org>; Sat, 25 Mar 2023 11:12:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbjCYLMv (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 25 Mar 2023 07:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbjCYLMu (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 25 Mar 2023 07:12:50 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29EE15179
        for <phone-devel@vger.kernel.org>; Sat, 25 Mar 2023 04:12:47 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id cn12so17411777edb.4
        for <phone-devel@vger.kernel.org>; Sat, 25 Mar 2023 04:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679742766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i+Da6p8t1bRmX9X4IXLRnY2DE8przk6Zp2l2Yy3LUzg=;
        b=geb6dszSdPEclC0i9jC/0SdaI754rIyFU2xO6DvpzfKgCLSi+crJ/ha7gvhh4mkKJ/
         RpgSNLq7KKSn/GzBp8VLUBAR+2ZIhvhymqwW8mJDYGVIrWgkNps7uRpPPjtE4ewNxu0Y
         7eqDdNgaBIFoabYq9srYc4gpT12DeaRGWU45faXGSVfjkHKsc3pxgRnhYvs6MqoShDeO
         35kDR18K7Zsn3GNsRPQXmh3wXADALhYL37fUF4LBkC70l+l3bpBLVFsgE+5aZ5aHU1XQ
         Q3+Lu91azxFIeVN+MsAPRA6V+IMmKDyRLJwaan9TVO8Pe0FO37SarJm5xDtDR8HWUqso
         QO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+Da6p8t1bRmX9X4IXLRnY2DE8przk6Zp2l2Yy3LUzg=;
        b=BoaC8hVscZLVFStlJ9QMLq5EHFpcB+XBdybdVMSbT3uMt6Fq/bo4SdByfgFNS8zzWh
         XWxLdbuMxSS5rf2Y43BCpkvtEpOqx+6P2Dl8Ja2ggxyFSxhl+iTzyZ0Fup58TiEgrsk1
         kBXSBRD9BHBvKi7syVfIlF0m/NZbRbKUtcwsyJ4aCoRn4VXEvR4aZN0b/fAEvZ/3dAcA
         SYY4b3pjwhQ37MrA+RwJ7DFFtgyChohFPvjczb+koGviXBz0w8d9Hq1WceJ4XDCBeO5e
         kMfjo+rrcHVUZ4IvnzaJvTVG/n8vQ8thwZX0bPg1sNFjPAu18Eogk7NBo3pNYj/hHJ1j
         uE/w==
X-Gm-Message-State: AAQBX9f3/efFpgo8+Sb284yqsM1660AeDyYb9oY+tWtzUNSQxbPb6tlm
        gu/4PE53ksMDxi2gm9LpwZlbMw==
X-Google-Smtp-Source: AKy350ba6T8ZzFpM6baZosd4rhtYX0c3g3ppufyrcSy2Ttex0o5fyknxa3roehxOistyoBz3X8p/AQ==
X-Received: by 2002:a17:906:b349:b0:931:91a:fa4f with SMTP id cd9-20020a170906b34900b00931091afa4fmr6752833ejb.41.1679742766251;
        Sat, 25 Mar 2023 04:12:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id k24-20020a50ce58000000b004fc9e462743sm11988618edj.91.2023.03.25.04.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:12:45 -0700 (PDT)
Message-ID: <488a6684-50aa-e78d-d704-7f59ed3f2c13@linaro.org>
Date:   Sat, 25 Mar 2023 12:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 08/18] dt-bindings: gce: Add header for MT6795's GCE
 mailbox
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, matthias.bgg@gmail.com
Cc:     qii.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
 <20230324175456.219954-9-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324175456.219954-9-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 24/03/2023 18:54, AngeloGioacchino Del Regno wrote:
> Add the GCE header file to define the GCE subsystem IDs, hardware
> event IDs and thread priority IDs for the MT6795 Helio X10 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  include/dt-bindings/gce/mediatek,mt6795-gce.h | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 include/dt-bindings/gce/mediatek,mt6795-gce.h
> 
> diff --git a/include/dt-bindings/gce/mediatek,mt6795-gce.h b/include/dt-bindings/gce/mediatek,mt6795-gce.h
> new file mode 100644
> index 000000000000..97d5ba2d2b44
> --- /dev/null
> +++ b/include/dt-bindings/gce/mediatek,mt6795-gce.h
> @@ -0,0 +1,123 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */

This should be squashed with previous commit adding this compatible. It
is one logical change - bindings for mt6795 mailbox. There is no point
in splitting one change into two.

Best regards,
Krzysztof

