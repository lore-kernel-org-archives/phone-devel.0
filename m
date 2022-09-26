Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012DBC6FA8E
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 16:29:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbiIZQ27 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 12:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbiIZQ2k (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 12:28:40 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A7810D0D2
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 08:17:44 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t14so10718616wrx.8
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 08:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=xO4khjU4+78jf2xpWOKdr7uLPN/M8XJlTiPq0JGsUEU=;
        b=whq7ccc85DgTYmP6s9w/n/+7AGuhR/C3CzhxsMckVS0NDJC2aH8TKUxA7XayhmUFSQ
         bZzdV6DAn/tgA1B6M0cpDU/5QwFr/8vio+M3edDLK7AUuEmBHGNMjItC6AqXB7CPEey/
         2QpXj048LdNjue/gAWJzHdP2AzVjzQpLXB/Mo5/C+q9Utp9k3fAh+pN9+lTN0IIRo4UJ
         h+wXbwqrTSiunnZ2odiLLoMmHakBG0vSSlh6V0mQAwc95RYZFwA1CvzGtWXBsEIcIONz
         TGecJbRv4j44++peR7wjh0YBN4WdPCWhpWb9C8d5KAGUBZxEeNNEOfvzk+4nNoaeqPB9
         BCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=xO4khjU4+78jf2xpWOKdr7uLPN/M8XJlTiPq0JGsUEU=;
        b=6GElgIrEXfkR7r06HhvSm5GxpYVziztryEfJH3O7AKcM2JJgOSlJYo9n/wh7DGJtE2
         KGrKuOXgKrMlRhzpyalk9P2Bc3GrtVzYInBAxrmpr7jk2jbpaestYfbs8Ll3qfOlZCrI
         ZfuspOeJZqm6sBu0aaasybtx7BEZnkUzfTD6Hw29XvY9MfFy8KRp+kG2D1wqALx/IgmR
         SbDXbHplBBjm902Tkbo0s3n3xbdZUHmfp3MbpUVR8oMcpstB4tDM7lEZu/DSD50zLOZr
         2xvHrObflqY++OoWwKIHiraFHyJCAQnGj934kImnQoHuAePIbgu/+Tyrm6MgEZVMItdY
         aUfQ==
X-Gm-Message-State: ACrzQf3ltsRb9E8r29rRGH8sJQ+Gy2TPW1Com1JLy/WSdhfAVgss+BKG
        m/EzV14YTq397zpzKcmfovUAAg==
X-Google-Smtp-Source: AMsMyM6up2Ozit/2+z03cRrBYJ1BFBnT49cZk9lO9N6icaZeWOxslodaMHPv9BrhhcXW5grI6X5I2Q==
X-Received: by 2002:a5d:588c:0:b0:22b:1b41:6b83 with SMTP id n12-20020a5d588c000000b0022b1b416b83mr13256254wrf.283.1664205462948;
        Mon, 26 Sep 2022 08:17:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bc13:ca44:4aa0:2ef0? ([2a01:e0a:982:cbb0:bc13:ca44:4aa0:2ef0])
        by smtp.gmail.com with ESMTPSA id v3-20020adfebc3000000b0022adf321d22sm14451956wrn.92.2022.09.26.08.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 08:17:41 -0700 (PDT)
Message-ID: <6bcce1f6-3eee-6fce-7a0a-44550b3dc3f8@linaro.org>
Date:   Mon, 26 Sep 2022 17:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] ARM: dts: qcom: pm8941: adjust node names to bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925210229.128462-1-luca@z3ntu.xyz>
 <20220925210229.128462-2-luca@z3ntu.xyz>
 <ec8cc121-9814-cd52-fb49-c33ab1376f89@linaro.org>
 <3070538e-fa8d-4506-bbf8-c2770d092eb5@linaro.org>
 <3dda8e86-b92b-488a-5afb-0cb49e7e52ae@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <3dda8e86-b92b-488a-5afb-0cb49e7e52ae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 26/09/2022 12:29, Krzysztof Kozlowski wrote:
> On 26/09/2022 12:04, Neil Armstrong wrote:
>> On 26/09/2022 11:22, Krzysztof Kozlowski wrote:
>>>>    		};
>>>>    
>>>> -		usb_id: misc@900 {
>>>> +		usb_id: extcon@900 {
>>>
>>> Why? extcon is Linux specific name and should not be added to DTS.
>>> Anything requires it?
>>
>> It matches the current dt bindings:
> 
> Then instead maybe let's fix it in the bindings and DTS?

Yes it would be preferable

> 
> Best regards,
> Krzysztof
> 

Neil
