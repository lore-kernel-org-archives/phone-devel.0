Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B947AC25B6B
	for <phone-devel@archiver.kernel.org>; Thu, 26 Oct 2023 19:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbjJZTgb (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 26 Oct 2023 15:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbjJZTgb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 26 Oct 2023 15:36:31 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149D61A6
        for <phone-devel@vger.kernel.org>; Thu, 26 Oct 2023 12:36:29 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c59a4dcdacso21585251fa.1
        for <phone-devel@vger.kernel.org>; Thu, 26 Oct 2023 12:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698348987; x=1698953787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OTgf2Dvow9ZuXFPqFfbC0fdxBZgN8QcR7Q24NuIsbkQ=;
        b=oCsUUWNf40nDNxPhrbehQjJH3/sMUd6nty7cLyO9bQyEiopL6LnZcGj/BaMrtQcc1i
         VVYfzS1tY2XxR46oByRBoxpukYsHpqX2xCnVepJEc8oUQe5hAJ4Nk72PI3/WOjZdWR3q
         IVGA+rSxklLeUZWB3v643KL1pmgDIkr2hkDZfTQGUu9xG6LIj93Ri0e1+lbu1gSGABWI
         3DtiecyqAw/naTc4o3kdenCOBK1I04kZ9KF9nkwn10/4h5/hitq0HxwT/PRtEospTz1p
         PCdEulzEqqYRT1DXaObr16E44tzoRLXQ7N9Hq6UH+yz0V3lUsElRlV2+uogjGQzIGU6C
         n7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698348987; x=1698953787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OTgf2Dvow9ZuXFPqFfbC0fdxBZgN8QcR7Q24NuIsbkQ=;
        b=TNV7Vk05B96M6q06Xd0eOh2ZNBGjqHkVEqT/Xg0U/JlRNfRcJHhLJKrF6pXvRZmAf0
         UXZnEhNVxsaa07UzU/wZvGnyIFwK3X7NNFbXQmztqsUaq6u37Q2CqCLTbwViHJzaGr0j
         9k2NyzGdvVOt4F2b6gfAD9bVQ6nGr6hiK9mxE5KcahFOfkmu7dFV/7Olo3BWFCL3nHhJ
         jAo218MnCBunyAjiXD+D2cOn1nBQtnwVLX0b0nzP9Rc0M/eCK+PR6KPFGzRCNtjxJSgq
         nZchPZtUiVzxxsKB/kAdISeRkHacAAyxUGE3BxsaNpFk55kIPieuUhHYLZBTkrXYgYpe
         tgtw==
X-Gm-Message-State: AOJu0YwY5T0Y5LQV6YkELF4VlAMoaB44cinKkASXMalJlwwpyhp2VH7J
        b3q9ibWxH7SiaEeHZmO6Q3TbHw==
X-Google-Smtp-Source: AGHT+IFOlZ4mUTLecLw/FO20DFaae9bB4NAnizYV3Y4IKYS/iIm9yXm0Ntj2T8hWdq/pC8rojnFjgw==
X-Received: by 2002:a19:a411:0:b0:507:a089:caf8 with SMTP id q17-20020a19a411000000b00507a089caf8mr233719lfc.67.1698348987253;
        Thu, 26 Oct 2023 12:36:27 -0700 (PDT)
Received: from [172.30.204.84] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n30-20020ac2491e000000b00507a0bb04efsm3086919lfi.195.2023.10.26.12.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 12:36:26 -0700 (PDT)
Message-ID: <2d191492-7fee-44f9-9de2-92821afa30d4@linaro.org>
Date:   Thu, 26 Oct 2023 21:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom: Add support for HTC One Mini 2
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20231024-htc-memul-v2-0-8912940b6f95@z3ntu.xyz>
 <20231024-htc-memul-v2-3-8912940b6f95@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231024-htc-memul-v2-3-8912940b6f95@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 10/24/23 22:57, Luca Weiss wrote:
> Add support for this smartphone based on the MSM8926 SoC, codenamed
> "memul".
> 
> Supported functionality:
> * Power & volume buttons
> * ADSP
> * Magnetometer
> * Accelerometer
> * Touchscreen
> * Vibrator
> * SD card
> * Charger
> * USB
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
sdhci vddio should have regulator-allow-set-load

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
