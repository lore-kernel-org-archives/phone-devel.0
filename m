Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A413ECAAD1
	for <phone-devel@archiver.kernel.org>; Thu,  1 Sep 2022 16:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235004AbiIAQOk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 1 Sep 2022 12:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234991AbiIAQOh (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 1 Sep 2022 12:14:37 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD7893503
        for <phone-devel@vger.kernel.org>; Thu,  1 Sep 2022 09:14:36 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id z6so25142905lfu.9
        for <phone-devel@vger.kernel.org>; Thu, 01 Sep 2022 09:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=oM5Ezf93shH3kTZ/vWZom8C9aO4D37NWLp1m2av/9KE=;
        b=weJDobI4VZLlQOv2NmBusEwHliBx35A0mbIaFjUlAYWNEroUGOQ8uthHHliuu7BU8p
         b+KkC1eXTODjP+yuFhR/dK5ZRTcFfygCZR1bMaH8t9B7bCXYJUsBhtAdMNY8OQXzZLqr
         yOqF000XGvlGs2gwcW1w8bEFYaE7b033v7/966gK1virFXNzIp7cdlwLUysFMGdPpqH0
         yloNo0s3Q4YiKAeTShZ8bszaujCDsORpn8fMuagniFsviVOlkajOSHZo02qFPvynefB9
         BbgW9UAL4Ccn4FZRR6LQYxUzNiE0P802zOAWfiUztoFcBaktOnN9aJ4sq6SvhnJtCe9l
         /ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=oM5Ezf93shH3kTZ/vWZom8C9aO4D37NWLp1m2av/9KE=;
        b=ovOYdn9LNuCSHpwmafNMeTL/DxDL8wHCV9bMYsBaQC8sxgBbNx47dR57Q2qq1VbLwa
         S1nKu8YrJXs2AdHMnMdJtEc2cMBhmDCEIrvhEETw5i65g2U4/L4O8ZJcmSS7cdqLLkCu
         7h+Y0ErcWJcZp/ZK2kBsxBUN8cskAQyl3bKYsSDbzGMDWcn4MwNONbklZrfKgbLRSYKn
         3mUOG+fE7XfV7sTDmXOkWa0AAZzfpB1KCz/kCtYgatRRntzVVZH9ODbXK9fr5eLMBqp2
         84WwgK2PKL/MqH/tuyQSKi4fwzMzwFD1qGIAxmU87o25z6vwE71iuDm5uUq51B4SctmZ
         nXkg==
X-Gm-Message-State: ACgBeo2GUMfBXPJe3+zpoMCzAAJ+m8LbxBtZhBev3ezwX8PzNQzm96XA
        KMdR1mAP2O5tS1sw2cN0+iYDbw==
X-Google-Smtp-Source: AA6agR7mFWuOJgz07cAbY8XAhBR6s/+8zDbJ48LhLiRZk/NLUAK+9mIF34+dj5dbwMX4aTNNI+016w==
X-Received: by 2002:a05:6512:3b23:b0:492:b36c:acab with SMTP id f35-20020a0565123b2300b00492b36cacabmr11580881lfv.157.1662048876214;
        Thu, 01 Sep 2022 09:14:36 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id t24-20020a056512209800b0049490b3bb46sm78580lfr.36.2022.09.01.09.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 09:14:35 -0700 (PDT)
Message-ID: <df07db67-e710-389a-ba9a-903c6855397b@linaro.org>
Date:   Thu, 1 Sep 2022 19:14:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 11/14] dt-bindings: arm: cpus: Add kryo240 compatible
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Luca Weiss <luca@z3ntu.xyz>, Maxime Ripard <maxime@cerno.tech>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20220901072414.1923075-1-iskren.chernev@gmail.com>
 <20220901072414.1923075-12-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901072414.1923075-12-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 01/09/2022 10:24, Iskren Chernev wrote:
> Kryo240 is found in SM4250, the slower sibling of the SM6115.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
