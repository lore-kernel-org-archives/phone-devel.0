Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5CEC25B0E
	for <phone-devel@archiver.kernel.org>; Fri, 12 Aug 2022 13:34:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238968AbiHLNew (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 12 Aug 2022 09:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238951AbiHLNev (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 12 Aug 2022 09:34:51 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E8B9E13B
        for <phone-devel@vger.kernel.org>; Fri, 12 Aug 2022 06:34:48 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id v2so1379553lfi.6
        for <phone-devel@vger.kernel.org>; Fri, 12 Aug 2022 06:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=BZWPu5Gd//RL+Fh9taZwYOP97Z5i1BsHH/FWdANRQTQ=;
        b=zQz2gZCK/5ZJh9ivkAAuyGjG4hCSJBu7jU5wR5UXWpCIdruZMgyn6VuTm1QqWh8x6h
         HasBqW0BJks2PPnztLww2524JDH1d7jjoeGsvxikXYxJYJFjk8BIfrhBpfjGxpZK/M9c
         i/XHY2xZVnfl3MUBoRVQ93hjGX176jC+gF8hAmvbNaq8yR1l4ibEIM4tQ0LuMQYZ3Av6
         C2mARZuJz1sjPhoFQTQMRAfzR9vvJdrVu8rXsT7aBemuKm+iY2DRz94VkQFi0ogfgfQX
         2TuTBSeSVjWH98xo6xxXmr1B5FGooSs1InWSlqWPzlK/wUQNfApOMUurC8nSP8DIpW7X
         UTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=BZWPu5Gd//RL+Fh9taZwYOP97Z5i1BsHH/FWdANRQTQ=;
        b=sX4dE7zf1UjI//nnjPCxOp4qT6xG9DgH8IZwiKl84NVwPeoocUASOdSgpV9+sqB4Zx
         c8MyxaKHwTpdXz3mEaXtQeXKigUkyciPbKYydoOhjw7hLANiQS8PA+EA8iKjjnGMyZ1G
         Sc5vIke2wY6UO5ibktN/f0ILffqsSx5WJXhimEl9mtn9qke4xSr8ll/BTYfCwe21kfpg
         5PLgROUXVdHsgzSU0k4Zjogjlci9SV7usil0eNmJI0j2JBjUBvZ7h7H4OdL2b9BAOmOs
         ARD+k23QdL7RbNbRs0g27Q8BARixGMQf9X42IwO3472THWcBNgkBN/bB/8wuAeGvcbDK
         q/wQ==
X-Gm-Message-State: ACgBeo2m00buyPPdzaJE3QdGypQLkXJAX9P1C/WnxKwVaLCTWbA1Eue6
        lBhiIhdK3sPQiHWJV5iPYitVcA==
X-Google-Smtp-Source: AA6agR58fBX3co0zBUriZQcv0W0Vcn+Jz7pblBOBdMET79vrEFBlHlAawrlSdkJOdpXfFE+cQE60vw==
X-Received: by 2002:a19:f505:0:b0:48b:2bfb:9a99 with SMTP id j5-20020a19f505000000b0048b2bfb9a99mr1201171lfb.101.1660311287068;
        Fri, 12 Aug 2022 06:34:47 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id s2-20020a056512202200b0048ae8e4cebdsm218224lfs.139.2022.08.12.06.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 06:34:46 -0700 (PDT)
Message-ID: <5ac47ae7-ab49-5413-e489-b8b5f053697a@linaro.org>
Date:   Fri, 12 Aug 2022 16:34:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sm6350: Add interconnect support
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220525144404.200390-1-luca.weiss@fairphone.com>
 <20220525144404.200390-6-luca.weiss@fairphone.com>
 <CM41EUB650GB.YO1J30NYO5NU@otso>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CM41EUB650GB.YO1J30NYO5NU@otso>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/08/2022 15:09, Luca Weiss wrote:
> Hi Bjorn,
> 
> On Wed May 25, 2022 at 4:44 PM CEST, Luca Weiss wrote:
>> Add all the different NoC providers that are found in SM6350 and
>> populate different nodes that use the interconnect properties.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> 
> The other patches (1-4) from this series have been merged into torvalds'
> repo already, so just this one is missing from 5.20/6.0.
> 
> Could you please pick it up for the next merge window if everything's
> alright with it?

It's still a merge window...

Best regards,
Krzysztof
