Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD78C4332F
	for <phone-devel@archiver.kernel.org>; Wed,  2 Nov 2022 20:11:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbiKBULw (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 2 Nov 2022 16:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230457AbiKBULt (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 2 Nov 2022 16:11:49 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1820C338
        for <phone-devel@vger.kernel.org>; Wed,  2 Nov 2022 13:11:49 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id v8so6064163qkg.12
        for <phone-devel@vger.kernel.org>; Wed, 02 Nov 2022 13:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVMcnUWjxaSK0Yh2I3vt/XgKGynIdU21Ts9Up5NV3Xg=;
        b=pF+ResqOlkUk7h7VGlX+YNM8nsmuuBPkGnZHp3cM0CYX9OW9tlC9PLrqS/2mB7uZt9
         pzGYJKMnCjb9wJODZRQGbi0n+5BkGvGMc6kP9Sg7CiJhbR/Cqk5OtOrhq6ZsXFvqsfNO
         hC/RL4TtJyWbaUVasSSjNQIhp+utfENXsWodqjT8QFBCVbFwSGWmWS2XRYSNyWejNlmY
         hj0CyJaxVOz0wI0KZJFGUSzvirf2Kzz9pQ8cuyn/h2BRJaU16XhZKj7XKdi0YOLmHliY
         VkhErRd10hhtrPc0sQCm0FxL8gD57mZFaFNPv//J7s4CSKJkE59Rmpi1vRSbHp7JHKbp
         8PrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVMcnUWjxaSK0Yh2I3vt/XgKGynIdU21Ts9Up5NV3Xg=;
        b=5mCK5pQ+ykZc104/tlBczzdCETNQ+OJaQTl3/sh9lJ47IZ1zshfy/XLsQ4DIDfxGr3
         JnlFO25bDKAJf9T6cW8Z+nnv/bep7qT+qLLV0GmAVA5Gb7+CYVsXeVe8ctiz+ZxVDHSS
         L0cWh+Nn586Irv6yI7R4rTtO7Z7N5wskfpiRBC474+Usbg0Qt9xPSkiGj8Ydt0t8a5sB
         KJiwQmJtAfOMA6X3XSb0OOcj3J2DmN6IKn+0+78OZQVl4IYEfDKD8hMxLESj+kDvi1sZ
         xO3KWS9fD23w+uWEPlPLrZOx980VmSFn7xMngLikDrIN5Z7ECFL7Z0uV+3wBYSqiBqf1
         lhCQ==
X-Gm-Message-State: ACrzQf02Jb6WAPdMcEaWXwoUKNo58OveFfqmLdYvaSo0XvyMhc+6Mp5Q
        GLaiqu9Sz2if5MmHmVWtbo/nzQ==
X-Google-Smtp-Source: AMsMyM7NZI3iyZtdE3Da+UibfIbr7SHN+YGUbTEWKsQoHJ8XKbpu12IIBogUp1+QrovfCyhvrdhuzQ==
X-Received: by 2002:a37:de0a:0:b0:6fa:422c:1fda with SMTP id h10-20020a37de0a000000b006fa422c1fdamr9613046qkj.607.1667419908262;
        Wed, 02 Nov 2022 13:11:48 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id bb38-20020a05622a1b2600b003995f6513b9sm6910112qtb.95.2022.11.02.13.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 13:11:47 -0700 (PDT)
Message-ID: <aa2b0ab5-8ed5-cb49-711c-f928de24a8e4@linaro.org>
Date:   Wed, 2 Nov 2022 16:11:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/1] arm64: dts: qcom: Add MSM8976 device tree
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221030194311.197909-1-a39.skl@gmail.com>
 <20221030194311.197909-2-a39.skl@gmail.com>
 <4dda8dbb-a951-2207-32f6-2d6748e75087@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4dda8dbb-a951-2207-32f6-2d6748e75087@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 31/10/2022 17:02, Konrad Dybcio wrote:
> 
> 
> On 30.10.2022 20:42, Adam Skladowski wrote:
>> Add a base DT for MSM8976 SoC.
>>
>> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 1357 +++++++++++++++++++++++++
> Not sure if code that's not compiled anywhere will be accepted.

It's a dead code, so it should not.

Best regards,
Krzysztof

