Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D73C43219
	for <phone-devel@archiver.kernel.org>; Wed,  2 Nov 2022 20:45:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbiKBUps (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 2 Nov 2022 16:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbiKBUpr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 2 Nov 2022 16:45:47 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819F9959B
        for <phone-devel@vger.kernel.org>; Wed,  2 Nov 2022 13:45:45 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id k2so7044199qkk.7
        for <phone-devel@vger.kernel.org>; Wed, 02 Nov 2022 13:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnNVi/onk0XmnRagR34LdTKyHanICP4TJkvqJmX6lV0=;
        b=Ok8VTXhWiVphi+jKBST1OXbwoqZl2mWGMh/yl88PUd+6oOOxJrl0F+9WQqRDMJFTKD
         yd0CKTCFKnPTYC+bT2Fs84vPWewjkA7Uhuorc/pRhb+e6fJDRImdnibsUaz3+LokvxCB
         GyavmueFSdSYnV2abWEcG0aGle9Fmft9ictEgnhSF5R4JruZSb3kwlLX0Z16PUCLfebB
         wdR/kuLyb4wYx7bVg6gDQ7kPRvrgNPQmGJFn6rVcFFByNzeBWpsVpruAL/N+gq5HaLT6
         fhq8IhE7kNY/yZ4sPYhKzZo7nBxcJV6h0bjUG6Hh7gWPZVU4N+ojfZfs/9+I73Z6Ac2C
         gd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnNVi/onk0XmnRagR34LdTKyHanICP4TJkvqJmX6lV0=;
        b=PqZOcFhrxUD9tAtmUaI0awnTHEP9DYYfZsIYTyBOnssH4ZytNmkwjlVSMJBaFKWWaG
         xsBX1Cqc9eWAjE369Hmau7UifCK+K0WgkV202Zop6HWqNDY4Twn5OgWNjLRaCc0j47zf
         eOqJdlLHI7qEI7p4AasqkD07VkVJ7YfsTikBtWE48niu592BactWTKOvF75EBmvGtDF7
         dTL1+oeDJYYhQv+8e3Et4om+mbXTGa8JlXia6d46zJUaeR1ufMdD2y5KIcgHDkW+/5Bx
         VLoBxny8fDf02STGHFX6FOs/e03u6muKXpsZyS7xUELnaV4gM81yjx+ka6eLqeRMEJE8
         bK9g==
X-Gm-Message-State: ACrzQf0v2JCM/ATRVgzvpSdWSTjlZxWaLypVaiVnuQGVWJo8ClUAGWeG
        vhkgnNZ5Ou8LsuFS523nBmYGTQ==
X-Google-Smtp-Source: AMsMyM4/lX3KYjZyNGJHPfwRa1MLlhvzTYN937WY6yPA/6InYBBS8LlqJfddbk5LoJa0H8+MJC3Wuw==
X-Received: by 2002:a05:620a:248d:b0:6fa:713b:2924 with SMTP id i13-20020a05620a248d00b006fa713b2924mr1027865qkn.544.1667421944433;
        Wed, 02 Nov 2022 13:45:44 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id i5-20020ac84f45000000b0039ee562799csm7131875qtw.59.2022.11.02.13.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 13:45:44 -0700 (PDT)
Message-ID: <96923e06-acd5-bed4-4dd5-e5923d9a3189@linaro.org>
Date:   Wed, 2 Nov 2022 16:45:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 03/10] arm64: dts: qcom: sm6350-lena: Add SD Card Detect
 to sdc2 on/off pinctrl
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221030073232.22726-1-marijn.suijten@somainline.org>
 <20221030073232.22726-4-marijn.suijten@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221030073232.22726-4-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 30/10/2022 03:32, Marijn Suijten wrote:
> In addition to the sdc2 pins, set the SD Card Detect pin in a sane state
> to be used as an interrupt when an SD Card is slotted in or removed.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

