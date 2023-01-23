Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8322C05027
	for <phone-devel@archiver.kernel.org>; Mon, 23 Jan 2023 17:11:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232600AbjAWRLs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 23 Jan 2023 12:11:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbjAWRLr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 23 Jan 2023 12:11:47 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 667C8AD00
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 09:11:46 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id j17so9620756wms.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 09:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w/1n6Rnx67kZYArlthTKZLtXubhv3HxF61v2sHJZdtI=;
        b=D6mCK+sNgyqI8k7P3xFY+QAzdy/QUXCsgKTvL9iznmaCEiA8KTzPZ2mFBeVub9/7Q6
         a7EDMeXOn8It3e3nKAuHDlTRpXllRzGRE9CN1T8MqH5ig1cE4lEukqZgSIrYzq7Sue9P
         P+iYYOAmc7TdAMF4plYPtU91tT+ZzVXkJKlxdOh/9t9/QU+5GTtOCDTuNgultTH2OUFp
         q6QVQ1cSNcSW2lmIzKW4BE96j6q5j2qTgpp8g2D2c2mnllwMBA3fCFB+7ZKl4/FykDC9
         OjApyeqiDR6rvBTdmkmCDFDbdsYEL/ll4bBjkrQqQYskcjbtrj7PDLdsmYy3U7h1iHnm
         AkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w/1n6Rnx67kZYArlthTKZLtXubhv3HxF61v2sHJZdtI=;
        b=vC5W+eo+JiO/IMZoJBzNl9M1ZU2CTINlkRUnfdOVYGN2hwsTlbt3mROHVqJtDE+62u
         kCcCfZI/QIh5SRY3w0eJ2w5++RtxJrnjwhnO8GIM8YrZMjCBVXFSaJi9vSZ9OCll0He1
         DmkVKbdErRQmL24LVfnPdcVanW95HB9Ij9zReegP6jyMcvFDH4hTrk7b6UqtSyg1R/TG
         i8e4YbF+GgacQvntEdTCVX1JqozzW+U+qbrR10XpLoMf7cmrHuPOJ2inF6uh3ZKIvS8y
         aUFT9qlSOQl987IVLFMq+0SfhyJf6MUOTS1gPWlpssm77iGdcYmLlG/9ccuHD4X7HHEx
         xq/w==
X-Gm-Message-State: AFqh2krGoNfhrWwnncA/cF7EFEWKVc53VWi0yin4qpYc0YSsdb849vd9
        ub4XbJms0hEcOP9hnpb2FaZ0Sg==
X-Google-Smtp-Source: AMrXdXtGdUeLHbnaS4hmtb2SyIomWK0GV8Cd02EvA/qIDnUsl5zN96cLh5XItAyRcUDAWCzJAsB44Q==
X-Received: by 2002:a1c:7312:0:b0:3d2:3eda:dd1 with SMTP id d18-20020a1c7312000000b003d23eda0dd1mr23603852wmb.17.1674493904926;
        Mon, 23 Jan 2023 09:11:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h11-20020a05600c314b00b003db2e3f2c7csm15249768wmo.0.2023.01.23.09.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 09:11:44 -0800 (PST)
Message-ID: <1481d44d-f84c-db12-d95d-75f367e973de@linaro.org>
Date:   Mon, 23 Jan 2023 18:11:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: Add MSM8926 and Samsung
 Galaxy Tab 4 10.1 LTE
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Stefan Hansson <newbyte@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        matti.lehtimaki@gmail.com
References: <20230122144749.87597-1-newbyte@postmarketos.org>
 <20230122144749.87597-3-newbyte@postmarketos.org>
 <f67b23e8-a476-7f8c-b692-e85ebbe669f5@linaro.org>
In-Reply-To: <f67b23e8-a476-7f8c-b692-e85ebbe669f5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 23/01/2023 18:10, Krzysztof Kozlowski wrote:
> On 22/01/2023 15:47, Stefan Hansson wrote:
>> MSM8926 (also known as Snapdragon 400) is very similar to MSM8226 and
>> APQ8026 with the primary difference being that it features an LTE modem
>> unlike the former two which feature a 3G modem and a GPS-only modem,
>> respectively.
>>
>> This also documents Samsung Galaxy Tab 4 10.1 LTE (samsung,matisselte)
>> which is a tablet by Samsung based on the MSM8926 SoC.
>>
>> Signed-off-by: Stefan Hansson <newbyte@postmarketos.org>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 47913a8e3eea..7a0b2088ead9 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -35,6 +35,7 @@ description: |
>>          mdm9615
>>          msm8226
>>          msm8916
>> +        msm8926
>>          msm8953
>>          msm8956
>>          msm8974
>> @@ -219,6 +220,11 @@ properties:
>>            - const: qcom,msm8916-v1-qrd/9-v1
>>            - const: qcom,msm8916
>>  
>> +      - items:
>> +          - enum:
>> +              - samsung,matisselte
> 
> 1. matisse is the code name, lte is version/suffix. I don't think they
> should be together, because then it looks like "matisselte" is a name.
> It actually sounds like one word.

Update: there is already matisse-wifi, so please follow the same naming
convention. Version suffix should be separated with hyphen.

> 
> 2. You base on other SoC but you do not include its compatibles. Why? Is
> it intended? None of the properties applicable to other SoC will match
> here, thus I actually wonder if you run dtbs_check...

Best regards,
Krzysztof

