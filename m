Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD531C7EE2C
	for <phone-devel@archiver.kernel.org>; Fri, 26 May 2023 15:42:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244133AbjEZPm4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 26 May 2023 11:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243855AbjEZPm4 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 26 May 2023 11:42:56 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3804F7
        for <phone-devel@vger.kernel.org>; Fri, 26 May 2023 08:42:53 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-307d58b3efbso587056f8f.0
        for <phone-devel@vger.kernel.org>; Fri, 26 May 2023 08:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20221208.gappssmtp.com; s=20221208; t=1685115772; x=1687707772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQw+zfZTmj3Rrv2z68fRpRd9uvWpwcM+LxwxnhqEPSc=;
        b=O8tXlthhBgjEbO1XpEqH7NlZTs+2M3Y+z9Bi4BJz+glfTwjV57YuE3j/vS/GCCr8b0
         bAziTwsMOOggSsOc90DoDDi2QrbytKM+faq7nGVYvPD/AaelwXY9jHCiKi2XJ6PXiC/d
         QnlMWyiZecupq7QnD8y4liWV9HKxePbVkKSopDBwY85zbg9Lweju7J/hWkiz/7AenKOw
         X/45v15UzzQWChHdc5WI1b6ZEmxMNFDTybImmGlvIkNNuip2hXMS5xsCMjWn8FYVyiFD
         z6guOz701BjiQppy3mkeL5xzOuMOK8o3/vqGVIdNBc43krCl8rFl92ElBaNiiFoWnueU
         mtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685115772; x=1687707772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQw+zfZTmj3Rrv2z68fRpRd9uvWpwcM+LxwxnhqEPSc=;
        b=VeprQSawoKP1YTlXrJ63Ekxkyp+bTvV2lasvLJBNBvCkkCFCgphEYi+Bja+G51D46c
         lt+Umoeq9rEFGiudohZbrLkzQebjITOBXUInsFZK3+3T67PHVEIXENetb7HxnzWyPWQd
         gpNzKqzn3AQq2juJSBju5LtKOrMSDcIGGn6IG1f8r7sZ/WaIdEWuc7vYor6SiUyxaAiQ
         k6eCJywVNKJWHb/mUZboDBBME9F2kgBTmBERGx93Dqs4m1TaauUDEi3IdTfQRfb+H5PQ
         amxsx2RzEoUuQ4o7z7J0y7rO/iQMCTv7hdfvm5D9HhooBN6VxzX7WovOpxOaRmkSRomq
         FOIw==
X-Gm-Message-State: AC+VfDyVUVGYv+l/yqUGYMmdUnDoDG7AyMfqP4JFGCttW9Aicmhux2T0
        iNgAOPk8gonSrbsJ30fvLKtJFg==
X-Google-Smtp-Source: ACHHUZ438yXRK5wT8tUO+6PCb06t7sypVhoVCPPpwgAqaqggPoqzquUPLXg0ZIVMzMpbthYUwg1ZVw==
X-Received: by 2002:adf:e792:0:b0:309:51ec:9ce0 with SMTP id n18-20020adfe792000000b0030951ec9ce0mr1942254wrm.69.1685115772372;
        Fri, 26 May 2023 08:42:52 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u3-20020adfdb83000000b0030aded83385sm533922wri.27.2023.05.26.08.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 08:42:51 -0700 (PDT)
Message-ID: <cf03b068-2d2d-45e4-f724-83304992550e@nexus-software.ie>
Date:   Fri, 26 May 2023 16:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/8] arm64: dts: qcom: msm8916: Fix regulator constraints
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230510-msm8916-regulators-v1-0-54d4960a05fc@gerhold.net>
 <20230510-msm8916-regulators-v1-3-54d4960a05fc@gerhold.net>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20230510-msm8916-regulators-v1-3-54d4960a05fc@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 17/05/2023 19:48, Stephan Gerhold wrote:
> The regulator constraints for most MSM8916 devices (except DB410c) were
> originally taken from Qualcomm's msm-3.10 vendor device tree (for lack
> of better documentation). Unfortunately it turns out that Qualcomm's
> voltages are slightly off as well and do not match the voltage
> constraints applied by the RPM firmware.
> 
> This means that we sometimes request a specific voltage but the RPM
> firmware actually applies a much lower or higher voltage. This is
> particularly critical for pm8916_l11 which is used as SD card VMMC
> regulator: The SD card can choose a voltage from the current range of
> 1.8 - 2.95V. If it chooses to run at 1.8V we pretend that this is fine
> but the RPM firmware will still silently end up configuring 2.95V.
> This can be easily reproduced with a multimeter or by checking the
> SPMI hardware registers of the regulator.
> 
> Fix this by making the voltages match the actual "specified range" in
> the PM8916 Device Specification which is enforced by the RPM firmware.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

