Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095B3C25B0F
	for <phone-devel@archiver.kernel.org>; Fri, 12 Aug 2022 10:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233008AbiHLKF6 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 12 Aug 2022 06:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237577AbiHLKF6 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 12 Aug 2022 06:05:58 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B9757253
        for <phone-devel@vger.kernel.org>; Fri, 12 Aug 2022 03:05:56 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id u3so684039lfk.8
        for <phone-devel@vger.kernel.org>; Fri, 12 Aug 2022 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=IO7so1201LCfMcIFny+9ruzvEPMZiRRert/i7tnBZi8=;
        b=hGkEc8OoOo4q8ohhtTgulAqSMGWFmQV7Kp+Hqhe5r9kdgSYD+x5QgyuJ89ZvNjtMYY
         7N/SGx8r4gdeAABgtKSfLvL13ubXlOqDPe/fIOL6QycTjezx4Q53UkWT8rMpoGRVDBlx
         tJlKtSfkN4qEhkCM7P+p/ZHu9i5w36/blNVKZWfaGz+HriLRW/fdLOP4szer9hJsrMPe
         Y7mcrCizGa5j4m4/gXJU3zNpH/mBa+U8bMzN7yn34LgaAjGetvgkfYa8TfsuxhEGJHxC
         QCdAX1PGrkPtz7iWCXPMbWf8FLSzSsdku9tbl3/rt13s9K7GrOwkx2SeV1idImXvE+lr
         ++0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=IO7so1201LCfMcIFny+9ruzvEPMZiRRert/i7tnBZi8=;
        b=YO+CVpioMX+14Y74RpmsOjRbnH3S0dJwB7UBb9f+eGw8tNVISCLiJWa0w1LQAGXZB+
         B8mPF6N/3jZtTn78hTo3lbYwpCLmtkv4q7H/tcQeVdQNFAXEZ88ymqRo5KL+IAFCgo5c
         wO0zay6u8rhS/xkzHrfgspyoSbPJNvzox9RbUjeBGZSzjB5stfWTJgJhuTXye0Ns6A9y
         YazI6gB0ALLffC2lQ9K/QRetIjewZiRV9cBOEwlCn8N4BQcN9eOWfxGGq9uPzASQesA4
         /H19sjITaAkgFd7MmNFT1xIfmiVNd0ZpmypgBdul952hqqMNo/Xy2NoHiQRI9n3no/i0
         syNQ==
X-Gm-Message-State: ACgBeo0f+MHyeEXJhENXutZe/Q2hWfwTnuGmBpvdXIy7MRPXMBXwnm6a
        giwDHybR6fizO7pcsY6Zvom03w==
X-Google-Smtp-Source: AA6agR6fzUskvP6InRv+oxetqHdNsHTS4o7mioyPTv9TSP3493LiUEJKces/OsoPzUKEazRp8tWuow==
X-Received: by 2002:a05:6512:260e:b0:47d:ae43:62b3 with SMTP id bt14-20020a056512260e00b0047dae4362b3mr1170146lfb.77.1660298754958;
        Fri, 12 Aug 2022 03:05:54 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id x27-20020a0565123f9b00b0048a77a2c4b2sm158340lfa.158.2022.08.12.03.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 03:05:54 -0700 (PDT)
Message-ID: <2ee101f8-7466-c437-76f0-ae480b921cff@linaro.org>
Date:   Fri, 12 Aug 2022 13:05:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dt-bindings: dmaengine: qcom: gpi: add compatible for
 SM6350
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220812082721.1125759-1-luca.weiss@fairphone.com>
 <20220812082721.1125759-2-luca.weiss@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220812082721.1125759-2-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/08/2022 11:27, Luca Weiss wrote:
> Document the compatible for GPI DMA controller on SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
