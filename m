Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35028C4332F
	for <phone-devel@archiver.kernel.org>; Sat, 14 May 2022 19:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235013AbiENTrr (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 14 May 2022 15:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235001AbiENTrp (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 14 May 2022 15:47:45 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93021FCF5
        for <phone-devel@vger.kernel.org>; Sat, 14 May 2022 12:47:43 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i10so19710229lfg.13
        for <phone-devel@vger.kernel.org>; Sat, 14 May 2022 12:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7S+G4FYAdKpveK/bCmr9kuwFdE+5AmrPUFrgJUvGcmw=;
        b=ANk5B1sxQqM2aO3vtNFxJVAs4kc/zEx+dSujyBRANHAKOqAetHSGGKLwaswqWVrpRj
         igL/HkOkChIycS9asjwvFxCxD3oFlxH4On0b0OHYrc7GDdpY6pGahyfLWTXGLH34vAgl
         Vd5d0qRWKbdvyZAo1T6EZ1PY0y2002GVi+XPwMEoIHi1jhSt+cdjbUmwWyd5qgm509R3
         1AgiCCYfAuShNG61T48xc/Ot3QT0Hta++sKGssyeEwWYOu2/oK4Mc/LMK5vfrrZhWqmf
         82mVQu1IL8pdgqYw6rKXd1DQU1C3/MFLPMT8kVrMG2rZL+3JqAzAhoJL3BvCeyQpKQ0j
         08vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7S+G4FYAdKpveK/bCmr9kuwFdE+5AmrPUFrgJUvGcmw=;
        b=fb7eCV2OTBpQ/3jsfmv5o+sKmNwLBC/AvVXAZMPPWQkMjp0FhC/nNpJHOhv7kfUzDn
         SH7Y4QXY6YdzTL0owrB4ivARXhsQnwqCUi8YkDExDeQyxSbA+F/Tp2kW9qh5aSQEQVt/
         lXiXMxTtpDI5dIs6Dt7i6NgEtRDtBYmX6gyY/f5cbTM63Oe5g+RuRxQNHTyYVZb0DoEg
         RlZFWOxjxObygRIoyJp32SpugryFBdTqtXSpfs9tgA/OOt9HOuHXKZy4LddUCptAKxNu
         GR3qLCQ7eV1u8qEC8HIgjAMdYGzFJvwiu7xE+snrq/BazONgCe3bk1TKNCYV6Zgevjo7
         14Bw==
X-Gm-Message-State: AOAM531pgF4nGQJ9J3SGLeojNYt3gsDPZM0E4L3I+hQxmadNnbefKxe0
        eDTMBk82+t1NTRtH9VK7JWtzZQ==
X-Google-Smtp-Source: ABdhPJyJfap7agj1HyLvqRJynfyFTCCOZ8RyKcoEWWXmxoDJsZYKV+tgR7ZwB+iOfyM/B3IieL5PTw==
X-Received: by 2002:a05:6512:e84:b0:474:12f3:cb53 with SMTP id bi4-20020a0565120e8400b0047412f3cb53mr7492604lfb.254.1652557662126;
        Sat, 14 May 2022 12:47:42 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q30-20020ac2515e000000b0047255d2117fsm795121lfd.174.2022.05.14.12.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 May 2022 12:47:41 -0700 (PDT)
Message-ID: <e7cfff16-ee2e-f204-a427-a25aa337d392@linaro.org>
Date:   Sat, 14 May 2022 21:47:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/7] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm6125
 compatible
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220511220613.1015472-1-marijn.suijten@somainline.org>
 <20220511220613.1015472-3-marijn.suijten@somainline.org>
 <d2507298-00a6-a1cc-0302-f96597fb4127@linaro.org>
 <20220513091734.hivkkbpc6inyb4la@SoMainline.org>
 <5cce491d-c673-d2a6-3aae-79b2e5902a01@linaro.org>
 <CACRpkdbyVScvnn-99XQ526B=64fQp34PKjot1CJ2Wfm0PKmZgg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdbyVScvnn-99XQ526B=64fQp34PKjot1CJ2Wfm0PKmZgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 13/05/2022 23:09, Linus Walleij wrote:
>>> I prefer yours to be applied first, so that I can retest this
>>> patchseries with stricter / more correct dt-bindings introduced by it.
>>> My series can also be resent with the notice that it has already been
>>> rebased on top of your series, after collecting more reviews.  Where
>>> necessary, I can review your series too if that helps getting it in
>>> sooner.
>>
>> Sounds good. It's in Bjorn's hands now. :)
> 
> Ugh can I get that with a pull request? Maybe Krzysztof can provide?

Ah, I completely forgot that this is actually pinctrl, so it's not Bjorn
but you. :) Of course then it can go via Pinctrl tree, in any order you
prefer and anyway it's not my call. :)

> 
> BTW I have high confidence in you Krzysztof after all your work on the
> Samsung pin controllers, can you and Bjorn
> discuss maybe adding you as comaintainer for Qualcomm pin controllers,
> it's not like Bjorn has too little to do.

Sure, I am happy to help here. I'll talk with Bjorn.

Best regards,
Krzysztof
