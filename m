Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2177FEE0205
	for <phone-devel@archiver.kernel.org>; Tue, 26 Sep 2023 19:56:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbjIZT4Y (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 26 Sep 2023 15:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233431AbjIZT4X (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 26 Sep 2023 15:56:23 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FDFE11D
        for <phone-devel@vger.kernel.org>; Tue, 26 Sep 2023 12:56:16 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bffa8578feso163044931fa.2
        for <phone-devel@vger.kernel.org>; Tue, 26 Sep 2023 12:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695758175; x=1696362975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZWwru9Tps9HZuVOzGRrxWEvHqJ8rz14pCmAeXDoZTt4=;
        b=oyDlSWxP4l/wAIekY45zNBEVZHyh5loCfQv/ZLOSlUft4Hd6DjG+VcmwafNx4Jt4Gb
         j0TnwWEzESAqxQfDG10WLsiY3WQEcjkthdol7FVC2mmHB4pF/DUhMPNK1vzXC7l2AayG
         kAhD02GonUCSTAL6jLQKjzgJJSwjRjT7vZBgr6uOwal/cJuMhzeCAKPnvRKVi8ys5fdF
         VrVwodsz7V1B825eZsjivVMkRN/JVOUDkB1rgYJ10nNeZ67UkUVmh/IYWH+3aESmMRS1
         ZjL6w9UH6MqzxUSRoc5BuXWRS5zugvbhgZ/n48Fz8jRpPzUBs0H0BwbBERjdjqZQ5NAn
         ImrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695758175; x=1696362975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWwru9Tps9HZuVOzGRrxWEvHqJ8rz14pCmAeXDoZTt4=;
        b=RzooVFFHVN5uZW9Q5ZbfsupXmLBblZgJ3lR9OSIf126V+i2n2JZmlq9qWny3aPwLWz
         kMppuG0wH9+oix5uhWI4DeNhgVcKWEppkq+FZ3rrOZlaGDFPIr24g8J5gFe31JUayfqv
         aKdNtT9HU2+guBvTl1NsWtBD98802R4DNN+lvUDyxja7Ex24hUcDDVegVTZpmjD5G6Fh
         cVt9iVNOoA8QwMyl5zStAf8nFniYwnRkTc/41v17YKKfsBRaUZLeBySvC26ufaQaCFwI
         imMbcnVS8IlcTct6wP7TUs84xV6icWBteVH/xvsI1wn45nZqrT+rEGm5+LrAjmXGWulv
         0S3Q==
X-Gm-Message-State: AOJu0YygqUNxesD3TljNmxFc0f5lzfIcFlKQJ2c8zr1cTWCK7JOSou1F
        0vAMvaAsYRWUyg4qUgaw6BHF6HQMl0W+MHEc/x0CPw==
X-Google-Smtp-Source: AGHT+IF/n55V2ruGDazD2dr+p7at0YbpTrosrtedX3N1FGnJ0vXRFBHWAZ/JMeQtlsUVSoG4I8QUEg==
X-Received: by 2002:a2e:8256:0:b0:2c0:158f:8133 with SMTP id j22-20020a2e8256000000b002c0158f8133mr39125ljh.28.1695758174694;
        Tue, 26 Sep 2023 12:56:14 -0700 (PDT)
Received: from [192.168.33.189] (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
        by smtp.gmail.com with ESMTPSA id v6-20020a170906380600b0099c53c4407dsm8109693ejc.78.2023.09.26.12.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 12:56:14 -0700 (PDT)
Message-ID: <278ac134-992e-460a-b37a-60a746eab107@linaro.org>
Date:   Tue, 26 Sep 2023 21:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] arm64: dts: qcom: msm8916-samsung-a2015: Add sound
 and modem
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
References: <20230926-msm8916-modem-v1-0-398eec74bac9@gerhold.net>
 <20230926-msm8916-modem-v1-4-398eec74bac9@gerhold.net>
 <2c9eda54-a90e-483a-abc2-865d82854b80@linaro.org>
 <ZRMwdRo9hAm4BO5E@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <ZRMwdRo9hAm4BO5E@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

[...]

>>> +
>>>  &blsp_i2c2 {
>>>  	status = "okay";
>>>  
>>> @@ -243,6 +258,13 @@ &gpu {
>>>  	status = "okay";
>>>  };
>>>  
>>> +&lpass {
>>> +	dai-link@3 {
>>> +		reg = <MI2S_QUATERNARY>;
>>> +		qcom,playback-sd-lines = <1>;
>>> +	};
>>> +};
>> Is that not status = reserved?
>>
> 
> Correct. This is here to simplify switching to the modem-bypass audio
> routing if someone does not need (or want) the modem. The direct audio
> path with the LPASS drivers tends to be more reliable and configurable
> (especially wrt bit formats, sampling rates, latency, channels etc).
> I know that at some point this helped someone who tried to use an old
> phone as some kind of portable musical instrument / synthesizer.
> 
> It's not too obvious that these definitions would be needed when making
> those changes (because devices using the standard SD lines (i.e <0>) do
> not need it). If you forget about this you get non-functional audio with
> no error or any hint what could be wrong.
> 
> To simplify switching between the different audio routing options, the
> lk2nd bootloader actually has an option to do this transformation in the
> DTB automagically during boot. It's sort of like a DTB overlay that
> disables the QDSP6 audio path and enables this node instead. The DAI
> links are also adjusted where necessary.
> 
> Do you think a comment would help here?
I'd say a comment would be necessary here :D

While I understand this use-case, I believe this is better suited
for an actual DTBO or something entirely kept inside lk2nd.
Otherwise this looks very confusing to an outside reader.

Konrad
