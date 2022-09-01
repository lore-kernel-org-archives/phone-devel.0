Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC1CC64991
	for <phone-devel@archiver.kernel.org>; Thu,  1 Sep 2022 16:05:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232578AbiIAQF1 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 1 Sep 2022 12:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233195AbiIAQFZ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 1 Sep 2022 12:05:25 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0B227170
        for <phone-devel@vger.kernel.org>; Thu,  1 Sep 2022 09:05:23 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id v26so14871036lfd.10
        for <phone-devel@vger.kernel.org>; Thu, 01 Sep 2022 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=fwg3fIYthgTs88ncHATwwlsyo02fA/7My937oz1s3nQ=;
        b=VEBB4UnOUDi9ZpiH7kvO452gEURhNXsGVfcP+RlG+xSsUqxQPSY3L2kryzWbWzuBLi
         guuYPeEQQWMD/8NcpemJFDAaFno5yCEOtIGrJ8PhKoKKlH8kJPmaKIv+P/L998YqY7Vq
         3YcprWCk7l4HXdlNLLdV+4IrlL0Ku8lLH/xSrOtbMiLhZL9fTYSs76Vh/EIlYlIu8T52
         T7YiMkRSF0WVhWRoa0bf7SCAxJFofogmENZcDCr41FUWEfxMIif9sEJcdUO1tWVuC0La
         O2APX0nLEXNJfOHF584Olva5pWnDP12as8KbZ21ODA4w1BD+nkHNDld+nEvsG2HoxVD7
         u1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=fwg3fIYthgTs88ncHATwwlsyo02fA/7My937oz1s3nQ=;
        b=0bhS+KSzshY3d4/D5HXx55Cc3baoWqXwxFM0E+HcwF38iQSxoGmEQxLQCHByhhav+7
         kbrUy+SfH3KPm+S4/eQM+s+7IMPqi//J4qrfLc++zZcOfZ16wQkn4kUG+HhsH6lxuuIj
         HgX4D6/C0s3UlKv7D25dev/qQNsKc3aRI/SBFOpqUnqWKmChITnyOJxe4HpdxBmFPSKg
         Dlb+G74lqUBjkQ/grpcm9nP9pkt/R0FZlC6zkgcXrP9fguVIA1DVmcohvoI2ZFdYnLc8
         KS7dRrrzxGHNIcgeBERoN8KMIEqPKCIKFQtwrHVUp/FW+nRak2aDX1OjTSnVj+TzD8cI
         aAHQ==
X-Gm-Message-State: ACgBeo2NUDuRRnNcwhQDEAfqRNia1TL+HI8SV5bDIq2+kwOGUXvhzyPG
        ujKiDGTIsUBQo6npXNvU9fZe2g==
X-Google-Smtp-Source: AA6agR70lkkzNRz9aGzp3iTtVpGqYq69wcsA6toTWrvnOGTTZqhXtvwQfMz9XAYOtNadleqhcE6cmg==
X-Received: by 2002:ac2:4a81:0:b0:494:832d:621d with SMTP id l1-20020ac24a81000000b00494832d621dmr3292954lfp.413.1662048322122;
        Thu, 01 Sep 2022 09:05:22 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id x6-20020a056512078600b0049480c69d98sm919177lfr.239.2022.09.01.09.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 09:05:21 -0700 (PDT)
Message-ID: <b8990062-7721-7bb6-9a92-a364ca7ae460@linaro.org>
Date:   Thu, 1 Sep 2022 19:05:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 03/14] arm64: dts: qcom: sm6115: Add GCC node
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20220901072414.1923075-1-iskren.chernev@gmail.com>
 <20220901072414.1923075-4-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901072414.1923075-4-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 01/09/2022 10:24, Iskren Chernev wrote:
> Add support for the main clock bundle on the SM6115.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)

This needs squashing, because one patchset per device node on first
submission does not make sense.

Please squash all your 1-7, 8-10 patches.

Best regards,
Krzysztof
