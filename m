Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB88C07E9D
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 08:54:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbiIZIx7 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234640AbiIZIxr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 04:53:47 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827443C8DC
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:53:45 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id t14so9069502wrx.8
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=LivMufJfxLpe4WS1qV8qZqQ4CFkVL3CKwRAqAJHi1Es=;
        b=PFSHfiu7M7KhHbwP0ceB/NA0fncscKquMUPY3R054Jv6/uQzPHkJ7Osjn+baRwnwWJ
         Gqlw0m0ygq/a2PTWJ1tqmXzNxB7ndwRgwvdfkmzq2KWiM73ISW1gcEaeMvB47nj0EczM
         fHzWswDfvAhidsBNM2cQdaEfzX2fk0Ay7ob7f50S6+HlqZ94CYK95F9x3CK7DxNrPCZ8
         Jj9hNcGYdfSMVBdeiZy2lkTxeboZFxxPa8ZtvXMr8wqzW2LpLmF77F3c8jVChFescLDV
         aRcKxvGmLryxssEwYm85E16VBEKTVb9sup4SxJ93FL7xDMDwe0hKw3fgsIbB1JxvH+0Y
         DnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=LivMufJfxLpe4WS1qV8qZqQ4CFkVL3CKwRAqAJHi1Es=;
        b=bnzUdKH7oapjE4mvFS+K1kZy+0RlrTO79rDRV9x9B6Xpkkz/uo2409FtDcfE8VAuZU
         Wq3bNgHuvjtmBPChHSAuH9OFtgva1YPuMGSRRrxtnV9vVQhbArpj5qK49P2ramN1lUTv
         ZvvzlPzewQE8dRA/8ddD4jiIZm5v7kFl0DA093eYuVH65QPIDdAXGCft14kfA+UPKL7j
         FBeGkfPEcCCKirEokZedpmR/msHWkjmbAZNzaW59wveigYWTncNBG+d7SGLgRV+ExWyF
         p9cs1it8A6fExEmNeYnL8NmQ/51D9XcI21j+sYiWuBSMk3N3QTM4PxyXzQRQpF5R0Lhx
         wXcg==
X-Gm-Message-State: ACrzQf0p7K2O8lFI0a8HSmcQQbjSU5NT/HTrzvU02FcLtVl2lrR5wnxz
        rmW0um2BRV6tHAiX1JZG2VP02g==
X-Google-Smtp-Source: AMsMyM4DCMtMi/TGHpEULTmQPoY0SfiG4h2J3z/9LCH58zU8LGOX7pHu6gayEcBzM+3/Ib116p7mzQ==
X-Received: by 2002:adf:d1e1:0:b0:22a:cd3e:e98b with SMTP id g1-20020adfd1e1000000b0022acd3ee98bmr13124669wrd.510.1664182423996;
        Mon, 26 Sep 2022 01:53:43 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id q12-20020a7bce8c000000b003b5054c6cd2sm12142329wmj.36.2022.09.26.01.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:53:43 -0700 (PDT)
Message-ID: <f7fa76a5-a4c5-d254-bac1-c2933cb10044@linaro.org>
Date:   Mon, 26 Sep 2022 10:53:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] ARM: dts: qcom: pm8226: fix regulators node name
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925210229.128462-1-luca@z3ntu.xyz>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220925210229.128462-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/09/2022 23:02, Luca Weiss wrote:
> Adjust the node name to match bindings and fix the validation warning.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm/boot/dts/qcom-pm8226.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-pm8226.dtsi b/arch/arm/boot/dts/qcom-pm8226.dtsi
> index 9b7d9d04ded6..be8c8032a3b1 100644
> --- a/arch/arm/boot/dts/qcom-pm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8226.dtsi
> @@ -98,7 +98,7 @@ pm8226_1: pm8226@1 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> -		pm8226_spmi_regulators: pm8226-regulators {
> +		pm8226_spmi_regulators: regulators {
>   			compatible = "qcom,pm8226-regulators";
>   		};
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
