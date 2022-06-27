Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36367C433EF
	for <phone-devel@archiver.kernel.org>; Mon, 27 Jun 2022 09:00:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbiF0JAC (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 27 Jun 2022 05:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbiF0JAB (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 27 Jun 2022 05:00:01 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2EC062C5
        for <phone-devel@vger.kernel.org>; Mon, 27 Jun 2022 01:59:59 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id e2so11998648edv.3
        for <phone-devel@vger.kernel.org>; Mon, 27 Jun 2022 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OJD3PXeQcR9dqZ5Y7yZVLU8WDdZSUs8hEAVEMiuij4s=;
        b=mBcUp//R90f/Wq5aerXEP5Jb3KTttQ3I+AqwSlNt/W7te4T7VYw+iFp0bnSvhyclS5
         SuaYvm9L+9uEl7UZwFbpIvCpwbiuSo6BhQ8jzrn/7Nl/3EBUqzMK1KEpc09m4+VuS9Ia
         TXyP+XGJZKLTzLyq1Qyl4jyhHiiMz6S0NgesKDKGmDv1QhulRYmsCGo/BAVk5kb8NqJx
         0q8wQgaqz43l3T+r/p1tHqEviIJYRfTiSvK8M0bHYs7qgkA5hfeHpPHUKo5lyc/MC+Oh
         jLNPwkhR9c/Sh1h18sYqi0iQUaayC9xcNnwwzbcunlvd/UpaZ3A23OkZS2rDJxAtogBV
         ikMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OJD3PXeQcR9dqZ5Y7yZVLU8WDdZSUs8hEAVEMiuij4s=;
        b=TR6b9dt6wE5XUYh86FIj7ThUUA6Jj3wYTExBAqGBoCVli13FguMR8EPJyeaJWwPXH6
         PsjCWhnqk+pBGZ8Rz7CVxPsLeVMY/ssO9JpnnnpLbt6VN3j+Z1gKImerb6PwwGdztpqB
         3YM58zFJs+LwVUlgyTgSOLZ99sEirqyDk7qlvjD59nDy9U7KDvpenKRDP05HvdtyYvUR
         7FqAv6Wzr3aeW8Ihu4rfvFw6bLBtg6lEXYCaqx3UO6VccQ++MuMGKMmBGnRO9ek3ql5M
         K2o+a3YtYcb30mf7iEfXqJ/EvMw0PkCknVTMo47f3i6fzS+pUOMqlAw5hkttZx8XfcCN
         dhnA==
X-Gm-Message-State: AJIora9jQnDUPoT8Xq5cR/ETXIMkYg/msIFMQTY2Bj1U5HTj3NmS7IL2
        89/AfLePBPwL+oCn/JwR0BC9XA==
X-Google-Smtp-Source: AGRyM1vx9hW9lzNzpgqm+U8e8cip5LlD6oegAC5bL8EXEcSPE33v/USYPPy/Vv76y2er5Hvfx5q6kg==
X-Received: by 2002:a05:6402:1d50:b0:436:beac:a4e3 with SMTP id dz16-20020a0564021d5000b00436beaca4e3mr15491833edb.191.1656320398400;
        Mon, 27 Jun 2022 01:59:58 -0700 (PDT)
Received: from [192.168.0.247] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090611d300b007109b15c109sm4806316eja.66.2022.06.27.01.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 01:59:58 -0700 (PDT)
Message-ID: <6fa1db53-6e4e-b6b1-2313-dee7aadad5ae@linaro.org>
Date:   Mon, 27 Jun 2022 10:59:56 +0200
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
 <de5a0e6f-411f-0c7b-ae1e-1117a4126d2d@linaro.org>
 <9554982a-c48b-e902-2d96-b317c46df698@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9554982a-c48b-e902-2d96-b317c46df698@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 27/06/2022 10:49, AngeloGioacchino Del Regno wrote:
> Il 25/06/22 22:30, Krzysztof Kozlowski ha scritto:
>> On 24/06/2022 11:35, AngeloGioacchino Del Regno wrote:
>>> Add the bindings for MT6795's clock controller.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> Acked-by: Rob Herring <robh@kernel.org>
>>> ---
>>>   include/dt-bindings/clock/mt6795-clk.h | 275 +++++++++++++++++++++++++
>>>   1 file changed, 275 insertions(+)
>>>   create mode 100644 include/dt-bindings/clock/mt6795-clk.h
>>>
>>> diff --git a/include/dt-bindings/clock/mt6795-clk.h b/include/dt-bindings/clock/mt6795-clk.h
>>> new file mode 100644
>>> index 000000000000..9902906ac902
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/mt6795-clk.h
>>
>> Vendor prefix.
>>
> 
> For consistency, I'd really like to keep the filename as it is.
> 
> At least in this directory, all of the MediaTek clock bindings
> are using the format mtXXXX-clk.h... and that's not only seen
> in MediaTek, but also in Broadcom, Renesas, RockChip, HiSilicon,
> nVidia, etc.

Several new files are introduced with vendor prefix. The same as in
bindings - old bindings were without vendor, so for consistency we would
never switch to vendor one.

For consistency with Documentation/devicetree/bindings and with all new
files in binding headers, please add vendor prefix.

Best regards,
Krzysztof
