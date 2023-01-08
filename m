Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DEBC54EBC
	for <phone-devel@archiver.kernel.org>; Sun,  8 Jan 2023 22:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbjAHWVB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 8 Jan 2023 17:21:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233906AbjAHWU7 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 8 Jan 2023 17:20:59 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCFD65D6
        for <phone-devel@vger.kernel.org>; Sun,  8 Jan 2023 14:20:57 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id d30so5401573lfv.8
        for <phone-devel@vger.kernel.org>; Sun, 08 Jan 2023 14:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Au8PIm+4NyW4j2miivRKm9HzANsXUXWrooOUvpFJEq4=;
        b=xJvnO7XVZiOab0uE/yZrxgm/ub+DAz+6aEXXpyyjV3sWzc0k/1Rs2rnflDNrecuCTg
         LbVMManTt4KsRW2z/AIK9H0z9cdYybQtuOSow6c4VO5910cbqfxrB524jdXsgpAyKF/V
         u37sYgYOcIrEQVaTegJ4kETigFG7RNNRHrvwl94F6iakojGqnrXTiqKzPxHF78uHdVbo
         2Kdq+m8g+Q+zBAYcfBJWk+ZIWPos2icJEV8xES5tDrx4hn36cCyzSbB+2vXGIAq0gB2Y
         ZzfoW8gPlQbFTKx5bz42Hmi/qJ4s24HcH9LQGWHqI3FWtWbK5KRkmDgBI7GGjXfBDLfK
         jpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Au8PIm+4NyW4j2miivRKm9HzANsXUXWrooOUvpFJEq4=;
        b=7XUD2PCnVj+UmxJdvh57XoDMKC2yvNtcBq4+xHAZSzHUc226Cz9cq5BgHnXHzTxKNJ
         g87zLC8elDelcHVZzKbxwmRlAy9jOaWsuBOn8GL0vgGGzGeIpymp2nAnGQAFFMJzMWYN
         XD+z3gFHgX798GlHcnQYOeD4zLi6h1KELR/x0oQnkbWOfRwB+xMUrRbjVMgQJEFw5RCP
         9UOB2VPa0HxQfXhBTyqXW2TbblK9SiNF9O6T/GAhi5TmafTIzT+9ZBUK6remYuF9A1zq
         KGTjAVKZlTbJUrYXFCtq4dmoDEmfyZpzk0E8H1OegY7E3Weuq4KGIBsaGDdQJ7vF/1KL
         XKDQ==
X-Gm-Message-State: AFqh2krUxO08omiuKchMb9LDa9XhyEv4DCSme2tP+bOgr/uVwg0CbKdc
        txaHqDb65cXieu4teGm0jmMpgE6JyS9uommh
X-Google-Smtp-Source: AMrXdXulolSMJEdgGfRuthfwuZXbZcAZCXKUjQ0WbO2OcS3CQBLdYTBRgcdg8N7kimzp8ztv5EiScg==
X-Received: by 2002:a19:6b1a:0:b0:4cb:262c:5422 with SMTP id d26-20020a196b1a000000b004cb262c5422mr8339607lfa.20.1673216456288;
        Sun, 08 Jan 2023 14:20:56 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id dt17-20020a0565122a9100b004cb061887b5sm1257258lfb.126.2023.01.08.14.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 14:20:55 -0800 (PST)
Message-ID: <a86973c7-db5e-ab2c-4b6b-d9c82f76a070@linaro.org>
Date:   Mon, 9 Jan 2023 00:20:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom,ids: Add a bunch of older SoCs
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230104115348.25046-1-stephan@gerhold.net>
 <20230104115348.25046-4-stephan@gerhold.net>
 <20230108214052.GA313089-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230108214052.GA313089-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 08/01/2023 23:40, Rob Herring wrote:
> On Wed, Jan 04, 2023 at 12:53:47PM +0100, Stephan Gerhold wrote:
>> Sync the SoC IDs in qcom,ids.h with relevant entries from Qualcomm's LK
>> bootloader [1] that is used for almost all older Qualcomm SoCs.
>>
>> Several of these are already supported, e.g.:
>>    - MSM8960 -> APQ8060, MSM8260, ...
>>    - MSM8976 -> APQ8076
>>    - MSM8956 -> APQ8056
>> Others are currently being worked on, e.g.:
>>    - MSM8909(W) -> APQ8009(W), MSM8905, MSM8209, ...
>>    - MSM8939 -> MSM8239, ...
>>
>> And even all remaining ones added are close enough to what is already
>> supported so that future support is realistic (if someone steps up to
>> do the work).
>>
>> Add all of them at once to avoid having to add them one by one in the
>> future. This will also benefit other projects making use of the same
>> dt-bindings, e.g. bootloaders where adding support for all these SoCs
>> is a bit easier than on Linux.
> 
> The promise was in accepting the properties upstream is we'd only be
> adding these for bootloaders with dtbs that we can't otherwise update or
> change. Do all of those meet this criteria? Seems unlikely.


Most of Qualcomm platforms come with the signed bootloader, so it is 
impossible to change it without vendor keys. This might sound bad for 
you, but I fear that this list would include most of the platforms until 
Qualcomm agrees to rework kernel-bootloader-dtb interaction.

-- 
With best wishes
Dmitry

