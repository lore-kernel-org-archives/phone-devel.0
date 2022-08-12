Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990D0C00140
	for <phone-devel@archiver.kernel.org>; Fri, 12 Aug 2022 10:06:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237871AbiHLKGg (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 12 Aug 2022 06:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237546AbiHLKGf (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 12 Aug 2022 06:06:35 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFAB79753C
        for <phone-devel@vger.kernel.org>; Fri, 12 Aug 2022 03:06:32 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x19so692999lfq.7
        for <phone-devel@vger.kernel.org>; Fri, 12 Aug 2022 03:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=azcV9dUXGLyvJ1HXCFQoiPwl4R9cCXQpr4RG4L7Q6lg=;
        b=dIG2Kf/ZtELw49VJpK+5sIi7pN0IcACaYc9R1dGcXjyTAFWRnXKUVatGx7jwn7I2g+
         5WZthg9JH1FPpw35LSFKs+heVsW9Wa90ysn3lR5pxhm9LwrTfigv48SjYjfnvoYpz+NH
         6f9gvK+Nw+bz8O5LpdrTM7NDOhSliLul9bYglUO9/f+5uAzfAasvoSPYzHBIkNBZbklK
         s03yX2Qc+t/KsTrbrj8iI4oP6/CNG01UdybTA355UkjVY0u8CfSHTjKPmGWK/wn9VOpi
         qcl/g3Kp6pCuxfG01+3Nt3Zcy5cdPdEl1t+u9Vt6EuRyR2umLJrp+04XMmS0QKx6E5yl
         nHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=azcV9dUXGLyvJ1HXCFQoiPwl4R9cCXQpr4RG4L7Q6lg=;
        b=tWrKxLiFVwh9eUYcnw5XkjA9njB3vn50WR288gBOy5JTSehpy7zlNRRCYGht/EcLB/
         jATP97VWN4b3wpz5gZ3u37gbZ6P7i+91mHX/cnG4jUx1LsG1UnxvZ7xLp4g71ISw9W1J
         0RqE6upCyWjxG38Xg9LMm0MvkRWnPZNI0gQDPkvWUmDGxVI37WbrOZTucwL1RZRQwlhP
         kTszXih3Nv6NnZJhF1UdZq1KQDuPPP4MNFfcHSgTnYmdNw1v38HFKtAjj/5/4JGqcRGE
         JIntbw3ipogNBBMwA/kTU9jyVdTGCV5Nqjfb/d/XyIum1M7CF2ZQO97uiQSUp7nWT/7M
         iVOg==
X-Gm-Message-State: ACgBeo0l8P4cJoqm95ObQOfC+hvqY/1mccq5NdINMS8pwQiqapAvfQFM
        0WmCpEzSye5fv3/v+f6LSeMSbQ==
X-Google-Smtp-Source: AA6agR6JKxA0NhGbseGy7N3sH5d8PuTIZDW8lB7MYEIYhdenJTipcSBK6J4XoMJ2hVVvH29Ktsjwuw==
X-Received: by 2002:ac2:4f03:0:b0:48a:6061:bd8e with SMTP id k3-20020ac24f03000000b0048a6061bd8emr1146671lfr.647.1660298791278;
        Fri, 12 Aug 2022 03:06:31 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id p4-20020a19f004000000b0048a98b7bad3sm157586lfc.197.2022.08.12.03.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 03:06:30 -0700 (PDT)
Message-ID: <5c187887-c458-8b51-c510-60143d325972@linaro.org>
Date:   Fri, 12 Aug 2022 13:06:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add GPI DMA nodes
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220812082721.1125759-1-luca.weiss@fairphone.com>
 <20220812082721.1125759-4-luca.weiss@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220812082721.1125759-4-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/08/2022 11:27, Luca Weiss wrote:
> Add nodes for the gpi_dma0 and gpi_dma1 which are (optionally) used for
> various i2c busses based on the qup firmware configuration.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 59 ++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
