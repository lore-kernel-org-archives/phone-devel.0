Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B287EB64DC
	for <phone-devel@archiver.kernel.org>; Thu, 20 Jul 2023 12:01:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjGTMBz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 20 Jul 2023 08:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231575AbjGTMBy (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 20 Jul 2023 08:01:54 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014E3172D
        for <phone-devel@vger.kernel.org>; Thu, 20 Jul 2023 05:01:46 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbef8ad9bbso6068565e9.0
        for <phone-devel@vger.kernel.org>; Thu, 20 Jul 2023 05:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689854505; x=1690459305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1mSDaVl3JU+HvwGjSR+QaJjRAnEFc4saHjf//VvH5Yk=;
        b=m33sstRpwA3obptMsfRSnHmYzIdeCUSdQQk48Er2O/KW30oRJP2HU9hyWf4hOQ7IQI
         FfYbeKiwKphLtlWkVoAdfS0DQ7gUDlQrNpJCB+yZt1WtvRJ/bpe71HRbai/16dLy6d6u
         I+W39l1BkIU/pYyFhuRbTl+JFXKXTGeIAVBJo0D7iocZOkAnFZEH06la3cdXPVp5ub0K
         JL+h84c8ktYXXr7J2LGZAKbu1IJG2et6l7CxdL9mIC4K31TfeMwtCQAYE4A+bo6auden
         gnzkPA9HaurxSrefEI/9MP7BxjIFcgag+6P5sKsXjm6LzBDYOH9cfGIDJmEzk2tzcJYt
         tJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689854505; x=1690459305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mSDaVl3JU+HvwGjSR+QaJjRAnEFc4saHjf//VvH5Yk=;
        b=BrebUm+tTa0SQVZ1tlZxMlkvaK2TRIfekcaaEFkS3lclOYCRob6mqOS1SdSwxhdbmO
         VZzwl//u+yN3uwqhoErETe14UUalzK9Dy4dwgPwhBcP4iFjVmxkj1GFn25rcn3szykFa
         Pt6mlnVbtVtOE96bNtLeI9dbmiP6iJosu1WtzJE2nP+7XmAquDlbR+KD1Jaywg8GrTUv
         cTFKX6T2Lw6q9ImEK0O1mpQwHDKMB7RjZFHAl/4TBI4+8JMrYzJpyBGZfXYvb3OceWjm
         O4PVq+lwff0zALPI8JnP4fG6SuhEWvCVC5EydKatHwdKelh+Qv7Fwr9NoHtsfiXEl6zl
         48kw==
X-Gm-Message-State: ABy/qLY6i3EZgIHSaHSBgeMJJPXBMqQU5XmVtSuYLAUPUJUd6wDLgh3j
        S2BYgePJCnHLO1m6CE15labSSQ==
X-Google-Smtp-Source: APBJJlHHRMzgk8SNYyVrru2kh5gNrEKZKOx7onWKVBzJKdh/06yDLV+HjsmKCc94OfbxF5WR7s5O9A==
X-Received: by 2002:a7b:cd0d:0:b0:3fb:e643:1225 with SMTP id f13-20020a7bcd0d000000b003fbe6431225mr4439955wmj.13.1689854505423;
        Thu, 20 Jul 2023 05:01:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id k5-20020a5d6285000000b0031455482d1fsm1150836wru.47.2023.07.20.05.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 05:01:44 -0700 (PDT)
Message-ID: <ab463c69-59e0-99b5-1526-7c344fcc593f@linaro.org>
Date:   Thu, 20 Jul 2023 14:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt6795: Add support for display
 blocks and DPI/DSI
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        matthias.bgg@gmail.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, kernel@collabora.com
References: <20230720091559.86406-1-angelogioacchino.delregno@collabora.com>
 <20230720091559.86406-2-angelogioacchino.delregno@collabora.com>
 <0809ac02-b8bf-ed63-9e2e-e77cd7e93464@baylibre.com>
 <d892a76c-165b-dbeb-79aa-70f3ebd7f07c@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d892a76c-165b-dbeb-79aa-70f3ebd7f07c@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 20/07/2023 13:52, AngeloGioacchino Del Regno wrote:
> Il 20/07/23 13:35, Alexandre Mergnat ha scritto:
>>
>>
>> On 20/07/2023 11:15, AngeloGioacchino Del Regno wrote:
>>> Introduce all nodes for all of the display blocks in the MediaTek Helio
>>> X10 MT6795 SoC, including the DSI PHY and DSI/DPI interfaces: those are
>>> left disabled as usage is board specific.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 252 +++++++++++++++++++++++
>>>   1 file changed, 252 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi 
>>> b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>>> index 597bce2fed72..d805d7a63024 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>>> @@ -2,6 +2,9 @@
>>>   /*
>>>    * Copyright (c) 2015 MediaTek Inc.
>>>    * Author: Mars.C <mars.cheng@mediatek.com>
>>> + *
>>> + * Copyright (C) 2023 Collabora Ltd.
>>> + *                    AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>
>> Shouldn't be like this ?
>>
>>   * Copyright (c) 2015 MediaTek Inc.
>>   * Copyright (C) 2023 Collabora Ltd.
>>   * Authors: Mars.C <mars.cheng@mediatek.com>
>>   *          AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>>
> 
> I don't think that there's any rule about this?
> Also I don't really mind the strings order, but if anyone really does, I can change
> it....

These have two entirely different meanings. Your patch suggests you hold
copyrights (which is usually not true if working for employer).

Best regards,
Krzysztof

