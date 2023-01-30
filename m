Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBE0C54EED
	for <phone-devel@archiver.kernel.org>; Mon, 30 Jan 2023 14:24:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237671AbjA3OYK (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 30 Jan 2023 09:24:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237529AbjA3OXv (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 30 Jan 2023 09:23:51 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0102A3CE29
        for <phone-devel@vger.kernel.org>; Mon, 30 Jan 2023 06:22:45 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id gr7so7558241ejb.5
        for <phone-devel@vger.kernel.org>; Mon, 30 Jan 2023 06:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mp4r9fVpKZrzzgv4D9J+I1cyqWfeLifMaidR1ESs/XU=;
        b=nvY5nlRxsX46l48SpXxJHxTOpx5vwRolWHXeXIfrwTV+sxdjBY+bxhpt1aXTcXgErw
         e+6ApQliSQDeXS06uwz4Kqx2OEpi2RmRS9sAiphlvhx10NEqy05FFlYP19w1EJXvEmpd
         2CbTttOyOJN4mwUhtr0ht8zs0o9m1gDbxmiKKexSGcHYlz9pTlFZRyZNOQ8p5F4Gm/Xr
         r2XPUdQWTKpDfVyAnvkPUzqEWrfUeZAIjpuYbYqGgQsKcaHTrOtD/OaWPDf6RuOjqzz+
         t4m/CiCXlbt5YyFVrGRYevkpzHFwxoTnezegT3vQVgWzwWqeBOkHP3YgAcc908BZev3F
         bygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mp4r9fVpKZrzzgv4D9J+I1cyqWfeLifMaidR1ESs/XU=;
        b=1XTR8mNPW7+z7Iw7pe+0Mykxo3BJWEuOPcNCLZC6q7Xq5c3TBIvRbGa/F8u3whw3dX
         EtTR960Nm0SnvA6vP0veg1njzjZaLYN7Eoa24ncG256bWoSXMHG9hqkfbPW+971lzeyo
         +gYuEBY1MMIoNLqe5Og1i3FbyRtHoE5Lxcw6UEzA1C1TdFd2pudv/z9mxa1WFxptn1XB
         WQKuIGiPSzbw/dsn2Ocepi6ahzgbjDu+b3NPYIcdRLc3ER8HQ+grpRJnthsu2W8JTo6w
         zitJHxf+PRPfYc3RaFA2D+LiGNyMXBysy/sW1xvlovu6oFBuzMyix1IHRCafan7MNAFz
         ro7w==
X-Gm-Message-State: AO0yUKU3ku1GvkhKSITDMzSS8kiu1xGZ5udwpHjK5WOu44ChElhZUWnA
        FqAlrbRkvqyWWc8Dd/o9uxFpvQ==
X-Google-Smtp-Source: AK7set889yj+dR/89CpchqzYstp2P/VMTYjNzpamS85mDA7EvwK5iBUQV/Uj7vVPTON3aNKos3siBg==
X-Received: by 2002:a17:906:2dd8:b0:87b:d3fa:79f2 with SMTP id h24-20020a1709062dd800b0087bd3fa79f2mr11618195eji.19.1675088478736;
        Mon, 30 Jan 2023 06:21:18 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id q5-20020a1709060f8500b00883ec4c63ddsm3634846ejj.146.2023.01.30.06.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 06:21:18 -0800 (PST)
Message-ID: <fd879d4e-13d7-bb82-8668-a1423fc7e428@linaro.org>
Date:   Mon, 30 Jan 2023 15:21:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] arm64: dts: qcom: msm8992-lg-bullhead: Correct memory
 overlap with SMEM region
Content-Language: en-US
To:     Petr Vorel <petr.vorel@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Konrad Dybico <konrad.dybico@linaro.org>
References: <20230128055214.33648-1-jamiemdouglass@gmail.com>
 <CAB1t1CwzUCEL1josABxfyqX91Z6DsrbEuopsDYsgq-eNxh6Btw@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAB1t1CwzUCEL1josABxfyqX91Z6DsrbEuopsDYsgq-eNxh6Btw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 30.01.2023 15:19, Petr Vorel wrote:
> Hi Jamie,
> 
> On Sat, 28 Jan 2023 at 06:53, Jamie Douglass <jamiemdouglass@gmail.com> wrote:
>>
>> A previously committed reserved memory region was overlapping with the
> 
> IMHO there should be marked commit which you're fixing:
> Fixes: 22c7e1a0fa45 ("arm64: dts: msm8992-bullhead: add memory hole region")
Yes

> 
>> SMEM memory region, causing an error message in dmesg:
>>         OF: reserved mem: OVERLAP DETECTED!
>>         reserved@5000000 (0x0000000005000000--0x0000000007200000)
>>         overlaps with smem_region@6a00000
>>         (0x0000000006a00000--0x0000000006c00000)
>> This patch splits the previous reserved memory region into two
>> reserved sections either side of the SMEM memory region.
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Tested-by: Petr Vorel <pvorel@suse.cz>
> ...
>> +++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
>> @@ -53,8 +53,13 @@ cont_splash_mem: memory@3400000 {
>>                         no-map;
>>                 };
>>
>> -               removed_region: reserved@5000000 {
>> -                       reg = <0 0x05000000 0 0x2200000>;
>> +               reserved@5000000 {
> Can we keep "removed_region:" ?
> removed_region: reserved@5000000 {
> 
>> +                       reg = <0x0 0x05000000 0x0 0x1a00000>;
>> +                       no-map;
>> +               };
>> +
>> +               reserved@6c00000 {
> Not sure which label to add, maybe append 2?
> removed_region2: reserved@6c00000 {
> @Konrad @Krzysztof WDYT?
Generally, if you don't expect that there'll be a need to
amend/reference the node from somewhere else, the label is
rather useless..

Konrad

> 
> Kind regards,
> Petr
> 
>> +                       reg = <0x0 0x06c00000 0x0 0x400000>;
>>                         no-map;
>>                 };
>>         };
