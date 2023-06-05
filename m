Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9543AC7EE2A
	for <phone-devel@archiver.kernel.org>; Mon,  5 Jun 2023 06:25:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjFEGZf (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 5 Jun 2023 02:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjFEGZd (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 5 Jun 2023 02:25:33 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618B5ED
        for <phone-devel@vger.kernel.org>; Sun,  4 Jun 2023 23:25:32 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5149b63151aso6629105a12.3
        for <phone-devel@vger.kernel.org>; Sun, 04 Jun 2023 23:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685946331; x=1688538331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o226GIM7TNLn/fW/l5qPMbx7gXL+g0NzLxiZx3vJfOY=;
        b=BfV89KS7ZQpgta8igkdPdZauvLKsZGwO8BbgxPH+n4tZgvMyPSx9AKAe1+fdvkQFOp
         sNJF3snUKGHppRwRJvHGXjY5IZiyjnYYGqR8QJLiOb8rBIUkDOJ4p4XFu5xgNMdYCQOn
         03Zz6CPRnVXxvihWKfhUo/LuPuCfkiYYXymbUaMgdLzjVmYP7KsfAUgYeMFldgVlvsNY
         vYpdSILuwDbFkGIdfIIClK5d5NXDFvagmy9ZzsdrJuzSZfB2Ej98xU9Uy1ofsoBLx4Dx
         IeAThQsPU+FbObMNVu2pMHPSRTFnreWHveU1GfXjP8efTp5IWDNveWXPKe1+5IOC9NAb
         uVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685946331; x=1688538331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o226GIM7TNLn/fW/l5qPMbx7gXL+g0NzLxiZx3vJfOY=;
        b=U2DCcCr3iByl/IR7RxHmUijRrCRggA6qGWRgB2uX4Ok0LNVDzKoWNqS/IEoHZ0qLc/
         s9JDwV03ttqcE3WzWfU6AEaNo0F19JVhNeI6+4DGDJ1SRtZhLLTO2LX8JLBtD57Wc4p6
         mJTP4CefE/50nHcr0OZWNwS1WLK4HGYuQKtfmHGAkHSOEhHmobfMG6NNL61X4B2D+qyf
         ZTNv12MLzZFvb6jJl12CV50HdiKlNJ563ujW7oTUAJvR4txo6BkJoCR5LFamcRHkRxrm
         MZDqQBKb401DKImPc2wS56DGwGtMmgTpCwgMXlcWGLOUblVB9A9xMAjR+D8gfkKFd2HW
         7gVw==
X-Gm-Message-State: AC+VfDw+7ohjfzn85RwK5GSlvU8mDc4n7t5G3wD3hdKGKV+MS3CGtBus
        nv0rUimbKuPB/2RUc+e9m5nqfw==
X-Google-Smtp-Source: ACHHUZ46Jq0uyk0YvooixC7rES62lNsgI/qtIj1ss5urREstlbOH1QiLHaLq1qHGw55tISA2Kewiyg==
X-Received: by 2002:aa7:c64d:0:b0:515:3103:631e with SMTP id z13-20020aa7c64d000000b005153103631emr8187170edr.25.1685946330881;
        Sun, 04 Jun 2023 23:25:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id b11-20020a05640202cb00b005147f604965sm3563772edx.24.2023.06.04.23.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 23:25:30 -0700 (PDT)
Message-ID: <9e2461f8-bb11-bac3-a983-5197bd1ea3ba@linaro.org>
Date:   Mon, 5 Jun 2023 08:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: qcom,msm8996-mss-pil: Add
 SDM660 compatible
Content-Language: en-US
To:     Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230604061421.3787649-1-alexeymin@postmarketos.org>
 <05658f98-ddc1-702b-ea4b-4ea95d0b3313@linaro.org>
 <06cd3bc1-ce97-3b62-c5f1-98b22c8c24b0@postmarketos.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <06cd3bc1-ce97-3b62-c5f1-98b22c8c24b0@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 04/06/2023 15:35, Alexey Minnekhanov wrote:
> On 04.06.2023 12:11, Krzysztof Kozlowski wrote:>
>> You also need to restrict/constrain power domains and resets.
>>
>> Best regards,
>> Krzysztof
>>
> 
> If I understand correctly, power domains and resets should be already 
> restricted together with msm8996+msm8998 by "else" branch [1]?
> Am I missing something?

Ah, right.

Best regards,
Krzysztof

