Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5DAC6FA89
	for <phone-devel@archiver.kernel.org>; Thu, 15 Sep 2022 14:46:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbiIOOq5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 15 Sep 2022 10:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbiIOOq4 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 15 Sep 2022 10:46:56 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA80F4054C
        for <phone-devel@vger.kernel.org>; Thu, 15 Sep 2022 07:46:54 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id k10so30739751lfm.4
        for <phone-devel@vger.kernel.org>; Thu, 15 Sep 2022 07:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=AGYhLBK5MSu4nlYE38/3ZKhX68k6E7tf3J/hrxENfXs=;
        b=rpZUuAgkZgkOjflUiWTZwd+GkSbdnhZjLkU0OETEYgL08O6D1xhJlen9gERv+BxelT
         /8BVBnibVun9LB8UkpDRfxmYNfT+K8doUZ1FiYbYvQDK6l+mu6JoGW5k2i3OEN3XLd6h
         mgOEzDQpnm+eXJ5deTLa+ru/Ngz64gRRYdcw2UPNNy0h7PK5u+fdUoje+ILuKWiDDsTu
         SE7j7xTSi/EkhtkEROFfF4Je34W6PGSUY2dgIPN1sit9/C1Wv7UmDWN0fMYOOX0Sr8Hs
         hIHYQ3pTQEt7ZWq7OBmMNFTS6eeqZl+g0c/QvP4qeHJ3FwWuqa2r3HgL/Bg8J4nmbfMy
         AOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=AGYhLBK5MSu4nlYE38/3ZKhX68k6E7tf3J/hrxENfXs=;
        b=YDqWe3LO0zQYYCF9xoTG9GoicYg2ZzhvnZm47xWYeFnRnp9KDEPaDI/abvJbCgUD0f
         +xZTQWgxrlN9Ez4y/GFV1PagXrnOj+Z8wMuHjFncacxSv1erOHecaANElbw6esHYIvAu
         MVIDXkvQ1iCYSGWDTnP9M5ZCeq13fo25YXBpxeWub38VyNVJw6WSUAnjwzg28Lox/PNF
         Ru6vL6rQ+KO/cFdzwPjTVzVgjKW15U3dadooeWr9PadaQIrkJan0GmiOrnUoG7+CyQJt
         lLazAuGjP9XldP/JTYLuS4IZo0mPTqPZyHofUVGCaqAP8+aEwgn2Ip3C4UNVQLmXDEKS
         rm+Q==
X-Gm-Message-State: ACrzQf3F75+gEfzltaZ6S0H2EDaaL8XstfxtQBOVfKRsy2sy4vDCNWWt
        JepH1flSAgjLY9CSUS/+T8CU3A==
X-Google-Smtp-Source: AMsMyM6sTVqBhiHgRPSFWFJfdv6mwloF+nJ/A4e7ioKumbOT+oAyNzVGHqJY4u3N4UmUmYMrcLrvlw==
X-Received: by 2002:a05:6512:3184:b0:49d:6b29:201c with SMTP id i4-20020a056512318400b0049d6b29201cmr80443lfe.363.1663253213308;
        Thu, 15 Sep 2022 07:46:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y15-20020a19914f000000b0049487818dd9sm3003927lfj.60.2022.09.15.07.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 07:46:52 -0700 (PDT)
Message-ID: <2e941f23-e951-f952-5c0f-fc2946a189b5@linaro.org>
Date:   Thu, 15 Sep 2022 17:46:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 1/2] mfd: qcom-spmi-pmic: convert hex numbers lowercase
Content-Language: en-GB
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lee Jones <lee.jones@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20220915113523.44074-1-luca.weiss@fairphone.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220915113523.44074-1-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 15/09/2022 14:35, Luca Weiss wrote:
> There are some IDs that are written in uppercase. For consistency
> convert them to lowercase.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> Changes since v2:
> * Split out to separate patch
> 
>   include/soc/qcom/qcom-spmi-pmic.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

-- 
With best wishes
Dmitry

