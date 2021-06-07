Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519BDC47082
	for <phone-devel@archiver.kernel.org>; Mon,  7 Jun 2021 08:23:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 224A861205
	for <phone-devel@archiver.kernel.org>; Mon,  7 Jun 2021 08:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbhFGIZS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 7 Jun 2021 04:25:18 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38772 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhFGIZR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 7 Jun 2021 04:25:17 -0400
Received: from mail-wr1-f71.google.com ([209.85.221.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lqAXd-0002dw-Q6
        for phone-devel@vger.kernel.org; Mon, 07 Jun 2021 08:23:25 +0000
Received: by mail-wr1-f71.google.com with SMTP id v15-20020a5d4a4f0000b0290118dc518878so7559338wrs.6
        for <phone-devel@vger.kernel.org>; Mon, 07 Jun 2021 01:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nNihlv2mQDvu7x35XjiDukEpJ//QCmebfmPCVN6DojI=;
        b=JoazaIPk3dsCuDn5i1xVbDSdSKxKVI2qPxSJJezOLQVpBVeL1+ZfP83niXisURVV/m
         FEo27lb9hjsds6as8brnTbgS8Jj+gTh5rx8lxoCzphELjPWMIFHj3PeykYuoGvYGC9m6
         WV12L9RL41syrBukCUb+i0TrzdFDqz1O9dN7ENjolyh19pTcfjXOqw3RzCjFYB8Wa9GP
         nGKaQaxguXt8KhM7IGUl0bsfWiixgrhwveyb4ipID0jcB8wIpT+vYhv2RrQMTmG2xl8y
         5iMhcGgkCX/Lyr/AtPjECw59BVONNGWDYbhvXV2XAIJGCBK6q00nhnB3ZPLqeFUZFc9w
         pdyw==
X-Gm-Message-State: AOAM531VlRLnuBiD5fqKd8hja0Fpqo78WjtmyXa1BtoE/53186vZ8E2c
        Ir8A7k41yPiJ0MM21sDIcbw1gmYrA001E91zLDsHj4Q3r9VeBbjUSnElFHGiFq2UwzwWEf288QK
        0XOYJsv+NGzwJd51yrpauGIhvFUpB+GisxxYZie27
X-Received: by 2002:a05:600c:4a29:: with SMTP id c41mr15998422wmp.17.1623054205597;
        Mon, 07 Jun 2021 01:23:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFB+dRPKGdNJg3l60fhDad4GGbvMwgFjD2jIMcvCpVhYadAMZl/UxKxT1ZNfyObVD0Hqpaug==
X-Received: by 2002:a05:600c:4a29:: with SMTP id c41mr15998412wmp.17.1623054205481;
        Mon, 07 Jun 2021 01:23:25 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id b15sm14473023wru.64.2021.06.07.01.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 01:23:25 -0700 (PDT)
Subject: Re: [PATCH 5/5] arm64: dts: qcom: msm8916-samsung-a2015: Add NFC
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <Michael.Srba@seznam.cz>
References: <20210604172742.10593-1-stephan@gerhold.net>
 <20210604172742.10593-5-stephan@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f835dc4d-5643-1249-0f23-e9c0337a4f38@canonical.com>
Date:   Mon, 7 Jun 2021 10:23:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604172742.10593-5-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 04/06/2021 19:27, Stephan Gerhold wrote:
> The Samsung Galaxy A3/A5 both have a Samsung S3FWRN5 NFC chip that
> works quite well with the s3fwrn5 driver in the Linux NFC subsystem.
> 
> The clock setup for the NFC chip is a bit special (although this
> seems to be a common approach used for Qualcomm devices with NFC):
> 
> The NFC chip has an output GPIO that is asserted whenever the clock
> is needed to function properly. On the A3/A5 this is wired up to
> PM8916 GPIO2, which is then configured with a special function
> (NFC_CLK_REQ or BB_CLK2_REQ).
> 
> Enabling the rpmcc RPM_SMD_BB_CLK2_PIN clock will then instruct
> PM8916 to automatically enable the clock whenever the NFC chip
> requests it. The advantage is that the clock is only enabled when
> needed and we don't need to manage it ourselves from the NFC driver.
> 
> Note that for some reason Samsung decided to connect the I2C pins
> to GPIOs where no hardware I2C bus is available, so we need to
> fall back to software bit-banging with i2c-gpio.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../qcom/msm8916-samsung-a2015-common.dtsi    | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
