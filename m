Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49665CDB476
	for <phone-devel@archiver.kernel.org>; Wed, 11 Oct 2023 18:29:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234976AbjJKS31 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 11 Oct 2023 14:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232636AbjJKS30 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 11 Oct 2023 14:29:26 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC03693
        for <phone-devel@vger.kernel.org>; Wed, 11 Oct 2023 11:29:24 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5044dd5b561so242722e87.1
        for <phone-devel@vger.kernel.org>; Wed, 11 Oct 2023 11:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697048963; x=1697653763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eejRC5jkkP9a/cnnUiuXlShL9G58ptQE16Rjy2o31Kc=;
        b=l34vBeqbHEJoZnXc39NmqowIFcSAYkwnXNfrs3eKZSehQL8dUP2dGuy6TPHXypCwju
         xdHKIb+KkKitz+04WtiZAmG7dLJoEA1Z4q0nue/pgt4KQYRglENVQcd0lSy5htF0K2pP
         Mb+MEqyM+AwsMePnzjISyu/ujYj/xvMNJ9uEVgUTw6MJLdmHUzwJffaP6YoZtOcDeXKX
         xgYRq9TD2TsH99Q8scVFw5pmVFCKBnR4nBjP+OWyf4r1jEzQU9njy1D2oPFbe+jD35q7
         J8zLBoMssjLXJoIiA4iwXPhEZ6DrmQCTiL+oUO4JbwIvK+6o8bW/6B3x/ESp69ZnNiQo
         cupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697048963; x=1697653763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eejRC5jkkP9a/cnnUiuXlShL9G58ptQE16Rjy2o31Kc=;
        b=oNdL40zox70U5ORajz5GVbOIv2a5fnFnJ++ivIyFM/99JQhmBYjg5v3Xl25pCk73E7
         0z8ovyzRYqOnhxyHtj4/AlCFzdWFPLlA3dSIRwBQJdegO2k9iV0DsrDWmTBD/mPa/j5M
         DOs3GVWkejwbhWRa6TVxEHeYNZX+qWu1UP0B/Npsaf0JDaN15rWBzr71uLG25vRi99V6
         1Af4w3Y1H2Xl6x6JPEjtcqdt21yylA1aLW9ApKVDX16yuxrON68JSmgZR+HGLaau6PNN
         FtzJEs1tAcs/yO4Z5r/4e3qofPppeZk9YqJ0gn5g0Hoxt+fCYi2KUgORObmjXcFo29R2
         vnBg==
X-Gm-Message-State: AOJu0Yw+9OftqrhLRirmlEI3reDICbcZ+q/zGswPrQDNs9+JDsUMbc6l
        wf1o0AJe4JPhkCPGqjwtN8f11g==
X-Google-Smtp-Source: AGHT+IGMLQlG/2YqVwq9AN9IBYY2DekPXLj3trGyLQFjz0c/WVT0DhBhXpaKl81zyKyxcOyvuuabeg==
X-Received: by 2002:a19:7917:0:b0:503:c51:74d7 with SMTP id u23-20020a197917000000b005030c5174d7mr15013587lfc.17.1697048963200;
        Wed, 11 Oct 2023 11:29:23 -0700 (PDT)
Received: from [172.30.204.35] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id b21-20020ac25635000000b00503fe93fb56sm2368604lff.228.2023.10.11.11.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 11:29:22 -0700 (PDT)
Message-ID: <9e781059-bc86-4485-a9e5-80fcd14113fc@linaro.org>
Date:   Wed, 11 Oct 2023 20:29:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ARM: dts: qcom: msm8226: Add watchdog node
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
References: <20231011-msm8226-msm8974-watchdog-v1-0-2c472818fbce@z3ntu.xyz>
 <20231011-msm8226-msm8974-watchdog-v1-2-2c472818fbce@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231011-msm8226-msm8974-watchdog-v1-2-2c472818fbce@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 10/11/23 18:33, Luca Weiss wrote:
> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> 
> Add watchdog for MSM8226 platform.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
