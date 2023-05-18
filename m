Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449E0C77B7D
	for <phone-devel@archiver.kernel.org>; Thu, 18 May 2023 07:19:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbjERHT5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 18 May 2023 03:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbjERHTo (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 18 May 2023 03:19:44 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4777530C4
        for <phone-devel@vger.kernel.org>; Thu, 18 May 2023 00:19:39 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-965f7bdab6bso325714466b.3
        for <phone-devel@vger.kernel.org>; Thu, 18 May 2023 00:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394377; x=1686986377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gwTSnqzLtgeY9emNU+hbMq75lDoh1HWWm3NzweFDwzM=;
        b=T1Sh4+2lzD3bSfN+/8TQjBiWh//n6l4kRKk7o+RQH2YHCftCBoMPtYd3+su720dt1U
         1HAA+HeN/bsMSPqKMK/G4wRUcgNsODGtAh3QkPJSpk+eXAegja/NnFblfv2z9TO/3XEa
         rDF4Fgc+xLFFryB52X8JhsYJSUhtTT1g663g4TeTrXG/Il3i/bGzfinG/nU9BpajBJmE
         LqvU5CoQxzBdfH8vUYCxKI5wCtCyrc6KM75gm/oELl/h7zQ9H3F4vEOq1vxwkVmLQRNG
         RD7R/homvc/vH/wWdUwvzKTDgQHxJjRYKDnfEKYD/L/i+U1pdkcBIeVmRwJ0+I0aLtO9
         eZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394377; x=1686986377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwTSnqzLtgeY9emNU+hbMq75lDoh1HWWm3NzweFDwzM=;
        b=DsseCzIA5mU0+FGh8wN+VLcE9xTMrWc4c/vIcHMEcqtveIBSOOmGnpt6Qdy0t6uPVE
         dlv3RYorxxgCsDBx1nuk/+d8KZvvbatGWuHQNQnChYVEkelfgjRwLhcDNz2KySxDD2W9
         FjguG7FskPSXMJCWzsr1Aarj5Yi/tHQSmUxWEmXAyoW9wSUpf6fw1/cQcuryvnNvNFXA
         gT/Z/3IUaFCedoOxq9WGBP3k56YXmS6cx4n6uDj7nGgkPUJfX4bnH6b+anOIz1g4ty3u
         6gnJQi7U1oVLvPsnVfiRJnfPZnm0fLHgJGZ+i0zC6jabnfM1EsNzLQ3VwswL91+GiEz9
         ksNw==
X-Gm-Message-State: AC+VfDxbSxAL829B4iKeVdcEhvVRvu7c1UnkTT4NL9Gdd7harK5P+HbB
        TuA4O2lBjzQPdTRtzlA2SOlcBA==
X-Google-Smtp-Source: ACHHUZ5XEZF63Sg6MWtZ1QEpfQ0vG/iSgAb42WkV0+odOmHmWrWTo1Ioka+202Jw6cmQ/NA5S8/fXg==
X-Received: by 2002:a17:907:9712:b0:967:b02c:b06a with SMTP id jg18-20020a170907971200b00967b02cb06amr37912471ejc.27.1684394377719;
        Thu, 18 May 2023 00:19:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a2b:c408:5834:f48e? ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id bv15-20020a170906b1cf00b009531d9efcc4sm573376ejb.133.2023.05.18.00.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 00:19:37 -0700 (PDT)
Message-ID: <f99c1fbd-d6b2-f6d4-cbd6-1ddb17430e8f@linaro.org>
Date:   Thu, 18 May 2023 09:19:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: pmi8998: add flash LED
 controller
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        amartinz@shiftphones.com
References: <20230518061328.146847-1-me@dylanvanassche.be>
 <20230518061328.146847-3-me@dylanvanassche.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230518061328.146847-3-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 18/05/2023 08:13, Dylan Van Assche wrote:
> Qualcomm PMIC PMI8998 has a 3 channel flash LED driver which is used
> by many phones for 1 or 2 flash LEDs. Each LED can be used in flash mode
> or torch mode. Add the flash LED controller node to PMI8998 DTS.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

