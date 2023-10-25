Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F15DC25B47
	for <phone-devel@archiver.kernel.org>; Wed, 25 Oct 2023 08:53:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234166AbjJYIxd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 25 Oct 2023 04:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232720AbjJYIxc (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 25 Oct 2023 04:53:32 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30A7129
        for <phone-devel@vger.kernel.org>; Wed, 25 Oct 2023 01:53:29 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so8382033a12.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Oct 2023 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698224008; x=1698828808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jqDiGZSAEWENqW9kahxeDuO1dH7CgDPifdSzgWaBa9I=;
        b=riyj2cQx/7f6rP3uQvnF4GTEBf5g3NCArwU2cnzE7w97UbZb0mHJikIL7EQJS7pUc+
         LXx1pz6cN7S8Tpx4PilMqyBFRE+7VY8PU68kv+lTLUXgLH4TkcaMWlp1yWl2x7PxC/TW
         ydDXACw5/R73VeTqayrotr+a+GnCtwrmTyTM6TJLMfXigJrFjvxxkrulQ4b0q9yYBJtR
         4vdeKm4lzZIfQecvuAHZFA3mLADXhbNTQzaAEVt5rVqVdlPT7YUK6MZYulNcambxMD9W
         DEqBydL4BxT1gB7VN8CtOdjXVKyWgfM+xERFBujMxwwRxPSfOiTInAum6p5k6YHfPihM
         J3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698224008; x=1698828808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jqDiGZSAEWENqW9kahxeDuO1dH7CgDPifdSzgWaBa9I=;
        b=a9atPqCQtVzcRRtJ38VbzMa+O8YhD/2ko6BhdYWdJ4JzFigmZoFbR7FyQbLLh9F9HC
         dAeRLvikwr+aSx4ey4oP0+cIIDkmvLV2FJyb8Qw7HpgYxDdS2dJIA1zGymJF7Dfn+2tv
         +uJwNcxlYg5KqsZjGQt9fBhEzhQaTiFplmOI1Ld8c+46qbBdbEBrh3Km3AOm2KGHHT+u
         Kl+RSdfTnVCgYHYUkNtit4JjUtG0mVig27tss+EaCLDiINyqnH1wQf8/28uspNpEZH8U
         XQzwcNIHWzvuvfXDqSlcMn9q1U6UBAhZGh3QFtrZ1hiMYvChtJWdfX8u/xn6JFUOS9ca
         OMaw==
X-Gm-Message-State: AOJu0YwGebeUxXhDsp86J4riaxon1WE8uD2kgU+XEubskDhoxRw0MJ8E
        NEyxQf5edgrwXM5XRHjUK2EHkw==
X-Google-Smtp-Source: AGHT+IFdJIpJy2HcSg0IPExEK9z49nZ51+jUBkDUPzDL9FWXLMg/9f67U/WwgN6O/lrxXnmcr29fPA==
X-Received: by 2002:a05:6402:11d4:b0:540:b524:5228 with SMTP id j20-20020a05640211d400b00540b5245228mr2842168edw.33.1698224008152;
        Wed, 25 Oct 2023 01:53:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id m20-20020a509994000000b0053635409213sm9415717edb.34.2023.10.25.01.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 01:53:27 -0700 (PDT)
Message-ID: <13c63dd3-011d-49a8-9db4-8135178e3cd1@linaro.org>
Date:   Wed, 25 Oct 2023 10:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add samsung-matisselte and common matisse dtsi
Content-Language: en-US
To:     Stefan Hansson <newbyte@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20231025083952.12367-1-newbyte@postmarketos.org>
 <04fae330-0866-408a-8016-b6f897f9550e@linaro.org>
 <25a25ec1-e556-4f55-9594-47dc56971091@postmarketos.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <25a25ec1-e556-4f55-9594-47dc56971091@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/10/2023 10:52, Stefan Hansson wrote:
> 
> 
> On 2023-10-25 10:48, Krzysztof Kozlowski wrote:
>> On 25/10/2023 10:37, Stefan Hansson wrote:
>>> This series adds a common samsung-matisse dtsi and reworks
>>> samsung-matisse-wifi to use it, and introduces samsung-matisselte. I
>>> choose matisselte over matisse-lte as this is how most other devices
>>> (klte, s3ve3g) do it and it is the codename that Samsung gave the
>>> device. See individual commits for more information.
>>>
>>> ---
>>> Changes since v1:
>>>
>>>   - Rebased on latest linux-next
>>>   - Added qcom,msm8226 compatible to matisselte inspired by recent Lumia
>>>     830 patch. This is done as in v1, the patch was rejected because I
>>>     included the msm8226 dtsi despite not marking matisselte as
>>>     compatible with msm8226, and I was not sure how to resolve that. As
>>>     such, I'm copying what was done in the Lumia 830 (microsoft-tesla)
>>>     patch given that it was accepted.
>>
>> One version per day, so you won't ignore tags.
> 
> Sorry, I don't understand. Could you clarify what you mean? Thanks in 
> advance.

Do not send more than one version of your patchset per 24h, if your
patchset is bigger than one patch.

Best regards,
Krzysztof

