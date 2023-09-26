Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F8CE7E65E
	for <phone-devel@archiver.kernel.org>; Tue, 26 Sep 2023 18:58:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235656AbjIZS67 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 26 Sep 2023 14:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235438AbjIZS66 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 26 Sep 2023 14:58:58 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949FC12A
        for <phone-devel@vger.kernel.org>; Tue, 26 Sep 2023 11:58:51 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so11183466a12.1
        for <phone-devel@vger.kernel.org>; Tue, 26 Sep 2023 11:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695754730; x=1696359530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hk1J9RCasnvG6e6o9YLP75HHSMhMiZcPHRcgR1qmnvE=;
        b=g3KXGWx2IdmOrwelh2GinmhgsmLwXdtrZfJXfj9xeaU39YPRbm8ZDZUt5Wgjry2c6z
         goORivLPj5XqNzEXSc3oIwAQQVXZkQejBnATsNEXeX4uPOwxvzL59pl7O/mAUpaWlyRY
         QYAzJ/bdd/d2qCGgSDrUl4pLAGhIx04+5dPoBw+1TXGn7gbIRna3oVpPZxiW39dIUcU+
         zVSyQinuaRvwFfYfkpG6a2DZ/ZC2v9XMtoztMnz09dg2L4dv8UA0LdYBl1pYWdv5+QKc
         kbeog+752ZDouFwfIp1NcwU32VpnOEALyjaPejPZwYEkGxswWAk8Z5tD3GjHG3QTc2Ga
         FhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695754730; x=1696359530;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hk1J9RCasnvG6e6o9YLP75HHSMhMiZcPHRcgR1qmnvE=;
        b=EKKqFi2zkmOSYqWuQtYx7puEl8ahiYZxzcUuQsL3RM87jQxG21tKoJiTK2YBodjnNk
         hauoTaqDQcChv6j3JulB3s68p140m8WFygkP6Hh1r+gcr2e4q0NFpCbuNxfntiSzwHXH
         mN/zbSlRzWtLMSm8MVmKMVH6AFja4LL8bfWG6+Ju3UF2CSZnLkhh/oMA3MKhBGArfN7x
         vzYFZb9a+aNmEEfKwXdHgQuQh3LvWTEvon/5NTUt0QnJDKNch1f4gMuWGf01HxG3R//s
         uk2fCdFVRcAkBU5AlyM5TXTcAWrXmi3HLvjXXqyDWnVnz9OUp6CAZo6ddIaN5qQwhv1M
         Jw+g==
X-Gm-Message-State: AOJu0YyGYKnL4z/CHzt6gg8WVkxxvlruLPgo9NX/1cqY9WivwFoqg1AX
        kHlM1QcdmINwimjZrYmQWGbgCw==
X-Google-Smtp-Source: AGHT+IH07nID6HNn8quuPFyW5umCXgmEfh1kjJSu/qyUmeXCaewTsNuk6OFtNdmHuBnedAgzWhMAkQ==
X-Received: by 2002:aa7:d5c6:0:b0:533:6ef4:9f5b with SMTP id d6-20020aa7d5c6000000b005336ef49f5bmr8299368eds.6.1695754730060;
        Tue, 26 Sep 2023 11:58:50 -0700 (PDT)
Received: from [192.168.33.189] ([178.235.177.23])
        by smtp.gmail.com with ESMTPSA id f15-20020a50ee8f000000b0052a19a75372sm7088795edr.90.2023.09.26.11.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 11:58:49 -0700 (PDT)
Message-ID: <7eee967a-0900-4a0c-b609-93d5c784ebd6@linaro.org>
Date:   Tue, 26 Sep 2023 20:58:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] arm64: dts: qcom: msm8916-asus-z00l: Add sound and
 modem
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "J.R. Divya Antony" <d.antony.jr@gmail.com>
References: <20230926-msm8916-modem-v1-0-398eec74bac9@gerhold.net>
 <20230926-msm8916-modem-v1-8-398eec74bac9@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230926-msm8916-modem-v1-8-398eec74bac9@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 26.09.2023 18:51, Stephan Gerhold wrote:
> From: "J.R. Divya Antony" <d.antony.jr@gmail.com>
> 
> Enable sound and modem for the ASUS Zenfone 2 Laser. The setup is
> similar to most MSM8916 devices, i.e.:
> 
>  - QDSP6 audio
>  - Speakear/earpiece/headphones/microphones via digital/analog codec
>    in MSM8916/PM8916
>  - Audio jack detection via analog codec in PM8916
>  - WWAN Internet via BAM-DMUX
> 
> Signed-off-by: J.R. Divya Antony <d.antony.jr@gmail.com>
> [Stephan: rebase and simplify, add consistent commit message]
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
