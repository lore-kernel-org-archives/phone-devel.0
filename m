Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2F7C6FD1C
	for <phone-devel@archiver.kernel.org>; Sat, 25 Mar 2023 11:11:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbjCYLLS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 25 Mar 2023 07:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbjCYLLR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 25 Mar 2023 07:11:17 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC78FF1A
        for <phone-devel@vger.kernel.org>; Sat, 25 Mar 2023 04:11:16 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id eh3so17277952edb.11
        for <phone-devel@vger.kernel.org>; Sat, 25 Mar 2023 04:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679742674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lV1rN1wo2nRvAaYZdkTrOyIvGW+U6VCRJq/I81taaAs=;
        b=u8pAzvSNyQOfu/k+Wa7LHyQPVT2Db4PS1oVigeauzeXlkidjTWyuJMR5qGv7CdnL9L
         T6e6kOVVbXuKNRtbG3DqdEthhneYNCrORCPZBP4Hn8iCiz+5w0Xo70VxcuXbc+1A8aO8
         NyBYo5W1AR1xUMhh/oXNc2iRAZEtSdLqoZKg9qpLE7uSv7YipYMq0VQ3TuOadJCIQczf
         BshrbnzxWSMy3+THqWRstUa8++0b0nTbOp7LtmSr8u2ZkQEhlC63tNWccUd7NazsLdRz
         q64/MD3SsWU/kb+6rTSbvvKgz0p8XF8ekvxVlsEcQ9k2ZTAKxu1DXhTC7EXp9HI63h2M
         8R0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lV1rN1wo2nRvAaYZdkTrOyIvGW+U6VCRJq/I81taaAs=;
        b=qgSKSiXow/kbzsd4awH+COCRkjYIsLFCrF0X+toQy5FceEwDoM0D86RJQtlJjqVT9M
         PVmcRvqsUXg8ECx/pHet+sqNzRxg8oE6WSZBsMse0z1r6HAgVsPvL2oLqbHrpzunVz7v
         wd+FytfEsCevG0ojmlONa4Y3MX1J5tDtOTJVlwqe/BzJMbmoEE/cKptVir5PMRemZHhc
         kKcNrJsNyQT2+g1i3VmbgNPujMNyJJyVrY08BnaKIS536x8FRVciMTp0KoZep+W6YDOg
         xE2fC8cwqASdcOrkCemLLmqHLtaHjV43djhOamGCkmgX2jFM3fNd5SEGqj9Yx6Ouc4j/
         wk1w==
X-Gm-Message-State: AAQBX9dF755GG4AT3JwRBbDB/95w1mTQOxHFnHRI8CLxPqdFmJP92t9y
        3llaLbJJBZ6nLeU7C3qvW1mISw==
X-Google-Smtp-Source: AKy350ZYdSBcRBYiIJQzjnskMU+XdPaRhHfBGxv/yx5cWwiqBHUiNFoQLxPIHqYNeUu4uxUxNT2A8Q==
X-Received: by 2002:aa7:d658:0:b0:4bc:f925:5dbe with SMTP id v24-20020aa7d658000000b004bcf9255dbemr5679118edr.42.1679742674721;
        Sat, 25 Mar 2023 04:11:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id a13-20020a509e8d000000b00501d73cfc86sm7043075edf.9.2023.03.25.04.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:11:14 -0700 (PDT)
Message-ID: <9b2280fc-4619-d748-cb79-eae11a767549@linaro.org>
Date:   Sat, 25 Mar 2023 12:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 04/18] dt-bindings: i2c: i2c-mt65xx: Add compatible for
 MT6795 Helio X10
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
 <20230324175456.219954-5-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324175456.219954-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 24/03/2023 18:54, AngeloGioacchino Del Regno wrote:
> The MT6795 SoC uses the same I2C controller parameters as MT8173:
> add a new compatible string for it.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

